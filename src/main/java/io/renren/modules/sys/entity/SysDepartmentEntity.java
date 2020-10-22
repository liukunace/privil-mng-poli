package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-01 18:25
 */
@Data
@TableName("sys_department")
public class SysDepartmentEntity implements Serializable {
    /**
     * ID
     */
    @TableId
    private Long deptId;

    /**
     * 父级ID
     */
    private Long pId;

    /**
     * 父菜单名称
     */
    @TableField(exist=false)
    private String parentName;

    private String dingId;
    /**
     * 名称
     */
    @NotBlank(message="部门名称不能为空")
    private String label;

    /**
     * 部门key
     */
    private String value;

    /**
     * 类型     0：目录   1：钉钉   2：系统
     */
    private Integer type;

    /**
     * 排序
     */
    private Integer rankn;

    /**
     * 备注
     */
    private String remark;

    @TableField(exist=false)
    private List<?> children;

    @TableField(exist=false)
    private List<Long> userIdList;

    /**
     * ztree属性
     */
    @TableField(exist=false)
    private Boolean open;

}
