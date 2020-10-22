package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.MapUtils;
import io.renren.modules.sys.dao.SysUserProjectDao;
import io.renren.modules.sys.entity.SysUserProjectEntity;
import io.renren.modules.sys.service.SysUserProjectService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 11:28
 */
@Service("sysUserProjectService")
public class SysUserProjectServiceImpl extends ServiceImpl<SysUserProjectDao, SysUserProjectEntity> implements SysUserProjectService {

    @Override
    public void saveOrUpdate(Long userId, List<Long> projectIdList) {

        //先删除用户与项目关系
        this.removeByMap(new MapUtils().put("user_id", userId));

        if(projectIdList == null || projectIdList.size() == 0){
            return ;
        }

        //保存用户与角色关系
        for(Long projectId : projectIdList) {
            SysUserProjectEntity sysUserProjectEntity = new SysUserProjectEntity();
            sysUserProjectEntity.setUserId(userId);
            sysUserProjectEntity.setProjectId(projectId);
            this.save(sysUserProjectEntity);
        }

    }

    @Override
    public List<Long> queryProjectIdList(Long userId) {
        return baseMapper.queryProjectIdList(userId);
    }

    @Override
    public int deleteBatch(Long[] projectIds) {
        return baseMapper.deleteBatch(projectIds);
    }

    @Override
    public List<Long> queryUserIdList(Long projectId) {
        return baseMapper.queryUserIdList(projectId);
    }
}
