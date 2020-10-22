/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.RRException;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.R;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.SysUserInfoEntity;
import io.renren.modules.sys.service.*;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 系统用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUserEntity> implements SysUserService {
	@Autowired
	private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysUserProjectService sysUserProjectService;
    @Autowired
    private SysUserDepartmentService sysUserDepartmentService;
    @Autowired
    private SysDepartmentService sysDepartmentService;
    @Autowired
    private SysProjectService sysProjectService;

	@Autowired
	private SysRoleService sysRoleService;

	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		String username = (String)params.get("username");
		String departmentName = (String)params.get("departmentName");
		String projectName = (String)params.get("projectName");
		String roleName = (String)params.get("roleName");
		Long createUserId = (Long)params.get("createUserId");

		IPage<SysUserEntity> page = this.page(
			new Query<SysUserEntity>().getPage(params),
			new QueryWrapper<SysUserEntity>()
				.like(StringUtils.isNotBlank(username),"ding_name", username)
				.like(StringUtils.isNotBlank(departmentName),"department_name", departmentName)
				.like(StringUtils.isNotBlank(projectName),"project_name", projectName)
				.like(StringUtils.isNotBlank(roleName),"role_name", roleName)
				.eq(createUserId != null,"create_user_id", createUserId)
		);
		return new PageUtils(page);
	}

    @Override
    public PageUtils queryPageGroup(Map<String, Object> params) {
        Page pageObj=(Page)params.get("page");
        Long pageNum = pageObj.getCurrent();
        Long limitNum = pageObj.getSize();
        String dingName = "%"+(String)params.get("username")+"%";
        Long deptId = (Long)params.get("deptId");
        Page<SysUserEntity> page = new Page<>(pageNum, limitNum);

        QueryWrapper<SysUserEntity> wrapper = new QueryWrapper();
        wrapper.like(StringUtils.isNotBlank(dingName),"ding_name", dingName);

        IPage<SysUserEntity> pageList=this.queryUserByDeptPerms(page,deptId,dingName);
        return new PageUtils(pageList);
    }

    @Override
    public PageUtils queryPageRole(Map<String, Object> params) {
        Page pageObj=(Page)params.get("page");
        Long pageNum = pageObj.getCurrent();
        Long limitNum = pageObj.getSize();
        String dingName = "%"+(String)params.get("username")+"%";
        Long roleId = (Long)params.get("roleId");
        Page<SysUserEntity> page = new Page<>(pageNum, limitNum);
        IPage<SysUserEntity> pageList=this.queryUserByRolePerms(page,roleId,dingName);
        return new PageUtils(pageList);
    }

    @Override
	public List<String> queryAllPerms(Long userId) {
		return baseMapper.queryAllPerms(userId);
	}

	@Override
	public List<Long> queryAllMenuId(Long userId) {
		return baseMapper.queryAllMenuId(userId);
	}

    @Override
    public List<Long> queryAllMenuIdByName(String userName) {
        return baseMapper.queryAllMenuIdByName(userName);
    }

	@Override
	public SysUserEntity queryByUserName(String username) {
		return baseMapper.queryByUserName(username);
	}

    @Override
    public SysUserEntity queryByDingId(String dingId) {
        return baseMapper.queryUserByDingId(dingId);
    }

    @Override
    public SysUserEntity queryUserByDingId(String dingId) {
        return baseMapper.queryUserByDingId(dingId);
    }

    @Override
    public List<SysUserEntity> queryUserByUserIds(List<Long> userIds) {
        return baseMapper.queryUserByUserIds(userIds);
    }

    @Override
    public Long queryUserIdByName(String username){
        return baseMapper.queryUserIdByName(username);
    }

    @Override
    public List<SysUserEntity> queryByDingName(String dingName) {
        return baseMapper.queryByDingName(dingName);
    }

    @Override
    public IPage<SysUserEntity> queryUserByDeptPerms(Page<SysUserEntity> page, Long deptId, String dingName) {
        return baseMapper.queryUserByDeptPerms(page,deptId,dingName);
    }

    @Override
    public IPage<SysUserEntity> queryUserByRolePerms(Page<SysUserEntity> page, Long roleId, String dingName) {
        return baseMapper.queryUserByRolePerms(page,roleId,dingName);
    }

    @Override
	@Transactional
	public void saveUser(SysUserEntity user) {
		user.setCreateTime(new Date());
		//sha256加密
		String salt = RandomStringUtils.randomAlphanumeric(20);
		user.setPassword(new Sha256Hash(user.getPassword(), salt).toHex());
		user.setSalt(salt);
        userParamHandler(user);
		this.save(user);
		//检查角色是否越权
		checkRole(user);
		//保存用户与角色关系
        userRoleHandler(user);
	}

    @Override
    @Transactional
    public void saveDingUser(SysUserEntity user) {
        user.setCreateTime(new Date());
        this.save(user);
    }

    //saveUser2(SysUserInfoEntity user);

	@Override
	@Transactional
	public void update(SysUserEntity user) {
		if(StringUtils.isBlank(user.getPassword())){
			user.setPassword(null);
		}else{
			user.setPassword(new Sha256Hash(user.getPassword(), user.getSalt()).toHex());
		}
        userParamHandler(user);
		this.updateById(user);
		//检查角色是否越权
		checkRole(user);
		//保存用户与角色、项目、部门关系
        userRoleHandler(user);
	}

	@Override
	public void deleteBatch(Long[] userId) {
		this.removeByIds(Arrays.asList(userId));
	}

	@Override
	public boolean updatePassword(Long userId, String password, String newPassword) {
		SysUserEntity userEntity = new SysUserEntity();
		userEntity.setPassword(newPassword);
		return this.update(userEntity,
				new QueryWrapper<SysUserEntity>().eq("user_id", userId).eq("password", password));
	}
	
	/**
	 * 检查角色是否越权
	 */
	private void checkRole(SysUserEntity user){
		if(user.getRoleIdList() == null || user.getRoleIdList().size() == 0){
			return;
		}
		//如果不是超级管理员，则需要判断用户的角色是否自己创建
		if(user.getCreateUserId() == Constant.SUPER_ADMIN){
			//return ;
		}
		
		//查询用户创建的角色列表
		List<Long> roleIdList = sysRoleService.queryRoleIdList(user.getCreateUserId());

		//判断是否越权
		if(!roleIdList.containsAll(user.getRoleIdList())){
			//throw new RRException("新增用户所选角色，不是本人创建");
		}
	}

	private void userParamHandler(SysUserEntity user){
        String deptName="";
        if(user.getDeptIdList()!=null && user.getDeptIdList().size()>=1){
            for(int i=0;i<user.getDeptIdList().size();i++){
                deptName+=sysDepartmentService.queryDeptById(user.getDeptIdList().get(i)).getLabel()+",";
            }
            user.setDepartmentName(deptName.substring(0, deptName.length() -1));
        }else{
            user.setDepartmentName("");
        }
        String projectName="";
        if(user.getProjectIdList()==null || user.getProjectIdList().size()<=0){
            //projectName="无项目归属,";
        }
        if(user.getProjectIdList()!=null && user.getProjectIdList().size()>0){
            for(int i=0;i<user.getProjectIdList().size();i++){
                projectName+=sysProjectService.queryProjectById(user.getProjectIdList().get(i)).getProjectName()+",";
            }
            user.setProjectName(projectName.substring(0, projectName.length() -1));
        }

        String roleName="";
        if(user.getRoleIdList()!=null && user.getRoleIdList().size()>0){
            for(int i=0;i<user.getRoleIdList().size();i++){
                roleName+=sysRoleService.queryRoleById(user.getRoleIdList().get(i)).getRoleName()+",";
            }
            user.setRoleName(roleName.substring(0, roleName.length() -1));
        }

    }

    private void userRoleHandler(SysUserEntity user){
        if(user.getRoleIdList()!=null && user.getRoleIdList().size()>=1){
            sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
        }
        if(user.getProjectIdList()!=null && user.getProjectIdList().size()>=1){
            sysUserProjectService.saveOrUpdate(user.getUserId(), user.getProjectIdList());
        }
        if(user.getDeptIdList()!=null && user.getDeptIdList().size()>=1){
            sysUserDepartmentService.saveOrUpdate(user.getUserId(), user.getDeptIdList());
        }

    }

}