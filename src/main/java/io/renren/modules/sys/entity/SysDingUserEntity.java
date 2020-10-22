package io.renren.modules.sys.entity;
import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @description:
 * @author: liukun
 * @create: 2020-09-09 11:22
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysDingUserEntity {
    //private Long id;
    //@Excel(name = "性别",width = 10,height = 10,replace = {"男_1","女_0"},suffix = "生")
    //private Integer sex;
    @Excel(name = "姓名",width= 30,height = 15)
    private String name;
    @Excel(name = "用户id",width= 30,height = 15)
    private String dingId;

    @Excel(name = "部门",width= 30,height = 15)
    private String department;

    @Excel(name = "部门id",width= 30,height = 15)
    private String deptId;

    @Excel(name = "手机号",width= 30,height = 15)
    private String phone;

    @Excel(name = "邮箱",width= 30,height = 15)
    private String email;
}
