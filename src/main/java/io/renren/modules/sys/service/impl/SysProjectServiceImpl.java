package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.sys.dao.SysProjectDao;
import io.renren.modules.sys.entity.SysProjectEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysProjectService;
import io.renren.modules.sys.service.SysUserProjectService;
import io.renren.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Map;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 16:49
 */
@Service("sysProjectService")
public class SysProjectServiceImpl extends ServiceImpl<SysProjectDao, SysProjectEntity> implements SysProjectService {

    @Autowired
    private SysUserProjectService sysUserProjectService;

    @Override
    public SysProjectEntity queryProjectById(Long projId) {
        return baseMapper.selectById(projId);
    }

    @Override
    public SysProjectEntity queryProjectByName(String name) {
        return baseMapper.queryProjectByName(name);
    }

    @Override
    public SysProjectEntity queryProjectByOtherId(String otherId) {
        return baseMapper.queryProjectByOtherId(otherId);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String projectName = (String)params.get("projectName");
        Long createUserId = (Long)params.get("createUserId");

        IPage<SysProjectEntity> page = this.page(
                new Query<SysProjectEntity>().getPage(params),
                new QueryWrapper<SysProjectEntity>()
                        .like(StringUtils.isNotBlank(projectName),"project_name", projectName)
                        //.eq(createUserId != null,"create_user_id", createUserId)
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatch(Long[] projectIds) {
        //删除项目
        this.removeByIds(Arrays.asList(projectIds));

        //删除项目与用户关联
        sysUserProjectService.deleteBatch(projectIds);
    }
}
