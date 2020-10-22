package io.renren.modules.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-28 19:25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysDingProjectEntity {
    @Excel(name = "项目id",numFormat="0",width= 30,height = 15)
    private Long projectId;
    @Excel(name = "项目名称",width= 60,height = 15)
    private String projectName;
    @Excel(name = "第三方ID",width= 30,height = 15)
    private String otherId;
    @Excel(name = "备注",width= 60,height = 15)
    private String remark;
}
