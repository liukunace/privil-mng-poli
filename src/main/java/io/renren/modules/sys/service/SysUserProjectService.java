package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysUserProjectEntity;

import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 11:26
 */
public interface SysUserProjectService extends IService<SysUserProjectEntity> {

    void saveOrUpdate(Long userId, List<Long> projectIdList);

    /**
     * 根据项目ID，获取用户ID列表
     */
    List<Long> queryProjectIdList(Long userId);

    int deleteBatch(Long[] projectIds);

    List<Long> queryUserIdList(Long projectId);

}
