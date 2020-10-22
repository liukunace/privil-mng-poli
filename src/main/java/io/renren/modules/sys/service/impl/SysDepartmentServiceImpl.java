package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.Constant;
import io.renren.common.utils.MapUtils;
import io.renren.modules.sys.dao.SysDepartmentDao;
import io.renren.modules.sys.entity.SysDepartmentEntity;
import io.renren.modules.sys.entity.SysMenuEntity;
import io.renren.modules.sys.service.SysDepartmentService;
import io.renren.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 18:40
 */
@Service("sysDepartmentService")
public class SysDepartmentServiceImpl extends ServiceImpl<SysDepartmentDao, SysDepartmentEntity> implements SysDepartmentService {

    @Autowired
    private SysUserDepartmentServiceImpl sysUserDepartmentServiceImpl;

    @Override
    public List<SysDepartmentEntity> queryListParentId(Long parentId, List<Long> deptIdList) {
        List<SysDepartmentEntity> menuList = queryListParentId(parentId);
        if(deptIdList == null){
            return menuList;
        }
        List<SysDepartmentEntity> userDeptList = new ArrayList<>();
        for(SysDepartmentEntity dept : menuList){
            if(deptIdList.contains(dept.getDeptId())){
                userDeptList.add(dept);
            }
        }
        return userDeptList;
    }

    @Override
    public List<SysDepartmentEntity> queryListParentId(Long parentId) {
        return baseMapper.queryListParentId(parentId);
    }

    @Override
    public List<SysDepartmentEntity> queryListUpParentId(Long id) {
        return baseMapper.queryListUpParentId(id);
    }

    @Override
    public List<String> queryCascadList(Long id) {
        return getAllUpDeptFlatList(id);
    }

    @Override
    public List<String> queryCascadList(String name) {
        return getAllUpDeptFlatList(baseMapper.queryDeptByLabel(name).getDeptId());
    }

    @Override
    public List<SysDepartmentEntity> queryDeptList() {
        //return baseMapper.queryDeptList();
        List<Long> deptIdList=new ArrayList<Long>();
        deptIdList.add(1L);
        return getAllDeptList(null);
    }

    @Override
    public List<SysDepartmentEntity> queryDeptUpList(Long id) {
        return getAllUpDeptList(id);
    }

    @Override
    public SysDepartmentEntity queryDeptById(Long deptId) {
        return baseMapper.selectById(deptId);
    }

    @Override
    public SysDepartmentEntity queryDeptByLabel(String label) {
        return baseMapper.queryDeptByLabel(label);
    }

    @Override
    public SysDepartmentEntity queryDeptByValue(String value) {
        return baseMapper.queryDeptByValue(value);
    }

    @Override
    public SysDepartmentEntity queryDeptByDingId(String dingId) {
        return baseMapper.queryDeptByDingId(dingId);
    }

    @Override
    public List<SysDepartmentEntity> getUserDeptList() {
        return null;
    }

    @Override
    public void delete(Long deptId) {
        //删除菜单
        this.removeById(deptId);
        //删除用户与部门关联
        sysUserDepartmentServiceImpl.removeByMap(new MapUtils().put("dept_id", deptId));

    }

    @Override
    public void deleteBatch(Long[] deptIds) {
        //删除角色
        this.removeByIds(Arrays.asList(deptIds));
        //删除部门与用户关联
        sysUserDepartmentServiceImpl.deleteBatch(deptIds);
    }

    /**
     * 获取所有列表
     */
    private List<SysDepartmentEntity> getAllDeptList(List<Long> deptIdList){
        //查询根部门列表
        List<SysDepartmentEntity> deptList = queryListParentId(0L, deptIdList);
        //递归获取子部门
        getDeptTreeList(deptList, deptIdList);
        return deptList;
    }


    /**
     * 递归获取子集
     */
    private List<SysDepartmentEntity> getDeptTreeList(List<SysDepartmentEntity> menuList, List<Long> deptIdList){
        List<SysDepartmentEntity> subDeptList = new ArrayList<SysDepartmentEntity>();
        for(SysDepartmentEntity entity : menuList){
            //目录
            entity.setChildren(getDeptTreeList(queryListParentId(entity.getDeptId(), deptIdList), deptIdList));
            subDeptList.add(entity);
        }
        return subDeptList;
    }

    /**
     * 获取所有上级列表
     */
    private List<SysDepartmentEntity> getAllUpDeptList(Long id){
        List<SysDepartmentEntity> deptList = queryListUpParentId(id);
        //递归获取子部门
        getParentDeptList(deptList);

        return deptList;
    }

    private List<String> getAllUpDeptFlatList(Long id){
        List<SysDepartmentEntity> deptList = queryListUpParentId(id);
        List<String> valueList = new ArrayList<String>();
        valueList.add(deptList.get(0).getValue());
        getCascadList(deptList,valueList);
        Collections.reverse(valueList);
        return valueList;
    }

    /**
     * 递归获取父级
     * @param deptList
     */
    private List<SysDepartmentEntity> getParentDeptList(List<SysDepartmentEntity> deptList) {
        List<SysDepartmentEntity> subDeptList = new ArrayList<SysDepartmentEntity>();

        for(SysDepartmentEntity entity : deptList){
            //目录
            entity.setChildren(getParentDeptList(queryListUpParentId(entity.getPId())));
            subDeptList.add(entity);
        }

        return subDeptList;

    }

    /**
     * 递归获取cascad
     * @param deptList
     */
    private List<SysDepartmentEntity> getCascadList(List<SysDepartmentEntity> deptList,List<String> valueList) {
        List<SysDepartmentEntity> subDeptList = new ArrayList<SysDepartmentEntity>();
        for(SysDepartmentEntity entity : deptList){
            List<SysDepartmentEntity> entityList=queryListUpParentId(entity.getPId());
            if(entityList.size()>0){
                valueList.add(entityList.get(0).getValue());
            }
            entity.setChildren(getCascadList(queryListUpParentId(entity.getPId()),valueList));
            subDeptList.add(entity);
        }
        return subDeptList;
    }
}
