package io.renren.modules.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.annotation.SysLog;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.*;
import io.renren.modules.sys.form.NameForm;
import io.renren.modules.sys.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/poli")
public class PoliController extends AbstractController{
    @GetMapping("/test")
    public String test(){
        return "poli-sys-oauth-test";
    }

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private ShiroService shiroService;
    @Autowired
    private SysUserTokenService sysUserTokenService;

    @Autowired
    private SysUserProjectService sysUserProjectService;

    @Autowired
    private SysDepartmentService sysDepartmentService;

    @Autowired
    private SysUserDepartmentService sysUserDepartmentService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysProjectService sysProjectService;

    /**
     * 第三方项目保存
     */
    @PostMapping("/project/save")
    public R save(@RequestParam("projectName") String projectName,
                  @RequestParam("otherId") String otherId){
        SysProjectEntity projEx=sysProjectService.queryProjectByOtherId(otherId);
        if(projEx!=null){
            return R.ok().put("status","重复数据");
        }
        SysProjectEntity proj=new SysProjectEntity();
        proj.setProjectName(projectName);
        proj.setOtherId(otherId);
        proj.setRemark("第三方同步");
        sysProjectService.save(proj);
        return R.ok();
    }
    /**
     * 项目查重
     */
    @GetMapping("/project/check/{otherId}")
    public R infoCheck(@PathVariable("otherId") String otherId){
        if(sysProjectService.queryProjectByOtherId(otherId)!=null){
            return R.ok().put("projectId", sysProjectService.queryProjectByOtherId(otherId).getProjectId());
        }
        return R.ok().put("projectId", null);
    }

    /**
     * 部门信息
     */
    @GetMapping("/dept/info")
    public R deptsinfo(@RequestParam("deptIds") String deptIds){
        String[] deptIdsArray=deptIds.split(",");
        List<SysDepartmentEntity> list=new ArrayList<>();
        for(int i=0;i<deptIdsArray.length;i++){
            SysDepartmentEntity dept = sysDepartmentService.getById(Long.valueOf(deptIdsArray[i]));
            if(dept!=null){
                list.add(dept);
            }
        }
        return R.ok().put("departments", list);
    }

    /**
     * 部门信息
     */
    @GetMapping("/dept/info/{deptId}")
    public R deptinfo(@PathVariable("deptId") Long deptId){
        SysDepartmentEntity dept = sysDepartmentService.getById(deptId);
        return R.ok().put("department", dept);
    }

    /**
     * 用户名查询
     */
    @GetMapping("/exit/{name}")
    public R nameExit(@PathVariable("name") String name){
        SysUserEntity user=sysUserService.queryByUserName(name);
        boolean isExit= user!=null ? true : false;
        return R.ok().put("isExit", isExit);
    }

    /**
     * 根据部门获取用户列表
     */
    @PostMapping("/user/relate")
    public R updateUsersRelate(@RequestBody UserRelateEntity userR){
        System.out.println(userR.getUserIds());
        int size=userR.getUserIds().length;
        if(size>0){
            for(int i=0;i<size;i++){
                //roleIds
                SysUserEntity u=sysUserService.getById(userR.getUserIds()[i]);

                if(userR.getDeptIds()!=null && userR.getDeptIds().length>0){
                    List<Long> li=Arrays.asList(userR.getDeptIds());
                    if(li!=null && li.size()>0){
                        u.setDeptIdList(li);
                    }
                }
                if(userR.getRoleIds()!=null && userR.getRoleIds().length>0){
                    List<Long> li=Arrays.asList(userR.getRoleIds());
                    if(li!=null && li.size()>0){
                        u.setRoleIdList(li);
                    }
                }
                if(userR.getProjectIdList()!=null && userR.getProjectIdList().length>0){
                    List<Long> li=Arrays.asList(userR.getProjectIdList());
                    if(li!=null && li.size()>0){
                        u.setProjectIdList(li);
                    }
                }
                u.setCreateUserId(1L);
                u.setStatus(1);
                u.setPassword(null);
                sysUserService.update(u);
            }
        }
        return R.ok().put("status", "update"+size+"条。");
    }

    /**
     * 根据部门获取用户列表
     */
    @GetMapping("/dept/user")
    public R queryUsersByDept(@RequestParam("id") Long id ){
        List<Long> ids=sysUserDepartmentService.queryUserIdList(id);
        if(ids.size()<=0){
            return R.ok().put("list", null);
        }
        List<SysUserEntity> list=sysUserService.queryUserByUserIds(ids);
        return R.ok().put("list", list);
    }

    /**
     * 根据部门获取用户列表
     */
    @GetMapping("/user1")
    public R queryUsersByDeptGroup(@RequestParam("deptId") Long deptId ,@RequestParam("dingName") String dingName){
        Page<SysUserEntity> page = new Page<>(1, 10);
        IPage<SysUserEntity> list=sysUserService.queryUserByDeptPerms(page,deptId,"%"+dingName+"%");
        return R.ok().put("page", list);
    }

    /**
     * 根据项目获取用户列表
     */
    @GetMapping("/project/user")
    public R queryUsersByProject(@RequestParam("id") Long id ){
        List<Long> ids=sysUserProjectService.queryUserIdList(id);
        if(ids.size()<=0){
            return R.ok().put("list", null);
        }
        List<SysUserEntity> list=sysUserService.queryUserByUserIds(ids);
        return R.ok().put("list", list);
    }

    /**
     * 根据角色获取用户列表
     */
    @GetMapping("/role/user")
    public R queryUsersByRole(@RequestParam("id") Long id ){
        List<Long> ids=sysUserRoleService.queryUserIdList(id);
        if(ids.size()<=0){
            return R.ok().put("list", null);
        }
        List<SysUserEntity> list=sysUserService.queryUserByUserIds(ids);
        return R.ok().put("list", list);
    }

    /**
     * 根据部门，角色，项目获取用户列表
     */
    @GetMapping("/multiple/user")
    public R queryUsersBymultiple(@RequestParam(value = "deptId", required = false, defaultValue = "-1") Long deptId,
                                  @RequestParam(value = "roleId", required = false, defaultValue = "16") Long roleId,
                                  @RequestParam(value = "projId", required = false, defaultValue = "-1") Long projId ){
        List<Long> ids=null;
        if(deptId!=null && deptId>=0){
            ids=sysUserDepartmentService.queryUserIdList(deptId);//1
            if(roleId!=null && roleId>=0){
                ids.retainAll(sysUserRoleService.queryUserIdList(roleId));//12
                if(projId!=null && projId>=0){
                    ids.retainAll(sysUserProjectService.queryUserIdList(projId));//123
                }
            }else{
                if(projId!=null && projId>=0){
                    ids.retainAll(sysUserProjectService.queryUserIdList(projId));//13
                }
            }
        }else{
            if(roleId!=null && roleId>=0){
                ids=sysUserRoleService.queryUserIdList(roleId);//2
                if(projId!=null && projId>=0){
                    ids.retainAll(sysUserProjectService.queryUserIdList(projId));//23
                }
            }else{
                if(projId!=null && projId>=0){
                    ids=sysUserProjectService.queryUserIdList(projId);//3
                }
            }
        }

        if(ids==null || ids.size()<=0){
            return R.ok().put("list", null);
        }
        //System.out.println(ids);
        List<SysUserEntity> list=sysUserService.queryUserByUserIds(ids);
        return R.ok().put("list", list);
    }

    /**
     * 根据部门，角色，项目获取用户列表
     */
    @GetMapping("/multiple_wer/user")
    public R queryUsersBymultipleWer(@RequestParam(value = "deptId", required = false, defaultValue = "-1") Long deptId,
                                  @RequestParam(value = "roleId", required = false, defaultValue = "16") Long roleId,
                                  @RequestParam(value = "projId", required = false, defaultValue = "-1") String projId ){
        List<Long> ids=null;
        if(deptId!=null && deptId>=0){
            ids=sysUserDepartmentService.queryUserIdList(deptId);//1
            if(roleId!=null && roleId>=0){
                ids.retainAll(sysUserRoleService.queryUserIdList(roleId));//12
                if(projId!=null && !projId.equals("-1")){
                    ids.retainAll(sysUserProjectService.queryUserIdList(sysProjectService.queryProjectByOtherId(projId).getProjectId()));//123
                }
            }else{
                if(projId!=null && !projId.equals("-1")){
                    ids.retainAll(sysUserProjectService.queryUserIdList(sysProjectService.queryProjectByOtherId(projId).getProjectId()));//13
                }
            }
        }else{
            if(roleId!=null && roleId>=0){
                ids=sysUserRoleService.queryUserIdList(roleId);//2
                if(projId!=null && !projId.equals("-1")){
                    ids.retainAll(sysUserProjectService.queryUserIdList(sysProjectService.queryProjectByOtherId(projId).getProjectId()));//23
                }
            }else{
                if(projId!=null && !projId.equals("-1")){
                    ids=sysUserProjectService.queryUserIdList(sysProjectService.queryProjectByOtherId(projId).getProjectId());//3
                }
            }
        }

        if(ids==null || ids.size()<=0){
            return R.ok().put("list", null);
        }
        //System.out.println(ids);
        List<SysUserEntity> list=sysUserService.queryUserByUserIds(ids);
        return R.ok().put("list", list);
    }

    /**
     * 导航菜单
     */
    @GetMapping("/dep")
    public R getDeptt(){
        Long id=2L;
        List<SysDepartmentEntity> list = sysDepartmentService.list();
        return R.ok().put("list", list);
    }

    @GetMapping("/dept/list")
    public R getDeptNav(){
        List<SysDepartmentEntity> list = sysDepartmentService.queryDeptList();
        return R.ok().put("list", list);
    }

    @GetMapping("/user/list")
    public R queryUserList(){
        List<SysUserEntity> list = sysUserService.list();
        return R.ok().put("list", list);
    }

    @GetMapping("/user/name")
    public R queryUserByName(@RequestParam("name") String name){
        SysUserEntity u = sysUserService.queryByUserName(name);
        List<String> projlist=new ArrayList<>();
        List<Long> idlist=sysUserProjectService.queryProjectIdList(u.getUserId());

        for(int i=0;i<idlist.size(); i++){
            String idx=sysProjectService.queryProjectById(idlist.get(i)).getOtherId();
            projlist.add(idx);
        }
        u.setProjectOtherIdList(projlist);
        return R.ok().put("user", u);
    }

    @GetMapping("/dept/cascad")//http://localhost:60605/privil-mng-poli/poli/dept/cascad?id=2
    public R getDeptNavUp(@RequestParam("id") Long id){
        List<Long> idList=sysUserDepartmentService.queryDeptIdList(id);
        if(idList.size()<=0){
            return R.ok().put("list", null);
        }
        List<String> list = sysDepartmentService.queryCascadList(idList.get(0));
        return R.ok().put("list", list);
    }

    @GetMapping("/dept/cascadname")//http://localhost:60605/privil-mng-poli/poli/dept/cascad?id=2
    public R getDeptNavUpByName(@RequestParam("id") Long id, @RequestParam("name") String name){
        List<Long> idList=sysUserDepartmentService.queryDeptIdList(id);
        if(idList.size()<=0){
            if(name!=null && !name.equals("")){
                List<String> dlist = sysDepartmentService.queryCascadList(name);
                return R.ok().put("list", dlist);
            }
            List<String> list = sysDepartmentService.queryCascadList(idList.get(0));
            return R.ok().put("list", list);
        }

        if(idList.size()>=1){
            List<List<String>> listAll=new ArrayList<>();
            for(int i=0;i<idList.size();i++){
                List<String> list = sysDepartmentService.queryCascadList(idList.get(i));
                listAll.add(list);
            }
            return R.ok().put("list", listAll);
        }
        return R.ok().put("list", null);

    }

    @GetMapping("/dept/getid")//http://localhost:60605/privil-mng-poli/poli/dept/cascad?id=6
    public R getDeptByLabel(@RequestParam("value") String value){
        SysDepartmentEntity dept=sysDepartmentService.queryDeptByValue(value);
        return R.ok().put("dept", dept);
    }

    /**
     * 导航菜单
     */
    @GetMapping("/ids")
    public R getUserIdsByProject(){
        Long id=1L;
        List<Long> userIdList = sysUserProjectService.queryProjectIdList(id);
        return R.ok().put("userIds", userIdList);
    }

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
     * 验证钉钉账号 By ID
     */
    @GetMapping("/ding/check")
    public R checkDingId(@RequestParam("id") String id){
        SysUserEntity user = sysUserService.queryUserByDingId(id);
        if(user!=null){
            return R.ok().put("user",user.getUsername()).put("cname",user.getDingName());
        }
        return  R.ok().put("user",null);
    }

    /**
     * 导航菜单备用  http://poliprivil.mng.ivtech.tech/privil-mng-poli/poli/nav/admin
     *                     poliprivil.mng.ivtech.tech
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

    @GetMapping("/nav/ding/{dingId}")
    public R navDing(@PathVariable("dingId") String dingId){
        if(sysUserService.queryByDingId(dingId)!=null ){
            Long userId=sysUserService.queryByDingId(dingId).getUserId();

            //Set<String> permissions = shiroService.getUserPermissionsBuziness(userId);
            //List<SysMenuEntity> menuList = sysMenuService.getUserBusinessMenuList(userId);
            List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(userId);
            Set<String> permissions = shiroService.getUserPermissions(userId);

            return R.ok().put("menuList", menuList).put("permissions", permissions);
        }
        return R.ok().put("menuList",null);
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
