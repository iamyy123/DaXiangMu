<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="数字货币类型" prop="coinType">
        <el-input
          v-model="queryParams.coinType"
          placeholder="请输入数字货币类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="持仓数量" prop="amount">
        <el-input
          v-model="queryParams.amount"
          placeholder="请输入持仓数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="持仓占比" prop="percentage">
        <el-input
          v-model="queryParams.percentage"
          placeholder="请输入持仓占比"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="美元价值" prop="usdValue">
        <el-input
          v-model="queryParams.usdValue"
          placeholder="请输入美元价值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="当前价格" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入当前价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="快照日期" prop="snapshotDate">
        <el-date-picker clearable
          v-model="queryParams.snapshotDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择快照日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:position:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:position:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:position:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:position:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="positionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="持仓ID" align="center" prop="id" />
      <el-table-column label="数字货币类型" align="center" prop="coinType" />
      <el-table-column label="持仓数量" align="center" prop="amount" />
      <el-table-column label="持仓占比" align="center" prop="percentage" />
      <el-table-column label="美元价值" align="center" prop="usdValue" />
      <el-table-column label="当前价格" align="center" prop="price" />
      <el-table-column label="快照日期" align="center" prop="snapshotDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.snapshotDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:position:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:position:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改持仓数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="数字货币类型" prop="coinType">
          <el-input v-model="form.coinType" placeholder="请输入数字货币类型" />
        </el-form-item>
        <el-form-item label="持仓数量" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入持仓数量" />
        </el-form-item>
        <el-form-item label="持仓占比" prop="percentage">
          <el-input v-model="form.percentage" placeholder="请输入持仓占比" />
        </el-form-item>
        <el-form-item label="美元价值" prop="usdValue">
          <el-input v-model="form.usdValue" placeholder="请输入美元价值" />
        </el-form-item>
        <el-form-item label="当前价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入当前价格" />
        </el-form-item>
        <el-form-item label="快照日期" prop="snapshotDate">
          <el-date-picker clearable
            v-model="form.snapshotDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择快照日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPosition, getPosition, delPosition, addPosition, updatePosition } from "@/api/system/position"

export default {
  name: "Position",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 持仓数据表格数据
      positionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        coinType: null,
        amount: null,
        percentage: null,
        usdValue: null,
        price: null,
        snapshotDate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        coinType: [
          { required: true, message: "数字货币类型不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "持仓数量不能为空", trigger: "blur" }
        ],
        percentage: [
          { required: true, message: "持仓占比不能为空", trigger: "blur" }
        ],
        usdValue: [
          { required: true, message: "美元价值不能为空", trigger: "blur" }
        ],
        snapshotDate: [
          { required: true, message: "快照日期不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询持仓数据列表 */
    getList() {
      this.loading = true
      listPosition(this.queryParams).then(response => {
        this.positionList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        coinType: null,
        amount: null,
        percentage: null,
        usdValue: null,
        price: null,
        snapshotDate: null,
        createTime: null,
        updateTime: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加持仓数据"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getPosition(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改持仓数据"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePosition(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addPosition(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除持仓数据编号为"' + ids + '"的数据项？').then(function() {
        return delPosition(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/position/export', {
        ...this.queryParams
      }, `position_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
