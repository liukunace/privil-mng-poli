package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.dao.SysUserInfoDao;
import io.renren.modules.sys.entity.SysUserInfoEntity;
import io.renren.modules.sys.service.SysUserInfoService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

@Service("sysUserInfoService")
public class SysUserInfoServiceImpl extends ServiceImpl<SysUserInfoDao, SysUserInfoEntity> implements SysUserInfoService {

    @Override
    public void saveUser(SysUserInfoEntity user) {
        user.setPassword(md5(user.getPassword()));
        this.save(user);
    }

    // 不带秘钥加密
    private static String md5(String text)  {
        // 加密后的字符串
        String md5str = DigestUtils.md5Hex(text);
        System.out.println("MD52加密后的字符串为:" + md5str + "\t长度：" + md5str.length());
        return md5str;
    }
    // 带秘钥加密
    public static String md5(String text, String key) throws Exception {
        // 加密后的字符串
        String md5str = DigestUtils.md5Hex(text + key);
        System.out.println("MD5加密后的字符串为:" + md5str);
        return md5str;
    }


}
