package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysUserDepartmentEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-02 10:31
 */
@Mapper
public interface SysUserDepartmentDao extends BaseMapper<SysUserDepartmentEntity> {
    /**
     * 根据用户ID，获取部门ID列表
     */
    List<Long> queryDeptIdList(Long userId);

    List<Long> queryUserIdList(Long deptId);

    /**
     * 根据部门ID数组，批量删除
     */
    int deleteBatch(Long[] deptIds);




}
