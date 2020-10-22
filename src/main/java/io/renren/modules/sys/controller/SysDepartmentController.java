package io.renren.modules.sys.controller;

import io.renren.common.annotation.SysLog;
import io.renren.common.utils.Constant;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.sys.entity.SysDepartmentEntity;
import io.renren.modules.sys.entity.SysMenuEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.SysUserInfoEntity;
import io.renren.modules.sys.service.SysDepartmentService;
import io.renren.modules.sys.service.SysUserDepartmentService;
import io.renren.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import utils.PinyinUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-02 11:16
 */
@RestController
@RequestMapping("/sys/dept")
public class SysDepartmentController extends AbstractController{

    @Autowired
    private SysDepartmentService sysDepartmentService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysUserDepartmentService sysUserDepartmentService;

    /**
     * 部门列表
     */
    @GetMapping("/select")
    @RequiresPermissions("sys:dept:select")
    public R select(){
        Map<String, Object> map = new HashMap<>();

        //如果不是超级管理员，则只查询自己所拥有的部门列表
        if(getUserId() != Constant.SUPER_ADMIN){
            //map.put("create_user_id", getUserId());
        }
        List<SysDepartmentEntity> list = sysDepartmentService.listByMap(map);
        //添加顶级菜单
        SysDepartmentEntity root = new SysDepartmentEntity();
        root.setDeptId(0L);
        root.setLabel("一级目录");
        root.setPId(-1L);
        root.setOpen(true);
        list.add(root);

        return R.ok().put("list", list);
    }

    /**
     * 所有菜单列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sys:dept:list")
    public List<SysDepartmentEntity> list(){
        List<SysDepartmentEntity> menuList = sysDepartmentService.list();
        for(SysDepartmentEntity sysMenuEntity : menuList){
            SysDepartmentEntity parentMenuEntity = sysDepartmentService.getById(sysMenuEntity.getPId());
            if(parentMenuEntity != null){
                sysMenuEntity.setParentName(parentMenuEntity.getLabel());
            }
        }
        return menuList;
    }


    /**
     * 部门信息
     */
    @GetMapping("/info/{deptId}")
    public R info(@PathVariable("deptId") Long deptId){
        SysDepartmentEntity dept = sysDepartmentService.getById(deptId);
        return R.ok().put("department", dept);
    }

    /**
     * 保存部门
     */
    @SysLog("保存部门")
    @PostMapping("/save")
    public R save(@RequestBody SysDepartmentEntity dept){
        if(dept.getLabel()==null || dept.getLabel().equals("")){
            return R.error(408,"名称属性类型错误");
        }
        String code= PinyinUtils.getAllPinyin(dept.getLabel());
        dept.setValue(code+ (int)((Math.random()*9+1)*1000));
        sysDepartmentService.save(dept);
        return R.ok();
    }

    /**
     * 修改部门
     */
    @SysLog("修改部门")
    @PostMapping("/update")
    public R update(@RequestBody SysDepartmentEntity dept){
        String code= PinyinUtils.getAllPinyin(dept.getLabel());
        dept.setValue(code+ (int)((Math.random()*9+1)*1000));
        sysDepartmentService.saveOrUpdate(dept);
        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除部门")
    @PostMapping("/delete/{deptId}")
    @RequiresPermissions("sys:dept:delete")
    public R delete(@PathVariable("deptId") long deptId){
        //判断是否有子
        List<SysDepartmentEntity> deptList = sysDepartmentService.queryListParentId(deptId);
        if(deptList.size() > 0){
            return R.error("请先删除子部门");
        }
        List<Long> userSize=sysUserDepartmentService.queryUserIdList(deptId);
        if(userSize!=null && userSize.size()>0){
            for(int i=0;i<userSize.size();i++){
                SysUserEntity uex = sysUserService.getById(userSize.get(i));
                if(uex!=null){
                    return R.error("请先删除部门下的用户");
                }
            }
        }
        sysDepartmentService.delete(deptId);
        return R.ok();
    }

    /**
     * 批量删除部门
     */
    @SysLog("批量删除部门")
    @PostMapping("/delete")
    public R delete(@RequestBody Long[] deptIds){
        sysDepartmentService.deleteBatch(deptIds);
        return R.ok();
    }

}
