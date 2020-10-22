package io.renren.modules.sys.entity;

import lombok.Data;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-14 19:19
 */
@Data
public class UserRelateEntity {
    private Long[] userIds;
    private Long[] deptIds;
    private Long[] roleIds;
    private Long[] projectIdList;
}
