package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysUserDepartmentEntity;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-02 10:51
 */
public interface SysUserDepartmentService  extends IService<SysUserDepartmentEntity> {

    void saveOrUpdate(Long userId, List<Long> deptIdList);

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
