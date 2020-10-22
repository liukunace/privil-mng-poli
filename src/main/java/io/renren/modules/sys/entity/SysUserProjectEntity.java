package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 11:20
 */

@Data
@TableName("sys_user_project")
public class SysUserProjectEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 项目ID
     */
    private Long projectId;
}
