package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysProjectEntity;
import io.renren.modules.sys.entity.SysRoleEntity;

import java.util.Map;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 16:48
 */
public interface SysProjectService extends IService<SysProjectEntity> {

    SysProjectEntity queryProjectById(Long projId);

    SysProjectEntity queryProjectByName(String name);

    SysProjectEntity queryProjectByOtherId(String otherId);

    PageUtils queryPage(Map<String, Object> params);

    void deleteBatch(Long[] projectIds);

}
