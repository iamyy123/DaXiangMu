<template>
  <div class="homepage-container">
    <!-- 页面加载动画 -->
    <transition name="fade" mode="out-in">
      <div v-show="!loading" class="page-content">
    <!-- 顶部统计卡片区域 -->
    <el-row :gutter="[16, 16]">
      <el-col :xs="24" :sm="12" :lg="8">
        <el-card
          class="stat-card"
          shadow="hover"
        >
          <template #header>
            <div class="card-header">
              <span>未读消息数</span>
              <el-button
                type="text"
                size="small"
                @click="navigateTo('/system/message/index')"
              >
                查看详情 <i class="el-icon-arrow-right"></i>
              </el-button>
            </div>
          </template>
          <div class="stat-content">
            <i class="el-icon-message" style="color: #1890ff; font-size: 32px;"></i>
            <el-statistic
              :value="overviewData.unreadMessageCount"
              :value-style="{ color: '#1890ff', fontSize: '28px', fontWeight: 'bold' }"
            />
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="8">
        <el-card
          class="stat-card"
          shadow="hover"
        >
          <template #header>
            <div class="card-header">
              <span>待审核报告数</span>
              <el-button
                type="text"
                size="small"
                @click="navigateTo('/system/report/index')"
              >
                查看详情 <i class="el-icon-arrow-right"></i>
              </el-button>
            </div>
          </template>
          <div class="stat-content">
            <i class="el-icon-document" style="color: #faad14; font-size: 32px;"></i>
            <el-statistic
              :value="overviewData.pendingReportCount"
              :value-style="{ color: '#faad14', fontSize: '28px', fontWeight: 'bold' }"
            />
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="8">
        <el-card
          class="stat-card"
          shadow="hover"
        >
          <template #header>
            <div class="card-header">
              <span>当前总资产估值</span>
              <el-button
                type="text"
                size="small"
                @click="navigateTo('/system/position/index')"
              >
                查看详情 <i class="el-icon-arrow-right"></i>
              </el-button>
            </div>
          </template>
          <div class="stat-content">
            <i class="el-icon-money" style="color: #52c41a; font-size: 32px;"></i>
            <el-statistic
              :value="overviewData.totalAssetValue"
              :precision="2"
              :value-style="{ color: '#52c41a', fontSize: '28px', fontWeight: 'bold' }"
              prefix="$"
            />
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 功能入口卡片区域 -->
    <el-row :gutter="[16, 16]" style="margin-top: 16px;">
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="console.log('Card clicked directly'); navigateTo('/system/message/index')"
        >
          <div class="feature-content">
            <i class="el-icon-message" style="color: #1890ff; font-size: 48px;"></i>
            <h3 class="feature-title">消息列表</h3>
            <p class="feature-desc">查看所有数字货币消息</p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="navigateTo('/system/position/index')"
        >
          <div class="feature-content">
            <i class="el-icon-money" style="color: #52c41a; font-size: 48px;"></i>
            <h3 class="feature-title">持仓数据</h3>
            <p class="feature-desc">查看当前持仓和变化趋势</p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="navigateTo('/system/report/index')"
        >
          <div class="feature-content">
            <i class="el-icon-document" style="color: #faad14; font-size: 48px;"></i>
            <h3 class="feature-title">建议报告</h3>
            <p class="feature-desc">查看AI分析报告并审核</p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="navigateTo('/system/history/index')"
        >
          <div class="feature-content">
            <i class="el-icon-data-line" style="color: #eb2f96; font-size: 48px;"></i>
            <h3 class="feature-title">历史数据</h3>
            <p class="feature-desc">查看历史行情和交易数据</p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="navigateTo('/system/log/index')"
        >
          <div class="feature-content">
            <i class="el-icon-document-copy" style="color: #fa8c16; font-size: 48px;"></i>
            <h3 class="feature-title">操作日志</h3>
            <p class="feature-desc">查看系统操作记录</p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :lg="6">
        <el-card
          class="feature-card"
          shadow="hover"
          @click="navigateTo('/system/difyconfig/index')"
        >
          <div class="feature-content">
            <i class="el-icon-setting" style="color: #13c2c2; font-size: 48px;"></i>
            <h3 class="feature-title">配置管理</h3>
            <p class="feature-desc">管理系统配置信息</p>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 资产趋势图区域 -->
    <el-card class="chart-card" shadow="hover" style="margin-top: 16px;">
      <template #header>
        <div class="card-header">
          <span>资产趋势图</span>
        </div>
      </template>
      <div id="assetChart" ref="assetChart" class="chart-container"></div>
    </el-card>

    <!-- 系统信息和技术选型区域 -->
    <el-row :gutter="[40, 20]" style="margin-top: 16px; margin-bottom: 24px;">
      <el-col :xs="24" :lg="11">
        <h2 class="section-title">AI驱动数字货币投资辅助系统</h2>
        <p class="system-desc">
          基于人工智能技术的数字货币投资辅助系统，为投资者提供实时行情分析、智能投资建议和资产跟踪管理功能，帮助用户做出更明智的投资决策。
        </p>
        <p class="version-info">
          <strong>当前版本:</strong> <span style="color: #1890ff; font-size: 18px;">v{{ version }}</span>
        </p>
        <div class="system-tags">
          <el-tag type="primary">免费开源</el-tag>
        </div>
      </el-col>

      <el-col :xs="24" :lg="13">
        <h2 class="section-title">技术选型</h2>
        <el-row :gutter="[40, 20]">
          <el-col :xs="24" :sm="12">
            <h4 class="tech-subtitle">后端技术</h4>
            <el-list>
              <el-list-item v-for="(tech, index) in backendTech" :key="index" class="tech-item">
                {{ tech }}
              </el-list-item>
            </el-list>
          </el-col>
          <el-col :xs="24" :sm="12">
            <h4 class="tech-subtitle">前端技术</h4>
            <el-list>
              <el-list-item v-for="(tech, index) in frontendTech" :key="index" class="tech-item">
                {{ tech }}
              </el-list-item>
            </el-list>
          </el-col>
        </el-row>
      </el-col>
    </el-row>

    <!-- 联系信息、更新日志区域 -->
    <el-row :gutter="[16, 16]">
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-card class="info-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span>联系信息</span>
            </div>
          </template>
          <el-list>
            <el-list-item v-for="(item, index) in contactInfo" :key="index">
              <i :class="item.icon" style="margin-right: 8px;"></i>
              {{ item.text }}
            </el-list-item>
          </el-list>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-card class="info-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span>更新日志</span>
            </div>
          </template>
          <el-list>
            <el-list-item v-for="(item, index) in updateLogs" :key="index">
              {{ index + 1 }}. {{ item }}
            </el-list-item>
          </el-list>
        </el-card>
      </el-col>
    </el-row>
      </div>
    </transition>
    
    <!-- 加载动画 -->
    <div v-show="loading" class="loading-container">
      <i class="el-icon-loading loading-icon"></i>
      <p>正在加载数据...</p>
    </div>
  </div>
</template>

<script>
import echarts from 'echarts';

export default {
  name: 'HomePage',
  data() {
    return {
      loading: true,
      overviewData: {
        unreadMessageCount: 0,
        pendingReportCount: 0,
        totalAssetValue: 0
      },
      version: "3.9.0",
      backendTech: [
        'SpringBoot', 'Spring Security', 'JWT', 'MyBatis', 'Druid', 'Fastjson', '...'
      ],
      frontendTech: [
        'Vue', 'Vuex', 'Element-ui', 'Axios', 'Sass', 'Quill', '...'
      ],
      updateLogs: [
        '前后端分离系统',
        '新增AI分析报告功能',
        '优化持仓数据统计',
        '支持数字货币消息实时推送'
      ],
      contactInfo: [
        { icon: 'el-icon-user', text: 'QQ：1234567' },
        { icon: 'el-icon-share', text: 'Github：@1234567' }
      ],
      assetChart: null
    };
  },
  mounted() {
    this.loadOverview();
    this.initChart();
    // 设置定时刷新概览数据
    this.interval = setInterval(() => {
      this.loadOverview();
    }, 30000);
  },
  beforeDestroy() {
    // 清除定时器
    if (this.interval) {
      clearInterval(this.interval);
    }
    // 销毁图表
    if (this.assetChart) {
      this.assetChart.dispose();
    }
  },
  methods: {
    loadOverview() {
      this.loading = true;
      // 模拟API请求延迟
      setTimeout(() => {
        // 使用默认数据，因为API服务不存在
        this.overviewData = {
          unreadMessageCount: 5,
          pendingReportCount: 2,
          totalAssetValue: 15689.50
        };
        this.loading = false;
      }, 800);
    },
    navigateTo(path) {
      // 直接跳转，使用完整的/index路径确保导航正常
      console.log('Card clicked, navigating to:', path);
      this.$router.push(path);
    },
    initChart() {
      // 初始化ECharts实例
      this.assetChart = echarts.init(this.$refs.assetChart);
      
      // 配置项
      const option = {
        title: {
          text: '资产趋势',
          left: 'center',
          textStyle: {
            fontSize: 16,
            fontWeight: 'normal'
          }
        },
        tooltip: {
          trigger: 'axis',
          formatter: '日期: {b}<br/>资产: ${c}'
        },
        xAxis: {
          type: 'category',
          data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
          axisLine: {
            lineStyle: {
              color: '#ccc'
            }
          }
        },
        yAxis: {
          type: 'value',
          axisLine: {
            lineStyle: {
              color: '#ccc'
            }
          },
          splitLine: {
            lineStyle: {
              color: '#f0f0f0'
            }
          }
        },
        series: [{
          data: [12000, 19000, 30000, 23000, 29000, 33000, 31000],
          type: 'line',
          smooth: true,
          lineStyle: {
            color: '#1890ff',
            width: 3
          },
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: 'rgba(24, 144, 255, 0.3)' },
              { offset: 1, color: 'rgba(24, 144, 255, 0.1)' }
            ])
          },
          itemStyle: {
            color: '#1890ff',
            borderWidth: 2,
            borderColor: '#fff'
          }
        }]
      };
      
      // 设置配置项
      this.assetChart.setOption(option);
      
      // 监听窗口大小变化，调整图表
      window.addEventListener('resize', () => {
        if (this.assetChart) {
          this.assetChart.resize();
        }
      });
    }
  }
};
</script>

<style scoped>
.homepage-container {
  padding: 20px;
  background-color: #f5f7fa;
}

/* 响应式容器内边距 */
@media (max-width: 768px) {
  .homepage-container {
    padding: 12px;
  }
}

/* 统计卡片样式 */
.stat-card {
  transition: all 0.3s ease;
  min-height: 150px;
}

.stat-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

/* 移动端禁用悬停效果 */
@media (max-width: 768px) {
  .stat-card:hover {
    transform: none;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  }
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.stat-content {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px 0;
}

.stat-content i {
  margin-right: 16px;
}

/* 功能卡片样式 */
.feature-card {
  cursor: pointer;
  transition: all 0.3s ease;
  min-height: 200px;
}

.feature-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

/* 移动端禁用悬停效果 */
@media (max-width: 768px) {
  .feature-card:hover {
    transform: none;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  }
}

.feature-content {
  text-align: center;
  padding: 24px 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.feature-title {
  margin: 16px 0 8px 0;
  font-size: 18px;
  font-weight: 500;
}

/* 移动端功能卡片标题 */
@media (max-width: 768px) {
  .feature-title {
    font-size: 16px;
  }
}

.feature-desc {
  color: #666;
  margin: 0;
  font-size: 14px;
}

/* 移动端功能卡片描述 */
@media (max-width: 768px) {
  .feature-desc {
    font-size: 12px;
  }
}

/* 图表卡片样式 */
.chart-card {
  transition: all 0.3s ease;
}

.chart-card:hover {
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

/* 移动端图表卡片 */
@media (max-width: 768px) {
  .chart-card:hover {
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  }
}

.chart-container {
  height: 300px;
  width: 100%;
}

/* 移动端图表高度调整 */
@media (max-width: 768px) {
  .chart-container {
    height: 220px;
  }
}

/* 系统信息和技术选型区域样式 */
.section-title {
  font-size: 28px;
  font-weight: 500;
  margin-bottom: 20px;
  color: #1a1a1a;
  text-align: center;
}

/* 移动端标题 */
@media (max-width: 768px) {
  .section-title {
    font-size: 22px;
    margin-bottom: 16px;
  }
}

.system-desc {
  font-size: 16px;
  line-height: 1.8;
  color: #555;
  margin-bottom: 20px;
  text-align: center;
}

/* 移动端系统描述 */
@media (max-width: 768px) {
  .system-desc {
    font-size: 14px;
    line-height: 1.6;
    margin-bottom: 16px;
  }
}

.version-info {
  font-size: 16px;
  color: #333;
  margin-bottom: 24px;
  text-align: center;
}

/* 移动端版本信息 */
@media (max-width: 768px) {
  .version-info {
    font-size: 14px;
    margin-bottom: 20px;
  }
}

.system-tags {
  margin-bottom: 24px;
  text-align: center;
}

.system-buttons {
  text-align: center;
  margin-bottom: 20px;
}

.system-buttons .el-button {
  margin-right: 12px;
  margin-bottom: 12px;
  transition: all 0.3s ease;
}

/* 移动端按钮 */
@media (max-width: 768px) {
  .system-buttons .el-button {
    width: 100%;
    margin-right: 0;
  }
}

.tech-subtitle {
  margin-bottom: 16px;
  color: #333;
  font-size: 18px;
  font-weight: 500;
  text-align: center;
}

/* 移动端技术选型标题 */
@media (max-width: 768px) {
  .tech-subtitle {
    font-size: 16px;
    margin-bottom: 12px;
  }
}

.tech-item {
  padding: 8px 0;
  font-size: 15px;
  color: #555;
  text-align: center;
}

/* 移动端技术选型项 */
@media (max-width: 768px) {
  .tech-item {
    font-size: 13px;
    padding: 6px 0;
  }
}

/* 联系信息和更新日志样式 */
.info-card {
  transition: all 0.3s ease;
  min-height: 180px;
}

.info-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

/* 移动端禁用悬停效果 */
@media (max-width: 768px) {
  .info-card:hover {
    transform: none;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  }
}

/* 移动端列表项样式 */
@media (max-width: 768px) {
  .el-list-item {
    font-size: 14px;
  }
}

/* 淡入过渡效果 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

/* 页面内容入场动画 */
.page-content {
  animation: slideIn 0.5s ease;
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* 加载动画样式 */
.loading-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 400px;
  width: 100%;
}

.loading-icon {
  font-size: 48px;
  color: #1890ff;
  animation: spin 1s infinite linear;
  margin-bottom: 16px;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.loading-container p {
  font-size: 16px;
  color: #666;
}
</style>