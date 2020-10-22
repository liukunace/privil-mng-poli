package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 11:13
 */
@Data
@TableName("sys_project")
public class SysProjectEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId
    private Long projectId;

    /**
     * 名称
     */
    @NotBlank(message="角色名称不能为空")
    private String projectName;

    private String otherId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建者ID
     */
    private Long createUserId;
}
