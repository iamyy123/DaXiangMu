package com.ruoyi.wms.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.ApprovalRecordBo;
import com.ruoyi.wms.domain.entity.ApprovalRecord;
import com.ruoyi.wms.domain.vo.ApprovalRecordVo;
import com.ruoyi.wms.mapper.ApprovalRecordMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class ApprovalRecordService {

    private final ApprovalRecordMapper approvalRecordMapper;
    private final AllocationSuggestionService allocationSuggestionService;

    /**
     * 查询审核记录
     */
    public ApprovalRecordVo queryById(Long id) {
        ApprovalRecordVo record = approvalRecordMapper.selectVoById(id);
        enrichRecordWithSuggestionInfo(record);
        return record;
    }

    /**
     * 查询审核记录列表
     */
    public TableDataInfo<ApprovalRecordVo> queryPageList(ApprovalRecordBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ApprovalRecord> lqw = buildQueryWrapper(bo);
        Page<ApprovalRecordVo> result = approvalRecordMapper.selectVoPage(pageQuery.build(), lqw);
        List<ApprovalRecordVo> recordList = result.getRecords();
        enrichRecordWithSuggestionInfo(recordList);
        return TableDataInfo.build(result);
    }

    /**
     * 查询审核记录列表
     */
    public List<ApprovalRecordVo> queryList(ApprovalRecordBo bo) {
        LambdaQueryWrapper<ApprovalRecord> lqw = buildQueryWrapper(bo);
        List<ApprovalRecordVo> recordList = approvalRecordMapper.selectVoList(lqw);
        enrichRecordWithSuggestionInfo(recordList);
        return recordList;
    }

    private LambdaQueryWrapper<ApprovalRecord> buildQueryWrapper(ApprovalRecordBo bo) {
        LambdaQueryWrapper<ApprovalRecord> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getSuggestionId() != null, ApprovalRecord::getSuggestionId, bo.getSuggestionId());
        lqw.eq(bo.getApproverId() != null, ApprovalRecord::getApproverId, bo.getApproverId());
        lqw.eq(bo.getApprovalResult() != null, ApprovalRecord::getApprovalResult, bo.getApprovalResult());
        lqw.orderByDesc(ApprovalRecord::getApprovalTime);
        return lqw;
    }

    /**
     * 为审核记录添加配置建议信息
     */
    private void enrichRecordWithSuggestionInfo(List<ApprovalRecordVo> recordList) {
        if (recordList.isEmpty()) {
            return;
        }
        
        for (ApprovalRecordVo record : recordList) {
            enrichRecordWithSuggestionInfo(record);
        }
    }

    /**
     * 为单个审核记录添加配置建议信息
     */
    private void enrichRecordWithSuggestionInfo(ApprovalRecordVo record) {
        if (record == null || record.getSuggestionId() == null) {
            return;
        }
        
        // 查询配置建议日期
        String suggestionDate = allocationSuggestionService.queryById(record.getSuggestionId()).getSuggestionDate().toString();
        record.setSuggestionDate(suggestionDate);
        
        // 设置审核结果描述
        if (record.getApprovalResult() != null) {
            switch (record.getApprovalResult()) {
                case 1:
                    record.setApprovalResultDesc("已通过");
                    break;
                case 2:
                    record.setApprovalResultDesc("已拒绝");
                    break;
                default:
                    record.setApprovalResultDesc("未知");
            }
        }
    }

    /**
     * 新增审核记录
     */
    public void insertByBo(ApprovalRecordBo bo) {
        ApprovalRecord add = MapstructUtils.convert(bo, ApprovalRecord.class);
        approvalRecordMapper.insert(add);
    }

    /**
     * 修改审核记录
     */
    public void updateByBo(ApprovalRecordBo bo) {
        ApprovalRecord update = MapstructUtils.convert(bo, ApprovalRecord.class);
        approvalRecordMapper.updateById(update);
    }

    /**
     * 删除审核记录
     */
    public void deleteById(Long id) {
        approvalRecordMapper.deleteById(id);
    }

    /**
     * 批量删除审核记录
     */
    public void deleteByIds(Collection<Long> ids) {
        approvalRecordMapper.deleteBatchIds(ids);
    }
}
