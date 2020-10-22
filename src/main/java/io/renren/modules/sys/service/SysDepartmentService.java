package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysDepartmentEntity;
import io.renren.modules.sys.entity.SysMenuEntity;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 18:38
 */
public interface SysDepartmentService extends IService<SysDepartmentEntity> {

    /**
     * 根据父，查询子
     * @param parentId 父ID
     * @param deptIdList  ID
     */
    List<SysDepartmentEntity> queryListParentId(Long parentId, List<Long> deptIdList);

    /**
     * 根据父，查询子
     * @param parentId 父ID
     */
    List<SysDepartmentEntity> queryListParentId(Long parentId);

    List<SysDepartmentEntity> queryListUpParentId(Long id);

    List<String> queryCascadList(Long id);

    List<String> queryCascadList(String name);

    List<SysDepartmentEntity> queryDeptList();

    List<SysDepartmentEntity> queryDeptUpList(Long id);

    SysDepartmentEntity queryDeptById(Long deptId);

    SysDepartmentEntity queryDeptByLabel(String label);

    SysDepartmentEntity queryDeptByValue(String value);

    SysDepartmentEntity queryDeptByDingId(String dingId);

    /**
     * 获取用户部门列表
     */
    List<SysDepartmentEntity> getUserDeptList();

    /**
     * 删除
     */
    void delete(Long deptId);

    /**
     * 批量删除部门
     */
    void deleteBatch(Long[] deptIds);

}
