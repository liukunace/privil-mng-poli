package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysDepartmentEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 18:36
 */
@Mapper
public interface SysDepartmentDao extends BaseMapper<SysDepartmentEntity> {

    /**
     * 根据父，查询子
     * @param parentId 父ID
     */
    List<SysDepartmentEntity> queryListParentId(Long parentId);

    List<SysDepartmentEntity> queryListUpParentId(Long id);

    List<SysDepartmentEntity> queryDeptList();

    SysDepartmentEntity queryDeptByLabel(String label);

    SysDepartmentEntity queryDeptByValue(String value);

    SysDepartmentEntity queryDeptByDingId(String dingId);
}
