/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : sso_oauth2_poli

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 22/10/2020 18:27:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001753F311E287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'XTTD-2020WATKIG1603349934476', 1603350491186, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1603351800000, 1603350000000, 5, 'WAITING', 'CRON', 1603083290000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001753F311E287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2020-10-19 12:49:45');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 3, '2020-10-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 7, '2020-10-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 00:30:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 01:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 01:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 02:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 02:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 03:00:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 03:30:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 04:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 04:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 05:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 05:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 06:00:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 06:30:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 07:00:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 07:30:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 08:00:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 08:30:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 09:00:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 09:30:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 3, '2020-10-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 4, '2020-10-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-22 10:00:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-22 15:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `p_id` bigint(20) NULL DEFAULT NULL,
  `label` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ding_id` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `rankn` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES (2, 0, '青岛市黄岛区泊里镇人民政府', 'a0', NULL, '1', 0, 1);
INSERT INTO `sys_department` VALUES (272894239, 2, '智慧办', 'a02', NULL, '272894239', 1, 2);
INSERT INTO `sys_department` VALUES (273480001, 2, '党建工作办公室', 'a06', NULL, '273480001', 1, 6);
INSERT INTO `sys_department` VALUES (342627999, 2, '退役军人服务站', 'a12', NULL, '342627999', 1, 14);
INSERT INTO `sys_department` VALUES (342678862, 2, '董家口港社区', 'a24', NULL, '342678862', 1, 26);
INSERT INTO `sys_department` VALUES (342689912, 2, '港城文苑社区', 'a25', NULL, '342689912', 1, 27);
INSERT INTO `sys_department` VALUES (342701774, 2, '菜园社区', 'a26', NULL, '342701774', 1, 28);
INSERT INTO `sys_department` VALUES (342707837, 2, '政务服务局（便民服务中心）', 'a09', NULL, '342707837', 1, 10);
INSERT INTO `sys_department` VALUES (342783869, 2, '农业农村中心（农产品质量安全监管中心）', 'a13', NULL, '342783869', 1, 15);
INSERT INTO `sys_department` VALUES (342792845, 2, '财政审计中心（统计站）', 'a10', NULL, '342792845', 1, 11);
INSERT INTO `sys_department` VALUES (342795774, 2, '纪检监察办公室', 'a04', NULL, '342795774', 1, 4);
INSERT INTO `sys_department` VALUES (342832847, 2, '应急管理办公室', 'a08', NULL, '342832847', 1, 9);
INSERT INTO `sys_department` VALUES (342840788, 2, '港城佳苑社区', 'a27', NULL, '342840788', 1, 29);
INSERT INTO `sys_department` VALUES (342863822, 2, '重点项目攻坚办公室', 'a03', NULL, '342863822', 1, 3);
INSERT INTO `sys_department` VALUES (342863830, 2, '社会事务中心', 'a18', NULL, '342863830', 1, 22);
INSERT INTO `sys_department` VALUES (342864872, 2, '藏马社区', 'a201', NULL, '342864872', 1, 20);
INSERT INTO `sys_department` VALUES (342865747, 2, '借调人员', 'a40', NULL, '342865747', 1, 45);
INSERT INTO `sys_department` VALUES (342909739, 2, '社会治理中心', 'a16', NULL, '342909739', 1, 19);
INSERT INTO `sys_department` VALUES (342932771, 2, '平台公司筹备组', 'a36', NULL, '342932771', 1, 38);
INSERT INTO `sys_department` VALUES (342942670, 2, '兴泊社区', 'a28', NULL, '342942670', 1, 30);
INSERT INTO `sys_department` VALUES (342969636, 2, '新港城社区', 'a29', NULL, '342969636', 1, 31);
INSERT INTO `sys_department` VALUES (342980790, 2, '临港社区', 'a23', NULL, '342980790', 1, 24);
INSERT INTO `sys_department` VALUES (342988764, 2, '经济发展与投资促进中心', 'a14', NULL, '342988764', 1, 16);
INSERT INTO `sys_department` VALUES (342992716, 2, '老干部活动中心', 'a37', NULL, '342992716', 1, 7);
INSERT INTO `sys_department` VALUES (343014661, 2, '司法所', 'a38', NULL, '343014661', 1, 43);
INSERT INTO `sys_department` VALUES (343048585, 2, '宣教文卫中心', 'a15', NULL, '343048585', 1, 18);
INSERT INTO `sys_department` VALUES (343056577, 2, '红石社区', 'a31', NULL, '343056577', 1, 33);
INSERT INTO `sys_department` VALUES (343073673, 2, '党政办公室（人大办公室）', 'a01', NULL, '343073673', 1, 1);
INSERT INTO `sys_department` VALUES (343087657, 2, '发展保障中心', 'a17', NULL, '343087657', 1, 21);
INSERT INTO `sys_department` VALUES (343090597, 2, '封家社区', 'a32', NULL, '343090597', 1, 34);
INSERT INTO `sys_department` VALUES (343159502, 2, '尧头社区', 'a20', NULL, '343159502', 1, 23);
INSERT INTO `sys_department` VALUES (343176512, 2, '综合行政执法局（生态环境办公室）', 'a11', NULL, '343176512', 0, 13);
INSERT INTO `sys_department` VALUES (343176517, 2, '信阳社区', 'a33', NULL, '343176517', 1, 35);
INSERT INTO `sys_department` VALUES (343219378, 2, '规划建设管理办公室', 'a07', NULL, '343219378', 0, 8);
INSERT INTO `sys_department` VALUES (343253329, 2, '乡村振兴指导员', 'a39', NULL, '343253329', 0, 44);
INSERT INTO `sys_department` VALUES (343402112, 2, '双招双引办公室', 'a34', NULL, '343402112', 0, 17);
INSERT INTO `sys_department` VALUES (343404164, 2, '人武部', 'a35', NULL, '343404164', 0, 37);
INSERT INTO `sys_department` VALUES (343404168, 0, '系统组织架构', 'b1', NULL, NULL, 0, 2);
INSERT INTO `sys_department` VALUES (343404184, 2, '智慧办借调', 'a41', NULL, '407939146', 0, 46);
INSERT INTO `sys_department` VALUES (343404188, 343404168, '组织部1', 'zuzhibu85', NULL, NULL, 2, 0);
INSERT INTO `sys_department` VALUES (343404708, 343404168, '组织部2', 'zuzhibu2581', NULL, NULL, 2, 0);
INSERT INTO `sys_department` VALUES (343404709, 2, '督导巡查办公室', 'a05', NULL, '410434421', 0, 5);
INSERT INTO `sys_department` VALUES (343404710, 2, '泊里社区居委会', 'a19', NULL, '342864872', 0, 42);
INSERT INTO `sys_department` VALUES (343404711, 2, '沐官岛社区', 'a21', NULL, '410373614', 0, 24);
INSERT INTO `sys_department` VALUES (343404712, 2, '志翔路社区', 'a22', NULL, '410487366', 0, 25);
INSERT INTO `sys_department` VALUES (343404713, 2, '腾翔路社区', 'a231', NULL, '410507257', 0, 26);
INSERT INTO `sys_department` VALUES (343404714, 2, '常河路社区', 'a30', NULL, '342980790', 0, 27);
INSERT INTO `sys_department` VALUES (343404725, 2, '重点工作攻坚指挥部办公室', 'zdgzgjzhbbgs', NULL, '342863822', 0, 3);
INSERT INTO `sys_department` VALUES (343404726, 2, '纪检监察办公室（内设巡查办）', 'jjjcbgsnsxcb', NULL, '342795774', 0, 4);
INSERT INTO `sys_department` VALUES (343404727, 2, '蟠龙村', 'plc', NULL, '343090597', 0, 41);
INSERT INTO `sys_department` VALUES (343404728, 2, '董家口村', 'djkc', NULL, '342678862', 0, 33);
INSERT INTO `sys_department` VALUES (343404729, 2, '旺海村', 'whc', NULL, '342689912', 0, 39);
INSERT INTO `sys_department` VALUES (343404730, 2, '菜园村', 'cyc', NULL, '342701774', 0, 38);
INSERT INTO `sys_department` VALUES (343404731, 2, '兴泊路社区', 'xblsq', NULL, '342942670', 0, 31);
INSERT INTO `sys_department` VALUES (343404732, 2, '红石村', 'hsc', NULL, '343056577', 0, 36);
INSERT INTO `sys_department` VALUES (343404733, 2, '岚上村', 'lsc', NULL, '343176517', 0, 40);
INSERT INTO `sys_department` VALUES (3434047342, 2, '席乡路社区', 'xxlsq', NULL, '411503843', 0, 29);
INSERT INTO `sys_department` VALUES (343404735, 2, '三合路社区', 'shlsq', NULL, '411602627', 0, 30);
INSERT INTO `sys_department` VALUES (3434047369, 2, '贡口路社区', 'gklsq', NULL, '411632598', 0, 28);
INSERT INTO `sys_department` VALUES (343404737, 2, '贡口湾村', 'gkwc', NULL, '411639607', 0, 34);
INSERT INTO `sys_department` VALUES (343404738, 2, '信阳村', 'xyc', NULL, '411821532', 0, 35);
INSERT INTO `sys_department` VALUES (343404739, 2, '新泊村', 'xbc', NULL, '411837536', 0, 32);
INSERT INTO `sys_department` VALUES (343404740, 2, '海泊村', 'hbc', NULL, '411874269', 0, 37);
INSERT INTO `sys_department` VALUES (343404741, 2, '流动人员管理服务办公室', 'ldryglfwbgs', NULL, '411891185', 0, 20);
INSERT INTO `sys_department` VALUES (343404742, 2, '金融办', 'jrb', NULL, '411827965', 0, 12);
INSERT INTO `sys_department` VALUES (343404743, 2, '督导巡察办公室', 'ddxcbgs', NULL, '412119203', 0, 5);
INSERT INTO `sys_department` VALUES (343404744, 2, '党政领导', 'dzld', NULL, '412107446', 0, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,29,5,33,34,35,36,6,37,38,39,40,20000,20001,20004,20016,20017,20018,20005,20019,20006,20020,20007,20021,20002,20008,20009,20022,20010,20023,20024,20044,20045,20046,20047,20048,20049,20025,20050,20051,20026,20052,20053,20011,20027,20028,20029,20030,20012,20031,20032,20033,20034,20003,20013,20014,20035,20036,20037,20038,20039,20040,20041,20015,20042,20043,313000,314000,315000,31700017,30000,31000,37000,38000,39000,31000040,311000,312000,330000,32000,316000,331000,33000,34000,318000,319000,320000,321000,322000,35000,323000,324000,325000,36000,326000,327000,328000,329000,40000,3320000,42000,41000,-666666],\"createTime\":\"Oct 22, 2020 9:36:52 AM\"}]', 183, '0:0:0:0:0:0:0:1', '2020-10-22 09:36:53');
INSERT INTO `sys_log` VALUES (2, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":11130,\"username\":\"lewk\",\"dingName\":\"lewk\",\"salt\":\"EcNlTLjrDM9BbTu9jLvn\",\"email\":\"lew@111.cc\",\"mobile\":\"13233336666\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"departmentName\":\"青岛市黄岛区泊里镇人民政府\",\"roleName\":\"admin\",\"projectIdList\":[],\"deptIdList\":[2]}]', 32, '0:0:0:0:0:0:0:1', '2020-10-22 09:37:07');
INSERT INTO `sys_log` VALUES (3, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,29,5,33,34,35,36,6,37,38,39,40,50,20000,20001,20004,20016,20017,20018,20005,20019,20006,20020,20007,20021,20002,20008,20009,20022,20010,20023,20024,20044,20045,20046,20047,20048,20049,20025,20050,20051,20026,20052,20053,20011,20027,20028,20029,20030,20012,20031,20032,20033,20034,20003,20013,20014,20035,20036,20037,20038,20039,20040,20041,20015,20042,20043,313000,314000,315000,31700017,30000,31000,37000,38000,39000,31000040,311000,312000,330000,32000,316000,331000,33000,34000,318000,319000,320000,321000,322000,35000,323000,324000,325000,36000,326000,327000,328000,329000,40000,3320000,42000,41000,-666666]}]', 123, '0:0:0:0:0:0:0:1', '2020-10-22 15:05:05');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":11130,\"username\":\"lewk\",\"dingName\":\"lewk\",\"salt\":\"EcNlTLjrDM9BbTu9jLvn\",\"email\":\"lew@111.cc\",\"mobile\":\"13233336666\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"departmentName\":\"青岛市黄岛区泊里镇人民政府\",\"roleName\":\"admin\",\"projectIdList\":[],\"deptIdList\":[2]}]', 27, '0:0:0:0:0:0:0:1', '2020-10-22 15:05:18');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_num` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '权限系统', NULL, 'sys:info', 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'sys/user', 'sys:user:info', 1, 'userManage', 3);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', 'sys:role:info', 1, 'roleManage', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单展示', 'sys/menu', 'sys:menu:info', 1, 'menuManage', 1);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'logManage', 7);
INSERT INTO `sys_menu` VALUES (20000, 0, '泊里CIM智慧监管系统', NULL, NULL, 0, NULL, 0);
INSERT INTO `sys_menu` VALUES (20001, 20000, '地图系统', NULL, 'busi:poli:map', 0, NULL, 0);
INSERT INTO `sys_menu` VALUES (20002, 20000, '业务系统', NULL, 'busi:poli:bus', 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (20003, 20000, '系统设置', NULL, 'busi:poli:sys', 0, NULL, 2);
INSERT INTO `sys_menu` VALUES (20004, 20001, '项目总览', 'home', 'busi:poli:home', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (20005, 20001, '智慧工地', 'home?type=site', 'busi:poli:site', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (20006, 20001, '重点项目', 'home?type=project', 'busi:poli:project', 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (20007, 20001, '资料总览', 'home?type=info', 'busi:poli:info', 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (20008, 20002, '查看', NULL, 'busi:poli:sysproj:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20009, 20002, '项目信息总览', 'business/businessSystem', 'busi:poli:business:businessSystem', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20010, 20002, '移动巡检管理', 'business/inspection/mobileInspection', 'busi:poli:business:inspection:mobileInspection', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20011, 20002, '项目资料管理', 'business/dataManage', 'busi:poli:business:dataManage', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20012, 20002, '重点项目管理', 'business/keyProjects', 'busi:poli:business:keyProjects', 2, NULL, 4);
INSERT INTO `sys_menu` VALUES (20013, 20003, '查看', NULL, 'busi:poli:sys:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20014, 20003, '人员账号管理', 'system/systemSettings', 'busi:poli:system:systemSettings', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (20015, 20003, '功能权限管理', 'system/functionPermissions', 'busi:poli:system:functionPermissions', 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (20016, 20004, '查看', NULL, 'busi:poli:map:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20017, 20004, '地图项目新增', NULL, 'busi:poli:map:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20018, 20004, '地图项目编辑', NULL, 'busi:poli:map:update', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20019, 20005, '查看', NULL, 'busi:poli:site:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20020, 20006, '查看', NULL, 'busi:poli:project:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20021, 20007, '查看', NULL, 'busi:poli:info:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20022, 20009, '查看', NULL, 'busi:poli:business:businessSystem:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20023, 20010, '查看', NULL, 'busi:poli:manage:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20024, 20010, '巡检记录管理', NULL, 'busi:poli:manage:keep', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20025, 20010, '问题记录管理', NULL, 'busi:poli:manage:matter', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20026, 20010, '处罚单管理', NULL, 'busi:poli:manage:punish', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20027, 20011, '查看', NULL, 'busi:poli:proj:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20028, 20011, '新增项目资料', NULL, 'busi:poli:proj:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20029, 20011, '编辑项目资料', NULL, 'busi:poli:proj:update', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20030, 20011, '删除项目资料', NULL, 'busi:poli:proj:delete', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20031, 20012, '查看', NULL, 'busi:poli:stressproj:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20032, 20012, '新增重点项目', NULL, 'busi:poli:stressproj:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20033, 20012, '编辑重点项目', NULL, 'busi:poli:stressproj:update', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20034, 20012, '删除重点项目', NULL, 'busi:poli:stressproj:delete', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20035, 20014, '查看', NULL, 'busi:poli:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20036, 20014, '组织架构管理', NULL, 'busi:poli:role:structure', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20037, 20014, '角色分组管理', NULL, 'busi:poli:role:role', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20038, 20014, '用户新增', NULL, 'busi:poli:user:save', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20039, 20014, '用户删除', NULL, 'busi:poli:user:delete', 2, NULL, 4);
INSERT INTO `sys_menu` VALUES (20040, 20014, '用户编辑', NULL, 'busi:poli:user:update', 2, NULL, 5);
INSERT INTO `sys_menu` VALUES (20041, 20014, '批量部门调整', NULL, 'busi:poli:branch:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (20042, 20015, '查看', NULL, 'busi:poli:power:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20043, 20015, '配置权限', NULL, 'busi:poli:power:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20044, 20024, '查看', NULL, 'busi:poli:insp:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20045, 20024, '发起巡检', NULL, 'busi:poli:insp:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20046, 20024, '编辑巡检信息', NULL, 'busi:poli:insp:update', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (20047, 20024, '删除当前记录', NULL, 'busi:poli:insp:delete', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (20048, 20024, '整改结果确认', NULL, 'busi:poli:insp:confirm', 2, NULL, 4);
INSERT INTO `sys_menu` VALUES (20049, 20024, '延期申请', NULL, 'busi:poli:insp:delay', 2, NULL, 5);
INSERT INTO `sys_menu` VALUES (20050, 20025, '查看', NULL, 'busi:poli:changed:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20051, 20025, '整改结果提报', NULL, 'busi:poli:changed:save', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (20052, 20026, '查看', NULL, 'busi:poli:penalty:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20053, 20026, '处罚单编辑', NULL, 'busi:poli:penalty:update', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (31000, 30000, '数据共享', NULL, 'busi:poli:dataSharing', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (32000, 30000, '业务流转', NULL, 'busi:poli:businessFlow', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (33000, 30000, '规划管理', NULL, 'busi:poli:planningManagement', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (34000, 30000, '建设管理', NULL, 'busi:poli:constructionManagement', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (35000, 30000, '社会综治', NULL, 'busi:poli:comprehensiveSocialGovernance', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (36000, 30000, '党建管理', NULL, 'busi:poli:partyBuildingAtTheGrassrootsLevel', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (37000, 31000, '居民信息查询', NULL, 'busi:poli:dataSharing:residentQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (38000, 31000, '房屋信息查询', NULL, 'busi:poli:dataSharing:houseQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (39000, 31000, '企业法人查询', NULL, 'busi:poli:dataSharing:businessLicenseQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (31000040, 31000, '居民证件查询', NULL, 'busi:poli:dataSharing:residentCertificateQuery', 2, NULL, 46);
INSERT INTO `sys_menu` VALUES (311000, 31000, '项目信息查询', NULL, 'busi:poli:dataSharing:projectQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (312000, 31000, '党员信息查询', NULL, 'busi:poli:dataSharing:partyMemberQuery', 2, NULL, 83);
INSERT INTO `sys_menu` VALUES (313000, 3100086, '党建活动查询', NULL, 'busi:poli:dataSharing:partyBuildingActivities', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (314000, 3200033, '公文流转', NULL, 'busi:poli:businessFlow:officialDocumentCirculation', 2, NULL, 12);
INSERT INTO `sys_menu` VALUES (315000, 3200010, '流程管理', NULL, 'busi:poli:businessFlow:processManagement', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (316000, 32000, '督察督办', NULL, 'busi:poli:businessFlow:inspectionAndSupervision', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (31700017, 3300017, '规划查询', 'http://poli.ivtech.tech/#/plapp', 'busi:poli:planningManagement:planningQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (318000, 34000, '巡检提报', 'http://ding.supervision.ivtech.tech/#/report', 'busi:poli:constructionManagement:inspectionReport', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (319000, 34000, '问题整改', 'http://ding.supervision.ivtech.tech/#/list', 'busi:poli:constructionManagement:problemRectification', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (320000, 34000, '问题确认', 'http://ding.supervision.ivtech.tech/#/determination', 'busi:poli:constructionManagement:problemConfirmation', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (321000, 34000, '项目信息查询', NULL, 'busi:poli:constructionManagement', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (322000, 34000, '项目资料管理', NULL, 'busi:poli:constructionManagement', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (323000, 35000, '居民信息采集', 'http://poli.ivtech.tech/#/phoneCommon/residentPhoneDingDing', 'busi:poli:comprehensiveSocialGovernance:residentCollection', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (324000, 35000, '房屋信息采集', 'http://poli.ivtech.tech/#/phoneCommon/enterprisePhoneDingDing', 'busi:poli:comprehensiveSocialGovernance:houseCollection', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (325000, 35000, '企业信息采集', NULL, 'busi:poli:comprehensiveSocialGovernance:enterpriseCollection', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (326000, 36000, '党务公告', NULL, 'busi:poli:partyBuildingAtTheGrassrootsLevel:partyAffairsAnnouncement', 20, NULL, 0);
INSERT INTO `sys_menu` VALUES (327000, 36000, '党政宣传', NULL, 'busi:poli:partyBuildingAtTheGrassrootsLevel:partyAndGovernmentPropaganda', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (328000, 36000, '党员信息查询', NULL, 'busi:poli:partyBuildingAtTheGrassrootsLevel:partyMemberInformationQuery', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (329000, 36000, '考试公告', NULL, 'busi:poli:partyBuildingAtTheGrassrootsLevel:examinationAnnouncement', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (30000, 0, '政务通', NULL, NULL, 0, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, 1, '部门管理', 'sys/dept', 'sys:dept:info', 1, 'deptManage', 5);
INSERT INTO `sys_menu` VALUES (33, 5, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 12);
INSERT INTO `sys_menu` VALUES (34, 5, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (35, 5, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 3);
INSERT INTO `sys_menu` VALUES (36, 5, '删除', NULL, 'sys:dept:delete', 2, NULL, 4);
INSERT INTO `sys_menu` VALUES (6, 1, '项目管理', 'sys/project', 'sys:project:info', 1, 'projectManage', 6);
INSERT INTO `sys_menu` VALUES (37, 6, '查看', NULL, 'sys:project:list,sys:project:info', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (38, 6, '新增', NULL, 'sys:project:save,sys:project:select', 2, NULL, 2);
INSERT INTO `sys_menu` VALUES (39, 6, '修改', NULL, 'sys:project:update,sys:project:select', 292, NULL, 3);
INSERT INTO `sys_menu` VALUES (40, 6, '删除', NULL, 'sys:project:delete', 2, NULL, 4);
INSERT INTO `sys_menu` VALUES (330000, 31000, '政策解读', NULL, 'busi:poli:dataSharing:policyInterpretation', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (331000, 32000, '会议管理', NULL, 'busi:poli:businessFlow:managementOfMeetings', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (40000, 30000, '系统设置', NULL, 'busi:poli:systemSetting', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (3320000, 40000, '同步组织架构', NULL, 'busi:poli:systemSetting:updateOrganization', 20, NULL, 0);
INSERT INTO `sys_menu` VALUES (41000, 310000, '数据共享查询一览表', NULL, 'busi:poli:dataSharing:SelectTableData', 20, NULL, 0);
INSERT INTO `sys_menu` VALUES (42000, 40000, '测试功能1', NULL, 'busi:poli:test1', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (50, 1, '地图ZMap', 'sys/zmap', 'sys:zmap:info', 1, 'deptManage', 7);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_project`;
CREATE TABLE `sys_project`  (
  `project_id` bigint(20) NULL DEFAULT NULL,
  `project_name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `other_id` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_project
-- ----------------------------
INSERT INTO `sys_project` VALUES (5, '青岛港董家口港区原油商业储备库工程', '第三方同步', 0, '2fc67f78-8bdb-4161-8b68-f2eb0a1ff174');
INSERT INTO `sys_project` VALUES (6, '海湾·书香明庭', '第三方同步', 0, '1fa687ec-43a6-4d1e-a994-96d57acb737a');
INSERT INTO `sys_project` VALUES (7, '钢厂西路北段工程项目', '第三方同步', 0, '6632197f-e9bd-4b77-a9b2-e952f93db79a');
INSERT INTO `sys_project` VALUES (8, '青岛蓝港祥和居住小区', '第三方同步', 0, '786e5283-ec3d-4d7e-902c-8f5278b88607');
INSERT INTO `sys_project` VALUES (9, '钢厂西路北段管道运输工程项目', '第三方同步', 0, '32c4e018-5787-4d7f-94be-1b36e70d9d89');
INSERT INTO `sys_project` VALUES (10, '钢厂西路北段管道运输绿化带工程项目', '第三方同步', 0, 'e05aafed-27b9-45e4-8389-b64981a4fcde');
INSERT INTO `sys_project` VALUES (11, '海湾-书香明庭', '第三方同步', 0, '625ed295-7ebc-4427-a157-c7f00d9a087b');
INSERT INTO `sys_project` VALUES (4030, '青岛港董家口港区原油商业储备库工程 - 青岛港董家口港区原油商业储备库工程一期', '第三方同步', 0, '7deb9e23-3f9f-45e6-8da7-638e6bc980dd');
INSERT INTO `sys_project` VALUES (4031, '青岛董家口大酒店有限公司2#高层厂房、5#厂房', '第三方同步', 0, '697f3531-f9cc-4eb3-bf6b-b5b5a0950aa9');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '', 1, '2020-10-22 09:36:52');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (119, 1, 1);
INSERT INTO `sys_role_menu` VALUES (120, 1, 2);
INSERT INTO `sys_role_menu` VALUES (121, 1, 15);
INSERT INTO `sys_role_menu` VALUES (122, 1, 16);
INSERT INTO `sys_role_menu` VALUES (123, 1, 17);
INSERT INTO `sys_role_menu` VALUES (124, 1, 18);
INSERT INTO `sys_role_menu` VALUES (125, 1, 3);
INSERT INTO `sys_role_menu` VALUES (126, 1, 19);
INSERT INTO `sys_role_menu` VALUES (127, 1, 20);
INSERT INTO `sys_role_menu` VALUES (128, 1, 21);
INSERT INTO `sys_role_menu` VALUES (129, 1, 22);
INSERT INTO `sys_role_menu` VALUES (130, 1, 4);
INSERT INTO `sys_role_menu` VALUES (131, 1, 23);
INSERT INTO `sys_role_menu` VALUES (132, 1, 24);
INSERT INTO `sys_role_menu` VALUES (133, 1, 25);
INSERT INTO `sys_role_menu` VALUES (134, 1, 26);
INSERT INTO `sys_role_menu` VALUES (135, 1, 29);
INSERT INTO `sys_role_menu` VALUES (136, 1, 5);
INSERT INTO `sys_role_menu` VALUES (137, 1, 33);
INSERT INTO `sys_role_menu` VALUES (138, 1, 34);
INSERT INTO `sys_role_menu` VALUES (139, 1, 35);
INSERT INTO `sys_role_menu` VALUES (140, 1, 36);
INSERT INTO `sys_role_menu` VALUES (141, 1, 6);
INSERT INTO `sys_role_menu` VALUES (142, 1, 37);
INSERT INTO `sys_role_menu` VALUES (143, 1, 38);
INSERT INTO `sys_role_menu` VALUES (144, 1, 39);
INSERT INTO `sys_role_menu` VALUES (145, 1, 40);
INSERT INTO `sys_role_menu` VALUES (146, 1, 50);
INSERT INTO `sys_role_menu` VALUES (147, 1, 20000);
INSERT INTO `sys_role_menu` VALUES (148, 1, 20001);
INSERT INTO `sys_role_menu` VALUES (149, 1, 20004);
INSERT INTO `sys_role_menu` VALUES (150, 1, 20016);
INSERT INTO `sys_role_menu` VALUES (151, 1, 20017);
INSERT INTO `sys_role_menu` VALUES (152, 1, 20018);
INSERT INTO `sys_role_menu` VALUES (153, 1, 20005);
INSERT INTO `sys_role_menu` VALUES (154, 1, 20019);
INSERT INTO `sys_role_menu` VALUES (155, 1, 20006);
INSERT INTO `sys_role_menu` VALUES (156, 1, 20020);
INSERT INTO `sys_role_menu` VALUES (157, 1, 20007);
INSERT INTO `sys_role_menu` VALUES (158, 1, 20021);
INSERT INTO `sys_role_menu` VALUES (159, 1, 20002);
INSERT INTO `sys_role_menu` VALUES (160, 1, 20008);
INSERT INTO `sys_role_menu` VALUES (161, 1, 20009);
INSERT INTO `sys_role_menu` VALUES (162, 1, 20022);
INSERT INTO `sys_role_menu` VALUES (163, 1, 20010);
INSERT INTO `sys_role_menu` VALUES (164, 1, 20023);
INSERT INTO `sys_role_menu` VALUES (165, 1, 20024);
INSERT INTO `sys_role_menu` VALUES (166, 1, 20044);
INSERT INTO `sys_role_menu` VALUES (167, 1, 20045);
INSERT INTO `sys_role_menu` VALUES (168, 1, 20046);
INSERT INTO `sys_role_menu` VALUES (169, 1, 20047);
INSERT INTO `sys_role_menu` VALUES (170, 1, 20048);
INSERT INTO `sys_role_menu` VALUES (171, 1, 20049);
INSERT INTO `sys_role_menu` VALUES (172, 1, 20025);
INSERT INTO `sys_role_menu` VALUES (173, 1, 20050);
INSERT INTO `sys_role_menu` VALUES (174, 1, 20051);
INSERT INTO `sys_role_menu` VALUES (175, 1, 20026);
INSERT INTO `sys_role_menu` VALUES (176, 1, 20052);
INSERT INTO `sys_role_menu` VALUES (177, 1, 20053);
INSERT INTO `sys_role_menu` VALUES (178, 1, 20011);
INSERT INTO `sys_role_menu` VALUES (179, 1, 20027);
INSERT INTO `sys_role_menu` VALUES (180, 1, 20028);
INSERT INTO `sys_role_menu` VALUES (181, 1, 20029);
INSERT INTO `sys_role_menu` VALUES (182, 1, 20030);
INSERT INTO `sys_role_menu` VALUES (183, 1, 20012);
INSERT INTO `sys_role_menu` VALUES (184, 1, 20031);
INSERT INTO `sys_role_menu` VALUES (185, 1, 20032);
INSERT INTO `sys_role_menu` VALUES (186, 1, 20033);
INSERT INTO `sys_role_menu` VALUES (187, 1, 20034);
INSERT INTO `sys_role_menu` VALUES (188, 1, 20003);
INSERT INTO `sys_role_menu` VALUES (189, 1, 20013);
INSERT INTO `sys_role_menu` VALUES (190, 1, 20014);
INSERT INTO `sys_role_menu` VALUES (191, 1, 20035);
INSERT INTO `sys_role_menu` VALUES (192, 1, 20036);
INSERT INTO `sys_role_menu` VALUES (193, 1, 20037);
INSERT INTO `sys_role_menu` VALUES (194, 1, 20038);
INSERT INTO `sys_role_menu` VALUES (195, 1, 20039);
INSERT INTO `sys_role_menu` VALUES (196, 1, 20040);
INSERT INTO `sys_role_menu` VALUES (197, 1, 20041);
INSERT INTO `sys_role_menu` VALUES (198, 1, 20015);
INSERT INTO `sys_role_menu` VALUES (199, 1, 20042);
INSERT INTO `sys_role_menu` VALUES (200, 1, 20043);
INSERT INTO `sys_role_menu` VALUES (201, 1, 313000);
INSERT INTO `sys_role_menu` VALUES (202, 1, 314000);
INSERT INTO `sys_role_menu` VALUES (203, 1, 315000);
INSERT INTO `sys_role_menu` VALUES (204, 1, 31700017);
INSERT INTO `sys_role_menu` VALUES (205, 1, 30000);
INSERT INTO `sys_role_menu` VALUES (206, 1, 31000);
INSERT INTO `sys_role_menu` VALUES (207, 1, 37000);
INSERT INTO `sys_role_menu` VALUES (208, 1, 38000);
INSERT INTO `sys_role_menu` VALUES (209, 1, 39000);
INSERT INTO `sys_role_menu` VALUES (210, 1, 31000040);
INSERT INTO `sys_role_menu` VALUES (211, 1, 311000);
INSERT INTO `sys_role_menu` VALUES (212, 1, 312000);
INSERT INTO `sys_role_menu` VALUES (213, 1, 330000);
INSERT INTO `sys_role_menu` VALUES (214, 1, 32000);
INSERT INTO `sys_role_menu` VALUES (215, 1, 316000);
INSERT INTO `sys_role_menu` VALUES (216, 1, 331000);
INSERT INTO `sys_role_menu` VALUES (217, 1, 33000);
INSERT INTO `sys_role_menu` VALUES (218, 1, 34000);
INSERT INTO `sys_role_menu` VALUES (219, 1, 318000);
INSERT INTO `sys_role_menu` VALUES (220, 1, 319000);
INSERT INTO `sys_role_menu` VALUES (221, 1, 320000);
INSERT INTO `sys_role_menu` VALUES (222, 1, 321000);
INSERT INTO `sys_role_menu` VALUES (223, 1, 322000);
INSERT INTO `sys_role_menu` VALUES (224, 1, 35000);
INSERT INTO `sys_role_menu` VALUES (225, 1, 323000);
INSERT INTO `sys_role_menu` VALUES (226, 1, 324000);
INSERT INTO `sys_role_menu` VALUES (227, 1, 325000);
INSERT INTO `sys_role_menu` VALUES (228, 1, 36000);
INSERT INTO `sys_role_menu` VALUES (229, 1, 326000);
INSERT INTO `sys_role_menu` VALUES (230, 1, 327000);
INSERT INTO `sys_role_menu` VALUES (231, 1, 328000);
INSERT INTO `sys_role_menu` VALUES (232, 1, 329000);
INSERT INTO `sys_role_menu` VALUES (233, 1, 40000);
INSERT INTO `sys_role_menu` VALUES (234, 1, 3320000);
INSERT INTO `sys_role_menu` VALUES (235, 1, 42000);
INSERT INTO `sys_role_menu` VALUES (236, 1, 41000);
INSERT INTO `sys_role_menu` VALUES (237, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ding_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ding_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11', '组织部1', NULL, NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭,青岛港董家口港区原油商业储备库工程 - 青岛港董家口港区原油商业储备库工程一期,青岛董家口大酒店有限公司2#高层厂房、5#厂房', '地图,巡检人员');
INSERT INTO `sys_user` VALUES (10009, 'dingyuping', '丁玉平', NULL, NULL, 'test@123.cc', '13864872980', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '134769431720131275', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '各部门总体负责人');
INSERT INTO `sys_user` VALUES (10010, 'maguotao', '马国淘', NULL, NULL, 'r@12.cc', '15266232220', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '234745304838708711', NULL, '泊里测试项目A', '地图');
INSERT INTO `sys_user` VALUES (10011, 'yuanming', '袁铭', NULL, NULL, '', '15806537188', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '17670818291121420', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限3');
INSERT INTO `sys_user` VALUES (10012, 'zhangjinjin', '张金金', NULL, NULL, '', '13969856862', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '155610414124596800', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '综合信息法规室团队长');
INSERT INTO `sys_user` VALUES (10013, 'zhangjinxing', '张金星', NULL, NULL, '', '13655423578', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '180220380924585614', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '综合协调室团队长');
INSERT INTO `sys_user` VALUES (10014, 'chenghaosheng', '程浩胜', NULL, NULL, '', '15153282204', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '096704526330925790', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限2');
INSERT INTO `sys_user` VALUES (10015, 'zhuwenyou', '朱文友', NULL, NULL, '', '13969796593', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '114426684426213909', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '工作权限3');
INSERT INTO `sys_user` VALUES (10016, 'xufang', '徐芳', NULL, NULL, '', '15092080543', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）,重点工作攻坚指挥部办公室', '0718466467791843', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限1');
INSERT INTO `sys_user` VALUES (10017, 'mengqingyun', '孟庆云', NULL, NULL, '', '15092021391', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '076747566023249002', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '秘书机要室（督查考核室）团队长');
INSERT INTO `sys_user` VALUES (10018, 'dingleqiang', '丁乐强', NULL, NULL, '', '13573287199', 1, NULL, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '235323214619836075', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10019, 'liuzaibing', '刘在兵', NULL, NULL, '', '13793279599', 1, NULL, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '240727602820908901', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10020, 'xueqiuyue', '薛秋月', NULL, NULL, '', '15253272860', 1, 1, '2020-09-11 18:14:22', '党政办公室（人大办公室）', '130642466033862008', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '秘书机要室（督查考核室）团队长');
INSERT INTO `sys_user` VALUES (10021, 'wangyaojun', '王耀军', NULL, NULL, '', '17660234737', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '01033853206629462118', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限2');
INSERT INTO `sys_user` VALUES (10022, 'dingwei', '丁伟', NULL, NULL, '', '13553011066', 1, NULL, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '2344341338639294', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10023, 'dingzechao', '丁泽超', NULL, NULL, '', '13605422655', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）,重点工作攻坚指挥部办公室', '046622552620091369', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限1');
INSERT INTO `sys_user` VALUES (10024, 'zhangfengshou', '张丰收', NULL, NULL, '', '13793228335', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '524360474124048678', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '工作权限4');
INSERT INTO `sys_user` VALUES (10025, 'dongxisen', '董锡森', NULL, NULL, '', '13863966995', 1, NULL, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '316211506733779600', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10026, 'liuxiangqing', '刘相青', NULL, NULL, '', '13687616122', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '242521374621179250', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '工作权限5');
INSERT INTO `sys_user` VALUES (10027, 'xianglei', '相蕾', NULL, NULL, '', '18364211661', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '010338532067978310', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限2');
INSERT INTO `sys_user` VALUES (10028, 'wangxiaoyan', '王晓燕', NULL, NULL, '', '18562651117', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '4837173429266605', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '工作权限1');
INSERT INTO `sys_user` VALUES (10029, 'yufuchun', '于福春', NULL, NULL, '', '15712780608', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '240526573120316548', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限3');
INSERT INTO `sys_user` VALUES (10030, 'wangshengfeng', '王圣锋', NULL, NULL, '', '13792848789', 1, NULL, '2020-09-11 18:14:23', '党政办公室（人大办公室）', '234424172429155091', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10031, 'lifengying', '李风英', NULL, NULL, '1234@12.cc', '15166612225', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）,重点项目攻坚办公室,智慧办,重点工作攻坚指挥部办公室', '141951124026660785', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '各部门总体负责人');
INSERT INTO `sys_user` VALUES (10032, 'liuhaozhen', '刘昊桢', NULL, NULL, '', '18253293900', 1, NULL, '2020-09-11 18:14:23', '党政办公室（人大办公室）,重点项目攻坚办公室,智慧办', '403203261521032880', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10033, 'wusisi', '吴思思', NULL, NULL, '', '17606318644', 1, 1, '2020-09-11 18:14:23', '党政办公室（人大办公室）,重点项目攻坚办公室,智慧办', '233915480521502676', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限1');
INSERT INTO `sys_user` VALUES (10034, 'liudunxi', '柳敦习', NULL, NULL, '', '13853232088', 1, NULL, '2020-09-11 18:14:23', '青岛市黄岛区泊里镇人民政府,党政领导', '234303264126397933', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10035, 'zhangyongpeng', '张永鹏', NULL, NULL, '', '13589365559', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '026261581324301623', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10036, 'chengchuanshan', '程传山', NULL, NULL, '', '13589362058', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '234520146630676124', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10037, 'liangang', '连刚', NULL, NULL, '', '13506487526', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '03645244411162748', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10038, 'zhangyugang', '张玉刚', NULL, NULL, '', '18661425828', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '032317343224340177', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10039, 'luxuemei', '卢雪梅', NULL, NULL, '', '18669831577', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '062651571721737917', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10040, 'renshuangping', '任双平', NULL, NULL, '', '13656486809', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '234260235520119650', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10041, 'weijunxiang', '魏均祥', NULL, NULL, '', '13506427917', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '234411530838932109', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10042, 'chenxiaoguang', '陈晓光', NULL, NULL, '', '13678881696', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府,党政领导', '035225011037804446', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10043, 'liuxizhong', '刘西忠', NULL, NULL, '', '13730971788', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '243233063021312089', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10044, 'yuanshouqiang', '袁守强', NULL, NULL, '', '17667595328', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '01052868633634332915', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10045, 'wuzhongqin', '吴中钦', NULL, NULL, '', '13789877936', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '113159491021373773', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10046, 'zhouguixia', '周桂霞', NULL, NULL, '', '13589235776', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '235038484921631364', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10047, 'dongxiujuan', '董秀娟', NULL, NULL, '', '18561980787', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '621667226533558530', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10048, 'dongjinlei', '董金磊', NULL, NULL, '', '18561980770', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '325345166233757372', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10049, 'yuhui', '于徽', NULL, NULL, '', '18561980779', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '2343623440647919', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10050, 'lina', '李娜', NULL, NULL, '', '18561980301', 1, NULL, '2020-09-11 18:14:24', '青岛市黄岛区泊里镇人民政府', '2343193633842894', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10051, 'zhangquanshui', '张泉水', NULL, NULL, '', '17669755206', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '01054556392124293291', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10052, 'tianlu', '田璐', NULL, NULL, '', '18354233249', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '0867602104959840', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10053, 'duanyubing', '段玉冰', NULL, NULL, '', '18561980603', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '621750345627435452', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10054, 'jifuyao', '季付瑶', NULL, NULL, '', '18561980653', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '621719372223138113', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10055, 'luzhuoyue', '卢卓越', NULL, NULL, '', '18561980376', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '624113273321211001', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10056, 'zhangmei', '张梅', NULL, NULL, '', '17660956209', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '6223284560781669', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10057, 'wanghui', '王晖', NULL, NULL, '', '18561980592', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '2343642132943147', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10058, 'hexiaopan', '何小盼', NULL, NULL, '', '18561980869', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '01054556392220277986', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10059, 'wumingjie', '吴明洁', NULL, NULL, '', '18561980768', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '624033392921553127', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10060, 'lizhaomei', '李兆梅', NULL, NULL, '', '17660936956', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '621733310226086349', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10061, 'lüfei', '吕飞', NULL, NULL, '', '18561980306', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '2344446959706409', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10062, 'liping', '李萍', NULL, NULL, '', '18561980596', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '6231162634853631', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10063, 'changlin', '常琳', NULL, NULL, '', '18561980689', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '6217324149777467', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10064, 'cuiyujie', '崔玉节', NULL, NULL, '', '13730906071', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '234332172523849005', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10065, 'weikaili', '魏凯丽', NULL, NULL, '', '18561980928', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '234326403638878653', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10066, 'yangning', '杨宁', NULL, NULL, '', '18561980930', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '6231313658844057', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10067, 'zhangzhen', '张震', NULL, NULL, '', '18724782100', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '1855633807793575', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10068, 'dingjianming', '丁鉴鸣', NULL, NULL, '', '13285325097', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '01054548012820392944', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10069, 'gengdingwei', '耿丁伟', NULL, NULL, '', '17685557584', 1, 1, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府,社会治理中心', '175335502132189885', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '社会治理');
INSERT INTO `sys_user` VALUES (10070, 'zhujiamin', '朱珈民', NULL, NULL, '', '13962419350', 1, NULL, '2020-09-11 18:14:25', '青岛市黄岛区泊里镇人民政府', '01054548012726333242', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10071, 'gaojie', '高洁', NULL, NULL, '', '18765265117', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '02483742071256745', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10072, 'dipingfen', '邸平粉', NULL, NULL, '', '15166692769', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '240723664936384558', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10073, 'liyang', '李杨', NULL, NULL, '', '18562799063', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '2421435704846298', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10074, 'wangzeyin', '王泽银', NULL, NULL, '', '18353222256', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '234912323229328484', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10075, 'wanghao', '王浩', NULL, NULL, '', '15650150042', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '010545311339944958', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10076, 'wangwenjing', '王文静', NULL, NULL, '', '15763952076', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '234308150629269885', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10077, 'dongbo', '董博', NULL, NULL, '', '15265285868', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府,宣教文卫中心', '0105454757081071959', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10078, 'xuemengke', '薛孟珂', NULL, NULL, '', '13793222861', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '01054547570933623838', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10079, 'wangshouzhao', '王守召', NULL, NULL, '', '15763952067', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '234268614929173295', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10080, 'xugongsen', '徐公森', NULL, NULL, '', '15621184799', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '01055128292824182930', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10081, 'zhaochuanbin', '赵传彬', NULL, NULL, '', '17685895666', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '01055135092735453057', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10082, 'cuihang', '崔航', NULL, NULL, '', '15588623488', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '010441471111771990', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10083, 'liulifeng', '刘立峰', NULL, NULL, '', '15763952199', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府', '01055135092621194653', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10084, 'zhangfuyou', '张福有', NULL, NULL, '', '15650150012', 1, NULL, '2020-09-11 18:14:26', '青岛市黄岛区泊里镇人民政府,农业农村中心（农产品质量安全监管中心）', '133712232624393338', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10085, 'shiguilong', '史桂龙', NULL, NULL, '', '18669826988', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,党政领导', '034759585921520137', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10086, 'lixiaohe', '厉笑鹤', NULL, NULL, '', '13964846119', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,社会治理中心', '292946640421568188', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10087, 'liujun', '刘军', NULL, NULL, '', '18866222526', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,应急管理办公室', '010615024367672387', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10088, 'wangxiaolei', '王晓蕾', NULL, NULL, '', '18765934718', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '104849444429271638', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10089, 'wangyongxing', '王永星', NULL, NULL, '', '15166612158', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,农业农村中心（农产品质量安全监管中心）', '105427115929310386', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10090, 'dingmingbo', '丁明波', NULL, NULL, '', '13061266691', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '2437380820027989', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10091, 'dongfangxiao', '董方晓', NULL, NULL, '', '13969786588', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '234336204233402717', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10092, 'wangkun', '王昆', NULL, NULL, '', '15166000569', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '4331001406943067', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10093, 'dingzongguang', '丁宗光', NULL, NULL, '', '15753221707', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,综合行政执法局（生态环境办公室）', '392618625519937875', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10094, 'dingtao', '丁涛', NULL, NULL, '', '15166666895', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '0562654647647098', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10095, 'xumaopeng', '徐茂鹏', NULL, NULL, '', '17860817372', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,综合行政执法局（生态环境办公室）', '242630023724590109', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10096, 'sunzengzhi', '孙增志', NULL, NULL, '', '17860817366', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '01066223404523200786', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10097, 'duyuanqiang', '杜元强', NULL, NULL, '', '13864290856', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,综合行政执法局（生态环境办公室）', '115736480726097331', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10098, 'liuyang', '刘洋', NULL, NULL, '', '13780607729', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '2359375241679411', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10099, 'limei', '李梅', NULL, NULL, '', '13806449076', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府', '2114095616846583', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10100, 'zhanglei', '张雷', NULL, NULL, '', '13863966558', 1, NULL, '2020-09-11 18:14:27', '青岛市黄岛区泊里镇人民政府,党政领导', '0256054203793559', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10101, 'chumeng', '初萌', NULL, NULL, '', '15254252526', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,社会事务中心', '0310665922685455', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10102, 'cuikunguo', '崔坤国', NULL, NULL, '', '13792450285', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,农业农村中心（农产品质量安全监管中心）', '234311006423614509', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10103, 'dingxiaoli', '丁晓莉', NULL, NULL, '', '13583219466', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '4214281535-572529150', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10104, 'guopan', '郭盼', NULL, NULL, '', '18563332521', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '32400616421180591', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10105, 'dongfangzhu', '董方祝', NULL, NULL, '', '15963278761', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '160132246433407591', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10106, 'wangxiaoshan', '王肖杉', NULL, NULL, '', '17864290423', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,政务服务局（便民服务中心）', '073321666629472318', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10107, 'liuyichen', '刘苡辰', NULL, NULL, '', '18363997047', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府', '123645023121271815', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10108, 'xingzhenfu', '邢贞福', NULL, NULL, '', '15253228078', 1, NULL, '2020-09-11 18:14:28', '青岛市黄岛区泊里镇人民政府,农业农村中心（农产品质量安全监管中心）', '206506581336733011', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10110, 'duanlonghai', '段龙海', NULL, NULL, 'cesi@163.cc', '15288969512', 1, 11140, '2020-09-11 18:14:28', '智慧办借调', '0761486627792243', NULL, '青岛港董家口港区原油商业储备库工程,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭,青岛港董家口港区原油商业储备库工程 - 青岛港董家口港区原油商业储备库工程一期,青岛董家口大酒店有限公司2#高层厂房、5#厂房', 'admin,项目整改人员');
INSERT INTO `sys_user` VALUES (10111, 'shenxu', '沈旭', NULL, NULL, '22@11.cc', '15063393061', 1, 101102, '2020-09-11 18:14:28', '智慧办借调', '2848065452887397', NULL, '青岛港董家口港区原油商业储备库工程', 'admin');
INSERT INTO `sys_user` VALUES (10112, 'zhouguixia1', '周桂霞', NULL, NULL, '', '15224450776', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,纪检监察办公室（内设巡查办）', '234356522221631364', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10113, 'wangdongfei', '王东飞', NULL, NULL, '', '13963908517', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,纪检监察办公室（内设巡查办）,督导巡察办公室', '234447460029084429', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10114, 'gaoxuyou', '高绪友', NULL, NULL, '', '13863907590', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,人武部,纪检监察办公室（内设巡查办）,督导巡察办公室', '183931635739122681', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10115, 'weiquannian', '魏全年', NULL, NULL, '', '13589264332', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,纪检监察办公室（内设巡查办）,督导巡察办公室', '195446341138878619', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10116, 'zhuangmeixin', '庄美欣', NULL, NULL, '', '13573294089', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,老干部活动中心,纪检监察办公室（内设巡查办）,督导巡察办公室', '234228113824292057', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10117, 'zhangzihao', '张子浩', NULL, NULL, '', '15964965889', 1, NULL, '2020-09-11 18:14:28', '纪检监察办公室,纪检监察办公室（内设巡查办）', '026953653224154937', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10118, 'wangzeyin1', '王泽银', NULL, NULL, '', '13789880898', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）,督导巡察办公室', '242554140229328484', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10119, 'gaozhengxu', '高征绪', NULL, NULL, '', '18561356699', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）,督导巡察办公室', '085239265238884449', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10120, 'dongpeng', '董鹏', NULL, NULL, '', '13465889794', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '23444138411091148', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10121, 'liuzhaojun', '刘照军', NULL, NULL, '', '13256875668', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '245400313621117228', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10122, 'sunhongde', '孙宏德', NULL, NULL, '', '13668898274', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '234310305123224097', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10123, 'wangfeng', '王锋', NULL, NULL, '', '18561356687', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '0852392653955104', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10124, 'miaodebiao', '苗德标', NULL, NULL, '', '13863974790', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,腾翔路社区', '236628653432974919', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10125, 'zhuzhangpeng', '朱长鹏', NULL, NULL, '', '13953234980', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,社会事务中心,纪检监察办公室（内设巡查办）,督导巡察办公室', '140001456626613665', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10126, 'panggangboli', '逄刚泊里', NULL, NULL, '', '18853281983', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '15280624041119433560', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10127, 'zhangwen', '张文', NULL, NULL, '', '13969643627', 1, NULL, '2020-09-11 18:14:29', '纪检监察办公室,纪检监察办公室（内设巡查办）', '2343105748780903', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10128, 'pangzengnian', 'PL逄增年', NULL, NULL, '', '13963908415', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '2342620946112303390', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10129, 'xueyaoboli', '薛尧泊里', NULL, NULL, '', '15192691989', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '23422246561042513198', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10130, 'dinghao', '丁浩', NULL, NULL, '', '18853218876', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室,借调人员', '1959454152647048', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10131, 'donghuaboli', '董华泊里', NULL, NULL, '', '15763952089', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '20500705311031041741', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10132, 'xukai', '徐凯', NULL, NULL, '', '18766209970', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '2342091911779359', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10133, 'huahongbo', '华洪波', NULL, NULL, '1@qq.com', '15192066988', 1, 1, '2020-09-11 18:14:29', '党建工作办公室,党政领导', '196242115521388486', NULL, '青岛港董家口港区原油商业储备库工程,钢厂西路北段管道运输绿化带工程项目,海湾·书香明庭,海湾-书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目', 'admin,政务通');
INSERT INTO `sys_user` VALUES (10134, 'bishuaiboli', '毕帅泊里', NULL, NULL, '', '18653285377', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '3662454260846411538', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10135, 'xuweikang', '徐维康', NULL, NULL, '', '18366262883', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '234562345224541651', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10136, 'jieyongbo', '解永波', NULL, NULL, '', '18561356778', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '4130492134809037', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10137, 'zhangyifan', '张艺凡', NULL, NULL, '', '13793279258', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '240511114924458695', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10138, 'zhouxianyangboli', '周贤阳泊里', NULL, NULL, '', '13658681033', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '1723162040-405134215', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10139, 'chenjing', '陈敬', NULL, NULL, '', '15192617897', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '02356357671218596', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10140, 'wangjieboli', '王婕泊里', NULL, NULL, '', '15066392089', 1, NULL, '2020-09-11 18:14:29', '党建工作办公室', '2344503210904311788', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10141, 'liuguodong', '刘国栋', NULL, NULL, '', '18266227135', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室', '181250382720913350', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10142, 'dinglizhou', '丁立洲', NULL, NULL, '', '15963210937', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室', '372030205920192648', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10143, 'liuyu', '刘玉', NULL, NULL, '', '18561356612', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室,蟠龙村', '0105286427681073', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10144, 'liujiawei', '刘佳玮', NULL, NULL, '', '18354211280', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室,党政办公室（人大办公室）', '372032224320856499', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10145, 'zhuxiaolong', '朱晓龙', NULL, NULL, '', '13792489283', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室,借调人员', '3267134626239639', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10146, 'guanpeiyu', '管培育', NULL, NULL, '', '17605292927', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室', '116837652831145786', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10147, 'chenyu', '陈钰', NULL, NULL, '', '15269252065', 1, NULL, '2020-09-11 18:14:30', '党建工作办公室', '16381556101230696', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10148, 'zhangpeng', '张鹏', NULL, NULL, '', '15054810296', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '1039311025795439', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10149, 'xiaxiufang', '夏修方', NULL, NULL, '', '13573855257', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '234324692822570202', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10150, 'dongzhenwei', '董祯伟', NULL, NULL, '', '15964998477', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '234446095033553203', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10151, 'lidongxiao', '李冬晓', NULL, NULL, '', '13792855215', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '234333405226088949', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10152, 'zhuangyuanyuan', '庄媛媛', NULL, NULL, '', '13969642301', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '024908162523994596', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10153, 'zhangjinxia', '张锦霞', NULL, NULL, '', '13515420460', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '031323161724624600', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10154, 'wangxiqing', '王锡庆', NULL, NULL, '', '15265263950', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '240933101429633104', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10155, 'bishanqiang', '毕善强', NULL, NULL, '', '13780660772', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室,经济发展与投资促进中心', '234404492827231435', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10156, 'jiaronghui', '贾荣辉', NULL, NULL, '', '13156250444', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '033053073335827268', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10157, 'huangjinfeng', '黄进峰', NULL, NULL, '', '18661960673', 1, NULL, '2020-09-11 18:14:30', '应急管理办公室', '240543231540224313', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10158, 'dingzhaoshan', '丁兆山', NULL, NULL, '', '13864872557', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '01033846276919858860', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10159, 'xuelinlong', '薛林龙', NULL, NULL, '', '17606395817', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '234635426833732029', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10160, 'dongqiang', '董强', NULL, NULL, '', '15588623457', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '12465340611074999', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10161, 'chenhongwen', '陈洪文', NULL, NULL, '', '13012505206', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '031641190637863909', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10162, 'wangzengnan', '王增南', NULL, NULL, '', '18266619580', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室,常河路社区', '234258302729150020', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10163, 'luyongbo', '卢永波', NULL, NULL, '', '13964228370', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '201161080021400204', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10164, 'zhangxinshun', '张新顺', NULL, NULL, '', '15865502192', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '160338005424248298', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10165, 'limingyu', '李明宇', NULL, NULL, '', '18661951351', 1, NULL, '2020-09-11 18:14:31', '应急管理办公室', '040566310026247943', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10166, 'yangzenghua', '杨增华', NULL, NULL, '', '13853288170', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '2011592926164184', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10167, 'xinghui', '邢辉', NULL, NULL, '', '13553035619', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '18282068661184551', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10168, 'lizhenchi', '李振驰', NULL, NULL, '', '18300235107', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '234420496626241263', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10169, 'lüqingde', '吕清德', NULL, NULL, '', '13854238537', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '026561490221583143', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10170, 'chendong', '陈栋', NULL, NULL, '', '13615426956', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室,平台公司筹备组', '17156841661219267', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10171, 'wangmiao', '王苗', NULL, NULL, '', '15588621378', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '1643186467950444', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10172, 'bufantao', '卜凡涛', NULL, NULL, '', '13863939821', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '173716191521185590', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10173, 'lidan', '李丹', NULL, NULL, '', '15266228208', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '3116522163839851', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10174, 'wangjixuan', '王纪璇', NULL, NULL, '', '15054273245', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '045666171729460456', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10175, 'huxiaolong', '胡晓龙', NULL, NULL, '', '15966809610', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室,平台公司筹备组', '233169620532559175', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10176, 'dongna', '董娜', NULL, NULL, '', '13573800126', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '02552154661073689', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10177, 'shiaiying', '石爱英', NULL, NULL, '', '15266232315', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '172317171730449171', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10178, 'zhuyunfei', '朱云飞', NULL, NULL, '', '15610539289', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '103754640726049374', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10179, 'wangxiao', '王晓', NULL, NULL, '', '15963239709', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '2406583354943144', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10180, 'wangyajie', '王亚杰', NULL, NULL, '', '18660269799', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '240905645029075681', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10181, 'dongyan', '董岩', NULL, NULL, '', '13964207575', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '23445707491074342', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10182, 'lizenglei', '李增磊', NULL, NULL, '', '13553015626', 1, NULL, '2020-09-11 18:14:31', '规划建设管理办公室', '051941403526148794', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10183, 'gaoping', '高萍', NULL, NULL, '', '17685717120', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '24292662601262645', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10184, 'lihuiling', '李慧玲', NULL, NULL, '', '18764201827', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '01033846280026217209', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10185, 'cuienlai', '崔恩来', NULL, NULL, '', '15908996927', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '233605000823690288', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10186, 'liumingquan', '刘明泉', NULL, NULL, '', '18866207655', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '045951113621034131', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10187, 'tianhongde', '田洪德', NULL, NULL, '', '13964807617', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '234425432129720829', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10188, 'lijinmao', '李金茂', NULL, NULL, '', '13708975820', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '244440475626605343', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10189, 'zhuxianliang', '朱先亮', NULL, NULL, '', '13730924278', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '090956275826051927', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10190, 'lidezhi', '李德志', NULL, NULL, '', '18766481319', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室,社会治理中心', '240535340726198734', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10191, 'pangbin', '逄滨', NULL, NULL, '', '15266215859', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '43346829161171300', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10192, 'yangming', '杨明', NULL, NULL, '', '15192644445', 1, NULL, '2020-09-11 18:14:32', '规划建设管理办公室', '09230551846758', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10193, 'chenjing1', '陈晶', NULL, NULL, '', '13656395800', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '07391140291218862', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10194, 'liuqiang', '刘强', NULL, NULL, '', '15554217197', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '4406276831675874', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10195, 'liuhuilin', '刘惠琳', NULL, NULL, '', '13583252303', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '231033480720994923', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10196, 'dingcong', '丁聪', NULL, NULL, '', '13616421526', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '2836411942651913', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10197, 'dingweijia', '丁维嘉', NULL, NULL, '', '18863938718', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '220027144420219734', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10198, 'anzhonghua', '安仲华', NULL, NULL, '', '13964827183', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '172402184523166949', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10199, 'wangxia', '王霞', NULL, NULL, '', '13963962360', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '2356304907955635', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10200, 'jiangqingxia', '姜青霞', NULL, NULL, '', '13341242400', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '291309061823346408', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10201, 'wangxinyu', '王新宇', NULL, NULL, '', '18561839822', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '030929462829255842', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10202, 'libo', '李波', NULL, NULL, '', '13864221072', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '0139370757847700', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10203, 'yuxiaohui', '于晓慧', NULL, NULL, '', '15165232896', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '242245393220162690', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10204, 'dingjie', '丁杰', NULL, NULL, '', '18562878015', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '0106216911645519', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10205, 'zhaomengfan', '赵梦凡', NULL, NULL, '', '15863030358', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '193318063135652144', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10206, 'panyang', '潘洋', NULL, NULL, '', '13780650648', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '2735484426911539', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10207, 'chenhongren', '陈泓任', NULL, NULL, '', '15898869313', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '322932274337855440', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10208, 'quxianlong', '曲先龙', NULL, NULL, '', '13853232763', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）,海泊村', '234248363926012099', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10209, 'taizisheng', '邰子升', NULL, NULL, '', '13573287929', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）,规划建设管理办公室', '134354512236341415', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10210, 'changna', '常娜', NULL, NULL, '', '15969859497', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '010338315547770788', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10211, 'zhangqian', '张茜', NULL, NULL, '', '15712717357', 1, NULL, '2020-09-11 18:14:32', '政务服务局（便民服务中心）', '2460490807788476', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10212, 'dinghao1', '丁浩', NULL, NULL, '', '13705420236', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '1525476227647048', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10213, 'kuangzhounan', '况州南', NULL, NULL, '', '15806506199', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '322552693820867502', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10214, 'zhangxue', '张雪', NULL, NULL, '', '17854214574', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '2854596948793546', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10215, 'xuliling', '徐丽玲', NULL, NULL, '', '15684729327', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '235448450724160421', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10216, 'lüzhengnan', '吕正楠', NULL, NULL, '', '16678639637', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '01033831554521564722', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10217, 'yangzonglian', '杨宗连', NULL, NULL, '', '18300227018', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '145710134226203279', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10218, 'liping1', '李萍', NULL, NULL, '', '13687674455', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '0713651466853631', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10219, 'lumiao', '卢妙', NULL, NULL, '', '15865551853', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '1163043952684663', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10220, 'liuyujun', '刘玉军', NULL, NULL, '', '13687659126', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '234327280421134154', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10221, 'shixinmin', '石新民', NULL, NULL, '', '13969848126', 1, NULL, '2020-09-11 18:14:33', '政务服务局（便民服务中心）', '234311412730344084', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10222, 'lishihao', '李世好', NULL, NULL, '', '13792898388', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '093412624526057205', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10223, 'liuchengjie', '刘成杰', NULL, NULL, '', '15092129177', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '093439096921001080', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10224, 'zhangtinghui', '张亭辉', NULL, NULL, '', '15192615999', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '093401150524063388', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10225, 'wangshuai', '王帅', NULL, NULL, '', '17030103000', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '010338491619941018', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10226, 'weina', '魏娜', NULL, NULL, '', '15266224484', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '0103384902481255597', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10227, 'kongjie', '孔杰', NULL, NULL, '', '13969657132', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '2342620046751260', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10228, 'yuwenqing', '于文卿', NULL, NULL, '', '15965571927', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '093409462520152806', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10229, 'zhangyuehua', '张月华', NULL, NULL, '', '13954227855', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '021341353724241254', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10230, 'chenxiaoqing', '陈晓庆', NULL, NULL, '', '17864282924', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '626032181237807835', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10231, 'dingmingbo1', '丁明波', NULL, NULL, '', '15063057669', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '104425250820027989', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10232, 'zhangguodong', '张国栋', NULL, NULL, '', '13361255903', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '234409092124119246', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10233, 'liuhao', '刘昊', NULL, NULL, '', '18963119648', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '2468345668677618', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10234, 'wangxin', '王鑫', NULL, NULL, '', '13285323233', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '6941510934954944', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10235, 'wangshoufei', '王守飞', NULL, NULL, '', '15192559915', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '192535084729190945', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10236, 'dingtao1', '丁涛', NULL, NULL, '', '13969642031', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '0255361306647098', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10237, 'kongsong', '孔松', NULL, NULL, '', '15863111203', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '0933696620751274', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10238, 'wangzhi', '王志', NULL, NULL, '', '15066182888', 1, NULL, '2020-09-11 18:14:33', '综合行政执法局（生态环境办公室）', '2400030320941484', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10239, 'zhuangyuan', '庄园', NULL, NULL, '', '18561581788', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '1108441426772329', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10240, 'zhaofengyu', '赵烽宇', NULL, NULL, '', '18765957938', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '111637173135720799', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10241, 'hangang', '韩刚', NULL, NULL, '', '13963975725', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '12244509241226577', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10242, 'yuyunmin', '于云敏', NULL, NULL, '', '15853267178', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '01033849162119975148', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10243, 'doupeng', '窦鹏', NULL, NULL, '', '13675325327', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '10443627201013865', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10244, 'anmaoren', '安茂仁', NULL, NULL, '', '13863948713', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '093422576223578952', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10245, 'gaoluyang', '高路洋', NULL, NULL, '', '15923214325', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '222750082039248340', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10246, 'yinjiahao', '尹嘉豪', NULL, NULL, '', '18561475021', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '110816606323406970', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10247, 'zhengzhicheng', '郑志诚', NULL, NULL, '', '18765250750', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '104463485336423540', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10248, 'wangkun1', '王昆', NULL, NULL, '', '15966890352', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '0939105000943067', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10249, 'liuhang', '刘航', NULL, NULL, '', '13792839752', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '1044615064684818', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10250, 'wangxisen', '王西森', NULL, NULL, '', '13792810332', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '234439612229543450', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10251, 'xiaozhangchun', '肖长春', NULL, NULL, '', '13964882928', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '240039212732846748', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10252, 'wanglei', '王雷', NULL, NULL, '', '13708963297', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '0934126246955596', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10253, 'dingning', '丁宁', NULL, NULL, '', '15689114768', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '010338491616642464', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10254, 'chenghao', '程灏', NULL, NULL, '', '18560667062', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '1043391941997284', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10255, 'xuyunbo', '徐云波', NULL, NULL, '', '15318886121', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '116761641324161281', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10256, 'dongfangxiao1', '董方晓', NULL, NULL, '', '15689128555', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '104442513233402717', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10257, 'sunzengzhi1', '孙增志', NULL, NULL, '', '18553202566', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '235313125923200786', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10258, 'wangxibao', '王西宝', NULL, NULL, '', '15092060388', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '185417604429540041', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10259, 'wangxinyu1', '王新宇', NULL, NULL, '', '16621205041', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '01033849162229255842', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10260, 'xinjianfeng', '辛建锋', NULL, NULL, '', '15610043030', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '231845274536121132', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10261, 'dingjinguo', '丁金国', NULL, NULL, '', '13791805725', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '093422576120369677', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10262, 'hexiaowen', '何效文', NULL, NULL, '', '15064257772', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '202502002220346708', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10263, 'xukunsheng', '徐坤盛', NULL, NULL, '', '18865425668', 1, 1, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '104426196524233863', NULL, '青岛港董家口港区原油商业储备库工程', '综合执法');
INSERT INTO `sys_user` VALUES (10264, 'zhaotingjian', '赵廷建', NULL, NULL, '', '18753217650', 1, NULL, '2020-09-11 18:14:34', '综合行政执法局（生态环境办公室）', '104465356335578648', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10265, 'jixusheng', '季旭升', NULL, NULL, '', '13468280968', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '104418046223312797', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10266, 'panghong', '逄宏', NULL, NULL, '', '15954850879', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '0103384916171166347', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10267, 'dingzhaoping', '丁照平', NULL, NULL, '', '13791923913', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '093412625020114349', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10268, 'zhengliming', '郑丽明', NULL, NULL, '', '13665090613', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '011557485736274178', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10269, 'zhangqingzheng', '张清政', NULL, NULL, '', '18153272753', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '234757576824301306', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10270, 'miaozengshuai', '苗增帅', NULL, NULL, '', '16692302739', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '01033849161832916030', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10271, 'maoshuna', '毛淑娜', NULL, NULL, '', '18300218198', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '242343475927428742', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10272, 'dingyirui', '丁一芮', NULL, NULL, '', '18254279785', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '014167150119842671', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10273, 'dingfanglong', '丁方龙', NULL, NULL, '', '13646488753', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）,新泊村', '104459554120038337', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10274, 'liuye', '刘晔', NULL, NULL, '', '15192653379', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '0961654933677692', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10275, 'tianbaolong', '田宝龙', NULL, NULL, '', '13658667510', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '234323380429597900', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10276, 'zhangxue1', '张雪', NULL, NULL, '', '13045022632', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '010338491623793546', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10277, 'huangzhigang', '黄志刚', NULL, NULL, '', '13026522525', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '234455195339840487', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10278, 'anbaijin', '安佰金', NULL, NULL, '', '13730910703', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '104461215023186858', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10279, 'liujiawei1', '刘嘉伟', NULL, NULL, '', '17115729111', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '01033849162020899406', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10280, 'dongxiangyang', '董向阳', NULL, NULL, '', '15092258872', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '234343142533274853', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10281, 'yinshuchun', '殷树春', NULL, NULL, '', '15863096909', 1, NULL, '2020-09-11 18:14:35', '综合行政执法局（生态环境办公室）', '234231144327351595', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10282, 'wangliang', '王亮', NULL, NULL, '', '15806519512', 1, NULL, '2020-09-11 18:14:35', '经济发展与投资促进中心', '1115363744937091', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10283, 'limin', '李敏', NULL, NULL, '', '13863915666', 1, NULL, '2020-09-11 18:14:35', '经济发展与投资促进中心,双招双引办公室', '2345594519845761', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10284, 'wangzhaomin', '王兆敏', NULL, NULL, '', '18561356788', 1, NULL, '2020-09-11 18:14:35', '经济发展与投资促进中心', '040230265929096340', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10285, 'wangwenxin', '王文馨', NULL, NULL, '', '18562869193', 1, NULL, '2020-09-11 18:14:35', '经济发展与投资促进中心', '01033822022329270476', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10286, 'dongchunwei', '董春伟', NULL, NULL, '', '15253238979', 1, NULL, '2020-09-11 18:14:35', '经济发展与投资促进中心', '044453290333400125', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10287, 'duguimao', '杜贵茂', NULL, NULL, '', '18561356738', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '026062184326582217', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10288, 'liulei', '刘蕾', NULL, NULL, '', '15712751163', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '0911583439685670', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10289, 'gaoqiang', '高强', NULL, NULL, '', '15753239928', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心,发展保障中心', '0103382202241253218', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10290, 'guochangchao', '郭常超', NULL, NULL, '', '18766251016', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '200756273236438010', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10291, 'sunmingchun', '孙鸣春', NULL, NULL, '', '18561329080', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '101366191223754107', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10292, 'zhangjijie', '张济杰', NULL, NULL, '', '18561356658', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '221318390824296194', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10293, 'weiqufeng', '魏曲凤', NULL, NULL, '', '15063900529', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '234341606339046337', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10294, 'shenlei', '沈磊', NULL, NULL, '', '18561320688', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '1814320500892226', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10295, 'lixiaokun', '李晓坤', NULL, NULL, '', '18366262884', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '080719050926249023', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10296, 'chenlu', '陈璐', NULL, NULL, '', '15715320860', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心', '23432544391222472', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10297, 'lühongguo', '吕洪国', NULL, NULL, '', '15092088323', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心,双招双引办公室', '6833215021574120', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10298, 'dingchunyang', '丁春阳', NULL, NULL, '', '17854225877', 1, NULL, '2020-09-11 18:14:36', '经济发展与投资促进中心,双招双引办公室', '286918014920039279', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10299, 'zhangjintai', '张金泰', NULL, NULL, '', '13553098189', 1, NULL, '2020-09-11 18:14:36', '财政审计中心（统计站）', '052940342424587359', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10300, 'liuyang1', '刘洋', NULL, NULL, '', '18562521197', 1, NULL, '2020-09-11 18:14:36', '财政审计中心（统计站）', '010338315546679411', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10301, 'sunwenwen', '孙雯雯', NULL, NULL, '', '15725211002', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）,金融办', '111363045023709433', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10302, 'xuruiyao', '徐瑞瑶', NULL, NULL, '', '18866224935', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '234405460924463208', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10303, 'zhangyubing', '张玉兵', NULL, NULL, '', '13964894810', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '030055182024340012', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10304, 'songyandi', '宋岩弟', NULL, NULL, '', '13165086666', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）,金融办', '234356096623280737', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10305, 'xuguibin', '许桂彬', NULL, NULL, '', '18706302346', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '156616174335224866', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10306, 'yangzhaomiao', '杨兆苗', NULL, NULL, '', '13589362589', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '234268502326118073', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10307, 'limei1', '李梅', NULL, NULL, '', '18661425085', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '010338315548846583', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10308, 'fanxiaoli', '范晓丽', NULL, NULL, '', '18863901922', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '234456165533063053', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10309, 'wangxue', '王雪', NULL, NULL, '', '15092002319', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '1452630741955583', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10310, 'wangjingting', '王靖婷', NULL, NULL, '', '18706422200', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '200713506629649580', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10311, 'dailingfeng', '代凌锋', NULL, NULL, '', '15963220232', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '010053162920094690', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10312, 'zhangxiaomin', '张晓敏', NULL, NULL, '', '13687671553', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）', '176603185324240252', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10313, 'wangshenglou', '王升楼', NULL, NULL, '', '15020023583', 1, NULL, '2020-09-11 18:14:37', '财政审计中心（统计站）,志翔路社区', '234437483529113312', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10314, 'liuxiaomei', '刘晓梅', NULL, NULL, '', '13626420638', 1, NULL, '2020-09-11 18:14:38', '财政审计中心（统计站）', '234444472221035178', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10315, 'sunwenwen1', '孙雯雯', NULL, NULL, '', '18866851958', 1, NULL, '2020-09-11 18:14:38', '财政审计中心（统计站）', '01033919413823709433', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10316, 'dingxinming', '丁新明', NULL, NULL, '', '15166645851', 1, NULL, '2020-09-11 18:14:38', '财政审计中心（统计站）', '153537001220023327', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10317, 'zhouyanmo', '周衍默', NULL, NULL, '', '13791816998', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '151827416621887635', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10318, 'lixiang', '李湘', NULL, NULL, '', '15650168600', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '2343371203848074', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10319, 'panyueheng', '潘岳恒', NULL, NULL, '', '15763952078', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234255046028152663', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10320, 'wangyuanyuan', '王园园', NULL, NULL, '', '13210826775', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234311160929137515', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10321, 'sunli', '孙丽', NULL, NULL, '', '15254253672', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '1553373566744964', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10322, 'xuzhihui', '徐志辉', NULL, NULL, '', '13626390920', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '2721211024307234', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10323, 'caoailing', '曹爱玲', NULL, NULL, '', '13583230593', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234213354026268762', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10324, 'yanliping', '严丽萍', NULL, NULL, '', '15763952096', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234312396819879509', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10325, 'jinweijie', '金维杰', NULL, NULL, '', '13656483096', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234413262336907149', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10326, 'dongchen', '董晨', NULL, NULL, '', '15224448613', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心,农业农村中心（农产品质量安全监管中心）', '23432130521076837', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10327, 'dongyulan', '董玉兰', NULL, NULL, '', '15763952099', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234637456233506986', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10328, 'wangwenjing1', '王文静', NULL, NULL, '', '15063021891', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '323713474829269885', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10329, 'guofuyun', '郭福云', NULL, NULL, '', '15763952088', 1, NULL, '2020-09-11 18:14:38', '宣教文卫中心', '234310656136638863', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10330, 'shenlili', '沈丽丽', NULL, NULL, '', '18661425082', 1, NULL, '2020-09-11 18:14:39', '宣教文卫中心,退役军人服务站', '042531145827341352', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10331, 'zhoumeiling', '周美玲', NULL, NULL, '', '18661425083', 1, NULL, '2020-09-11 18:14:39', '宣教文卫中心', '234269211621807180', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10332, 'dinghuanmei', '丁焕梅', NULL, NULL, '', '15763952098', 1, NULL, '2020-09-11 18:14:39', '宣教文卫中心', '235446342420114385', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10333, 'jiewenjun', '解文军', NULL, NULL, '', '13808977985', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '142935631234748951', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10334, 'dinghua', '丁华', NULL, NULL, '', '18561356619', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '2314203113640365', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10335, 'dingyueqin', '丁月芹', NULL, NULL, '', '13864888118', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '062338073420041330', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10336, 'wangxia1', '王霞', NULL, NULL, '', '15763952097', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '2427083250955635', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10337, 'zhaochuanbin1', '赵传彬', NULL, NULL, '', '15092050555', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '103753234935453057', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10338, 'xiaojinguang', '肖金光', NULL, NULL, '', '13573250657', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）,信阳村', '150458600532812206', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10339, 'cuihang1', '崔航', NULL, NULL, '', '13687604137', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '2343352613771990', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10340, 'weiyuting', '魏玉庭', NULL, NULL, '', '13969607880', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '266018531739149523', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10341, 'wangxin1', '王新', NULL, NULL, '', '13864872168', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '2406691134942981', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10342, 'liwenhua', '李文华', NULL, NULL, '', '13964207893', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）,纪检监察办公室（内设巡查办）,督导巡察办公室', '050521545026241653', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10343, 'tangyang', '汤洋', NULL, NULL, '', '13869883276', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '2335440061888103', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10344, 'zhuangguiren', '庄桂仁', NULL, NULL, '', '13791923968', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234333690024099907', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10345, 'liuxinjian', '刘新建', NULL, NULL, '', '18766295137', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '253001261121027682', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10346, 'zhuangxiujie', '庄秀洁', NULL, NULL, '', '15563967825', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234313015624246469', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10347, 'zhaotingting', '赵婷婷', NULL, NULL, '', '18753231689', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234250534635541781', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10348, 'wangshiying', '王事颖', NULL, NULL, '', '18561475432', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234359233429087798', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10349, 'zhangzonggen', '张宗根', NULL, NULL, '', '13791922639', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234369085224155810', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10350, 'wuxuemin', '吴学敏', NULL, NULL, '', '13708966877', 1, NULL, '2020-09-11 18:14:39', '农业农村中心（农产品质量安全监管中心）', '234441236821466589', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10351, 'zhaomingyan', '赵明燕', NULL, NULL, '', '15963226180', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '176716623035639740', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10352, 'yangguixiang', '杨桂香', NULL, NULL, '', '13730971038', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '234422384726306303', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10353, 'xuejianming', '薛建明', NULL, NULL, '', '13589249126', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '194439436333648943', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10354, 'yinaijun', '尹爱军', NULL, NULL, '', '13455289656', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '234553646423615363', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10355, 'dongzhihong', '董治洪', NULL, NULL, '', '13553046519', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '240644555233460082', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10356, 'xugongsen1', '徐公森', NULL, NULL, '', '13573855836', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '234343011924182930', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10357, 'chengmingtai', '程明台', NULL, NULL, '', '15965555871', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '242150474430855917', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10358, 'zhuchuanrong', '祝传荣', NULL, NULL, '', '13791925559', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '145763530830518880', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10359, 'zhangjiaojiao', '张娇娇', NULL, NULL, '', '13793273006', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '693705252124139776', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10360, 'wangquanming', '王全明', NULL, NULL, '', '15020075761', 1, NULL, '2020-09-11 18:14:40', '农业农村中心（农产品质量安全监管中心）', '234412122729097585', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10361, 'tengzhaolong', '滕召龙', NULL, NULL, '', '15953282372', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '234407242127973314', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10362, 'weipengzhang', '魏朋章', NULL, NULL, '', '13791840158', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '141355513039057604', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10363, 'wanghuaiming', '王怀明', NULL, NULL, '', '13465877557', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '026634554129213401', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10364, 'xuzhongxue', '徐忠学', NULL, NULL, '', '13863939585', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '206220211724294166', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10365, 'zhaolong', '赵龙', NULL, NULL, '', '15866831658', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '01311910511163460', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10366, 'zhaobing', '赵兵', NULL, NULL, '', '13791953552', 1, NULL, '2020-09-11 18:14:41', '农业农村中心（农产品质量安全监管中心）', '10375025521143456', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10367, 'zhangzebo', '张则波', NULL, NULL, '', '15964287721', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '234058090924081673', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10368, 'zhangquanshui1', '张泉水', NULL, NULL, '', '19969925001', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '624013434724293291', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10369, 'wangning', '王宁', NULL, NULL, '', '13792906391', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '1216356619940374', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10370, 'zhoumei', '周梅', NULL, NULL, '', '13969871908', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '0122540322696605', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10371, 'tianxin', '田鑫', NULL, NULL, '', '13280855990', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '1129693734967995', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10372, 'dongjunshu', '董均书', NULL, NULL, '', '18561356676', 1, NULL, '2020-09-11 18:14:41', '社会治理中心,流动人员管理服务办公室', '231420312833281954', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10373, 'mengqi', '孟琪', NULL, NULL, '', '18562510592', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '6220615043754859', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10374, 'gongyichao', '宫艺超', NULL, NULL, '', '15963276353', 1, NULL, '2020-09-11 18:14:41', '社会治理中心,流动人员管理服务办公室', '650049604423623478', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10375, 'gengfangchao', '耿方超', NULL, NULL, '', '18266652333', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '060121401132394091', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10376, 'fengxiuwen', '封秀文', NULL, NULL, '', '18561356731', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '231411144023626632', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10377, 'taiqiwei', '邰启伟', NULL, NULL, '', '18561356721', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '231340276836283776', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10378, 'chenhong', '陈红', NULL, NULL, '', '15666822337', 1, NULL, '2020-09-11 18:14:41', '社会治理中心', '24244800631225050', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10379, 'xiapingping', '夏萍萍', NULL, NULL, '', '15505320067', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '105433326522991599', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10380, 'gaoxiaohan', '高晓涵', NULL, NULL, '', '15063946456', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '244007675438934170', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10381, 'fengziyan', '封子艳', NULL, NULL, '', '18353292589', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '214023434423392484', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10382, 'lixiaohe1', '厉笑鹤', NULL, NULL, '', '15698151451', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '01033829380321568188', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10383, 'wanghui1', '王晖', NULL, NULL, '', '13954208698', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '010338293804943147', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10384, 'weishufang', '魏淑芳', NULL, NULL, '', '18561980663', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '234325113739113361', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10385, 'gengdingwei1', '耿丁伟', NULL, NULL, '', '13626429310', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '01033822022532189885', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10386, 'liufang', '刘芳', NULL, NULL, '', '15954888671', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '2421493343684955', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10387, 'dingyanjuan', '丁艳娟', NULL, NULL, '', '13616391689', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '151811044820248525', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10388, 'wangyan', '王燕', NULL, NULL, '', '13573224113', 1, NULL, '2020-09-11 18:14:42', '社会治理中心', '1739052454946090', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10389, 'zhengwenfeng', '郑文凤', NULL, NULL, '', '18354202926', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '023547045736453838', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10390, 'xuli', '许丽', NULL, NULL, '', '18669869882', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '23431569101128837', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10391, 'chujunjian', '初均建', NULL, NULL, '', '13687624456', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '235311571220918128', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10392, 'yangrenjun', '杨仁军', NULL, NULL, '', '18561356690', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '231411145626085474', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10393, 'chenzhengfei', '陈正飞', NULL, NULL, '', '17685567343', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '176465662537862947', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10394, 'jifuyao1', '季付瑶', NULL, NULL, '', '15842908951', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '01033829380023138113', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10395, 'liumei', '刘梅', NULL, NULL, '', '17362228333', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '1759065715678253', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10396, 'xianweiyi', '咸伟艺', NULL, NULL, '', '18562610149', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '405201096121503475', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10397, 'dingjianming1', '丁鉴鸣', NULL, NULL, '', '15066190225', 1, NULL, '2020-09-11 18:14:43', '社会治理中心', '285065094520392944', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10398, 'guanqingjie', '管清洁', NULL, NULL, '', '13698651890', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '234320032231315709', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10399, 'tianlu1', '田璐', NULL, NULL, '', '17660430423', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '1521396254959840', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10400, 'zhujiamin1', '朱珈民', NULL, NULL, '', '13964219350', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '115621146726333242', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10401, 'wumingjie1', '吴明洁', NULL, NULL, '', '15154293960', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '090611375121553127', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10402, 'zhangmei1', '张梅', NULL, NULL, '', '15253282933', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '2350621058781669', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10403, 'hexiaopan1', '何小盼', NULL, NULL, '', '18766200400', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '101838223620277986', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10404, 'luzhuoyue1', '卢卓越', NULL, NULL, '', '18561565539', 1, NULL, '2020-09-11 18:14:44', '社会治理中心', '161166021221211001', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10405, 'zhaoyan', '赵艳', NULL, NULL, '', '15806920717', 1, NULL, '2020-09-11 18:14:45', '社会治理中心', '31124312211155998', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10407, 'liping2', '李萍', NULL, NULL, '', '18562561026', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '0500236406853631', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10408, 'cengxiaoyi', '曾晓艺', NULL, NULL, '', '13789858373', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '234323491926183173', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10409, 'dongfangkai', '董方凯', NULL, NULL, '', '15964242939', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '223339172033397497', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10410, 'yangning1', '杨宁', NULL, NULL, '', '15806519230', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '0102343003844057', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10411, 'cuiyujie1', '崔玉节', NULL, NULL, '', '18561980667', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '01033829380123849005', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10412, 'dingansheng', '丁安生', NULL, NULL, '', '18363963379', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '01033829376919946615', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10413, 'dongjinlei1', '董金磊', NULL, NULL, '', '15964228598', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '114429093233757372', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10414, 'lina1', '李娜', NULL, NULL, '', '18753273958', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '4720265867842894', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10415, 'zhujinhe', '朱津禾', NULL, NULL, '', '13655320191', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '623712501426284074', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10416, 'changlin1', '常琳', NULL, NULL, '', '16678981201', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '010338293802777467', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10417, 'dongjinpeng', '董金鹏', NULL, NULL, '', '15606390636', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '036328682633766977', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10418, 'wumin', '吴敏', NULL, NULL, '', '18661794230', 1, NULL, '2020-09-11 18:26:34', '社会治理中心', '0131446408694171', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10419, 'guanyanxue', '管延雪', NULL, NULL, '', '18266637390', 1, NULL, '2020-09-11 18:26:34', '社会治理中心,流动人员管理服务办公室', '011928454631206933', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10420, 'wangjunshan', '王均山', NULL, NULL, '', '13969846069', 1, NULL, '2020-09-11 18:26:34', '社会治理中心,乡村振兴指导员', '0539402929141717', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10421, 'dingmingchu', '丁明初', NULL, NULL, '', '13963964738', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '156303311020021136', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10422, 'wangyan0', '王艳', NULL, NULL, '', '13165031095', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '0200274549950344', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10423, 'zhangailing', '张爱玲', NULL, NULL, '', '15866810109', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '234314205524338113', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10424, 'fangjunsheng', '房俊生', NULL, NULL, '', '15066871122', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '234229190124833300', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10425, 'chenyajie', '陈雅洁', NULL, NULL, '', '15092059952', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '234269124138196004', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10426, 'wangjing', '王静', NULL, NULL, '', '15020096580', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '1335501256955694', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10427, 'xuemengke1', '薛孟珂', NULL, NULL, '', '18561397610', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '240841423733623838', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10428, 'zhaoyishu', '赵怡舒', NULL, NULL, '', '15589845938', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '046569280435596870', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10429, 'yangyong', '杨勇', NULL, NULL, '', '13553046178', 1, NULL, '2020-09-11 18:26:34', '社会事务中心', '0131191848841823', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10430, 'songchao', '宋超', NULL, NULL, '', '15564885950', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '2408431612762714', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10431, 'dingjie1', '丁杰', NULL, NULL, '', '13863966647', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '2342566464645519', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10432, 'dongjie', '董杰', NULL, NULL, '', '15064218697', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '06345812371077101', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10433, 'dingjinshu', '丁金淑', NULL, NULL, '', '18364277763', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '234243693120375521', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10434, 'yangchengtong', '杨成彤', NULL, NULL, '', '13964862315', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '234324413326242236', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10435, 'miaozhiwei', '苗植维', NULL, NULL, '', '18266647712', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '171850531333054878', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10436, 'xuconggao', '徐从高', NULL, NULL, '', '13969792970', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '234251631124174938', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10437, 'anxiaohong', '安晓红', NULL, NULL, '', '13963972507', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '011521622623363576', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10438, 'songfei', '宋菲', NULL, NULL, '', '18678451008', 1, NULL, '2020-09-11 18:26:35', '社会事务中心', '3110536719760263', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10439, 'liuzhongli', '刘仲利', NULL, NULL, '', '13869816018', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '050424502420843919', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10440, 'liushuai', '刘帅', NULL, NULL, '', '15192805556', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '0269012166675565', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10441, 'chenxiaoguang1', '陈晓光', NULL, NULL, '', '18863919386', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '235053393637804446', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10442, 'zhouxin', '周欣', NULL, NULL, '', '18363939013', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '010338605725697275', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10443, 'dingkaixuan', '丁凯旋', NULL, NULL, '', '18753217958', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '231524032719866493', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10444, 'miaopeisen', '苗沛森', NULL, NULL, '', '18253290890', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '240664642133077450', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10445, 'mengqingsen', '孟庆森', NULL, NULL, '', '15192543893', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '235638294823255751', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10446, 'zhouli', '周莉', NULL, NULL, '', '15166612397', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '1727283147703521', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10447, 'wanghaipeng', '王海鹏', NULL, NULL, '', '13964296621', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '104453114429334659', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10448, 'xuyiran', '徐艺冉', NULL, NULL, '', '13806428931', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '240908543024566239', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10449, 'xujinli', '徐金利', NULL, NULL, '', '15064277588', 1, NULL, '2020-09-11 18:26:35', '发展保障中心', '183147456424688136', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10450, 'yangzezhao', '杨泽照', NULL, NULL, '', '18206596906', 1, NULL, '2020-09-11 18:26:35', '退役军人服务站', '244965331526333554', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10451, 'sunyuying0', '孙钰莹', NULL, NULL, '1212@12.cc', '17862910935', 1, 11130, '2020-09-11 18:26:35', '青岛市黄岛区泊里镇人民政府,退役军人服务站', '240861460723686690', NULL, NULL, '地图');
INSERT INTO `sys_user` VALUES (10452, 'xujingjiang', '徐京江', NULL, NULL, '', '15763952117', 1, NULL, '2020-09-11 18:26:35', '退役军人服务站', '234312336524161987', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10453, 'chengbaoxiang', '程宝翔', NULL, NULL, '', '18353230924', 1, NULL, '2020-09-11 18:26:35', '退役军人服务站', '230037473630784290', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10454, 'mafei', '马飞', NULL, NULL, '', '18863919692', 1, NULL, '2020-09-11 18:26:35', '退役军人服务站', '23430630291264626', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10455, 'yinxianghong', '尹相宏', NULL, NULL, '', '13864232069', 1, NULL, '2020-09-11 18:26:35', '董家口港社区,贡口湾村', '042864322123655824', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10456, 'chenshaohua', '陈少华', NULL, NULL, '', '18561357897', 1, NULL, '2020-09-11 18:26:35', '董家口港社区,志翔路社区', '064356663037723557', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10457, 'dongchunjie', '董春杰', NULL, NULL, '', '15966817055', 1, NULL, '2020-09-11 18:26:35', '董家口港社区', '250746615333406350', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10458, 'dongguijie', '董桂杰', NULL, NULL, '', '15092458535', 1, NULL, '2020-09-11 18:26:35', '董家口港社区,贡口湾村', '234325264733423121', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10459, 'liuyaoxian', '刘耀贤', NULL, NULL, '', '13606488248', 1, NULL, '2020-09-11 18:26:35', '董家口港社区,乡村振兴指导员', '234207185621248316', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10460, 'yangzhaotian', '杨兆田', NULL, NULL, '', '13969657863', 1, NULL, '2020-09-11 18:26:35', '港城文苑社区,旺海村', '172949513526114578', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10461, 'wangziping', '王子平', NULL, NULL, '', '18561356627', 1, NULL, '2020-09-11 18:26:35', '港城文苑社区,红石村', '012004265029174254', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10462, 'songdiankun', '宋电坤', NULL, NULL, '', '13792848397', 1, NULL, '2020-09-11 18:26:35', '菜园社区,新泊村', '234410515923473562', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10463, 'wangshouzhao1', '王守召', NULL, NULL, '', '13969846067', 1, NULL, '2020-09-11 18:26:35', '菜园社区,菜园村', '234327253129173295', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10464, 'wufeng', '吴锋', NULL, NULL, '', '15763952116', 1, NULL, '2020-09-11 18:26:35', '菜园社区,菜园村', '2343251043706391', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10465, 'liqiang', '李强', NULL, NULL, '', '13061247444', 1, NULL, '2020-09-11 18:26:35', '港城佳苑社区,腾翔路社区', '1037506901844204', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10466, 'mengyanchun', '孟艳春', NULL, NULL, '', '15165323019', 1, NULL, '2020-09-11 18:26:35', '港城佳苑社区,沐官岛社区', '021501626923540145', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10467, 'wanganbin', '王安彬', NULL, NULL, '', '18678913785', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '024859473829176270', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10468, 'guanyanke', '管延科', NULL, NULL, '', '18561699081', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '234432432731199484', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10469, 'duzengxia', '杜增霞', NULL, NULL, '', '13863961258', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '234621404426170012', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10470, 'zhaojimin', '赵吉民', NULL, NULL, '', '15165238175', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '051336320835495261', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10471, 'dingfeng', '丁峰', NULL, NULL, '', '15969839333', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '2343243347642831', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10472, 'dipingfen1', '邸平粉', NULL, NULL, '', '13863352057', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '030822446436384558', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10473, 'xingzhenmei', '邢贞梅', NULL, NULL, '', '13964807971', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '231726266036728649', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10474, 'jiqiuli', '纪秋丽', NULL, NULL, '', '13969664001', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '234349422332147964', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10475, 'chenlixia', '陈立霞', NULL, NULL, '', '13375586530', 1, NULL, '2020-09-11 18:26:36', '藏马社区,泊里社区居委会', '234333302037984763', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10476, 'yushitao', '于世涛', NULL, NULL, '', '13964262916', 1, NULL, '2020-09-11 18:26:36', '兴泊社区,兴泊路社区', '234201494019973459', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10477, 'wangke', '王克', NULL, NULL, '', '13780651117', 1, NULL, '2020-09-11 18:26:36', '兴泊社区,兴泊路社区', '1517524401937760', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10478, 'zhaojie', '赵杰', NULL, NULL, '', '18561983798', 1, NULL, '2020-09-11 18:26:36', '兴泊社区', '0103386057261149083', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10479, 'jixiaoping', '季晓平', NULL, NULL, '', '13791946668', 1, NULL, '2020-09-11 18:26:36', '兴泊社区,席乡路社区', '234332602323318819', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10480, 'libing', '黎兵', NULL, NULL, '', '15266237163', 1, NULL, '2020-09-11 18:26:36', '新港城社区,规划建设管理办公室', '23431409361281127', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10481, 'dongfuting', '董福婷', NULL, NULL, '', '13256869619', 1, NULL, '2020-09-11 18:26:36', '新港城社区,贡口路社区', '014862221433557099', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10482, 'xingzhenhua', '邢贞华', NULL, NULL, '', '13969647655', 1, NULL, '2020-09-11 18:26:36', '临港社区,常河路社区', '231728562236723218', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10483, 'wangjinlian', '王金连', NULL, NULL, '', '13583271500', 1, NULL, '2020-09-11 18:26:36', '临港社区,常河路社区', '234252454829619448', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10484, 'dongwen', '董文', NULL, NULL, '', '15066235913', 1, NULL, '2020-09-11 18:26:36', '临港社区,常河路社区,旺海村', '23434653321076612', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10485, 'zhangzejin', '张则金', NULL, NULL, '', '13780655567', 1, NULL, '2020-09-11 18:26:36', '红石社区,红石村', '015548213324091128', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10486, 'zhangyumei', '张玉梅', NULL, NULL, '', '18561434055', 1, NULL, '2020-09-11 18:26:36', '红石社区,红石村', '256011326824345916', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10487, 'liulifeng1', '刘立峰', NULL, NULL, '', '18669746222', 1, NULL, '2020-09-11 18:26:36', '红石社区,农业农村中心（农产品质量安全监管中心）', '234417095821194653', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10488, 'liuzhen', '刘振', NULL, NULL, '', '18765223170', 1, NULL, '2020-09-11 18:26:36', '红石社区,海泊村', '2317262643676887', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10489, 'wangzhengquan', '王正全', NULL, NULL, '', '13780651348', 1, NULL, '2020-09-11 18:26:36', '封家社区,蟠龙村', '234656592229298480', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10490, 'chenhuaqing', '陈华庆', NULL, NULL, '', '17660929262', 1, NULL, '2020-09-11 18:26:36', '封家社区,蟠龙村', '104463213637656896', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10491, 'wanghao1', '王浩', NULL, NULL, '', '15066255444', 1, NULL, '2020-09-11 18:26:36', '封家社区', '2146544127944958', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10492, 'xujinzhong', '徐金中', NULL, NULL, '', '15954833116', 1, NULL, '2020-09-11 18:26:36', '封家社区,蟠龙村,新泊村', '243460103424687116', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10493, 'wangzhaoxin', '王照信', NULL, NULL, '', '13864205553', 1, NULL, '2020-09-11 18:26:36', '尧头社区', '234262634929345829', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10494, 'yanguifang', '阎桂芳', NULL, NULL, '', '15908939313', 1, NULL, '2020-09-11 18:26:36', '尧头社区,沐官岛社区', '01033840364137776703', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10495, 'yinxiaoli', '尹晓丽', NULL, NULL, '', '15192756448', 1, NULL, '2020-09-11 18:26:36', '尧头社区', '114938624923520323', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10496, 'dingchangsheng', '丁常胜', NULL, NULL, '', '15865555119', 1, NULL, '2020-09-11 18:26:36', '尧头社区,沐官岛社区', '024555056419970917', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10497, 'liushanghua', '刘尚华', NULL, NULL, '', '13687696867', 1, NULL, '2020-09-11 18:26:36', '信阳社区,董家口村', '213550246820948620', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10498, 'zhouzhaohua', '周兆花', NULL, NULL, '', '13853242887', 1, NULL, '2020-09-11 18:26:36', '信阳社区,岚上村', '014253624621443731', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10499, 'liyang1', '李杨', NULL, NULL, '', '13697653781', 1, NULL, '2020-09-11 18:26:36', '信阳社区,农业农村中心（农产品质量安全监管中心）', '3234295729846298', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10500, 'liuchuanqi', '刘传奇', NULL, NULL, '', '15092052727', 1, NULL, '2020-09-11 18:26:36', '信阳社区,信阳村', '216544631520847167', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10501, 'bidehua', '毕德华', NULL, NULL, '', '15066258581', 1, NULL, '2020-09-11 18:26:36', '重点项目攻坚办公室,党政办公室（人大办公室）', '104431313527309324', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10502, 'lixue', '李雪', NULL, NULL, '', '13589366376', 1, 1, '2020-09-11 18:26:37', '重点项目攻坚办公室,重点工作攻坚指挥部办公室', '1331680037858460', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '主要工作权限1');
INSERT INTO `sys_user` VALUES (10503, 'lushenggang', '卢胜刚', NULL, NULL, '', '18561426678', 1, NULL, '2020-09-11 18:26:37', '人武部,党建工作办公室', '642518004621557152', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10504, 'wangqingpeng', '王清鹏', NULL, NULL, '', '15250413174', 1, NULL, '2020-09-11 18:26:37', '平台公司筹备组', '125438280629339061', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10505, 'wangsong', '王淞', NULL, NULL, '', '18661725766', 1, NULL, '2020-09-11 18:26:37', '平台公司筹备组', '1935564962945075', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10506, 'dingxu', '丁旭', NULL, NULL, '', '18354253559', 1, NULL, '2020-09-11 18:26:37', '平台公司筹备组', '2344520050645132', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10507, 'zhaofengbo', '赵风波', NULL, NULL, '', '13854234511', 1, NULL, '2020-09-11 18:26:37', '平台公司筹备组', '026954131836041225', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10508, 'weijingwen', '魏敬雯', NULL, NULL, '', '18561736096', 1, NULL, '2020-09-11 18:26:37', '平台公司筹备组', '240855156239051922', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10509, 'zhoujiahai', '周加海', NULL, NULL, '', '13864251067', 1, NULL, '2020-09-11 18:26:37', '老干部活动中心', '014439412321449023', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10510, 'dingshichen', '丁仕臣', NULL, NULL, '', '13954238506', 1, NULL, '2020-09-11 18:26:37', '老干部活动中心', '242835240219849071', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10511, 'zhuangmeiqin', '庄美芹', NULL, NULL, '', '18661602752', 1, NULL, '2020-09-11 18:26:37', '司法所', '031568443524298095', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10512, 'wangpeihong', '王培宏', NULL, NULL, '', '18266641888', 1, NULL, '2020-09-11 18:26:37', '乡村振兴指导员', '1158380529147009', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10513, 'wanghuaifeng', '王怀峰', NULL, NULL, '', '13553030888', 1, NULL, '2020-09-11 18:26:37', '乡村振兴指导员', '100047674029211067', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10514, 'zhouxuan', '周璇', NULL, NULL, '', '15963266367', 1, NULL, '2020-09-11 18:26:37', '借调人员', '0935684506699679', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10515, 'dongpeng1', '董鹏', NULL, NULL, '', '18364249858', 1, NULL, '2020-09-11 18:26:37', '借调人员', '21051319481091148', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10516, 'cuiliwen', '崔沥文', NULL, NULL, '', '15376780999', 1, NULL, '2020-09-11 18:26:37', '借调人员,退役军人服务站', '035139535623786902', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10517, 'sunjianjiang', '孙建江', NULL, NULL, '', '13863971757', 1, NULL, '2020-09-11 18:26:37', '借调人员', '253117470323254462', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10518, 'zhaoyupeng', '赵玉鹏', NULL, NULL, '', '13553033117', 1, NULL, '2020-09-11 18:26:37', '借调人员', '062652275335758107', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10519, 'liumenghan', '刘梦涵', NULL, NULL, '', '15105320568', 1, NULL, '2020-09-11 18:26:37', '借调人员', '242004363921054951', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10520, 'zhanghanmei', '张晗梅', NULL, NULL, '', '15866880115', 1, NULL, '2020-09-11 18:26:37', '借调人员', '113108051324241198', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10521, 'dingguoyan', '丁国宴', NULL, NULL, '', '15610497888', 1, NULL, '2020-09-11 18:26:37', '借调人员', '01033840363919904024', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10522, 'fengcongyan', '封从艳', NULL, NULL, '', '15153243016', 1, NULL, '2020-09-11 18:26:37', '借调人员', '234257525223293222', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10523, 'langzhen', '郎朕', NULL, NULL, '', '18364291050', 1, NULL, '2020-09-11 18:26:37', '借调人员', '24026826481175559', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10524, 'chenxingshan', '陈星山', NULL, NULL, '', '13475828194', 1, NULL, '2020-09-11 18:26:37', '借调人员', '01033840364037805690', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (11112, 'weyuer', '未育', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '1159357048@qq.com', '15153111638', 1, 11130, '2020-09-18 19:27:04', '系统组织架构', NULL, NULL, '泊里市政项目B', '地图');
INSERT INTO `sys_user` VALUES (11113, 'admin1', '管理员1', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '234@4567.cc', '12322222222', 1, 11113, '2020-09-21 18:50:18', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '泊里测试项目A', '222');
INSERT INTO `sys_user` VALUES (11119, 'admin2', NULL, '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '33@cc.12', '12322221111', 1, 11119, '2020-09-21 20:53:16', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '泊里市政项目B', '123');
INSERT INTO `sys_user` VALUES (11120, 'admin5', NULL, '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '22@11.cc', '12322223333', 1, 1, '2020-09-21 20:55:32', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '啊2', '地图');
INSERT INTO `sys_user` VALUES (11121, '123', '', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '123@11.cc', '12332221111', 1, 11120, '2020-09-21 20:56:12', '系统组织架构', NULL, NULL, '泊里测试项目A', '地图');
INSERT INTO `sys_user` VALUES (11123, 'wangfl', '王法礼', '609879a19cfbebd5f2162ffa0f4fe162cb5c1bc84fee7f2ab676658c570e5aac', 'XKxdlIpJak5NjuRmWde7', 'wfl@11.cc', '13255556666', 1, 11123, '2020-09-22 11:22:05', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', 'admin1');
INSERT INTO `sys_user` VALUES (11127, 'liujj', '', '3a50221d9104b65029ca0ac2848b184fc6c44ab786ea154db290dca36720e508', 'GuLkjRLSOAbHKgnE0cao', '333@222.cc', '12322222222', 1, 1, '2020-09-23 09:40:39', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '泊里测试项目A', 'admin');
INSERT INTO `sys_user` VALUES (11128, 'sunyuying1', '孙玉莹', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '1159357048@qq.com', '15153111638', 1, 11128, '2020-09-23 10:01:17', '系统组织架构', NULL, NULL, '海湾·书香明庭', 'admin,admin1');
INSERT INTO `sys_user` VALUES (11129, 'sunys', '孙', '46354f584f16bbc969e2e9c0868f50cd153bc353480d8ca90306f0dd059952f7', 'svnhWfh6lVe3ghMWWMZm', '111@11.cc', '15599564753', 1, 10110, '2020-09-23 15:03:38', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '青岛港董家口港区原油商业储备库工程，海湾·书香明庭，钢厂西路北段工程项目，青岛蓝港祥和居住小区，钢厂西路北段管道运输工程项目，钢厂西路北段管道运输绿化带工程项目，海湾-书香明庭', 'admin');
INSERT INTO `sys_user` VALUES (11130, 'lewk', 'lewk', '52d3d1b4819b1341ec4c5a51a027ad812018c25722cce7b25c14eab4140aee06', 'EcNlTLjrDM9BbTu9jLvn', 'lew@111.cc', '13233336666', 1, 1, '2020-09-23 15:08:26', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '泊里测试项目A', 'admin');
INSERT INTO `sys_user` VALUES (11131, 'dd', '段龙海', '654aa1e301e43b6a8a83f9c350a06bcc1e19c9ed740d70b617d70b40f01aeace', 'p0qvmWrM4840jMwFcugp', '11@1.cc', '15288465732', 1, 1, '2020-09-24 14:27:02', '系统组织架构', NULL, NULL, '钢厂西路北段工程项目', 'admin');
INSERT INTO `sys_user` VALUES (11132, 'syn123', '史亚南', '0d10c30800b4e9cdce014aa5d359e57751749cca858dd346672acbbf0ff1abe8', 'HRs905WgE6ItixA7aftZ', '32iu@86.com', '15236325698', 1, 11131, '2020-09-24 14:55:36', '组织部2,系统组织架构', NULL, NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', 'ceshi');
INSERT INTO `sys_user` VALUES (11133, 'suntext', '时间', '90ff2333dd18e294a5bf9d7903c549509a593c8a8f1d99417975a6aa47b2a827', 'x5EktPXjyIa36S7MzAqu', '123@163.cc', '15476456564', 1, 11128, '2020-09-25 10:59:02', '系统组织架构', NULL, NULL, '泊里测试项目A', 'admin');
INSERT INTO `sys_user` VALUES (11139, 'zhaolf', '赵凌飞', 'f86042a5d3228a6ea0e3a342cd9e8943ec2d2853547d6c3ddee711fc9e1b3d31', 'bhpWjGKProYiWuWKczW4', '10076630@qq.com', '13001719099', 1, 1, '2020-09-27 09:16:21', '组织部2', NULL, NULL, '钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭,青岛港董家口港区原油商业储备库工程 - 青岛港董家口港区原油商业储备库工程一期,青岛董家口大酒店有限公司2#高层厂房、5#厂房,青岛港董家口港区原油商业储备库工程,海湾·书香明庭', '地图,admin1');
INSERT INTO `sys_user` VALUES (11140, 'shiyn', '亚南', '800a0809115b50c0f7acfd80b084ffc3604d331c51360217d1ff9856a4c41e04', 'VXd3RljbWhoSKFi8f3rc', '23@11.cc', '15632569852', 1, 11140, '2020-09-28 17:06:05', '组织部2,组织部1,系统组织架构', NULL, NULL, '海湾·书香明庭', 'admin,巡检人员');
INSERT INTO `sys_user` VALUES (101100, 'wangfali1', '王法礼', NULL, NULL, 'cesi@163.cc', '15288969512', 1, 101100, '2020-09-11 18:14:28', '智慧办借调', '091152311529320146', NULL, '钢厂西路北段工程项目', 'admin1,项目整改人员');
INSERT INTO `sys_user` VALUES (101101, 'sunyushu', '孙钰淑', NULL, NULL, '1@1.com', '17862183371', 1, 10110, '2020-09-29 09:42:41', '智慧办借调', '116938086923681082', NULL, '青岛港董家口港区原油商业储备库工程，海湾·书香明庭，钢厂西路北段工程项目，青岛蓝港祥和居住小区，钢厂西路北段管道运输工程项目，钢厂西路北段管道运输绿化带工程项目，海湾-书香明庭', 'admin');
INSERT INTO `sys_user` VALUES (101102, 'aa', 'aa', 'ef2c2747ec0985a82869f71a5e4051edc7bd11cb81765b87c578ef832bf216e8', 'N5BXQZ9CwtDvGQfeDxzn', '1@11.cc', '12322222222', 1, 11130, '2020-09-29 09:43:34', '青岛市黄岛区泊里镇人民政府', NULL, NULL, '青岛港董家口港区原油商业储备库工程', 'admin');
INSERT INTO `sys_user` VALUES (101103, 'dilraba', '迪丽热巴', '0b85f6ed95f49cdfc1a74e329fdafa71305c890727466b22c5c44ff11d1226ef', 'J3nYskUoozp59EaiChTZ', '1@163.com', '15987652387', 1, 101102, '2020-09-29 10:02:50', '组织部1', NULL, NULL, '钢厂西路北段工程项目，青岛蓝港祥和居住小区，钢厂西路北段管道运输工程项目', 'admin');
INSERT INTO `sys_user` VALUES (101106, 'taoli', '桃李', 'feba8a9a3014353a807e248d5fd2475030af89795be4158fc91cda1f3971bb24', 'sYGUldoC3Nhvmokdfw75', '1@163.com', '15678923456', 1, 11139, '2020-09-29 14:25:57', '组织部1', NULL, NULL, '钢厂西路北段工程项目，钢厂西路北段管道运输工程项目，青岛蓝港祥和居住小区，钢厂西路北段管道运输绿化带工程项目', 'admin，admin1');
INSERT INTO `sys_user` VALUES (101110, '12333', '2333', '218f87743665007a947f40a75022647bdf0c97640c71709472f213c3509d52d9', 'CiDmylXV4Mpaordsy7By', '1@163.com', '15678945674', 1, 11128, '2020-09-29 16:25:09', '组织部2', NULL, NULL, '钢厂西路北段管道运输工程项目，青岛蓝港祥和居住小区', 'admin1');
INSERT INTO `sys_user` VALUES (101114, '测', '1', '2d611161f5da26a1c672c13814d997861df0115954bff8beda2d4ec48384e1bf', '9cTXpjpwgdCAEMcbUyRb', '12@1.com', '15365896325', 1, 11140, '2020-09-29 17:27:43', '测', NULL, NULL, '钢厂西路北段管道运输工程项目，青岛蓝港祥和居住小区', 'ts，tt2，ttt，地图');
INSERT INTO `sys_user` VALUES (101116, '111', '111', 'd0fdafc585d98bd03e64eafc20dc67f75198b1be02761115e1891d127a592377', '2knDorFNWEGOhCU4yym8', '1@16.com', '15288969512', 1, 11130, '2020-09-30 10:32:38', '测试', NULL, NULL, '青岛港董家口港区原油商业储备库工程，钢厂西路北段工程项目', '地图');
INSERT INTO `sys_user` VALUES (101117, 'zhangyao', '张尧', NULL, NULL, NULL, '15098991206', 1, 11130, '2020-09-30 10:52:08', '智慧办借调', '0255673131778503', NULL, '钢厂西路北段管道运输工程项目,青岛蓝港祥和居住小区,钢厂西路北段工程项目', 'admin,政务通');
INSERT INTO `sys_user` VALUES (101123, 'text1', 'text1', '46f28be50cfed2cb73c1fa25ba206623e341a05e8ae883d3a2527a60fbdb3105', 'Gnkz6XVQXLWykGYkORXh', '', '13856743876', 1, 11131, '2020-09-30 16:26:18', '组织部1,组织部2', NULL, NULL, '海湾·书香明庭,钢厂西路北段工程项目,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,青岛蓝港祥和居住小区,青岛蓝港祥和居住小区', '123,222');
INSERT INTO `sys_user` VALUES (101127, 'lijun', '李君', NULL, NULL, NULL, '13455232612', 1, 1, '2020-10-12 15:20:42', '青岛市黄岛区泊里镇人民政府,社会治理中心', '2343265519841357', NULL, '青岛港董家口港区原油商业储备库工程', '政务通');
INSERT INTO `sys_user` VALUES (101130, 'liuzhaokun', '刘召坤', NULL, NULL, NULL, '15153235890', 1, NULL, '2020-10-13 15:28:32', '司法所', '241467192020884752', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101131, 'quyang', '曲扬', NULL, NULL, NULL, '13678892312', 1, NULL, '2020-10-13 19:27:59', '发展保障中心', '2350610444842170', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101132, 'liuhongjiang', '刘洪江', NULL, NULL, NULL, '15966818865', 1, NULL, '2020-10-13 19:27:59', '发展保障中心', '104429233321090445', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101133, 'liuhaigang', '刘海港', NULL, NULL, NULL, '13406802311', 1, NULL, '2020-10-13 19:27:59', '发展保障中心', '01103515016721093296', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101134, 'dingxiangfeng', '丁祥凤', NULL, NULL, NULL, '13863952617', 1, NULL, '2020-10-13 19:28:02', '社会事务中心', '242029033220174560', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101135, 'dongchunjie1', '董春杰', NULL, NULL, NULL, '15725210156', 1, NULL, '2020-10-13 19:28:06', '董家口村', '152024311333406350', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101136, 'chenxiyu', '陈西玉', NULL, NULL, NULL, '13853274336', 1, NULL, '2020-10-13 19:28:09', '岚上村', '206235393938092338', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101137, 'shiyanan', '史亚南', NULL, NULL, NULL, '15053143191', 1, 1, '2020-10-13 19:28:16', '智慧办借调', '166917571621297007', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', '地图,admin,admin1,123,222');
INSERT INTO `sys_user` VALUES (101138, 'zhaolingfei', '赵凌飞', NULL, NULL, NULL, '13001719099', 1, 1, '2020-10-13 19:28:16', '智慧办借调', '122320584335488967', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', 'admin');
INSERT INTO `sys_user` VALUES (101139, 'shishaozhu', '石少祝', NULL, NULL, NULL, '15762324580', 1, 11132, '2020-10-13 19:28:16', '智慧办借调', '601309344330271135', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', 'admin,项目整改人员');
INSERT INTO `sys_user` VALUES (101140, 'yangyinan', '杨印安', NULL, NULL, NULL, '18661777790', 1, 1, '2020-10-13 19:28:16', '智慧办借调', '133159073426125185', NULL, '青岛港董家口港区原油商业储备库工程,海湾·书香明庭,钢厂西路北段工程项目,青岛蓝港祥和居住小区,钢厂西路北段管道运输工程项目,钢厂西路北段管道运输绿化带工程项目,海湾-书香明庭', 'admin');
INSERT INTO `sys_user` VALUES (101141, 'zhaojie1', '赵杰', NULL, NULL, NULL, '15314208939', 1, NULL, '2020-10-13 19:28:16', '席乡路社区', '22065069491149083', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101142, 'wanghao0', '王 浩', NULL, NULL, NULL, '15066255444', 1, NULL, '2020-10-13 19:28:17', '三合路社区', '214654412728454420', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101143, 'fengyunzhi', '封云志', NULL, NULL, NULL, '13792494917', 1, NULL, '2020-10-13 19:28:17', '贡口路社区', '042661460623282471', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101144, '1', '1', 'eb11f103915f21c88b55dc212a33997223a5cf42c73bdff2abd8a293b7d4c4e3', 'BJ8i3lyyL2tumN5Y1fe4', '1', '15278965424', 1, 10110, '2020-10-14 10:17:45', '组织部2', NULL, NULL, '海湾·书香明庭', '地图');
INSERT INTO `sys_user` VALUES (101145, 'liuxiaojun', '刘晓军', NULL, NULL, NULL, '18561356736', 1, NULL, '2020-10-14 10:19:32', '经济发展与投资促进中心', '121709241821029312', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101146, 'dongxiujuan1', '董秀娟', NULL, NULL, NULL, '18866627127', 1, NULL, '2020-10-14 10:19:41', '社会治理中心', '234312696233558530', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101147, 'fuqiang', '付 强', NULL, NULL, NULL, '15154281000', 1, NULL, '2020-10-14 10:19:41', '社会治理中心', '184326474119422194', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101148, 'lüfei1', '吕飞', NULL, NULL, NULL, '18561980515', 1, NULL, '2020-10-14 10:19:42', '社会治理中心', '2343191767706409', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101149, 'yuhui1', '于徽', NULL, NULL, NULL, '13869877389', 1, NULL, '2020-10-14 10:19:42', '社会治理中心', '1043160105647919', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101150, 'duanyubing1', '段玉冰', NULL, NULL, NULL, '18765224888', 1, NULL, '2020-10-14 10:19:43', '社会治理中心', '116263052627435452', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101151, 'gongping', '公萍', NULL, NULL, NULL, '17864270363', 1, NULL, '2020-10-14 13:27:46', '农业农村中心（农产品质量安全监管中心）', '2345136214679969', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101152, 'liulei0', '刘磊', NULL, NULL, NULL, '15864208886', 1, NULL, '2020-10-14 16:06:06', '党政办公室（人大办公室）', '0209570754682418', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101153, 'yangdeqing', '杨德庆', NULL, NULL, NULL, '13553015167', 1, NULL, '2020-10-14 16:06:19', '规划建设管理办公室', '236711234726223383', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101154, 'bidesong', '毕德嵩', NULL, NULL, NULL, '18266230177', 1, NULL, '2020-10-14 16:06:19', '规划建设管理办公室', '240343675427311911', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101155, 'guoping', '郭平', NULL, NULL, NULL, '13583299162', 1, NULL, '2020-10-14 16:06:19', '规划建设管理办公室', '23431701271174310', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101156, 'weixufang', '魏旭芳', NULL, NULL, NULL, '15866899665', 1, NULL, '2020-10-14 16:06:19', '规划建设管理办公室', '234428394339050741', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101157, 'fengzhiyuan', '封志源', NULL, NULL, NULL, '18661425726', 1, NULL, '2020-10-14 16:06:20', '应急管理办公室', '163115372023423322', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101158, 'anxiang', '安祥', NULL, NULL, NULL, '18560643780', 1, NULL, '2020-10-14 16:06:31', '综合行政执法局（生态环境办公室）', '0934012415757500', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101159, 'dinghongrong', '丁洪荣', NULL, NULL, NULL, '13730978221', 1, NULL, '2020-10-14 16:06:36', '综合行政执法局（生态环境办公室）', '093412621420090170', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101160, 'muyujun', '穆玉军', NULL, NULL, NULL, '15712738213', 1, NULL, '2020-10-14 16:06:39', '综合行政执法局（生态环境办公室）', '234334410731019000', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101161, 'wanglili', '王丽丽', NULL, NULL, NULL, '15753261986', 1, NULL, '2020-10-14 16:06:39', '综合行政执法局（生态环境办公室）', '404322082829066347', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101162, 'dongxiaoyu', '董晓宇', NULL, NULL, NULL, '15866852977', 1, NULL, '2020-10-14 16:06:46', '农业农村中心（农产品质量安全监管中心）', '234321211533404727', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101163, 'liuxiaoqun', '刘校群', NULL, NULL, NULL, '15953251252', 1, NULL, '2020-10-14 16:06:46', '农业农村中心（农产品质量安全监管中心）', '235102653021055419', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101164, 'wangyunfei', '王云飞', NULL, NULL, NULL, '15192795066', 1, NULL, '2020-10-14 16:06:46', '农业农村中心（农产品质量安全监管中心）', '193521052229088056', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101165, 'dingxiaodong', '丁晓东', NULL, NULL, NULL, '18561721601', 1, NULL, '2020-10-14 19:27:49', '经济发展与投资促进中心', '234332653320022250', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101166, 'gaoyujiao', '高玉姣', NULL, NULL, NULL, '13863968878', 1, NULL, '2020-10-14 19:27:51', '经济发展与投资促进中心', '351362422239033938', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101167, 'lipeng', '历鹏', NULL, NULL, NULL, '13573216587', 1, NULL, '2020-10-14 19:27:51', '经济发展与投资促进中心', '2020451850703369', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101168, 'xingguanjunnan', '邢关俊楠', NULL, NULL, NULL, '13884941533', 1, NULL, '2020-10-14 19:28:04', '发展保障中心', '060126071536249218', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101169, '90', '90', 'ca29213def898ef03243ebb9b3dee01323a7143a7252e83f2e463ab06d8b33e2', 'VrQLHPmwRJHc4ypPo6iy', '90@11.cc', '15256568963', 1, 11130, '2020-10-15 10:09:36', '系统组织架构', NULL, NULL, '青岛港董家口港区原油商业储备库工程,钢厂西路北段管道运输工程项目,海湾·书香明庭,钢厂西路北段管道运输绿化带工程项目,钢厂西路北段工程项目,青岛蓝港祥和居住小区,海湾-书香明庭', 'ts11111111111111111');
INSERT INTO `sys_user` VALUES (101170, 'gaoxiaohan1', '高晓涵', NULL, NULL, NULL, '18561980380', 1, NULL, '2020-10-15 11:05:49', '社会治理中心', '255052401338934170', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101171, 'zhengwenfeng1', '郑文凤', NULL, NULL, NULL, '18561980352', 1, NULL, '2020-10-15 11:05:49', '社会治理中心', '621939440936453838', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101172, 'gengfangchao1', '耿方超', NULL, NULL, NULL, '15964987568', 1, NULL, '2020-10-15 11:05:49', '社会治理中心', '01160212514832394091', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101173, 'xiapingping1', '夏萍萍', NULL, NULL, NULL, '18561980383', 1, NULL, '2020-10-15 11:05:49', '社会治理中心', '405803602322991599', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101174, 'tianlu2', '田璐', NULL, NULL, NULL, '17669755205', 1, NULL, '2020-10-15 11:05:50', '社会治理中心', '011602174065959840', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101175, 'liufang1', '刘芳', NULL, NULL, NULL, '18561980529', 1, NULL, '2020-10-15 11:05:50', '社会治理中心', '2343300404684955', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101176, 'wangyan1', '王燕', NULL, NULL, NULL, '17669755207', 1, NULL, '2020-10-15 11:05:50', '社会治理中心', '011602066466946090', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101177, 'zhuangyanliang', '庄延亮', NULL, NULL, NULL, '18561356656', 1, NULL, '2020-10-15 11:05:51', '流动人员管理服务办公室', '231411143524026108', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101179, 'biefengjie', '别凤杰', NULL, NULL, NULL, '15166629168', 1, NULL, '2020-10-15 16:49:44', '规划建设管理办公室', '186059575120890999', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101180, 'jifuyao2', '季付瑶', NULL, NULL, NULL, '15854290895', 1, NULL, '2020-10-15 16:50:23', '社会治理中心', '124251451723138113', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101181, 'lüfei2', '吕飞', NULL, NULL, NULL, '15275229658', 1, NULL, '2020-10-15 16:50:23', '社会治理中心', '1722612622706409', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101185, 'yuxiangyun', '于香芸', NULL, NULL, NULL, '18254277187', 1, NULL, '2020-10-15 21:29:01', '党政办公室（人大办公室）', '210706142320578125', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101186, 'pangjianrong', '逄建荣', NULL, NULL, NULL, '18553220760', 1, NULL, '2020-10-15 21:29:13', '规划建设管理办公室', '185548133936217517', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101191, 'dinghongxin', '丁红欣', NULL, NULL, NULL, '15764266060', 1, NULL, '2020-10-16 11:53:05', '综合行政执法局（生态环境办公室）', '091346493120222594', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101192, 'xuwenxin', '徐文鑫', NULL, NULL, NULL, '15066817507', 1, NULL, '2020-10-16 11:53:23', '双招双引办公室', '266822645724353620', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101193, 'tengzhaojun', '滕召军', NULL, NULL, NULL, '15266249877', 1, NULL, '2020-10-16 11:53:40', '社会事务中心', '236526682327953348', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101196, 'sunyuying', '孙玉莹', NULL, NULL, '11@11.cc', '15153111638', 1, 11128, '2020-10-16 12:44:31', '智慧办借调', '086449376323423593', NULL, '海湾-书香明庭,钢厂西路北段管道运输绿化带工程项目,钢厂西路北段管道运输工程项目,青岛蓝港祥和居住小区,钢厂西路北段工程项目,海湾·书香明庭,青岛港董家口港区原油商业储备库工程', 'admin');

-- ----------------------------
-- Table structure for sys_user_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_department`;
CREATE TABLE `sys_user_department`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_department
-- ----------------------------
INSERT INTO `sys_user_department` VALUES (238, 10010, 343073673);
INSERT INTO `sys_user_department` VALUES (246, 10018, 343073673);
INSERT INTO `sys_user_department` VALUES (247, 10019, 343073673);
INSERT INTO `sys_user_department` VALUES (250, 10022, 343073673);
INSERT INTO `sys_user_department` VALUES (253, 10025, 343073673);
INSERT INTO `sys_user_department` VALUES (258, 10030, 343073673);
INSERT INTO `sys_user_department` VALUES (270, 10043, 2);
INSERT INTO `sys_user_department` VALUES (271, 10044, 2);
INSERT INTO `sys_user_department` VALUES (272, 10045, 2);
INSERT INTO `sys_user_department` VALUES (273, 10046, 2);
INSERT INTO `sys_user_department` VALUES (274, 10047, 2);
INSERT INTO `sys_user_department` VALUES (275, 10048, 2);
INSERT INTO `sys_user_department` VALUES (276, 10049, 2);
INSERT INTO `sys_user_department` VALUES (277, 10050, 2);
INSERT INTO `sys_user_department` VALUES (278, 10051, 2);
INSERT INTO `sys_user_department` VALUES (279, 10052, 2);
INSERT INTO `sys_user_department` VALUES (280, 10053, 2);
INSERT INTO `sys_user_department` VALUES (281, 10054, 2);
INSERT INTO `sys_user_department` VALUES (282, 10055, 2);
INSERT INTO `sys_user_department` VALUES (285, 10058, 2);
INSERT INTO `sys_user_department` VALUES (286, 10059, 2);
INSERT INTO `sys_user_department` VALUES (288, 10061, 2);
INSERT INTO `sys_user_department` VALUES (289, 10062, 2);
INSERT INTO `sys_user_department` VALUES (290, 10063, 2);
INSERT INTO `sys_user_department` VALUES (293, 10066, 2);
INSERT INTO `sys_user_department` VALUES (295, 10068, 2);
INSERT INTO `sys_user_department` VALUES (297, 10070, 2);
INSERT INTO `sys_user_department` VALUES (299, 10072, 2);
INSERT INTO `sys_user_department` VALUES (300, 10073, 2);
INSERT INTO `sys_user_department` VALUES (301, 10074, 2);
INSERT INTO `sys_user_department` VALUES (302, 10075, 2);
INSERT INTO `sys_user_department` VALUES (303, 10076, 2);
INSERT INTO `sys_user_department` VALUES (305, 10078, 2);
INSERT INTO `sys_user_department` VALUES (306, 10079, 2);
INSERT INTO `sys_user_department` VALUES (307, 10080, 2);
INSERT INTO `sys_user_department` VALUES (308, 10081, 2);
INSERT INTO `sys_user_department` VALUES (309, 10082, 2);
INSERT INTO `sys_user_department` VALUES (310, 10083, 2);
INSERT INTO `sys_user_department` VALUES (317, 10090, 2);
INSERT INTO `sys_user_department` VALUES (318, 10091, 2);
INSERT INTO `sys_user_department` VALUES (319, 10092, 2);
INSERT INTO `sys_user_department` VALUES (321, 10094, 2);
INSERT INTO `sys_user_department` VALUES (323, 10096, 2);
INSERT INTO `sys_user_department` VALUES (325, 10098, 2);
INSERT INTO `sys_user_department` VALUES (326, 10099, 2);
INSERT INTO `sys_user_department` VALUES (334, 10107, 2);
INSERT INTO `sys_user_department` VALUES (352, 10128, 273480001);
INSERT INTO `sys_user_department` VALUES (353, 10129, 273480001);
INSERT INTO `sys_user_department` VALUES (355, 10131, 273480001);
INSERT INTO `sys_user_department` VALUES (356, 10132, 273480001);
INSERT INTO `sys_user_department` VALUES (358, 10134, 273480001);
INSERT INTO `sys_user_department` VALUES (359, 10135, 273480001);
INSERT INTO `sys_user_department` VALUES (360, 10136, 273480001);
INSERT INTO `sys_user_department` VALUES (361, 10137, 273480001);
INSERT INTO `sys_user_department` VALUES (362, 10138, 273480001);
INSERT INTO `sys_user_department` VALUES (363, 10139, 273480001);
INSERT INTO `sys_user_department` VALUES (364, 10140, 273480001);
INSERT INTO `sys_user_department` VALUES (365, 10141, 273480001);
INSERT INTO `sys_user_department` VALUES (366, 10142, 273480001);
INSERT INTO `sys_user_department` VALUES (370, 10146, 273480001);
INSERT INTO `sys_user_department` VALUES (371, 10147, 273480001);
INSERT INTO `sys_user_department` VALUES (372, 10148, 342832847);
INSERT INTO `sys_user_department` VALUES (373, 10149, 342832847);
INSERT INTO `sys_user_department` VALUES (374, 10150, 342832847);
INSERT INTO `sys_user_department` VALUES (375, 10151, 342832847);
INSERT INTO `sys_user_department` VALUES (376, 10152, 342832847);
INSERT INTO `sys_user_department` VALUES (377, 10153, 342832847);
INSERT INTO `sys_user_department` VALUES (378, 10154, 342832847);
INSERT INTO `sys_user_department` VALUES (380, 10156, 342832847);
INSERT INTO `sys_user_department` VALUES (381, 10157, 342832847);
INSERT INTO `sys_user_department` VALUES (382, 10158, 342832847);
INSERT INTO `sys_user_department` VALUES (383, 10159, 342832847);
INSERT INTO `sys_user_department` VALUES (384, 10160, 342832847);
INSERT INTO `sys_user_department` VALUES (385, 10161, 342832847);
INSERT INTO `sys_user_department` VALUES (387, 10163, 342832847);
INSERT INTO `sys_user_department` VALUES (388, 10164, 342832847);
INSERT INTO `sys_user_department` VALUES (389, 10165, 342832847);
INSERT INTO `sys_user_department` VALUES (390, 10166, 343219378);
INSERT INTO `sys_user_department` VALUES (391, 10167, 343219378);
INSERT INTO `sys_user_department` VALUES (392, 10168, 343219378);
INSERT INTO `sys_user_department` VALUES (393, 10169, 343219378);
INSERT INTO `sys_user_department` VALUES (395, 10171, 343219378);
INSERT INTO `sys_user_department` VALUES (396, 10172, 343219378);
INSERT INTO `sys_user_department` VALUES (397, 10173, 343219378);
INSERT INTO `sys_user_department` VALUES (398, 10174, 343219378);
INSERT INTO `sys_user_department` VALUES (400, 10176, 343219378);
INSERT INTO `sys_user_department` VALUES (401, 10177, 343219378);
INSERT INTO `sys_user_department` VALUES (402, 10178, 343219378);
INSERT INTO `sys_user_department` VALUES (403, 10179, 343219378);
INSERT INTO `sys_user_department` VALUES (404, 10180, 343219378);
INSERT INTO `sys_user_department` VALUES (405, 10181, 343219378);
INSERT INTO `sys_user_department` VALUES (406, 10182, 343219378);
INSERT INTO `sys_user_department` VALUES (407, 10183, 343219378);
INSERT INTO `sys_user_department` VALUES (408, 10184, 343219378);
INSERT INTO `sys_user_department` VALUES (409, 10185, 343219378);
INSERT INTO `sys_user_department` VALUES (410, 10186, 343219378);
INSERT INTO `sys_user_department` VALUES (411, 10187, 343219378);
INSERT INTO `sys_user_department` VALUES (412, 10188, 343219378);
INSERT INTO `sys_user_department` VALUES (413, 10189, 343219378);
INSERT INTO `sys_user_department` VALUES (415, 10191, 343219378);
INSERT INTO `sys_user_department` VALUES (416, 10192, 343219378);
INSERT INTO `sys_user_department` VALUES (417, 10193, 342707837);
INSERT INTO `sys_user_department` VALUES (418, 10194, 342707837);
INSERT INTO `sys_user_department` VALUES (419, 10195, 342707837);
INSERT INTO `sys_user_department` VALUES (420, 10196, 342707837);
INSERT INTO `sys_user_department` VALUES (421, 10197, 342707837);
INSERT INTO `sys_user_department` VALUES (422, 10198, 342707837);
INSERT INTO `sys_user_department` VALUES (423, 10199, 342707837);
INSERT INTO `sys_user_department` VALUES (424, 10200, 342707837);
INSERT INTO `sys_user_department` VALUES (425, 10201, 342707837);
INSERT INTO `sys_user_department` VALUES (426, 10202, 342707837);
INSERT INTO `sys_user_department` VALUES (427, 10203, 342707837);
INSERT INTO `sys_user_department` VALUES (428, 10204, 342707837);
INSERT INTO `sys_user_department` VALUES (429, 10205, 342707837);
INSERT INTO `sys_user_department` VALUES (430, 10206, 342707837);
INSERT INTO `sys_user_department` VALUES (431, 10207, 342707837);
INSERT INTO `sys_user_department` VALUES (434, 10210, 342707837);
INSERT INTO `sys_user_department` VALUES (435, 10211, 342707837);
INSERT INTO `sys_user_department` VALUES (436, 10212, 342707837);
INSERT INTO `sys_user_department` VALUES (437, 10213, 342707837);
INSERT INTO `sys_user_department` VALUES (438, 10214, 342707837);
INSERT INTO `sys_user_department` VALUES (439, 10215, 342707837);
INSERT INTO `sys_user_department` VALUES (440, 10216, 342707837);
INSERT INTO `sys_user_department` VALUES (441, 10217, 342707837);
INSERT INTO `sys_user_department` VALUES (442, 10218, 342707837);
INSERT INTO `sys_user_department` VALUES (443, 10219, 342707837);
INSERT INTO `sys_user_department` VALUES (444, 10220, 342707837);
INSERT INTO `sys_user_department` VALUES (4455, 10221, 342707837);
INSERT INTO `sys_user_department` VALUES (446, 10222, 343176512);
INSERT INTO `sys_user_department` VALUES (447, 10223, 343176512);
INSERT INTO `sys_user_department` VALUES (448, 10224, 343176512);
INSERT INTO `sys_user_department` VALUES (449, 10225, 343176512);
INSERT INTO `sys_user_department` VALUES (450, 10226, 343176512);
INSERT INTO `sys_user_department` VALUES (451, 10227, 343176512);
INSERT INTO `sys_user_department` VALUES (452, 10228, 343176512);
INSERT INTO `sys_user_department` VALUES (453, 10229, 343176512);
INSERT INTO `sys_user_department` VALUES (454, 10230, 343176512);
INSERT INTO `sys_user_department` VALUES (455, 10231, 343176512);
INSERT INTO `sys_user_department` VALUES (456, 10232, 343176512);
INSERT INTO `sys_user_department` VALUES (457, 10233, 343176512);
INSERT INTO `sys_user_department` VALUES (458, 10234, 343176512);
INSERT INTO `sys_user_department` VALUES (459, 10235, 343176512);
INSERT INTO `sys_user_department` VALUES (460, 10236, 343176512);
INSERT INTO `sys_user_department` VALUES (461, 10237, 343176512);
INSERT INTO `sys_user_department` VALUES (462, 10238, 343176512);
INSERT INTO `sys_user_department` VALUES (463, 10239, 343176512);
INSERT INTO `sys_user_department` VALUES (464, 10240, 343176512);
INSERT INTO `sys_user_department` VALUES (465, 10241, 343176512);
INSERT INTO `sys_user_department` VALUES (466, 10242, 343176512);
INSERT INTO `sys_user_department` VALUES (467, 10243, 343176512);
INSERT INTO `sys_user_department` VALUES (468, 10244, 343176512);
INSERT INTO `sys_user_department` VALUES (469, 10245, 343176512);
INSERT INTO `sys_user_department` VALUES (470, 10246, 343176512);
INSERT INTO `sys_user_department` VALUES (471, 10247, 343176512);
INSERT INTO `sys_user_department` VALUES (472, 10248, 343176512);
INSERT INTO `sys_user_department` VALUES (473, 10249, 343176512);
INSERT INTO `sys_user_department` VALUES (474, 10250, 343176512);
INSERT INTO `sys_user_department` VALUES (475, 10251, 343176512);
INSERT INTO `sys_user_department` VALUES (476, 10252, 343176512);
INSERT INTO `sys_user_department` VALUES (477, 10253, 343176512);
INSERT INTO `sys_user_department` VALUES (478, 10254, 343176512);
INSERT INTO `sys_user_department` VALUES (479, 10255, 343176512);
INSERT INTO `sys_user_department` VALUES (480, 10256, 343176512);
INSERT INTO `sys_user_department` VALUES (481, 10257, 343176512);
INSERT INTO `sys_user_department` VALUES (482, 10258, 343176512);
INSERT INTO `sys_user_department` VALUES (483, 10259, 343176512);
INSERT INTO `sys_user_department` VALUES (484, 10260, 343176512);
INSERT INTO `sys_user_department` VALUES (485, 10261, 343176512);
INSERT INTO `sys_user_department` VALUES (486, 10262, 343176512);
INSERT INTO `sys_user_department` VALUES (488, 10264, 343176512);
INSERT INTO `sys_user_department` VALUES (489, 10265, 343176512);
INSERT INTO `sys_user_department` VALUES (490, 10266, 343176512);
INSERT INTO `sys_user_department` VALUES (491, 10267, 343176512);
INSERT INTO `sys_user_department` VALUES (492, 10268, 3431765125);
INSERT INTO `sys_user_department` VALUES (493, 10269, 343176512);
INSERT INTO `sys_user_department` VALUES (494, 10270, 343176512);
INSERT INTO `sys_user_department` VALUES (495, 10271, 3431765125);
INSERT INTO `sys_user_department` VALUES (496, 10272, 343176512);
INSERT INTO `sys_user_department` VALUES (498, 10274, 343176512);
INSERT INTO `sys_user_department` VALUES (4995, 10275, 343176512);
INSERT INTO `sys_user_department` VALUES (500, 10276, 343176512);
INSERT INTO `sys_user_department` VALUES (501, 10277, 343176512);
INSERT INTO `sys_user_department` VALUES (502, 10278, 343176512);
INSERT INTO `sys_user_department` VALUES (503, 10279, 343176512);
INSERT INTO `sys_user_department` VALUES (504, 10280, 343176512);
INSERT INTO `sys_user_department` VALUES (505, 10281, 343176512);
INSERT INTO `sys_user_department` VALUES (506, 10282, 342988764);
INSERT INTO `sys_user_department` VALUES (508, 10284, 342988764);
INSERT INTO `sys_user_department` VALUES (509, 10285, 342988764);
INSERT INTO `sys_user_department` VALUES (510, 10286, 342988764);
INSERT INTO `sys_user_department` VALUES (511, 10287, 342988764);
INSERT INTO `sys_user_department` VALUES (512, 10288, 342988764);
INSERT INTO `sys_user_department` VALUES (514, 10290, 342988764);
INSERT INTO `sys_user_department` VALUES (515, 10291, 342988764);
INSERT INTO `sys_user_department` VALUES (516, 10292, 342988764);
INSERT INTO `sys_user_department` VALUES (517, 10293, 342988764);
INSERT INTO `sys_user_department` VALUES (518, 10294, 342988764);
INSERT INTO `sys_user_department` VALUES (519, 10295, 342988764);
INSERT INTO `sys_user_department` VALUES (520, 10296, 342988764);
INSERT INTO `sys_user_department` VALUES (523, 10299, 342792845);
INSERT INTO `sys_user_department` VALUES (524, 10300, 342792845);
INSERT INTO `sys_user_department` VALUES (526, 10302, 342792845);
INSERT INTO `sys_user_department` VALUES (527, 10303, 342792845);
INSERT INTO `sys_user_department` VALUES (529, 10305, 342792845);
INSERT INTO `sys_user_department` VALUES (530, 10306, 342792845);
INSERT INTO `sys_user_department` VALUES (531, 10307, 342792845);
INSERT INTO `sys_user_department` VALUES (532, 10308, 342792845);
INSERT INTO `sys_user_department` VALUES (533, 10309, 342792845);
INSERT INTO `sys_user_department` VALUES (534, 10310, 342792845);
INSERT INTO `sys_user_department` VALUES (535, 10311, 342792845);
INSERT INTO `sys_user_department` VALUES (536, 10312, 342792845);
INSERT INTO `sys_user_department` VALUES (538, 10314, 342792845);
INSERT INTO `sys_user_department` VALUES (539, 10315, 3427928455);
INSERT INTO `sys_user_department` VALUES (540, 10316, 342792845);
INSERT INTO `sys_user_department` VALUES (541, 10317, 343048585);
INSERT INTO `sys_user_department` VALUES (542, 10318, 343048585);
INSERT INTO `sys_user_department` VALUES (543, 10319, 343048585);
INSERT INTO `sys_user_department` VALUES (544, 10320, 343048585);
INSERT INTO `sys_user_department` VALUES (545, 10321, 343048585);
INSERT INTO `sys_user_department` VALUES (546, 10322, 343048585);
INSERT INTO `sys_user_department` VALUES (547, 10323, 343048585);
INSERT INTO `sys_user_department` VALUES (548, 10324, 343048585);
INSERT INTO `sys_user_department` VALUES (549, 10325, 343048585);
INSERT INTO `sys_user_department` VALUES (551, 10327, 343048585);
INSERT INTO `sys_user_department` VALUES (552, 10328, 343048585);
INSERT INTO `sys_user_department` VALUES (553, 10329, 343048585);
INSERT INTO `sys_user_department` VALUES (555, 10331, 343048585);
INSERT INTO `sys_user_department` VALUES (556, 10332, 343048585);
INSERT INTO `sys_user_department` VALUES (557, 10333, 342783869);
INSERT INTO `sys_user_department` VALUES (558, 10334, 342783869);
INSERT INTO `sys_user_department` VALUES (559, 10335, 342783869);
INSERT INTO `sys_user_department` VALUES (560, 10336, 342783869);
INSERT INTO `sys_user_department` VALUES (561, 10337, 342783869);
INSERT INTO `sys_user_department` VALUES (563, 10339, 342783869);
INSERT INTO `sys_user_department` VALUES (564, 10340, 342783869);
INSERT INTO `sys_user_department` VALUES (565, 10341, 342783869);
INSERT INTO `sys_user_department` VALUES (567, 10343, 342783869);
INSERT INTO `sys_user_department` VALUES (568, 10344, 342783869);
INSERT INTO `sys_user_department` VALUES (569, 10345, 342783869);
INSERT INTO `sys_user_department` VALUES (570, 10346, 342783869);
INSERT INTO `sys_user_department` VALUES (571, 10347, 342783869);
INSERT INTO `sys_user_department` VALUES (572, 10348, 342783869);
INSERT INTO `sys_user_department` VALUES (573, 10349, 342783869);
INSERT INTO `sys_user_department` VALUES (574, 10350, 342783869);
INSERT INTO `sys_user_department` VALUES (575, 10351, 342783869);
INSERT INTO `sys_user_department` VALUES (576, 10352, 342783869);
INSERT INTO `sys_user_department` VALUES (577, 10353, 342783869);
INSERT INTO `sys_user_department` VALUES (578, 10354, 342783869);
INSERT INTO `sys_user_department` VALUES (579, 10355, 342783869);
INSERT INTO `sys_user_department` VALUES (580, 10356, 342783869);
INSERT INTO `sys_user_department` VALUES (581, 10357, 342783869);
INSERT INTO `sys_user_department` VALUES (582, 10358, 342783869);
INSERT INTO `sys_user_department` VALUES (583, 10359, 342783869);
INSERT INTO `sys_user_department` VALUES (584, 10360, 342783869);
INSERT INTO `sys_user_department` VALUES (585, 10361, 342783869);
INSERT INTO `sys_user_department` VALUES (586, 10362, 342783869);
INSERT INTO `sys_user_department` VALUES (587, 10363, 342783869);
INSERT INTO `sys_user_department` VALUES (588, 10364, 342783869);
INSERT INTO `sys_user_department` VALUES (589, 10365, 342783869);
INSERT INTO `sys_user_department` VALUES (590, 10366, 342783869);
INSERT INTO `sys_user_department` VALUES (591, 10367, 342909739);
INSERT INTO `sys_user_department` VALUES (592, 10368, 342909739);
INSERT INTO `sys_user_department` VALUES (593, 10369, 342909739);
INSERT INTO `sys_user_department` VALUES (594, 10370, 342909739);
INSERT INTO `sys_user_department` VALUES (595, 10371, 342909739);
INSERT INTO `sys_user_department` VALUES (597, 10373, 342909739);
INSERT INTO `sys_user_department` VALUES (599, 10375, 342909739);
INSERT INTO `sys_user_department` VALUES (600, 10376, 342909739);
INSERT INTO `sys_user_department` VALUES (601, 10377, 342909739);
INSERT INTO `sys_user_department` VALUES (602, 10378, 342909739);
INSERT INTO `sys_user_department` VALUES (603, 10379, 342909739);
INSERT INTO `sys_user_department` VALUES (604, 10380, 342909739);
INSERT INTO `sys_user_department` VALUES (605, 10381, 342909739);
INSERT INTO `sys_user_department` VALUES (606, 10382, 342909739);
INSERT INTO `sys_user_department` VALUES (607, 10383, 342909739);
INSERT INTO `sys_user_department` VALUES (608, 10384, 342909739);
INSERT INTO `sys_user_department` VALUES (609, 10385, 342909739);
INSERT INTO `sys_user_department` VALUES (610, 10386, 342909739);
INSERT INTO `sys_user_department` VALUES (611, 10387, 342909739);
INSERT INTO `sys_user_department` VALUES (612, 10388, 342909739);
INSERT INTO `sys_user_department` VALUES (613, 10389, 342909739);
INSERT INTO `sys_user_department` VALUES (614, 10390, 342909739);
INSERT INTO `sys_user_department` VALUES (615, 10391, 342909739);
INSERT INTO `sys_user_department` VALUES (616, 10392, 342909739);
INSERT INTO `sys_user_department` VALUES (617, 10393, 342909739);
INSERT INTO `sys_user_department` VALUES (618, 10394, 342909739);
INSERT INTO `sys_user_department` VALUES (619, 10395, 342909739);
INSERT INTO `sys_user_department` VALUES (620, 10396, 342909739);
INSERT INTO `sys_user_department` VALUES (621, 10397, 342909739);
INSERT INTO `sys_user_department` VALUES (622, 10398, 342909739);
INSERT INTO `sys_user_department` VALUES (623, 10399, 342909739);
INSERT INTO `sys_user_department` VALUES (624, 10400, 342909739);
INSERT INTO `sys_user_department` VALUES (625, 10401, 342909739);
INSERT INTO `sys_user_department` VALUES (626, 10402, 342909739);
INSERT INTO `sys_user_department` VALUES (627, 10403, 342909739);
INSERT INTO `sys_user_department` VALUES (628, 10404, 342909739);
INSERT INTO `sys_user_department` VALUES (629, 10405, 342909739);
INSERT INTO `sys_user_department` VALUES (630, 10407, 342909739);
INSERT INTO `sys_user_department` VALUES (631, 10408, 342909739);
INSERT INTO `sys_user_department` VALUES (632, 10409, 342909739);
INSERT INTO `sys_user_department` VALUES (633, 10410, 342909739);
INSERT INTO `sys_user_department` VALUES (634, 10411, 342909739);
INSERT INTO `sys_user_department` VALUES (635, 10412, 342909739);
INSERT INTO `sys_user_department` VALUES (636, 10413, 342909739);
INSERT INTO `sys_user_department` VALUES (637, 10414, 342909739);
INSERT INTO `sys_user_department` VALUES (638, 10415, 342909739);
INSERT INTO `sys_user_department` VALUES (639, 10416, 342909739);
INSERT INTO `sys_user_department` VALUES (640, 10417, 342909739);
INSERT INTO `sys_user_department` VALUES (641, 10418, 342909739);
INSERT INTO `sys_user_department` VALUES (644, 10421, 342863830);
INSERT INTO `sys_user_department` VALUES (645, 10422, 342863830);
INSERT INTO `sys_user_department` VALUES (646, 10423, 342863830);
INSERT INTO `sys_user_department` VALUES (647, 10424, 342863830);
INSERT INTO `sys_user_department` VALUES (648, 10425, 342863830);
INSERT INTO `sys_user_department` VALUES (649, 10426, 342863830);
INSERT INTO `sys_user_department` VALUES (650, 10427, 342863830);
INSERT INTO `sys_user_department` VALUES (651, 10428, 342863830);
INSERT INTO `sys_user_department` VALUES (652, 10429, 342863830);
INSERT INTO `sys_user_department` VALUES (653, 10430, 342863830);
INSERT INTO `sys_user_department` VALUES (654, 10431, 342863830);
INSERT INTO `sys_user_department` VALUES (655, 10432, 342863830);
INSERT INTO `sys_user_department` VALUES (656, 10433, 342863830);
INSERT INTO `sys_user_department` VALUES (657, 10434, 342863830);
INSERT INTO `sys_user_department` VALUES (658, 10435, 342863830);
INSERT INTO `sys_user_department` VALUES (659, 10436, 342863830);
INSERT INTO `sys_user_department` VALUES (660, 10437, 342863830);
INSERT INTO `sys_user_department` VALUES (663, 10438, 342863830);
INSERT INTO `sys_user_department` VALUES (664, 10439, 343087657);
INSERT INTO `sys_user_department` VALUES (665, 10440, 343087657);
INSERT INTO `sys_user_department` VALUES (666, 10441, 343087657);
INSERT INTO `sys_user_department` VALUES (667, 10442, 343087657);
INSERT INTO `sys_user_department` VALUES (668, 10443, 343087657);
INSERT INTO `sys_user_department` VALUES (669, 10444, 343087657);
INSERT INTO `sys_user_department` VALUES (670, 10445, 343087657);
INSERT INTO `sys_user_department` VALUES (671, 10446, 343087657);
INSERT INTO `sys_user_department` VALUES (672, 10447, 343087657);
INSERT INTO `sys_user_department` VALUES (673, 10448, 343087657);
INSERT INTO `sys_user_department` VALUES (674, 10449, 343087657);
INSERT INTO `sys_user_department` VALUES (675, 10330, 343048585);
INSERT INTO `sys_user_department` VALUES (676, 10330, 342627999);
INSERT INTO `sys_user_department` VALUES (677, 10450, 342627999);
INSERT INTO `sys_user_department` VALUES (679, 10452, 342627999);
INSERT INTO `sys_user_department` VALUES (680, 10453, 342627999);
INSERT INTO `sys_user_department` VALUES (681, 10454, 342627999);
INSERT INTO `sys_user_department` VALUES (684, 10457, 342678862);
INSERT INTO `sys_user_department` VALUES (705, 10478, 342942670);
INSERT INTO `sys_user_department` VALUES (718, 10491, 343090597);
INSERT INTO `sys_user_department` VALUES (720, 10493, 343159502);
INSERT INTO `sys_user_department` VALUES (722, 10495, 343159502);
INSERT INTO `sys_user_department` VALUES (734, 10283, 342988764);
INSERT INTO `sys_user_department` VALUES (735, 10283, 343402112);
INSERT INTO `sys_user_department` VALUES (736, 10297, 342988764);
INSERT INTO `sys_user_department` VALUES (737, 10297, 343402112);
INSERT INTO `sys_user_department` VALUES (738, 10298, 342988764);
INSERT INTO `sys_user_department` VALUES (739, 10298, 343402112);
INSERT INTO `sys_user_department` VALUES (740, 10032, 343073673);
INSERT INTO `sys_user_department` VALUES (741, 10032, 342863822);
INSERT INTO `sys_user_department` VALUES (742, 10032, 272894239);
INSERT INTO `sys_user_department` VALUES (749, 10504, 342932771);
INSERT INTO `sys_user_department` VALUES (750, 10505, 342932771);
INSERT INTO `sys_user_department` VALUES (751, 10506, 342932771);
INSERT INTO `sys_user_department` VALUES (752, 10507, 342932771);
INSERT INTO `sys_user_department` VALUES (753, 10508, 342932771);
INSERT INTO `sys_user_department` VALUES (756, 10509, 342992716);
INSERT INTO `sys_user_department` VALUES (757, 10510, 342992716);
INSERT INTO `sys_user_department` VALUES (758, 10511, 343014661);
INSERT INTO `sys_user_department` VALUES (759, 10459, 342678862);
INSERT INTO `sys_user_department` VALUES (760, 10459, 343253329);
INSERT INTO `sys_user_department` VALUES (761, 10512, 343253329);
INSERT INTO `sys_user_department` VALUES (762, 10513, 343253329);
INSERT INTO `sys_user_department` VALUES (763, 10514, 342865747);
INSERT INTO `sys_user_department` VALUES (764, 10515, 342865747);
INSERT INTO `sys_user_department` VALUES (766, 10517, 342865747);
INSERT INTO `sys_user_department` VALUES (767, 10518, 342865747);
INSERT INTO `sys_user_department` VALUES (768, 10519, 342865747);
INSERT INTO `sys_user_department` VALUES (769, 10520, 342865747);
INSERT INTO `sys_user_department` VALUES (770, 10521, 342865747);
INSERT INTO `sys_user_department` VALUES (771, 10522, 342865747);
INSERT INTO `sys_user_department` VALUES (772, 10523, 342865747);
INSERT INTO `sys_user_department` VALUES (773, 10524, 342865747);
INSERT INTO `sys_user_department` VALUES (774, 10111, 343404184);
INSERT INTO `sys_user_department` VALUES (778, 101101, 343404184);
INSERT INTO `sys_user_department` VALUES (783, 10467, 342864872);
INSERT INTO `sys_user_department` VALUES (784, 10467, 343404710);
INSERT INTO `sys_user_department` VALUES (785, 10468, 342864872);
INSERT INTO `sys_user_department` VALUES (786, 10468, 343404710);
INSERT INTO `sys_user_department` VALUES (787, 10469, 342864872);
INSERT INTO `sys_user_department` VALUES (788, 10469, 343404710);
INSERT INTO `sys_user_department` VALUES (789, 10470, 342864872);
INSERT INTO `sys_user_department` VALUES (790, 10470, 343404710);
INSERT INTO `sys_user_department` VALUES (791, 10471, 342864872);
INSERT INTO `sys_user_department` VALUES (792, 10471, 343404710);
INSERT INTO `sys_user_department` VALUES (793, 10472, 342864872);
INSERT INTO `sys_user_department` VALUES (794, 10472, 343404710);
INSERT INTO `sys_user_department` VALUES (795, 10473, 342864872);
INSERT INTO `sys_user_department` VALUES (796, 10473, 343404710);
INSERT INTO `sys_user_department` VALUES (797, 10474, 342864872);
INSERT INTO `sys_user_department` VALUES (798, 10474, 343404710);
INSERT INTO `sys_user_department` VALUES (799, 10475, 342864872);
INSERT INTO `sys_user_department` VALUES (800, 10475, 343404710);
INSERT INTO `sys_user_department` VALUES (801, 10496, 343159502);
INSERT INTO `sys_user_department` VALUES (802, 10496, 343404711);
INSERT INTO `sys_user_department` VALUES (803, 10313, 342792845);
INSERT INTO `sys_user_department` VALUES (804, 10313, 343404712);
INSERT INTO `sys_user_department` VALUES (805, 10124, 342795774);
INSERT INTO `sys_user_department` VALUES (806, 10124, 343404713);
INSERT INTO `sys_user_department` VALUES (807, 10482, 342980790);
INSERT INTO `sys_user_department` VALUES (808, 10482, 343404714);
INSERT INTO `sys_user_department` VALUES (809, 10483, 342980790);
INSERT INTO `sys_user_department` VALUES (810, 10483, 343404714);
INSERT INTO `sys_user_department` VALUES (816, 101123, 343404188);
INSERT INTO `sys_user_department` VALUES (817, 101123, 343404708);
INSERT INTO `sys_user_department` VALUES (820, 10263, 343176512);
INSERT INTO `sys_user_department` VALUES (829, 101117, 343404184);
INSERT INTO `sys_user_department` VALUES (837, 11111, 343404184);
INSERT INTO `sys_user_department` VALUES (838, 10501, 342863822);
INSERT INTO `sys_user_department` VALUES (839, 10501, 343073673);
INSERT INTO `sys_user_department` VALUES (840, 10144, 273480001);
INSERT INTO `sys_user_department` VALUES (841, 10144, 343073673);
INSERT INTO `sys_user_department` VALUES (852, 10112, 342795774);
INSERT INTO `sys_user_department` VALUES (853, 10112, 343404726);
INSERT INTO `sys_user_department` VALUES (864, 10117, 342795774);
INSERT INTO `sys_user_department` VALUES (865, 10117, 343404726);
INSERT INTO `sys_user_department` VALUES (870, 10120, 342795774);
INSERT INTO `sys_user_department` VALUES (871, 10120, 343404726);
INSERT INTO `sys_user_department` VALUES (872, 10121, 342795774);
INSERT INTO `sys_user_department` VALUES (873, 10121, 343404726);
INSERT INTO `sys_user_department` VALUES (874, 10122, 342795774);
INSERT INTO `sys_user_department` VALUES (875, 10122, 343404726);
INSERT INTO `sys_user_department` VALUES (876, 10123, 342795774);
INSERT INTO `sys_user_department` VALUES (877, 10123, 343404726);
INSERT INTO `sys_user_department` VALUES (881, 10126, 342795774);
INSERT INTO `sys_user_department` VALUES (882, 10126, 343404726);
INSERT INTO `sys_user_department` VALUES (883, 10127, 342795774);
INSERT INTO `sys_user_department` VALUES (884, 10127, 343404726);
INSERT INTO `sys_user_department` VALUES (887, 10516, 342865747);
INSERT INTO `sys_user_department` VALUES (888, 10516, 342627999);
INSERT INTO `sys_user_department` VALUES (889, 10489, 343090597);
INSERT INTO `sys_user_department` VALUES (890, 10489, 343404727);
INSERT INTO `sys_user_department` VALUES (891, 10490, 343090597);
INSERT INTO `sys_user_department` VALUES (892, 10490, 343404727);
INSERT INTO `sys_user_department` VALUES (895, 10143, 273480001);
INSERT INTO `sys_user_department` VALUES (896, 10143, 343404727);
INSERT INTO `sys_user_department` VALUES (897, 10170, 343219378);
INSERT INTO `sys_user_department` VALUES (898, 10170, 342932771);
INSERT INTO `sys_user_department` VALUES (899, 10420, 342909739);
INSERT INTO `sys_user_department` VALUES (900, 10420, 343253329);
INSERT INTO `sys_user_department` VALUES (901, 10130, 273480001);
INSERT INTO `sys_user_department` VALUES (902, 10130, 342865747);
INSERT INTO `sys_user_department` VALUES (903, 10145, 273480001);
INSERT INTO `sys_user_department` VALUES (904, 10145, 342865747);
INSERT INTO `sys_user_department` VALUES (905, 101130, 343014661);
INSERT INTO `sys_user_department` VALUES (907, 11123, 2);
INSERT INTO `sys_user_department` VALUES (908, 10480, 342969636);
INSERT INTO `sys_user_department` VALUES (909, 10480, 343219378);
INSERT INTO `sys_user_department` VALUES (910, 10209, 342707837);
INSERT INTO `sys_user_department` VALUES (911, 10209, 343219378);
INSERT INTO `sys_user_department` VALUES (912, 10087, 2);
INSERT INTO `sys_user_department` VALUES (913, 10087, 342832847);
INSERT INTO `sys_user_department` VALUES (914, 10155, 342832847);
INSERT INTO `sys_user_department` VALUES (915, 10155, 342988764);
INSERT INTO `sys_user_department` VALUES (916, 10289, 342988764);
INSERT INTO `sys_user_department` VALUES (917, 10289, 343087657);
INSERT INTO `sys_user_department` VALUES (918, 10101, 2);
INSERT INTO `sys_user_department` VALUES (919, 10101, 342863830);
INSERT INTO `sys_user_department` VALUES (920, 10494, 343159502);
INSERT INTO `sys_user_department` VALUES (921, 10494, 343404711);
INSERT INTO `sys_user_department` VALUES (922, 10466, 342840788);
INSERT INTO `sys_user_department` VALUES (923, 10466, 343404711);
INSERT INTO `sys_user_department` VALUES (924, 10456, 342678862);
INSERT INTO `sys_user_department` VALUES (925, 10456, 343404712);
INSERT INTO `sys_user_department` VALUES (926, 10465, 342840788);
INSERT INTO `sys_user_department` VALUES (927, 10465, 343404713);
INSERT INTO `sys_user_department` VALUES (928, 10497, 343176517);
INSERT INTO `sys_user_department` VALUES (929, 10497, 343404728);
INSERT INTO `sys_user_department` VALUES (930, 10460, 342689912);
INSERT INTO `sys_user_department` VALUES (931, 10460, 343404729);
INSERT INTO `sys_user_department` VALUES (932, 10484, 342980790);
INSERT INTO `sys_user_department` VALUES (933, 10484, 343404714);
INSERT INTO `sys_user_department` VALUES (934, 10484, 343404729);
INSERT INTO `sys_user_department` VALUES (935, 10464, 342701774);
INSERT INTO `sys_user_department` VALUES (936, 10464, 343404730);
INSERT INTO `sys_user_department` VALUES (937, 10463, 342701774);
INSERT INTO `sys_user_department` VALUES (938, 10463, 343404730);
INSERT INTO `sys_user_department` VALUES (939, 10476, 342942670);
INSERT INTO `sys_user_department` VALUES (940, 10476, 343404731);
INSERT INTO `sys_user_department` VALUES (941, 10477, 342942670);
INSERT INTO `sys_user_department` VALUES (942, 10477, 343404731);
INSERT INTO `sys_user_department` VALUES (943, 10162, 342832847);
INSERT INTO `sys_user_department` VALUES (944, 10162, 343404714);
INSERT INTO `sys_user_department` VALUES (945, 10485, 343056577);
INSERT INTO `sys_user_department` VALUES (946, 10485, 343404732);
INSERT INTO `sys_user_department` VALUES (947, 10486, 343056577);
INSERT INTO `sys_user_department` VALUES (948, 10486, 343404732);
INSERT INTO `sys_user_department` VALUES (949, 10461, 342689912);
INSERT INTO `sys_user_department` VALUES (950, 10461, 343404732);
INSERT INTO `sys_user_department` VALUES (951, 10498, 343176517);
INSERT INTO `sys_user_department` VALUES (952, 10498, 343404733);
INSERT INTO `sys_user_department` VALUES (953, 10479, 342942670);
INSERT INTO `sys_user_department` VALUES (954, 10479, 343404734);
INSERT INTO `sys_user_department` VALUES (955, 10481, 342969636);
INSERT INTO `sys_user_department` VALUES (956, 10481, 343404736);
INSERT INTO `sys_user_department` VALUES (957, 10455, 342678862);
INSERT INTO `sys_user_department` VALUES (958, 10455, 343404737);
INSERT INTO `sys_user_department` VALUES (959, 10458, 342678862);
INSERT INTO `sys_user_department` VALUES (960, 10458, 343404737);
INSERT INTO `sys_user_department` VALUES (961, 10338, 342783869);
INSERT INTO `sys_user_department` VALUES (962, 10338, 343404738);
INSERT INTO `sys_user_department` VALUES (963, 10500, 343176517);
INSERT INTO `sys_user_department` VALUES (964, 10500, 343404738);
INSERT INTO `sys_user_department` VALUES (965, 10462, 342701774);
INSERT INTO `sys_user_department` VALUES (966, 10462, 343404739);
INSERT INTO `sys_user_department` VALUES (967, 10273, 343176512);
INSERT INTO `sys_user_department` VALUES (968, 10273, 343404739);
INSERT INTO `sys_user_department` VALUES (969, 10492, 343090597);
INSERT INTO `sys_user_department` VALUES (970, 10492, 343404727);
INSERT INTO `sys_user_department` VALUES (971, 10492, 343404739);
INSERT INTO `sys_user_department` VALUES (972, 10208, 342707837);
INSERT INTO `sys_user_department` VALUES (973, 10208, 343404740);
INSERT INTO `sys_user_department` VALUES (974, 10488, 343056577);
INSERT INTO `sys_user_department` VALUES (975, 10488, 343404740);
INSERT INTO `sys_user_department` VALUES (976, 10419, 342909739);
INSERT INTO `sys_user_department` VALUES (977, 10419, 343404741);
INSERT INTO `sys_user_department` VALUES (978, 10374, 342909739);
INSERT INTO `sys_user_department` VALUES (979, 10374, 343404741);
INSERT INTO `sys_user_department` VALUES (980, 10372, 342909739);
INSERT INTO `sys_user_department` VALUES (981, 10372, 343404741);
INSERT INTO `sys_user_department` VALUES (982, 101131, 343087657);
INSERT INTO `sys_user_department` VALUES (983, 101132, 343087657);
INSERT INTO `sys_user_department` VALUES (984, 101133, 343087657);
INSERT INTO `sys_user_department` VALUES (985, 101134, 342863830);
INSERT INTO `sys_user_department` VALUES (986, 101135, 343404728);
INSERT INTO `sys_user_department` VALUES (987, 101136, 343404733);
INSERT INTO `sys_user_department` VALUES (992, 101141, 343404734);
INSERT INTO `sys_user_department` VALUES (993, 101142, 343404735);
INSERT INTO `sys_user_department` VALUES (994, 101143, 343404736);
INSERT INTO `sys_user_department` VALUES (995, 101144, 343404708);
INSERT INTO `sys_user_department` VALUES (996, 10088, 2);
INSERT INTO `sys_user_department` VALUES (997, 10088, 342707837);
INSERT INTO `sys_user_department` VALUES (998, 10071, 2);
INSERT INTO `sys_user_department` VALUES (999, 10071, 342707837);
INSERT INTO `sys_user_department` VALUES (1000, 10103, 2);
INSERT INTO `sys_user_department` VALUES (1001, 10103, 342707837);
INSERT INTO `sys_user_department` VALUES (1002, 10105, 2);
INSERT INTO `sys_user_department` VALUES (1003, 10105, 342707837);
INSERT INTO `sys_user_department` VALUES (1004, 10104, 2);
INSERT INTO `sys_user_department` VALUES (1005, 10104, 342707837);
INSERT INTO `sys_user_department` VALUES (1006, 10106, 2);
INSERT INTO `sys_user_department` VALUES (1007, 10106, 342707837);
INSERT INTO `sys_user_department` VALUES (1008, 10077, 2);
INSERT INTO `sys_user_department` VALUES (1009, 10077, 343048585);
INSERT INTO `sys_user_department` VALUES (1010, 10190, 343219378);
INSERT INTO `sys_user_department` VALUES (1011, 10190, 342909739);
INSERT INTO `sys_user_department` VALUES (1012, 101127, 2);
INSERT INTO `sys_user_department` VALUES (1013, 101127, 342909739);
INSERT INTO `sys_user_department` VALUES (1014, 10301, 342792845);
INSERT INTO `sys_user_department` VALUES (1015, 10301, 343404742);
INSERT INTO `sys_user_department` VALUES (1016, 10304, 342792845);
INSERT INTO `sys_user_department` VALUES (1017, 10304, 343404742);
INSERT INTO `sys_user_department` VALUES (1018, 10116, 342795774);
INSERT INTO `sys_user_department` VALUES (1019, 10116, 342992716);
INSERT INTO `sys_user_department` VALUES (1020, 10116, 343404726);
INSERT INTO `sys_user_department` VALUES (1021, 10116, 343404743);
INSERT INTO `sys_user_department` VALUES (1022, 10114, 342795774);
INSERT INTO `sys_user_department` VALUES (1023, 10114, 343404164);
INSERT INTO `sys_user_department` VALUES (1024, 10114, 343404726);
INSERT INTO `sys_user_department` VALUES (1025, 10114, 343404743);
INSERT INTO `sys_user_department` VALUES (1026, 10115, 342795774);
INSERT INTO `sys_user_department` VALUES (1027, 10115, 343404726);
INSERT INTO `sys_user_department` VALUES (1028, 10115, 343404743);
INSERT INTO `sys_user_department` VALUES (1029, 10342, 342783869);
INSERT INTO `sys_user_department` VALUES (1030, 10342, 343404726);
INSERT INTO `sys_user_department` VALUES (1031, 10342, 343404743);
INSERT INTO `sys_user_department` VALUES (1032, 10113, 342795774);
INSERT INTO `sys_user_department` VALUES (1033, 10113, 343404726);
INSERT INTO `sys_user_department` VALUES (1034, 10113, 343404743);
INSERT INTO `sys_user_department` VALUES (1035, 10125, 342795774);
INSERT INTO `sys_user_department` VALUES (1036, 10125, 342863830);
INSERT INTO `sys_user_department` VALUES (1037, 10125, 343404726);
INSERT INTO `sys_user_department` VALUES (1038, 10125, 343404743);
INSERT INTO `sys_user_department` VALUES (1039, 10119, 342795774);
INSERT INTO `sys_user_department` VALUES (1040, 10119, 343404726);
INSERT INTO `sys_user_department` VALUES (1041, 10119, 343404743);
INSERT INTO `sys_user_department` VALUES (1042, 10118, 342795774);
INSERT INTO `sys_user_department` VALUES (1043, 10118, 343404726);
INSERT INTO `sys_user_department` VALUES (1044, 10118, 343404743);
INSERT INTO `sys_user_department` VALUES (1045, 10093, 2);
INSERT INTO `sys_user_department` VALUES (1046, 10093, 343176512);
INSERT INTO `sys_user_department` VALUES (1047, 10097, 2);
INSERT INTO `sys_user_department` VALUES (1048, 10097, 343176512);
INSERT INTO `sys_user_department` VALUES (1049, 10102, 2);
INSERT INTO `sys_user_department` VALUES (1050, 10102, 342783869);
INSERT INTO `sys_user_department` VALUES (1051, 10108, 2);
INSERT INTO `sys_user_department` VALUES (1052, 10108, 342783869);
INSERT INTO `sys_user_department` VALUES (1053, 10084, 2);
INSERT INTO `sys_user_department` VALUES (1054, 10084, 342783869);
INSERT INTO `sys_user_department` VALUES (1055, 10089, 2);
INSERT INTO `sys_user_department` VALUES (1056, 10089, 342783869);
INSERT INTO `sys_user_department` VALUES (1057, 10487, 343056577);
INSERT INTO `sys_user_department` VALUES (1058, 10487, 342783869);
INSERT INTO `sys_user_department` VALUES (1059, 10326, 343048585);
INSERT INTO `sys_user_department` VALUES (1060, 10326, 342783869);
INSERT INTO `sys_user_department` VALUES (1061, 10499, 343176517);
INSERT INTO `sys_user_department` VALUES (1062, 10499, 342783869);
INSERT INTO `sys_user_department` VALUES (1063, 101145, 342988764);
INSERT INTO `sys_user_department` VALUES (1064, 101146, 342909739);
INSERT INTO `sys_user_department` VALUES (1065, 101147, 342909739);
INSERT INTO `sys_user_department` VALUES (1066, 101148, 342909739);
INSERT INTO `sys_user_department` VALUES (1067, 101149, 342909739);
INSERT INTO `sys_user_department` VALUES (1068, 101150, 342909739);
INSERT INTO `sys_user_department` VALUES (1069, 10175, 343219378);
INSERT INTO `sys_user_department` VALUES (1070, 10175, 342932771);
INSERT INTO `sys_user_department` VALUES (1071, 101140, 343404184);
INSERT INTO `sys_user_department` VALUES (1073, 101138, 343404184);
INSERT INTO `sys_user_department` VALUES (1075, 10133, 273480001);
INSERT INTO `sys_user_department` VALUES (1076, 10133, 343404744);
INSERT INTO `sys_user_department` VALUES (1077, 10085, 2);
INSERT INTO `sys_user_department` VALUES (1078, 10085, 343404744);
INSERT INTO `sys_user_department` VALUES (1079, 10040, 2);
INSERT INTO `sys_user_department` VALUES (1080, 10040, 343404744);
INSERT INTO `sys_user_department` VALUES (1081, 10034, 2);
INSERT INTO `sys_user_department` VALUES (1082, 10034, 343404744);
INSERT INTO `sys_user_department` VALUES (1083, 10100, 2);
INSERT INTO `sys_user_department` VALUES (1084, 10100, 343404744);
INSERT INTO `sys_user_department` VALUES (1085, 10035, 2);
INSERT INTO `sys_user_department` VALUES (1086, 10035, 343404744);
INSERT INTO `sys_user_department` VALUES (1087, 10036, 2);
INSERT INTO `sys_user_department` VALUES (1088, 10036, 343404744);
INSERT INTO `sys_user_department` VALUES (1089, 10037, 2);
INSERT INTO `sys_user_department` VALUES (1090, 10037, 343404744);
INSERT INTO `sys_user_department` VALUES (1091, 10038, 2);
INSERT INTO `sys_user_department` VALUES (1092, 10038, 343404744);
INSERT INTO `sys_user_department` VALUES (1093, 10039, 2);
INSERT INTO `sys_user_department` VALUES (1094, 10039, 343404744);
INSERT INTO `sys_user_department` VALUES (1095, 10042, 2);
INSERT INTO `sys_user_department` VALUES (1096, 10042, 343404744);
INSERT INTO `sys_user_department` VALUES (1097, 10041, 2);
INSERT INTO `sys_user_department` VALUES (1098, 10041, 343404744);
INSERT INTO `sys_user_department` VALUES (1099, 10503, 343404164);
INSERT INTO `sys_user_department` VALUES (1100, 10503, 273480001);
INSERT INTO `sys_user_department` VALUES (1101, 101151, 342783869);
INSERT INTO `sys_user_department` VALUES (1102, 11132, 343404708);
INSERT INTO `sys_user_department` VALUES (1103, 11132, 343404168);
INSERT INTO `sys_user_department` VALUES (1104, 101152, 343073673);
INSERT INTO `sys_user_department` VALUES (1105, 101153, 343219378);
INSERT INTO `sys_user_department` VALUES (1106, 101154, 343219378);
INSERT INTO `sys_user_department` VALUES (1107, 101155, 343219378);
INSERT INTO `sys_user_department` VALUES (1108, 101156, 343219378);
INSERT INTO `sys_user_department` VALUES (1109, 101157, 342832847);
INSERT INTO `sys_user_department` VALUES (1110, 101158, 343176512);
INSERT INTO `sys_user_department` VALUES (1111, 101159, 343176512);
INSERT INTO `sys_user_department` VALUES (1112, 101160, 343176512);
INSERT INTO `sys_user_department` VALUES (1113, 101161, 343176512);
INSERT INTO `sys_user_department` VALUES (1114, 101162, 342783869);
INSERT INTO `sys_user_department` VALUES (1115, 101163, 342783869);
INSERT INTO `sys_user_department` VALUES (1116, 101164, 342783869);
INSERT INTO `sys_user_department` VALUES (1117, 101165, 342988764);
INSERT INTO `sys_user_department` VALUES (1118, 101166, 342988764);
INSERT INTO `sys_user_department` VALUES (1119, 101167, 342988764);
INSERT INTO `sys_user_department` VALUES (1120, 101168, 343087657);
INSERT INTO `sys_user_department` VALUES (1140, 10031, 343073673);
INSERT INTO `sys_user_department` VALUES (1141, 10031, 342863822);
INSERT INTO `sys_user_department` VALUES (1142, 10031, 272894239);
INSERT INTO `sys_user_department` VALUES (1143, 10031, 343404725);
INSERT INTO `sys_user_department` VALUES (1144, 10028, 343073673);
INSERT INTO `sys_user_department` VALUES (1145, 10014, 343073673);
INSERT INTO `sys_user_department` VALUES (1146, 10015, 343073673);
INSERT INTO `sys_user_department` VALUES (1147, 10024, 343073673);
INSERT INTO `sys_user_department` VALUES (1148, 10026, 343073673);
INSERT INTO `sys_user_department` VALUES (1149, 10020, 343073673);
INSERT INTO `sys_user_department` VALUES (1150, 10017, 343073673);
INSERT INTO `sys_user_department` VALUES (1151, 10023, 343073673);
INSERT INTO `sys_user_department` VALUES (1152, 10023, 343404725);
INSERT INTO `sys_user_department` VALUES (1156, 10016, 343073673);
INSERT INTO `sys_user_department` VALUES (1157, 10016, 343404725);
INSERT INTO `sys_user_department` VALUES (1158, 10502, 342863822);
INSERT INTO `sys_user_department` VALUES (1159, 10502, 343404725);
INSERT INTO `sys_user_department` VALUES (1160, 10033, 343073673);
INSERT INTO `sys_user_department` VALUES (1161, 10033, 342863822);
INSERT INTO `sys_user_department` VALUES (1162, 10033, 272894239);
INSERT INTO `sys_user_department` VALUES (1163, 10021, 343073673);
INSERT INTO `sys_user_department` VALUES (1164, 10027, 343073673);
INSERT INTO `sys_user_department` VALUES (1165, 10029, 343073673);
INSERT INTO `sys_user_department` VALUES (1166, 10011, 343073673);
INSERT INTO `sys_user_department` VALUES (1167, 10013, 343073673);
INSERT INTO `sys_user_department` VALUES (1168, 10012, 343073673);
INSERT INTO `sys_user_department` VALUES (1169, 11112, 343404168);
INSERT INTO `sys_user_department` VALUES (1171, 10009, 343073673);
INSERT INTO `sys_user_department` VALUES (1172, 101137, 343404184);
INSERT INTO `sys_user_department` VALUES (1176, 101179, 343219378);
INSERT INTO `sys_user_department` VALUES (1177, 101170, 342909739);
INSERT INTO `sys_user_department` VALUES (1178, 101171, 342909739);
INSERT INTO `sys_user_department` VALUES (1179, 101172, 342909739);
INSERT INTO `sys_user_department` VALUES (1180, 101173, 342909739);
INSERT INTO `sys_user_department` VALUES (1181, 101174, 342909739);
INSERT INTO `sys_user_department` VALUES (1182, 101175, 342909739);
INSERT INTO `sys_user_department` VALUES (1183, 101176, 342909739);
INSERT INTO `sys_user_department` VALUES (1184, 10067, 2);
INSERT INTO `sys_user_department` VALUES (1185, 10067, 342909739);
INSERT INTO `sys_user_department` VALUES (1186, 10065, 2);
INSERT INTO `sys_user_department` VALUES (1187, 10065, 342909739);
INSERT INTO `sys_user_department` VALUES (1188, 10060, 2);
INSERT INTO `sys_user_department` VALUES (1189, 10060, 342909739);
INSERT INTO `sys_user_department` VALUES (1190, 10069, 2);
INSERT INTO `sys_user_department` VALUES (1191, 10069, 342909739);
INSERT INTO `sys_user_department` VALUES (1192, 10057, 2);
INSERT INTO `sys_user_department` VALUES (1193, 10057, 342909739);
INSERT INTO `sys_user_department` VALUES (1194, 10086, 2);
INSERT INTO `sys_user_department` VALUES (1195, 10086, 342909739);
INSERT INTO `sys_user_department` VALUES (1196, 10056, 2);
INSERT INTO `sys_user_department` VALUES (1197, 10056, 342909739);
INSERT INTO `sys_user_department` VALUES (1198, 101180, 342909739);
INSERT INTO `sys_user_department` VALUES (1199, 10064, 2);
INSERT INTO `sys_user_department` VALUES (1200, 10064, 342909739);
INSERT INTO `sys_user_department` VALUES (1201, 101181, 342909739);
INSERT INTO `sys_user_department` VALUES (1202, 101177, 343404741);
INSERT INTO `sys_user_department` VALUES (1208, 101169, 343404168);
INSERT INTO `sys_user_department` VALUES (1212, 11128, 343404168);
INSERT INTO `sys_user_department` VALUES (1213, 101185, 343073673);
INSERT INTO `sys_user_department` VALUES (1214, 101186, 343219378);
INSERT INTO `sys_user_department` VALUES (1216, 101139, 343404184);
INSERT INTO `sys_user_department` VALUES (1218, 101100, 343404184);
INSERT INTO `sys_user_department` VALUES (1222, 11140, 343404708);
INSERT INTO `sys_user_department` VALUES (1223, 11140, 343404188);
INSERT INTO `sys_user_department` VALUES (1224, 11140, 343404168);
INSERT INTO `sys_user_department` VALUES (1227, 10110, 343404184);
INSERT INTO `sys_user_department` VALUES (1232, 101191, 343176512);
INSERT INTO `sys_user_department` VALUES (1233, 101192, 343402112);
INSERT INTO `sys_user_department` VALUES (1234, 101193, 342863830);
INSERT INTO `sys_user_department` VALUES (1239, 101196, 343404184);
INSERT INTO `sys_user_department` VALUES (1240, 1, 343404188);
INSERT INTO `sys_user_department` VALUES (1241, 10451, 2);
INSERT INTO `sys_user_department` VALUES (1242, 10451, 342627999);
INSERT INTO `sys_user_department` VALUES (1243, 10095, 2);
INSERT INTO `sys_user_department` VALUES (1244, 10095, 343176512);
INSERT INTO `sys_user_department` VALUES (1245, 11139, 343404708);
INSERT INTO `sys_user_department` VALUES (1246, 101197, 343404188);
INSERT INTO `sys_user_department` VALUES (NULL, 11130, 2);

-- ----------------------------
-- Table structure for sys_user_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_project`;
CREATE TABLE `sys_user_project`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `project_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_project
-- ----------------------------
INSERT INTO `sys_user_project` VALUES (193, 101102, 5);
INSERT INTO `sys_user_project` VALUES (197, 101103, 7);
INSERT INTO `sys_user_project` VALUES (198, 101103, 8);
INSERT INTO `sys_user_project` VALUES (199, 101103, 9);
INSERT INTO `sys_user_project` VALUES (202, 10111, 5);
INSERT INTO `sys_user_project` VALUES (205, 101104, 6);
INSERT INTO `sys_user_project` VALUES (206, 101104, 11);
INSERT INTO `sys_user_project` VALUES (227, 101107, 10);
INSERT INTO `sys_user_project` VALUES (241, 0, 5);
INSERT INTO `sys_user_project` VALUES (243, 101108, 10);
INSERT INTO `sys_user_project` VALUES (247, 101109, 9);
INSERT INTO `sys_user_project` VALUES (248, 101109, 8);
INSERT INTO `sys_user_project` VALUES (249, 101109, 7);
INSERT INTO `sys_user_project` VALUES (266, 101110, 9);
INSERT INTO `sys_user_project` VALUES (267, 101110, 8);
INSERT INTO `sys_user_project` VALUES (272, 101111, 10);
INSERT INTO `sys_user_project` VALUES (273, 101112, 10);
INSERT INTO `sys_user_project` VALUES (278, 101114, 9);
INSERT INTO `sys_user_project` VALUES (279, 101114, 8);
INSERT INTO `sys_user_project` VALUES (291, 101106, 7);
INSERT INTO `sys_user_project` VALUES (292, 101106, 9);
INSERT INTO `sys_user_project` VALUES (293, 101106, 8);
INSERT INTO `sys_user_project` VALUES (294, 101106, 10);
INSERT INTO `sys_user_project` VALUES (302, 11131, 7);
INSERT INTO `sys_user_project` VALUES (310, 101101, 5);
INSERT INTO `sys_user_project` VALUES (311, 101101, 6);
INSERT INTO `sys_user_project` VALUES (312, 101101, 7);
INSERT INTO `sys_user_project` VALUES (313, 101101, 8);
INSERT INTO `sys_user_project` VALUES (314, 101101, 9);
INSERT INTO `sys_user_project` VALUES (315, 101101, 10);
INSERT INTO `sys_user_project` VALUES (316, 101101, 11);
INSERT INTO `sys_user_project` VALUES (317, 11129, 5);
INSERT INTO `sys_user_project` VALUES (318, 11129, 6);
INSERT INTO `sys_user_project` VALUES (319, 11129, 7);
INSERT INTO `sys_user_project` VALUES (320, 11129, 8);
INSERT INTO `sys_user_project` VALUES (321, 11129, 9);
INSERT INTO `sys_user_project` VALUES (322, 11129, 10);
INSERT INTO `sys_user_project` VALUES (323, 11129, 11);
INSERT INTO `sys_user_project` VALUES (332, 10109, 5);
INSERT INTO `sys_user_project` VALUES (333, 10109, 6);
INSERT INTO `sys_user_project` VALUES (338, 101116, 5);
INSERT INTO `sys_user_project` VALUES (339, 101116, 7);
INSERT INTO `sys_user_project` VALUES (359, 101118, 5);
INSERT INTO `sys_user_project` VALUES (360, 101118, 6);
INSERT INTO `sys_user_project` VALUES (361, 101118, 7);
INSERT INTO `sys_user_project` VALUES (362, 101118, 8);
INSERT INTO `sys_user_project` VALUES (363, 101118, 9);
INSERT INTO `sys_user_project` VALUES (364, 101118, 10);
INSERT INTO `sys_user_project` VALUES (365, 101118, 11);
INSERT INTO `sys_user_project` VALUES (366, 101119, 5);
INSERT INTO `sys_user_project` VALUES (367, 101119, 6);
INSERT INTO `sys_user_project` VALUES (368, 101119, 7);
INSERT INTO `sys_user_project` VALUES (369, 101119, 8);
INSERT INTO `sys_user_project` VALUES (370, 101119, 9);
INSERT INTO `sys_user_project` VALUES (371, 101119, 10);
INSERT INTO `sys_user_project` VALUES (372, 101119, 11);
INSERT INTO `sys_user_project` VALUES (373, 101120, 5);
INSERT INTO `sys_user_project` VALUES (374, 101120, 6);
INSERT INTO `sys_user_project` VALUES (375, 101120, 7);
INSERT INTO `sys_user_project` VALUES (376, 101120, 8);
INSERT INTO `sys_user_project` VALUES (377, 101120, 9);
INSERT INTO `sys_user_project` VALUES (378, 101120, 10);
INSERT INTO `sys_user_project` VALUES (379, 101120, 11);
INSERT INTO `sys_user_project` VALUES (380, 101121, 5);
INSERT INTO `sys_user_project` VALUES (381, 101121, 6);
INSERT INTO `sys_user_project` VALUES (382, 101121, 7);
INSERT INTO `sys_user_project` VALUES (383, 101121, 8);
INSERT INTO `sys_user_project` VALUES (384, 101121, 9);
INSERT INTO `sys_user_project` VALUES (385, 101121, 10);
INSERT INTO `sys_user_project` VALUES (386, 101121, 11);
INSERT INTO `sys_user_project` VALUES (387, 101122, 5);
INSERT INTO `sys_user_project` VALUES (388, 101122, 6);
INSERT INTO `sys_user_project` VALUES (393, 10133, 5);
INSERT INTO `sys_user_project` VALUES (394, 10133, 10);
INSERT INTO `sys_user_project` VALUES (395, 10133, 6);
INSERT INTO `sys_user_project` VALUES (396, 10133, 11);
INSERT INTO `sys_user_project` VALUES (397, 10133, 7);
INSERT INTO `sys_user_project` VALUES (398, 10133, 8);
INSERT INTO `sys_user_project` VALUES (399, 10133, 9);
INSERT INTO `sys_user_project` VALUES (403, 101126, 5);
INSERT INTO `sys_user_project` VALUES (404, 101126, 6);
INSERT INTO `sys_user_project` VALUES (408, 101123, 6);
INSERT INTO `sys_user_project` VALUES (409, 101123, 7);
INSERT INTO `sys_user_project` VALUES (410, 101123, 9);
INSERT INTO `sys_user_project` VALUES (411, 101123, 10);
INSERT INTO `sys_user_project` VALUES (412, 101123, 8);
INSERT INTO `sys_user_project` VALUES (413, 101123, 21);
INSERT INTO `sys_user_project` VALUES (414, 101127, 5);
INSERT INTO `sys_user_project` VALUES (415, 10263, 5);
INSERT INTO `sys_user_project` VALUES (416, 10069, 5);
INSERT INTO `sys_user_project` VALUES (417, 10069, 6);
INSERT INTO `sys_user_project` VALUES (418, 10069, 7);
INSERT INTO `sys_user_project` VALUES (419, 10069, 8);
INSERT INTO `sys_user_project` VALUES (420, 10069, 9);
INSERT INTO `sys_user_project` VALUES (421, 10069, 10);
INSERT INTO `sys_user_project` VALUES (422, 10069, 11);
INSERT INTO `sys_user_project` VALUES (458, 101117, 9);
INSERT INTO `sys_user_project` VALUES (459, 101117, 8);
INSERT INTO `sys_user_project` VALUES (460, 101117, 7);
INSERT INTO `sys_user_project` VALUES (461, 101128, 5);
INSERT INTO `sys_user_project` VALUES (462, 101128, 6);
INSERT INTO `sys_user_project` VALUES (463, 101128, 7);
INSERT INTO `sys_user_project` VALUES (464, 101128, 8);
INSERT INTO `sys_user_project` VALUES (465, 101128, 9);
INSERT INTO `sys_user_project` VALUES (466, 101128, 10);
INSERT INTO `sys_user_project` VALUES (467, 101128, 11);
INSERT INTO `sys_user_project` VALUES (496, 101129, 5);
INSERT INTO `sys_user_project` VALUES (497, 101129, 6);
INSERT INTO `sys_user_project` VALUES (498, 101129, 7);
INSERT INTO `sys_user_project` VALUES (499, 101129, 8);
INSERT INTO `sys_user_project` VALUES (500, 101129, 9);
INSERT INTO `sys_user_project` VALUES (501, 101129, 10);
INSERT INTO `sys_user_project` VALUES (502, 101129, 11);
INSERT INTO `sys_user_project` VALUES (524, 11123, 5);
INSERT INTO `sys_user_project` VALUES (525, 11123, 6);
INSERT INTO `sys_user_project` VALUES (526, 11123, 7);
INSERT INTO `sys_user_project` VALUES (527, 11123, 8);
INSERT INTO `sys_user_project` VALUES (528, 11123, 9);
INSERT INTO `sys_user_project` VALUES (529, 11123, 10);
INSERT INTO `sys_user_project` VALUES (530, 11123, 11);
INSERT INTO `sys_user_project` VALUES (531, 101144, 6);
INSERT INTO `sys_user_project` VALUES (532, 101140, 5);
INSERT INTO `sys_user_project` VALUES (533, 101140, 6);
INSERT INTO `sys_user_project` VALUES (534, 101140, 7);
INSERT INTO `sys_user_project` VALUES (535, 101140, 8);
INSERT INTO `sys_user_project` VALUES (536, 101140, 9);
INSERT INTO `sys_user_project` VALUES (537, 101140, 10);
INSERT INTO `sys_user_project` VALUES (538, 101140, 11);
INSERT INTO `sys_user_project` VALUES (546, 101138, 5);
INSERT INTO `sys_user_project` VALUES (547, 101138, 6);
INSERT INTO `sys_user_project` VALUES (548, 101138, 7);
INSERT INTO `sys_user_project` VALUES (549, 101138, 8);
INSERT INTO `sys_user_project` VALUES (550, 101138, 9);
INSERT INTO `sys_user_project` VALUES (551, 101138, 10);
INSERT INTO `sys_user_project` VALUES (552, 101138, 11);
INSERT INTO `sys_user_project` VALUES (560, 11132, 5);
INSERT INTO `sys_user_project` VALUES (561, 11132, 6);
INSERT INTO `sys_user_project` VALUES (562, 11132, 7);
INSERT INTO `sys_user_project` VALUES (563, 11132, 8);
INSERT INTO `sys_user_project` VALUES (564, 11132, 9);
INSERT INTO `sys_user_project` VALUES (565, 11132, 10);
INSERT INTO `sys_user_project` VALUES (566, 11132, 11);
INSERT INTO `sys_user_project` VALUES (567, 11111, 7);
INSERT INTO `sys_user_project` VALUES (568, 11111, 8);
INSERT INTO `sys_user_project` VALUES (569, 11111, 9);
INSERT INTO `sys_user_project` VALUES (570, 11111, 6);
INSERT INTO `sys_user_project` VALUES (688, 10031, 5);
INSERT INTO `sys_user_project` VALUES (689, 10031, 6);
INSERT INTO `sys_user_project` VALUES (690, 10031, 7);
INSERT INTO `sys_user_project` VALUES (691, 10031, 8);
INSERT INTO `sys_user_project` VALUES (692, 10031, 9);
INSERT INTO `sys_user_project` VALUES (693, 10031, 10);
INSERT INTO `sys_user_project` VALUES (694, 10031, 11);
INSERT INTO `sys_user_project` VALUES (695, 10028, 5);
INSERT INTO `sys_user_project` VALUES (696, 10028, 6);
INSERT INTO `sys_user_project` VALUES (697, 10028, 7);
INSERT INTO `sys_user_project` VALUES (698, 10028, 8);
INSERT INTO `sys_user_project` VALUES (699, 10028, 9);
INSERT INTO `sys_user_project` VALUES (700, 10028, 10);
INSERT INTO `sys_user_project` VALUES (701, 10028, 11);
INSERT INTO `sys_user_project` VALUES (702, 10014, 5);
INSERT INTO `sys_user_project` VALUES (703, 10014, 6);
INSERT INTO `sys_user_project` VALUES (704, 10014, 7);
INSERT INTO `sys_user_project` VALUES (705, 10014, 8);
INSERT INTO `sys_user_project` VALUES (706, 10014, 9);
INSERT INTO `sys_user_project` VALUES (707, 10014, 10);
INSERT INTO `sys_user_project` VALUES (708, 10014, 11);
INSERT INTO `sys_user_project` VALUES (709, 10015, 5);
INSERT INTO `sys_user_project` VALUES (710, 10015, 6);
INSERT INTO `sys_user_project` VALUES (711, 10015, 7);
INSERT INTO `sys_user_project` VALUES (712, 10015, 8);
INSERT INTO `sys_user_project` VALUES (713, 10015, 9);
INSERT INTO `sys_user_project` VALUES (714, 10015, 10);
INSERT INTO `sys_user_project` VALUES (715, 10015, 11);
INSERT INTO `sys_user_project` VALUES (716, 10024, 5);
INSERT INTO `sys_user_project` VALUES (717, 10024, 6);
INSERT INTO `sys_user_project` VALUES (718, 10024, 7);
INSERT INTO `sys_user_project` VALUES (719, 10024, 8);
INSERT INTO `sys_user_project` VALUES (720, 10024, 9);
INSERT INTO `sys_user_project` VALUES (721, 10024, 10);
INSERT INTO `sys_user_project` VALUES (722, 10024, 11);
INSERT INTO `sys_user_project` VALUES (723, 10026, 5);
INSERT INTO `sys_user_project` VALUES (724, 10026, 6);
INSERT INTO `sys_user_project` VALUES (725, 10026, 7);
INSERT INTO `sys_user_project` VALUES (726, 10026, 8);
INSERT INTO `sys_user_project` VALUES (727, 10026, 9);
INSERT INTO `sys_user_project` VALUES (728, 10026, 10);
INSERT INTO `sys_user_project` VALUES (729, 10026, 11);
INSERT INTO `sys_user_project` VALUES (730, 10020, 5);
INSERT INTO `sys_user_project` VALUES (731, 10020, 6);
INSERT INTO `sys_user_project` VALUES (732, 10020, 7);
INSERT INTO `sys_user_project` VALUES (733, 10020, 8);
INSERT INTO `sys_user_project` VALUES (734, 10020, 9);
INSERT INTO `sys_user_project` VALUES (735, 10020, 10);
INSERT INTO `sys_user_project` VALUES (736, 10020, 11);
INSERT INTO `sys_user_project` VALUES (737, 10017, 5);
INSERT INTO `sys_user_project` VALUES (738, 10017, 6);
INSERT INTO `sys_user_project` VALUES (739, 10017, 7);
INSERT INTO `sys_user_project` VALUES (740, 10017, 8);
INSERT INTO `sys_user_project` VALUES (741, 10017, 9);
INSERT INTO `sys_user_project` VALUES (742, 10017, 10);
INSERT INTO `sys_user_project` VALUES (743, 10017, 11);
INSERT INTO `sys_user_project` VALUES (744, 10023, 5);
INSERT INTO `sys_user_project` VALUES (745, 10023, 6);
INSERT INTO `sys_user_project` VALUES (746, 10023, 7);
INSERT INTO `sys_user_project` VALUES (747, 10023, 8);
INSERT INTO `sys_user_project` VALUES (748, 10023, 9);
INSERT INTO `sys_user_project` VALUES (749, 10023, 10);
INSERT INTO `sys_user_project` VALUES (750, 10023, 11);
INSERT INTO `sys_user_project` VALUES (758, 10016, 5);
INSERT INTO `sys_user_project` VALUES (759, 10016, 6);
INSERT INTO `sys_user_project` VALUES (760, 10016, 7);
INSERT INTO `sys_user_project` VALUES (761, 10016, 8);
INSERT INTO `sys_user_project` VALUES (762, 10016, 9);
INSERT INTO `sys_user_project` VALUES (763, 10016, 10);
INSERT INTO `sys_user_project` VALUES (764, 10016, 11);
INSERT INTO `sys_user_project` VALUES (765, 10502, 5);
INSERT INTO `sys_user_project` VALUES (766, 10502, 6);
INSERT INTO `sys_user_project` VALUES (767, 10502, 7);
INSERT INTO `sys_user_project` VALUES (768, 10502, 8);
INSERT INTO `sys_user_project` VALUES (769, 10502, 9);
INSERT INTO `sys_user_project` VALUES (770, 10502, 10);
INSERT INTO `sys_user_project` VALUES (771, 10502, 11);
INSERT INTO `sys_user_project` VALUES (772, 10033, 5);
INSERT INTO `sys_user_project` VALUES (773, 10033, 6);
INSERT INTO `sys_user_project` VALUES (774, 10033, 7);
INSERT INTO `sys_user_project` VALUES (775, 10033, 8);
INSERT INTO `sys_user_project` VALUES (776, 10033, 9);
INSERT INTO `sys_user_project` VALUES (777, 10033, 10);
INSERT INTO `sys_user_project` VALUES (778, 10033, 11);
INSERT INTO `sys_user_project` VALUES (779, 10021, 5);
INSERT INTO `sys_user_project` VALUES (780, 10021, 6);
INSERT INTO `sys_user_project` VALUES (781, 10021, 7);
INSERT INTO `sys_user_project` VALUES (782, 10021, 8);
INSERT INTO `sys_user_project` VALUES (783, 10021, 9);
INSERT INTO `sys_user_project` VALUES (784, 10021, 10);
INSERT INTO `sys_user_project` VALUES (785, 10021, 11);
INSERT INTO `sys_user_project` VALUES (786, 10027, 5);
INSERT INTO `sys_user_project` VALUES (787, 10027, 6);
INSERT INTO `sys_user_project` VALUES (788, 10027, 7);
INSERT INTO `sys_user_project` VALUES (789, 10027, 8);
INSERT INTO `sys_user_project` VALUES (790, 10027, 9);
INSERT INTO `sys_user_project` VALUES (791, 10027, 10);
INSERT INTO `sys_user_project` VALUES (792, 10027, 11);
INSERT INTO `sys_user_project` VALUES (793, 10029, 5);
INSERT INTO `sys_user_project` VALUES (794, 10029, 6);
INSERT INTO `sys_user_project` VALUES (795, 10029, 7);
INSERT INTO `sys_user_project` VALUES (796, 10029, 8);
INSERT INTO `sys_user_project` VALUES (797, 10029, 9);
INSERT INTO `sys_user_project` VALUES (798, 10029, 10);
INSERT INTO `sys_user_project` VALUES (799, 10029, 11);
INSERT INTO `sys_user_project` VALUES (800, 10011, 5);
INSERT INTO `sys_user_project` VALUES (801, 10011, 6);
INSERT INTO `sys_user_project` VALUES (802, 10011, 7);
INSERT INTO `sys_user_project` VALUES (803, 10011, 8);
INSERT INTO `sys_user_project` VALUES (804, 10011, 9);
INSERT INTO `sys_user_project` VALUES (805, 10011, 10);
INSERT INTO `sys_user_project` VALUES (806, 10011, 11);
INSERT INTO `sys_user_project` VALUES (807, 10013, 5);
INSERT INTO `sys_user_project` VALUES (808, 10013, 6);
INSERT INTO `sys_user_project` VALUES (809, 10013, 7);
INSERT INTO `sys_user_project` VALUES (810, 10013, 8);
INSERT INTO `sys_user_project` VALUES (811, 10013, 9);
INSERT INTO `sys_user_project` VALUES (812, 10013, 10);
INSERT INTO `sys_user_project` VALUES (813, 10013, 11);
INSERT INTO `sys_user_project` VALUES (814, 10012, 5);
INSERT INTO `sys_user_project` VALUES (815, 10012, 6);
INSERT INTO `sys_user_project` VALUES (816, 10012, 7);
INSERT INTO `sys_user_project` VALUES (817, 10012, 8);
INSERT INTO `sys_user_project` VALUES (818, 10012, 9);
INSERT INTO `sys_user_project` VALUES (819, 10012, 10);
INSERT INTO `sys_user_project` VALUES (820, 10012, 11);
INSERT INTO `sys_user_project` VALUES (828, 10009, 5);
INSERT INTO `sys_user_project` VALUES (829, 10009, 6);
INSERT INTO `sys_user_project` VALUES (830, 10009, 7);
INSERT INTO `sys_user_project` VALUES (831, 10009, 8);
INSERT INTO `sys_user_project` VALUES (832, 10009, 9);
INSERT INTO `sys_user_project` VALUES (833, 10009, 10);
INSERT INTO `sys_user_project` VALUES (834, 10009, 11);
INSERT INTO `sys_user_project` VALUES (835, 101137, 5);
INSERT INTO `sys_user_project` VALUES (836, 101137, 6);
INSERT INTO `sys_user_project` VALUES (837, 101137, 7);
INSERT INTO `sys_user_project` VALUES (838, 101137, 8);
INSERT INTO `sys_user_project` VALUES (839, 101137, 9);
INSERT INTO `sys_user_project` VALUES (840, 101137, 10);
INSERT INTO `sys_user_project` VALUES (841, 101137, 11);
INSERT INTO `sys_user_project` VALUES (869, 101169, 5);
INSERT INTO `sys_user_project` VALUES (870, 101169, 9);
INSERT INTO `sys_user_project` VALUES (871, 101169, 6);
INSERT INTO `sys_user_project` VALUES (872, 101169, 10);
INSERT INTO `sys_user_project` VALUES (873, 101169, 7);
INSERT INTO `sys_user_project` VALUES (874, 101169, 8);
INSERT INTO `sys_user_project` VALUES (875, 101169, 11);
INSERT INTO `sys_user_project` VALUES (894, 11128, 6);
INSERT INTO `sys_user_project` VALUES (901, 101139, 5);
INSERT INTO `sys_user_project` VALUES (902, 101139, 6);
INSERT INTO `sys_user_project` VALUES (903, 101139, 7);
INSERT INTO `sys_user_project` VALUES (904, 101139, 8);
INSERT INTO `sys_user_project` VALUES (905, 101139, 9);
INSERT INTO `sys_user_project` VALUES (906, 101139, 10);
INSERT INTO `sys_user_project` VALUES (907, 101139, 11);
INSERT INTO `sys_user_project` VALUES (909, 101100, 7);
INSERT INTO `sys_user_project` VALUES (911, 11140, 6);
INSERT INTO `sys_user_project` VALUES (914, 10110, 5);
INSERT INTO `sys_user_project` VALUES (915, 10110, 7);
INSERT INTO `sys_user_project` VALUES (916, 10110, 8);
INSERT INTO `sys_user_project` VALUES (917, 10110, 9);
INSERT INTO `sys_user_project` VALUES (918, 10110, 10);
INSERT INTO `sys_user_project` VALUES (919, 10110, 11);
INSERT INTO `sys_user_project` VALUES (920, 10110, 4030);
INSERT INTO `sys_user_project` VALUES (921, 10110, 4031);
INSERT INTO `sys_user_project` VALUES (922, 101196, 11);
INSERT INTO `sys_user_project` VALUES (923, 101196, 10);
INSERT INTO `sys_user_project` VALUES (924, 101196, 9);
INSERT INTO `sys_user_project` VALUES (925, 101196, 8);
INSERT INTO `sys_user_project` VALUES (926, 101196, 7);
INSERT INTO `sys_user_project` VALUES (927, 101196, 6);
INSERT INTO `sys_user_project` VALUES (928, 101196, 5);
INSERT INTO `sys_user_project` VALUES (929, 1, 5);
INSERT INTO `sys_user_project` VALUES (930, 1, 6);
INSERT INTO `sys_user_project` VALUES (931, 1, 7);
INSERT INTO `sys_user_project` VALUES (932, 1, 8);
INSERT INTO `sys_user_project` VALUES (933, 1, 9);
INSERT INTO `sys_user_project` VALUES (934, 1, 10);
INSERT INTO `sys_user_project` VALUES (935, 1, 11);
INSERT INTO `sys_user_project` VALUES (936, 1, 4030);
INSERT INTO `sys_user_project` VALUES (937, 1, 4031);
INSERT INTO `sys_user_project` VALUES (938, 11139, 7);
INSERT INTO `sys_user_project` VALUES (939, 11139, 8);
INSERT INTO `sys_user_project` VALUES (940, 11139, 9);
INSERT INTO `sys_user_project` VALUES (941, 11139, 10);
INSERT INTO `sys_user_project` VALUES (942, 11139, 11);
INSERT INTO `sys_user_project` VALUES (943, 11139, 4030);
INSERT INTO `sys_user_project` VALUES (944, 11139, 4031);
INSERT INTO `sys_user_project` VALUES (945, 11139, 5);
INSERT INTO `sys_user_project` VALUES (946, 11139, 6);
INSERT INTO `sys_user_project` VALUES (947, 101197, 5);
INSERT INTO `sys_user_project` VALUES (948, 101197, 6);
INSERT INTO `sys_user_project` VALUES (949, 101197, 7);
INSERT INTO `sys_user_project` VALUES (950, 101197, 8);
INSERT INTO `sys_user_project` VALUES (951, 101197, 9);
INSERT INTO `sys_user_project` VALUES (952, 101197, 10);
INSERT INTO `sys_user_project` VALUES (953, 101197, 11);
INSERT INTO `sys_user_project` VALUES (954, 101197, 4030);
INSERT INTO `sys_user_project` VALUES (955, 101197, 4031);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 11130, 1);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '357419a6e6a37c9a93b114ce4a38a1e2', '2020-10-23 03:04:56', '2020-10-22 15:04:56');
INSERT INTO `sys_user_token` VALUES (11130, 'AT-116-1hvlxkd3YlpujLy2YinOwjKWZuFccpLK', '2020-10-23 03:05:31', '2020-10-22 15:05:31');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `used` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'lewk', '21232f297a57a5a743894a0e4a801fc3', 1);
INSERT INTO `user_info` VALUES (32, 'liuk', 'e10adc3949ba59abbe56e057f20f883e', 1);
INSERT INTO `user_info` VALUES (4, 'ms', '21232f297a57a5a743894a0e4a801fc3', 1);
INSERT INTO `user_info` VALUES (9, 'lk', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (10, 'mas1', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (11, '测试用户管理', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `user_info` VALUES (12, '测试用户管理用户', '827ccb0eea8a706c4c34a16891f84e7b', 0);
INSERT INTO `user_info` VALUES (13, '测试用户管理账号', '827ccb0eea8a706c4c34a16891f84e7b', 0);
INSERT INTO `user_info` VALUES (14, '测试用户管理用户', '827ccb0eea8a706c4c34a16891f84e7b', 0);
INSERT INTO `user_info` VALUES (15, 'suze', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (16, 'quliang', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (17, 'zhanghaiyan', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (18, 'maxiaoya', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (19, 'chenzhe', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (20, 'zhaoyan', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (21, 'quzhonggang', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (22, 'tanjian', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (23, 'zhaoyi', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (24, 'zhangshuang', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (25, 'liujia', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (26, 'jinghao', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (27, 'haozhaodong', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (28, 'kangbin', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (29, 'zhoubin', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (30, 'liwen', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (31, 'lvshi', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, 'q', '7694f4a66316e53c8cdd9d9954bd611d', 0);
INSERT INTO `user_info` VALUES (0, 'e', 'e1671797c52e15f763380b45e841ec32', 0);
INSERT INTO `user_info` VALUES (0, 'w', 'f1290186a5d0b1ceab27f4e77c0c5d68', 0);
INSERT INTO `user_info` VALUES (0, 'r', '4b43b0aee35624cd95b910189b3dc231', 0);
INSERT INTO `user_info` VALUES (0, 't', 'e358efa489f58062f10dd7316b65649e', 0);
INSERT INTO `user_info` VALUES (0, 'a', '0cc175b9c0f1b6a831c399e269772661', 0);
INSERT INTO `user_info` VALUES (0, 'sun', '827ccb0eea8a706c4c34a16891f84e7b', 0);
INSERT INTO `user_info` VALUES (0, '2331', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, '12333', 'bae175604f2b1309ea6a36453190b70e', 0);
INSERT INTO `user_info` VALUES (0, '11111', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'r', '4b43b0aee35624cd95b910189b3dc231', 0);
INSERT INTO `user_info` VALUES (0, 't', 'e358efa489f58062f10dd7316b65649e', 0);
INSERT INTO `user_info` VALUES (0, 'weyuer', 'b0baee9d279d34fa1dfd71aadb908c3f', 0);
INSERT INTO `user_info` VALUES (0, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'admin5', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, '123', '202cb962ac59075b964b07152d234b70', 0);
INSERT INTO `user_info` VALUES (0, 'sunyuying1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'wangfl', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'liujj', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'sunyuying1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'sunys', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'lewk', '63a65b8c0f606c4282218ac0ac08d879', 0);
INSERT INTO `user_info` VALUES (0, 'dd', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'syn123', '048a43ed70e5fb51432af8c0f72f9c00', 0);
INSERT INTO `user_info` VALUES (0, 'suntext', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, '1', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '测', '9b5394fd929896fb9e90e26b3d18e63d', 0);
INSERT INTO `user_info` VALUES (0, 'syn', 'd726760b0467b77803d6d1f3585deb6e', 0);
INSERT INTO `user_info` VALUES (0, '2', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, 'zhaolf', 'b41d0e0f924336bd25624277ce7ea9f5', 0);
INSERT INTO `user_info` VALUES (0, 'shiyn', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'aa', '4124bc0a9335c27f086f24ba207a4912', 0);
INSERT INTO `user_info` VALUES (0, 'dilraba', 'f50499c0b43c9c4878f60f5fbaff662c', 0);
INSERT INTO `user_info` VALUES (0, 'taoli', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'taoli', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, '1', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '1111', 'b59c67bf196a4758191e42f76670ceba', 0);
INSERT INTO `user_info` VALUES (0, '1234', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, '12333', '78bf4f00f81a36b57950e239f1df91c1', 0);
INSERT INTO `user_info` VALUES (0, '测', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '1', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, 'a', '0cc175b9c0f1b6a831c399e269772661', 0);
INSERT INTO `user_info` VALUES (0, '测', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '111', '21232f297a57a5a743894a0e4a801fc3', 0);
INSERT INTO `user_info` VALUES (0, 'text1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'text1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'text1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'text1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'text2', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, 'text1', '96e79218965eb72c92a549dd5a330112', 0);
INSERT INTO `user_info` VALUES (0, '1111', '6512bd43d9caa6e02c990b0a82652dca', 0);
INSERT INTO `user_info` VALUES (0, 'ww', '514f1b439f404f86f77090fa9edc96ce', 0);
INSERT INTO `user_info` VALUES (0, '1', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '1', 'c4ca4238a0b923820dcc509a6f75849b', 0);
INSERT INTO `user_info` VALUES (0, '90', '8613985ec49eb8f757ae6439e879bb2a', 0);
INSERT INTO `user_info` VALUES (0, 'sys1019', 'f379eaf3c831b04de153469d1bec345e', 0);

SET FOREIGN_KEY_CHECKS = 1;
