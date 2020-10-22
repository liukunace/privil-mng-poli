package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.MapUtils;
import io.renren.modules.sys.dao.SysUserDepartmentDao;
import io.renren.modules.sys.entity.SysUserDepartmentEntity;
import io.renren.modules.sys.entity.SysUserRoleEntity;
import io.renren.modules.sys.service.SysUserDepartmentService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-02 10:52
 */
@Service("sysUserDepartmentService")
public class SysUserDepartmentServiceImpl extends ServiceImpl<SysUserDepartmentDao, SysUserDepartmentEntity> implements SysUserDepartmentService {
    @Override
    public void saveOrUpdate(Long userId, List<Long> deptIdList) {
        //先删除用户与部门关系
        this.removeByMap(new MapUtils().put("user_id", userId));
        if(deptIdList == null || deptIdList.size() == 0){
            return ;
        }
        //保存用户与角色关系
        for(Long deptId : deptIdList){
            SysUserDepartmentEntity sysUserDepartmentEntity = new SysUserDepartmentEntity();
            sysUserDepartmentEntity.setUserId(userId);
            sysUserDepartmentEntity.setDeptId(deptId);
            this.save(sysUserDepartmentEntity);
        }

    }

    @Override
    public List<Long> queryDeptIdList(Long userId) {
        return baseMapper.queryDeptIdList(userId);
    }

    @Override
    public List<Long> queryUserIdList(Long deptId) {
        return baseMapper.queryUserIdList(deptId);
    }

    @Override
    public int deleteBatch(Long[] deptIds) {
        return baseMapper.deleteBatch(deptIds);
    }
}
