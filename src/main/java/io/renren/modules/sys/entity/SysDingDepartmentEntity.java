package io.renren.modules.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-09 15:10
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysDingDepartmentEntity {
    //部门id	部门	key(英文key值)	父级id
    @Excel(name = "部门id",numFormat="0",width= 30,height = 15)
    private Long deptId;
    @Excel(name = "部门",width= 60,height = 15)
    private String label;
    @Excel(name = "key(英文key值)",width= 30,height = 15)
    private String value;
    @Excel(name = "父级id",numFormat="0",width= 30,height = 15)
    private Long pid;
}
