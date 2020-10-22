package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysUserInfoEntity;

public interface SysUserInfoService  extends IService<SysUserInfoEntity> {
    /**
     * 保存用户
     */
    void saveUser(SysUserInfoEntity user);
}
