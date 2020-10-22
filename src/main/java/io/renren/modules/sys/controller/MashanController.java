package io.renren.modules.sys.controller;


import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysMenuEntity;
import io.renren.modules.sys.form.NameForm;
import io.renren.modules.sys.service.ShiroService;
import io.renren.modules.sys.service.SysMenuService;
import io.renren.modules.sys.service.SysUserService;
import io.renren.modules.sys.service.SysUserTokenService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/mas")
public class MashanController extends AbstractController{
    @GetMapping("/test")
    public String test(){
        return "mas-sys-oauth-test";
    }

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private ShiroService shiroService;
    @Autowired
    private SysUserTokenService sysUserTokenService;

    /**
     * 导航菜单
     */
    @GetMapping("/nav")
    public R nav(@RequestBody NameForm form){
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(getUserId());
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuListByName("liuk");//error
        String name=form.getName();
        Long userId;
        userId=sysUserService.queryUserIdByName(name);
        List<SysMenuEntity> menuList = sysMenuService.getUserBusinessMenuList(userId);
        Set<String> permissions = shiroService.getUserPermissionsBuziness(userId);
        return R.ok().put("menuList", menuList).put("permissions", permissions);
    }

    /**
     * 导航菜单备用
     */
    @GetMapping("/nav/{name}")
    public R nav(@PathVariable("name") String name){
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(getUserId());
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuListByName("liuk");//error
        Long userId;
        userId=sysUserService.queryUserIdByName(name);
        List<SysMenuEntity> menuList = sysMenuService.getUserBusinessMenuList(userId);
        Set<String> permissions = shiroService.getUserPermissionsBuziness(userId);
        return R.ok().put("menuList", menuList).put("permissions", permissions);
    }

    /**
     * 所有菜单列表(根据用户权限获取)
     */
    @GetMapping("/role/list/{name}")
    public List<SysMenuEntity> list(@PathVariable("name") String name){
        List<SysMenuEntity> menuList = sysMenuService.list();
        for(SysMenuEntity sysMenuEntity : menuList){
            SysMenuEntity parentMenuEntity = sysMenuService.getById(sysMenuEntity.getParentId());
            if(parentMenuEntity != null){
                sysMenuEntity.setParentName(parentMenuEntity.getName());
            }
        }
        Long userId=sysUserService.queryUserIdByName(name);
        Set<String> permissions = shiroService.getUserPermissions(userId);
        Iterator<SysMenuEntity> iterator = menuList.iterator();
        while (iterator.hasNext()) {
            SysMenuEntity menu = iterator.next();
            String menuPers=menu.getPerms();
            if(menuPers!=null&&menuPers!=""){
                if(!menuPers.contains(",")){
                    if (!permissions.contains(menu.getPerms())) {
                        iterator.remove();//迭代器删除
                    }
                }else{
                    String[] menuPersArr=menuPers.split(",");
                    if (!permissions.contains(menuPersArr[0]) && !permissions.contains(menuPersArr[1])) {
                        iterator.remove();//迭代器删除
                    }
                }
            }
        }
        return menuList;
    }

    private boolean containsPers(Set<String> set,String b){
        /**
        for (String temp: set) {
            if(temp.equals(b)||b.contains(temp)){
                return true;
            }
        }*/
        Iterator<String> it = set.iterator();
        while (it.hasNext()) {
            String temp = it.next();
            if (temp.equals(b) || b.contains(temp)) {
                return true;
            }
        }
        return false;
    }


    /**
     * 全部导航菜单
     */
    @GetMapping("/navall/{name}")
    public R navall(@PathVariable("name") String name){
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(getUserId());
        //List<SysMenuEntity> menuList = sysMenuService.getUserMenuListByName("liuk");//error
        Long userId;
        userId=sysUserService.queryUserIdByName(name);
        List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(userId);
        Set<String> permissions = shiroService.getUserPermissions(userId);
        return R.ok().put("menuList", menuList).put("permissions", permissions);
    }

    /**
     * 更新token by sso
     */
    @GetMapping("/user/{name}/{token}")
    public R fetchUserIdByName(@PathVariable("name") String name,@PathVariable("token") String token){
        Long userId=sysUserService.queryUserIdByName(name);
        if(userId!=null && userId!=0){
            sysUserTokenService.createTokenBySso(userId,token);
            return R.error(200,"success");
        }else {
            return R.error("token up error");
        }

    }
}
