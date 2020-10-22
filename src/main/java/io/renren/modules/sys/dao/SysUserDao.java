/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 系统用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {
	
	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);
	
	/**
	 * 根据用户名，查询系统用户
	 */
	SysUserEntity queryByUserName(String username);

	SysUserEntity queryByDingId(String dingId);

    List<SysUserEntity> queryByDingName(String dingName);

	//IPage<SysUserEntity> queryUserByDeptPerms(Page<SysUserEntity> page, @Param(Constants.WRAPPER) Wrapper<SysUserEntity> queryWrapper, Long deptId);
	IPage<SysUserEntity> queryUserByDeptPerms(Page<SysUserEntity> page, Long deptId, String dingName);

	IPage<SysUserEntity> queryUserByRolePerms(Page<SysUserEntity> page, Long roleId, String dingName);

    List<SysUserEntity> queryUserByUserIds(List<Long> userIds);

	SysUserEntity queryUserByDingId(String dingId);

	Long queryUserIdByName(String username);

    List<Long> queryAllMenuIdByName(String userName);
}
