package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysProjectEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 16:50
 */
@Mapper
public interface SysProjectDao extends BaseMapper<SysProjectEntity> {

    SysProjectEntity queryProjectByName(String name);

    SysProjectEntity queryProjectByOtherId(String otherId);

}
