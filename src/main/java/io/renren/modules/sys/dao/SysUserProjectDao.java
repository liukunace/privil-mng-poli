package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysUserProjectEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 11:24
 */
@Mapper
public interface SysUserProjectDao extends BaseMapper<SysUserProjectEntity> {
    /**
     * 根据项目ID，获取用户ID列表
     */
    List<Long> queryProjectIdList(Long userId);

    int deleteBatch(Long[] projectIds);

    List<Long> queryUserIdList(Long roleId);

}
