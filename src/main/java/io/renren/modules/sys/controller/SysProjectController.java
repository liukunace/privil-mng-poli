package io.renren.modules.sys.controller;

import io.renren.common.annotation.SysLog;
import io.renren.common.exception.RRException;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysMenuEntity;
import io.renren.modules.sys.entity.SysProjectEntity;
import io.renren.modules.sys.entity.SysRoleEntity;
import io.renren.modules.sys.service.SysProjectService;
import io.renren.modules.sys.service.SysRoleService;
import io.renren.modules.sys.service.SysUserProjectService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 16:42
 */
@RestController
@RequestMapping("/sys/project")
public class SysProjectController extends AbstractController{

    @Autowired
    private SysProjectService sysProjectService;

    @Autowired
    private SysUserProjectService sysUserProjectService;


    /**
     * 项目列表
     */
    @GetMapping("/select")
    @RequiresPermissions("sys:project:select")
    public R select(){
        Map<String, Object> map = new HashMap<>();

        //如果不是超级管理员，则只查询自己所拥有的项目列表
        if(getUserId() != Constant.SUPER_ADMIN){
            //map.put("create_user_id", getUserId());
        }
        List<SysProjectEntity> list =sysProjectService.listByMap(map);

        return R.ok().put("list", list);
    }

    /**
     * 所有项目列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sys:project:list")
    public R list(@RequestParam Map<String, Object> params){
        //只有超级管理员，才能查看所有项目列表
        if(getUserId() != Constant.SUPER_ADMIN){
            params.put("createUserId", getUserId());
        }
        PageUtils page = sysProjectService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 项目信息
     */
    @GetMapping("/info/{projectId}")
    @RequiresPermissions("sys:project:info")
    public R info(@PathVariable("projectId") Long projectId){
        SysProjectEntity project = sysProjectService.getById(projectId);
        return R.ok().put("project", project);
    }

    /**
     * 项目查重
     */
    @GetMapping("/check/{otherId}")
    public R infoCheck(@PathVariable("otherId") String otherId){
        if(sysProjectService.queryProjectByOtherId(otherId)!=null){
            return R.ok().put("projectId", sysProjectService.queryProjectByOtherId(otherId).getProjectId());
        }
        return R.ok().put("projectId", null);
    }

    /**
     * 保存
     */
    @SysLog("保存")
    @PostMapping("/save")
    @RequiresPermissions("sys:project:save")
    public R save(@RequestBody SysProjectEntity proj){
        //数据校验
        verifyForm(proj);
        sysProjectService.save(proj);
        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改")
    @PostMapping("/update")
    @RequiresPermissions("sys:project:update")
    public R update(@RequestBody SysProjectEntity proj){
        //数据校验
        verifyForm(proj);
        sysProjectService.updateById(proj);
        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除项目")
    @PostMapping("/delete")
    @RequiresPermissions("sys:project:delete")
    public R delete(@RequestBody Long[] projectIds){
        for(int i=0;i<projectIds.length;i++){
            List<Long> userSize=sysUserProjectService.queryUserIdList(projectIds[i]);
            if(userSize!=null && userSize.size()>0){
                return R.error("请先删除项目关联的用户");
            }
        }
        sysProjectService.deleteBatch(projectIds);
        return R.ok();
    }

    /**
     * 验证参数是否正确
     */
    private void verifyForm(SysProjectEntity proj) {
        if (StringUtils.isBlank(proj.getProjectName())) {
            throw new RRException("名称不能为空");
        }
    }

}
