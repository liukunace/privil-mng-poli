package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-04 10:19
 */
@Data
//@TableName("sys_component")
public class SysComponent implements Serializable {
    private static final long serialVersionUID = 1L;

    private String __config__;

}
