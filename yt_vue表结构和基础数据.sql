/*
 Navicat Premium Data Transfer

 Source Server         : 本地-Mysql
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : yt_vue

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 15/12/2023 18:38:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统消息表主键',
  `channel_id` tinyint(3) NULL DEFAULT NULL COMMENT '发送渠道，数据字典：0-系统消息 1-电子邮件',
  `category_id` tinyint(3) NULL DEFAULT NULL COMMENT '消息类型id',
  `category_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型名称',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `receiver_type` tinyint(3) NULL DEFAULT NULL COMMENT '发送对象类型 0-全部 1-按部门 2-按角色 3-按用户',
  `receiver_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收消息对象类型，根据type，可能是部门id、角色id或用户id，需进行长度限制',
  `receiver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送对象',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `is_scheduled` tinyint(3) NULL DEFAULT 0 COMMENT '是否定时发送 0-否 1-是',
  `scheduled_time` datetime NULL DEFAULT NULL COMMENT '定时发送的时间',
  `send_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '消息发送状态 0-未发送 1-已发送',
  `delete_flag` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_category`;
CREATE TABLE `sys_announcement_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息类型表id',
  `category_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型名称',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '消息类型状态，0-启用 1-停用',
  `delete_flag` tinyint(3) NULL DEFAULT NULL COMMENT '删除标记',
  `create_by` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement_category
-- ----------------------------
INSERT INTO `sys_announcement_category` VALUES (1, '通知公告', 0, 0, 'admin', '2023-12-07 16:04:12', 'admin', '2023-12-07 16:04:12');
INSERT INTO `sys_announcement_category` VALUES (2, '普通消息', 0, 0, 'admin', '2023-12-07 16:05:27', 'admin', '2023-12-07 16:06:12');
INSERT INTO `sys_announcement_category` VALUES (3, '活动消息', 0, 0, 'admin', '2023-12-07 16:05:45', 'admin', '2023-12-08 09:31:02');

-- ----------------------------
-- Table structure for sys_announcement_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_log`;
CREATE TABLE `sys_announcement_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志表id',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志表标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志表内容',
  `category_id` tinyint(3) NULL DEFAULT NULL COMMENT '消息类型id',
  `category_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型名称（冗余）',
  `send_type` tinyint(3) NULL DEFAULT 0 COMMENT '发送方式 0-业务触发 1-手动发送',
  `receiver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送对象',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发送日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement_receiver
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_receiver`;
CREATE TABLE `sys_announcement_receiver`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户系统通知表',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '接收消息的用户id',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '是否已读 0-未读 1-已读',
  `is_starred` tinyint(3) NULL DEFAULT 0 COMMENT '是否为星标（重要）邮件 0-否 1-是',
  `announcement_id` int(11) NULL DEFAULT NULL COMMENT '系统消息表id',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '消息获取时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE COMMENT '用户id索引',
  INDEX `idx_announcement_id`(`announcement_id`) USING BTREE COMMENT '消息表id'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_template`;
CREATE TABLE `sys_announcement_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息模板表id',
  `title` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息模板标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息模板内容',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '状态 0-启用 1-停用',
  `delete_flag` tinyint(3) NULL DEFAULT NULL COMMENT '删除标记',
  `create_by` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_announcement_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-17 14:51:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-17 14:51:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-17 14:51:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-17 14:51:23', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-17 14:51:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '消息刷新时间', 'sys.message.time', '15000', 'Y', 'admin', '2023-12-22 16:24:02', 'admin', '2023-12-22 17:01:22', '消息刷新时间');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '系统消息', '0', 'sys_announcement_channel', NULL, 'default', 'N', '0', 'admin', '2023-12-08 15:11:43', '', NULL, '消息发送渠道-系统消息');
INSERT INTO `sys_dict_data` VALUES (31, 2, '电子邮件', '1', 'sys_announcement_channel', NULL, 'default', 'N', '0', 'admin', '2023-12-08 15:13:03', '', NULL, '消息发送渠道-电子邮件');
INSERT INTO `sys_dict_data` VALUES (32, 0, '启用', '0', 'sys_start_status', NULL, 'success', 'N', '0', 'admin', '2023-12-15 18:04:14', 'admin', '2023-12-15 18:05:21', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 0, '停用', '1', 'sys_start_status', NULL, 'danger', 'N', '0', 'admin', '2023-12-15 18:04:42', 'admin', '2023-12-15 18:05:12', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 1, '已创建', '0', 'sys_announcement_status', NULL, 'primary', 'N', '0', 'admin', '2023-12-15 18:20:11', '', NULL, '消息发送状态');
INSERT INTO `sys_dict_data` VALUES (35, 2, '已发送', '1', 'sys_announcement_status', NULL, 'success', 'N', '0', 'admin', '2023-12-15 18:20:58', '', NULL, '消息发送状态');
INSERT INTO `sys_dict_data` VALUES (36, 1, '业务触发', '0', 'sys_announcement_send_type', NULL, 'default', 'N', '0', 'admin', '2023-12-15 18:24:06', '', NULL, '消息发送方式');
INSERT INTO `sys_dict_data` VALUES (37, 2, '手动发送', '1', 'sys_announcement_send_type', NULL, 'default', 'N', '0', 'admin', '2023-12-15 18:24:33', '', NULL, '消息发送方式');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-17 14:51:23', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '消息发送渠道', 'sys_announcement_channel', '0', 'admin', '2023-12-08 15:08:56', '', NULL, '消息中心消息的发送渠道');
INSERT INTO `sys_dict_type` VALUES (12, '启用停用', 'sys_start_status', '0', 'admin', '2023-12-15 18:02:21', '', NULL, '启用，停用状态');
INSERT INTO `sys_dict_type` VALUES (13, '消息发送状态', 'sys_announcement_status', '0', 'admin', '2023-12-15 18:18:51', '', NULL, '消息发送状态：0-已创建 1-已发送');
INSERT INTO `sys_dict_type` VALUES (14, '消息发送方式', 'sys_announcement_send_type', '0', 'admin', '2023-12-15 18:23:10', '', NULL, '发送方式 0-业务触发 1-手动发送');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-17 14:51:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-17 14:51:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-17 14:51:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1085 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-17 14:51:21', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-03-17 14:51:21', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-17 14:51:21', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-03-17 14:51:21', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (5, '消息中心', 0, 5, 'sysAnnouncement', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'message', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-17 14:51:21', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-17 14:51:21', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-17 14:51:21', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-17 14:51:21', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-17 14:51:21', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-17 14:51:21', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-17 14:51:21', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-17 14:51:21', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-17 14:51:21', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-17 14:51:21', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-17 14:51:21', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-17 14:51:21', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-17 14:51:21', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-17 14:51:21', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-17 14:51:21', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-17 14:51:21', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-17 14:51:21', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-17 14:51:21', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-17 14:51:21', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-17 14:51:21', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '消息类型', 5, 1, 'category', 'system/category/index', NULL, 1, 0, 'C', '0', '0', 'system:category:list', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '消息类型菜单');
INSERT INTO `sys_menu` VALUES (1062, '消息类型查询', 1061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:category:query', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '消息类型新增', 1061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:category:add', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '消息类型修改', 1061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:category:edit', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '消息类型删除', 1061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:category:remove', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '消息类型导出', 1061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:category:export', '#', 'admin', '2023-12-07 15:51:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '消息通知', 5, 2, 'announcement', 'system/announcement/index', NULL, 1, 0, 'C', '0', '0', 'system:announcement:list', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '消息通知菜单');
INSERT INTO `sys_menu` VALUES (1068, '消息通知查询', 1067, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:announcement:query', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, '消息通知新增', 1067, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:announcement:add', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '消息通知修改', 1067, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:announcement:edit', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '消息通知删除', 1067, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:announcement:remove', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '消息通知导出', 1067, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:announcement:export', '#', 'admin', '2023-12-07 17:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '消息日志', 5, 4, 'log', 'system/log/index', NULL, 1, 0, 'C', '0', '0', 'system:log:list', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '消息发送日志菜单');
INSERT INTO `sys_menu` VALUES (1074, '消息发送日志查询', 1073, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:log:query', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '消息发送日志新增', 1073, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:log:add', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, '消息发送日志修改', 1073, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:log:edit', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '消息发送日志删除', 1073, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:log:remove', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '消息发送日志导出', 1073, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:log:export', '#', 'admin', '2023-12-08 16:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '消息模板', 5, 3, 'template', 'system/template/index', NULL, 1, 0, 'C', '0', '0', 'system:template:list', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '消息模板菜单');
INSERT INTO `sys_menu` VALUES (1080, '消息模板查询', 1079, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:query', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '消息模板新增', 1079, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:add', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '消息模板修改', 1079, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:edit', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '消息模板删除', 1079, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:remove', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '消息模板导出', 1079, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:export', '#', 'admin', '2023-12-12 16:03:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-17 14:51:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-17 14:51:24', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-17 14:51:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-17 14:51:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-17 14:51:21', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

# 给sys_user表添加salt-盐值字段
ALTER TABLE `sys_user`
  ADD COLUMN `salt` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐' AFTER `password`;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', 'admin', '00', '3264933792@qq.com', '15888888888', '1', '/profile/avatar/2023/11/15/blob_20231115151648A001.png', '$2a$10$YJR6Jlza4mHdgvybZRPFs.7JMGIqmHh8RHO3V19veMnqr6nin4.lu', '1avm', '0', '0', '127.0.0.1', '2024-01-24 16:27:10', 'admin', '2023-03-17 14:51:21', '', '2024-01-24 16:27:10', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'ry', 'ry', '00', '511740020@qq.com', '15666666666', '1', '', '$2a$10$zZOSy3pQW2o2H2uxS71YhOjrAEvG5fUrYaB0haytOu4cKcYgzkLzO', 'wb1x', '0', '0', '127.0.0.1', '2024-01-24 16:27:58', 'admin', '2023-03-17 14:51:21', '', '2024-01-24 16:27:58', '测试员');


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

# 地区表和地区信息
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
                             `region_id` int(10) NOT NULL COMMENT '地区主键编号',
                             `region_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区名称',
                             `region_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区缩写',
                             `region_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行政地区编号',
                             `region_parent_id` int(10) NULL DEFAULT NULL COMMENT '地区父id',
                             `region_level` int(2) NULL DEFAULT NULL COMMENT '地区级别 1-省、自治区、直辖市 2-地级市、地区、自治州、盟 3-市辖区、县级市、县',
                             PRIMARY KEY (`region_id`) USING BTREE,
                             INDEX `idx_region_parent_id`(`region_parent_id`) USING BTREE COMMENT '父级别id索引',
                             INDEX `idx_region_code`(`region_code`) USING BTREE COMMENT '行政地区编号索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
INSERT INTO `sys_region` VALUES (1000000, '北京市', '京', '110000', -1, 1);
INSERT INTO `sys_region` VALUES (1000001, '天津市', '津', '120000', -1, 1);
INSERT INTO `sys_region` VALUES (1000002, '河北省', '冀', '130000', -1, 1);
INSERT INTO `sys_region` VALUES (1000003, '山西省', '晋', '140000', -1, 1);
INSERT INTO `sys_region` VALUES (1000004, '内蒙古自治区', '内蒙古', '150000', -1, 1);
INSERT INTO `sys_region` VALUES (1000005, '辽宁省', '辽', '210000', -1, 1);
INSERT INTO `sys_region` VALUES (1000006, '吉林省', '吉', '220000', -1, 1);
INSERT INTO `sys_region` VALUES (1000007, '黑龙江省', '黑', '230000', -1, 1);
INSERT INTO `sys_region` VALUES (1000008, '上海市', '沪', '310000', -1, 1);
INSERT INTO `sys_region` VALUES (1000009, '江苏省', '苏', '320000', -1, 1);
INSERT INTO `sys_region` VALUES (1000010, '浙江省', '浙', '330000', -1, 1);
INSERT INTO `sys_region` VALUES (1000011, '安徽省', '皖', '340000', -1, 1);
INSERT INTO `sys_region` VALUES (1000012, '福建省', '闽', '350000', -1, 1);
INSERT INTO `sys_region` VALUES (1000013, '江西省', '赣', '360000', -1, 1);
INSERT INTO `sys_region` VALUES (1000014, '山东省', '鲁', '370000', -1, 1);
INSERT INTO `sys_region` VALUES (1000015, '河南省', '豫', '410000', -1, 1);
INSERT INTO `sys_region` VALUES (1000016, '湖北省', '鄂', '420000', -1, 1);
INSERT INTO `sys_region` VALUES (1000017, '湖南省', '湘', '430000', -1, 1);
INSERT INTO `sys_region` VALUES (1000018, '广东省', '粤', '440000', -1, 1);
INSERT INTO `sys_region` VALUES (1000019, '广西壮族自治区', '桂', '450000', -1, 1);
INSERT INTO `sys_region` VALUES (1000020, '海南省', '琼', '460000', -1, 1);
INSERT INTO `sys_region` VALUES (1000021, '重庆市', '渝', '500000', -1, 1);
INSERT INTO `sys_region` VALUES (1000022, '四川省', '川、蜀', '510000', -1, 1);
INSERT INTO `sys_region` VALUES (1000023, '贵州省', '黔、贵', '520000', -1, 1);
INSERT INTO `sys_region` VALUES (1000024, '云南省', '滇、云', '530000', -1, 1);
INSERT INTO `sys_region` VALUES (1000025, '西藏自治区', '藏', '540000', -1, 1);
INSERT INTO `sys_region` VALUES (1000026, '陕西省', '陕、秦', '610000', -1, 1);
INSERT INTO `sys_region` VALUES (1000027, '甘肃省', '甘、陇', '620000', -1, 1);
INSERT INTO `sys_region` VALUES (1000028, '青海省', '青', '630000', -1, 1);
INSERT INTO `sys_region` VALUES (1000029, '宁夏回族自治区', '宁', '640000', -1, 1);
INSERT INTO `sys_region` VALUES (1000030, '新疆维吾尔自治区', '新', '650000', -1, 1);
INSERT INTO `sys_region` VALUES (1000031, '香港特别行政区', '港', '810000', -1, 1);
INSERT INTO `sys_region` VALUES (1000032, '澳门特别行政区', '澳', '820000', -1, 1);
INSERT INTO `sys_region` VALUES (1000033, '台湾省', '台', '710000', -1, 1);
INSERT INTO `sys_region` VALUES (1000034, '东城区', NULL, '110101', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000035, '西城区', NULL, '110102', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000036, '朝阳区', NULL, '110105', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000037, '丰台区', NULL, '110106', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000038, '石景山区', NULL, '110107', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000039, '海淀区', NULL, '110108', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000040, '门头沟区', NULL, '110109', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000041, '房山区', NULL, '110111', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000042, '通州区', NULL, '110112', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000043, '顺义区', NULL, '110113', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000044, '昌平区', NULL, '110114', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000045, '大兴区', NULL, '110115', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000046, '怀柔区', NULL, '110116', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000047, '平谷区', NULL, '110117', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000048, '密云区', NULL, '110118', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000049, '延庆区', NULL, '110119', 1000000, 2);
INSERT INTO `sys_region` VALUES (1000050, '河西区', NULL, '120103', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000051, '和平区', NULL, '120101', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000052, '河东区', NULL, '120102', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000053, '南开区', NULL, '120104', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000054, '河北区', NULL, '120105', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000055, '红桥区', NULL, '120106', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000056, '东丽区', NULL, '120110', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000057, '西青区', NULL, '120111', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000058, '津南区', NULL, '120112', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000059, '北辰区', NULL, '120113', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000060, '武清区', NULL, '120114', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000061, '宝坻区', NULL, '120115', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000062, '滨海新区', NULL, '120116', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000063, '宁河区', NULL, '120117', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000064, '静海区', NULL, '120118', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000065, '蓟州区', NULL, '120119', 1000001, 2);
INSERT INTO `sys_region` VALUES (1000066, '石家庄市', NULL, '130100', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000067, '长安区', NULL, '130102', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000068, '桥西区', NULL, '130104', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000069, '新华区', NULL, '130105', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000070, '井陉矿区', NULL, '130107', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000071, '裕华区', NULL, '130108', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000072, '藁城区', NULL, '130109', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000073, '鹿泉区', NULL, '130110', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000074, '栾城区', NULL, '130111', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000075, '辛集市', NULL, '130181', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000076, '晋州市', NULL, '130183', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000077, '新乐市', NULL, '130184', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000078, '井陉县', NULL, '130121', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000079, '正定县', NULL, '130123', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000080, '行唐县', NULL, '130125', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000081, '灵寿县', NULL, '130126', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000082, '高邑县', NULL, '130127', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000083, '深泽县', NULL, '130128', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000084, '赞皇县', NULL, '130129', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000085, '无极县', NULL, '130130', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000086, '平山县', NULL, '130131', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000087, '元氏县', NULL, '130132', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000088, '赵县', NULL, '130133', 1000066, 3);
INSERT INTO `sys_region` VALUES (1000089, '唐山市', NULL, '130200', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000090, '路北区', NULL, '130203', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000091, '路南区', NULL, '130202', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000092, '古冶区', NULL, '130204', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000093, '开平区', NULL, '130205', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000094, '丰南区', NULL, '130207', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000095, '丰润区', NULL, '130208', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000096, '曹妃甸区', NULL, '130209', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000097, '遵化市', NULL, '130281', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000098, '迁安市', NULL, '130283', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000099, '滦县', NULL, '130223', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000100, '滦南县', NULL, '130224', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000101, '乐亭县', NULL, '130225', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000102, '迁西县', NULL, '130227', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000103, '玉田县', NULL, '130229', 1000089, 3);
INSERT INTO `sys_region` VALUES (1000104, '秦皇岛市', NULL, '130300', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000105, '海港区', NULL, '130302', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000106, '山海关区', NULL, '130303', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000107, '北戴河区', NULL, '130304', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000108, '抚宁区', NULL, '130306', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000109, '昌黎县', NULL, '130322', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000110, '卢龙县', NULL, '130324', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000111, '青龙满族自治县', NULL, '130321', 1000104, 3);
INSERT INTO `sys_region` VALUES (1000112, '邯郸市', NULL, '130400', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000113, '丛台区', NULL, '130403', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000114, '邯山区', NULL, '130402', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000115, '复兴区', NULL, '130404', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000116, '峰峰矿区', NULL, '130406', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000117, '肥乡区', NULL, '130407', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000118, '永年区', NULL, '130408', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000119, '武安市', NULL, '130481', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000120, '临漳县', NULL, '130423', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000121, '成安县', NULL, '130424', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000122, '大名县', NULL, '130425', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000123, '涉县', NULL, '130426', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000124, '磁县', NULL, '130427', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000125, '邱县', NULL, '130430', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000126, '鸡泽县', NULL, '130431', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000127, '广平县', NULL, '130432', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000128, '馆陶县', NULL, '130433', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000129, '魏县', NULL, '130434', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000130, '曲周县', NULL, '130435', 1000112, 3);
INSERT INTO `sys_region` VALUES (1000131, '邢台市', NULL, '130500', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000132, '桥东区', NULL, '130502', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000133, '桥西区', NULL, '130503', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000134, '南宫市', NULL, '130581', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000135, '沙河市', NULL, '130582', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000136, '邢台县', NULL, '130521', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000137, '临城县', NULL, '130522', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000138, '内丘县', NULL, '130523', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000139, '柏乡县', NULL, '130524', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000140, '隆尧县', NULL, '130525', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000141, '任县', NULL, '130526', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000142, '南和县', NULL, '130527', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000143, '宁晋县', NULL, '130528', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000144, '巨鹿县', NULL, '130529', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000145, '新河县', NULL, '130530', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000146, '广宗县', NULL, '130531', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000147, '平乡县', NULL, '130532', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000148, '威县', NULL, '130533', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000149, '清河县', NULL, '130534', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000150, '临西县', NULL, '130535', 1000131, 3);
INSERT INTO `sys_region` VALUES (1000151, '保定市', NULL, '130600', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000152, '竞秀区', NULL, '130602', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000153, '莲池区', NULL, '130606', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000154, '满城区', NULL, '130607', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000155, '清苑区', NULL, '130608', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000156, '徐水区', NULL, '130609', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000157, '涿州市', NULL, '130681', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000158, '定州市', NULL, '130682', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000159, '安国市', NULL, '130683', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000160, '高碑店市', NULL, '130684', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000161, '涞水县', NULL, '130623', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000162, '阜平县', NULL, '130624', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000163, '定兴县', NULL, '130626', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000164, '唐县', NULL, '130627', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000165, '高阳县', NULL, '130628', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000166, '容城县', NULL, '130629', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000167, '涞源县', NULL, '130630', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000168, '望都县', NULL, '130631', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000169, '安新县', NULL, '130632', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000170, '易县', NULL, '130633', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000171, '曲阳县', NULL, '130634', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000172, '蠡县', NULL, '130635', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000173, '顺平县', NULL, '130636', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000174, '博野县', NULL, '130637', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000175, '雄县', NULL, '130638', 1000151, 3);
INSERT INTO `sys_region` VALUES (1000176, '张家口市', NULL, '130700', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000177, '桥西区', NULL, '130703', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000178, '桥东区', NULL, '130702', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000179, '宣化区', NULL, '130705', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000180, '下花园区', NULL, '130706', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000181, '万全区', NULL, '130708', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000182, '崇礼区', NULL, '130709', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000183, '张北县', NULL, '130722', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000184, '康保县', NULL, '130723', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000185, '沽源县', NULL, '130724', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000186, '尚义县', NULL, '130725', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000187, '蔚县', NULL, '130726', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000188, '阳原县', NULL, '130727', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000189, '怀安县', NULL, '130728', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000190, '怀来县', NULL, '130730', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000191, '涿鹿县', NULL, '130731', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000192, '赤城县', NULL, '130732', 1000176, 3);
INSERT INTO `sys_region` VALUES (1000193, '承德市', NULL, '130800', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000194, '双桥区', NULL, '130802', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000195, '双滦区', NULL, '130803', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000196, '鹰手营子矿区', NULL, '130804', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000197, '平泉市', NULL, '130881', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000198, '承德县', NULL, '130821', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000199, '兴隆县', NULL, '130822', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000200, '滦平县', NULL, '130824', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000201, '隆化县', NULL, '130825', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000202, '丰宁满族自治县', NULL, '130826', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000203, '宽城满族自治县', NULL, '130827', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000204, '围场满族蒙古族自治县', NULL, '130828', 1000193, 3);
INSERT INTO `sys_region` VALUES (1000205, '沧州市', NULL, '130900', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000206, '运河区', NULL, '130903', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000207, '新华区', NULL, '130902', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000208, '泊头市', NULL, '130981', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000209, '任丘市', NULL, '130982', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000210, '黄骅市', NULL, '130983', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000211, '河间市', NULL, '130984', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000212, '沧县', NULL, '130921', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000213, '青县', NULL, '130922', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000214, '东光县', NULL, '130923', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000215, '海兴县', NULL, '130924', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000216, '盐山县', NULL, '130925', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000217, '肃宁县', NULL, '130926', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000218, '南皮县', NULL, '130927', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000219, '吴桥县', NULL, '130928', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000220, '献县', NULL, '130929', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000221, '孟村回族自治县', NULL, '130930', 1000205, 3);
INSERT INTO `sys_region` VALUES (1000222, '廊坊市', NULL, '131000', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000223, '广阳区', NULL, '131003', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000224, '安次区', NULL, '131002', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000225, '霸州市', NULL, '131081', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000226, '三河市', NULL, '131082', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000227, '固安县', NULL, '131022', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000228, '永清县', NULL, '131023', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000229, '香河县', NULL, '131024', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000230, '大城县', NULL, '131025', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000231, '文安县', NULL, '131026', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000232, '大厂回族自治县', NULL, '131028', 1000222, 3);
INSERT INTO `sys_region` VALUES (1000233, '衡水市', NULL, '131100', 1000002, 2);
INSERT INTO `sys_region` VALUES (1000234, '桃城区', NULL, '131102', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000235, '冀州区', NULL, '131103', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000236, '深州市', NULL, '131182', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000237, '枣强县', NULL, '131121', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000238, '武邑县', NULL, '131122', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000239, '武强县', NULL, '131123', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000240, '饶阳县', NULL, '131124', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000241, '安平县', NULL, '131125', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000242, '故城县', NULL, '131126', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000243, '景县', NULL, '131127', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000244, '阜城县', NULL, '131128', 1000233, 3);
INSERT INTO `sys_region` VALUES (1000245, '太原市', NULL, '140100', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000246, '杏花岭区', NULL, '140107', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000247, '小店区', NULL, '140105', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000248, '迎泽区', NULL, '140106', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000249, '尖草坪区', NULL, '140108', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000250, '万柏林区', NULL, '140109', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000251, '晋源区', NULL, '140110', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000252, '古交市', NULL, '140181', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000253, '清徐县', NULL, '140121', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000254, '阳曲县', NULL, '140122', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000255, '娄烦县', NULL, '140123', 1000245, 3);
INSERT INTO `sys_region` VALUES (1000256, '大同市', NULL, '140200', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000257, '城区', NULL, '140202', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000258, '矿区', NULL, '140203', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000259, '南郊区', NULL, '140211', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000260, '新荣区', NULL, '140212', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000261, '阳高县', NULL, '140221', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000262, '天镇县', NULL, '140222', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000263, '广灵县', NULL, '140223', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000264, '灵丘县', NULL, '140224', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000265, '浑源县', NULL, '140225', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000266, '左云县', NULL, '140226', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000267, '大同县', NULL, '140227', 1000256, 3);
INSERT INTO `sys_region` VALUES (1000268, '阳泉市', NULL, '140300', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000269, '城区', NULL, '140302', 1000268, 3);
INSERT INTO `sys_region` VALUES (1000270, '矿区', NULL, '140303', 1000268, 3);
INSERT INTO `sys_region` VALUES (1000271, '郊区', NULL, '140311', 1000268, 3);
INSERT INTO `sys_region` VALUES (1000272, '平定县', NULL, '140321', 1000268, 3);
INSERT INTO `sys_region` VALUES (1000273, '盂县', NULL, '140322', 1000268, 3);
INSERT INTO `sys_region` VALUES (1000274, '长治市', NULL, '140400', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000275, '城区', NULL, '140402', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000276, '郊区', NULL, '140411', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000277, '潞城市', NULL, '140481', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000278, '长治县', NULL, '140421', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000279, '襄垣县', NULL, '140423', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000280, '屯留县', NULL, '140424', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000281, '平顺县', NULL, '140425', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000282, '黎城县', NULL, '140426', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000283, '壶关县', NULL, '140427', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000284, '长子县', NULL, '140428', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000285, '武乡县', NULL, '140429', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000286, '沁县', NULL, '140430', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000287, '沁源县', NULL, '140431', 1000274, 3);
INSERT INTO `sys_region` VALUES (1000288, '晋城市', NULL, '140500', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000289, '城区', NULL, '140502', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000290, '高平市', NULL, '140581', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000291, '沁水县', NULL, '140521', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000292, '阳城县', NULL, '140522', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000293, '陵川县', NULL, '140524', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000294, '泽州县', NULL, '140525', 1000288, 3);
INSERT INTO `sys_region` VALUES (1000295, '朔州市', NULL, '140600', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000296, '朔城区', NULL, '140602', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000297, '平鲁区', NULL, '140603', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000298, '山阴县', NULL, '140621', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000299, '应县', NULL, '140622', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000300, '右玉县', NULL, '140623', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000301, '怀仁县', NULL, '140624', 1000295, 3);
INSERT INTO `sys_region` VALUES (1000302, '晋中市', NULL, '140700', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000303, '榆次区', NULL, '140702', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000304, '介休市', NULL, '140781', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000305, '榆社县', NULL, '140721', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000306, '左权县', NULL, '140722', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000307, '和顺县', NULL, '140723', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000308, '昔阳县', NULL, '140724', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000309, '寿阳县', NULL, '140725', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000310, '太谷县', NULL, '140726', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000311, '祁县', NULL, '140727', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000312, '平遥县', NULL, '140728', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000313, '灵石县', NULL, '140729', 1000302, 3);
INSERT INTO `sys_region` VALUES (1000314, '运城市', NULL, '140800', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000315, '盐湖区', NULL, '140802', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000316, '永济市', NULL, '140881', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000317, '河津市', NULL, '140882', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000318, '临猗县', NULL, '140821', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000319, '万荣县', NULL, '140822', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000320, '闻喜县', NULL, '140823', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000321, '稷山县', NULL, '140824', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000322, '新绛县', NULL, '140825', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000323, '绛县', NULL, '140826', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000324, '垣曲县', NULL, '140827', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000325, '夏县', NULL, '140828', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000326, '平陆县', NULL, '140829', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000327, '芮城县', NULL, '140830', 1000314, 3);
INSERT INTO `sys_region` VALUES (1000328, '忻州市', NULL, '140900', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000329, '忻府区', NULL, '140902', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000330, '原平市', NULL, '140981', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000331, '定襄县', NULL, '140921', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000332, '五台县', NULL, '140922', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000333, '代县', NULL, '140923', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000334, '繁峙县', NULL, '140924', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000335, '宁武县', NULL, '140925', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000336, '静乐县', NULL, '140926', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000337, '神池县', NULL, '140927', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000338, '五寨县', NULL, '140928', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000339, '岢岚县', NULL, '140929', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000340, '河曲县', NULL, '140930', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000341, '保德县', NULL, '140931', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000342, '偏关县', NULL, '140932', 1000328, 3);
INSERT INTO `sys_region` VALUES (1000343, '临汾市', NULL, '141000', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000344, '尧都区', NULL, '141002', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000345, '侯马市', NULL, '141081', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000346, '霍州市', NULL, '141082', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000347, '曲沃县', NULL, '141021', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000348, '翼城县', NULL, '141022', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000349, '襄汾县', NULL, '141023', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000350, '洪洞县', NULL, '141024', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000351, '古县', NULL, '141025', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000352, '安泽县', NULL, '141026', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000353, '浮山县', NULL, '141027', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000354, '吉县', NULL, '141028', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000355, '乡宁县', NULL, '141029', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000356, '大宁县', NULL, '141030', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000357, '隰县', NULL, '141031', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000358, '永和县', NULL, '141032', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000359, '蒲县', NULL, '141033', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000360, '汾西县', NULL, '141034', 1000343, 3);
INSERT INTO `sys_region` VALUES (1000361, '吕梁市', NULL, '141100', 1000003, 2);
INSERT INTO `sys_region` VALUES (1000362, '离石区', NULL, '141102', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000363, '孝义市', NULL, '141181', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000364, '汾阳市', NULL, '141182', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000365, '文水县', NULL, '141121', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000366, '交城县', NULL, '141122', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000367, '兴县', NULL, '141123', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000368, '临县', NULL, '141124', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000369, '柳林县', NULL, '141125', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000370, '石楼县', NULL, '141126', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000371, '岚县', NULL, '141127', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000372, '方山县', NULL, '141128', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000373, '中阳县', NULL, '141129', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000374, '交口县', NULL, '141130', 1000361, 3);
INSERT INTO `sys_region` VALUES (1000375, '呼和浩特市', NULL, '150100', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000376, '新城区', NULL, '150102', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000377, '回民区', NULL, '150103', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000378, '玉泉区', NULL, '150104', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000379, '赛罕区', NULL, '150105', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000380, '托克托县', NULL, '150122', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000381, '和林格尔县', NULL, '150123', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000382, '清水河县', NULL, '150124', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000383, '武川县', NULL, '150125', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000384, '土默特左旗', NULL, '150121', 1000375, 3);
INSERT INTO `sys_region` VALUES (1000385, '包头市', NULL, '150200', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000386, '昆都仑区', NULL, '150203', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000387, '东河区', NULL, '150202', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000388, '青山区', NULL, '150204', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000389, '石拐区', NULL, '150205', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000390, '白云鄂博矿区', NULL, '150206', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000391, '九原区', NULL, '150207', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000392, '固阳县', NULL, '150222', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000393, '土默特右旗', NULL, '150221', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000394, '达尔罕茂明安联合旗', NULL, '150223', 1000385, 3);
INSERT INTO `sys_region` VALUES (1000395, '乌海市', NULL, '150300', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000396, '海勃湾区', NULL, '150302', 1000395, 3);
INSERT INTO `sys_region` VALUES (1000397, '海南区', NULL, '150303', 1000395, 3);
INSERT INTO `sys_region` VALUES (1000398, '乌达区', NULL, '150304', 1000395, 3);
INSERT INTO `sys_region` VALUES (1000399, '赤峰市', NULL, '150400', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000400, '红山区', NULL, '150402', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000401, '元宝山区', NULL, '150403', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000402, '松山区', NULL, '150404', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000403, '林西县', NULL, '150424', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000404, '宁城县', NULL, '150429', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000405, '阿鲁科尔沁旗', NULL, '150421', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000406, '巴林左旗', NULL, '150422', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000407, '巴林右旗', NULL, '150423', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000408, '克什克腾旗', NULL, '150425', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000409, '翁牛特旗', NULL, '150426', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000410, '喀喇沁旗', NULL, '150428', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000411, '敖汉旗', NULL, '150430', 1000399, 3);
INSERT INTO `sys_region` VALUES (1000412, '通辽市', NULL, '150500', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000413, '科尔沁区', NULL, '150502', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000414, '霍林郭勒市', NULL, '150581', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000415, '开鲁县', NULL, '150523', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000416, '库伦旗', NULL, '150524', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000417, '奈曼旗', NULL, '150525', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000418, '扎鲁特旗', NULL, '150526', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000419, '科尔沁左翼中旗', NULL, '150521', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000420, '科尔沁左翼后旗', NULL, '150522', 1000412, 3);
INSERT INTO `sys_region` VALUES (1000421, '鄂尔多斯市', NULL, '150600', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000422, '东胜区', NULL, '150602', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000423, '康巴什区', NULL, '150603', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000424, '达拉特旗', NULL, '150621', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000425, '准格尔旗', NULL, '150622', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000426, '鄂托克前旗', NULL, '150623', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000427, '鄂托克旗', NULL, '150624', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000428, '杭锦旗', NULL, '150625', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000429, '乌审旗', NULL, '150626', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000430, '伊金霍洛旗', NULL, '150627', 1000421, 3);
INSERT INTO `sys_region` VALUES (1000431, '呼伦贝尔市', NULL, '150700', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000432, '海拉尔区', NULL, '150702', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000433, '扎赉诺尔区', NULL, '150703', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000434, '满洲里市', NULL, '150781', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000435, '牙克石市', NULL, '150782', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000436, '扎兰屯市', NULL, '150783', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000437, '额尔古纳市', NULL, '150784', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000438, '根河市', NULL, '150785', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000439, '阿荣旗', NULL, '150721', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000440, '陈巴尔虎旗', NULL, '150725', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000441, '新巴尔虎左旗', NULL, '150726', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000442, '新巴尔虎右旗', NULL, '150727', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000443, '莫力达瓦达斡尔族自治旗', NULL, '150722', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000444, '鄂伦春自治旗', NULL, '150723', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000445, '鄂温克族自治旗', NULL, '150724', 1000431, 3);
INSERT INTO `sys_region` VALUES (1000446, '巴彦淖尔市', NULL, '150800', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000447, '临河区', NULL, '150802', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000448, '五原县', NULL, '150821', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000449, '磴口县', NULL, '150822', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000450, '乌拉特前旗', NULL, '150823', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000451, '乌拉特中旗', NULL, '150824', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000452, '乌拉特后旗', NULL, '150825', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000453, '杭锦后旗', NULL, '150826', 1000446, 3);
INSERT INTO `sys_region` VALUES (1000454, '乌兰察布市', NULL, '150900', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000455, '集宁区', NULL, '150902', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000456, '丰镇市', NULL, '150981', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000457, '卓资县', NULL, '150921', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000458, '化德县', NULL, '150922', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000459, '商都县', NULL, '150923', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000460, '兴和县', NULL, '150924', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000461, '凉城县', NULL, '150925', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000462, '察哈尔右翼前旗', NULL, '150926', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000463, '察哈尔右翼中旗', NULL, '150927', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000464, '察哈尔右翼后旗', NULL, '150928', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000465, '四子王旗', NULL, '150929', 1000454, 3);
INSERT INTO `sys_region` VALUES (1000466, '兴安盟', NULL, '152200', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000467, '乌兰浩特市', NULL, '152201', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000468, '阿尔山市', NULL, '152202', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000469, '突泉县', NULL, '152224', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000470, '科尔沁右翼前旗', NULL, '152221', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000471, '科尔沁右翼中旗', NULL, '152222', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000472, '扎赉特旗', NULL, '152223', 1000466, 3);
INSERT INTO `sys_region` VALUES (1000473, '锡林郭勒盟', NULL, '152500', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000474, '锡林浩特市', NULL, '152502', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000475, '二连浩特市', NULL, '152501', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000476, '多伦县', NULL, '152531', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000477, '阿巴嘎旗', NULL, '152522', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000478, '苏尼特左旗', NULL, '152523', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000479, '苏尼特右旗', NULL, '152524', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000480, '东乌珠穆沁旗', NULL, '152525', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000481, '西乌珠穆沁旗', NULL, '152526', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000482, '太仆寺旗', NULL, '152527', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000483, '镶黄旗', NULL, '152528', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000484, '正镶白旗', NULL, '152529', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000485, '正蓝旗', NULL, '152530', 1000473, 3);
INSERT INTO `sys_region` VALUES (1000486, '阿拉善盟', NULL, '152900', 1000004, 2);
INSERT INTO `sys_region` VALUES (1000487, '阿拉善左旗', NULL, '152921', 1000486, 3);
INSERT INTO `sys_region` VALUES (1000488, '阿拉善右旗', NULL, '152922', 1000486, 3);
INSERT INTO `sys_region` VALUES (1000489, '额济纳旗', NULL, '152923', 1000486, 3);
INSERT INTO `sys_region` VALUES (1000490, '沈阳市', NULL, '210100', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000491, '沈河区', NULL, '210103', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000492, '和平区', NULL, '210102', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000493, '大东区', NULL, '210104', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000494, '皇姑区', NULL, '210105', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000495, '铁西区', NULL, '210106', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000496, '苏家屯区', NULL, '210111', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000497, '浑南区', NULL, '210112', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000498, '沈北新区', NULL, '210113', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000499, '于洪区', NULL, '210114', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000500, '辽中区', NULL, '210115', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000501, '新民市', NULL, '210181', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000502, '康平县', NULL, '210123', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000503, '法库县', NULL, '210124', 1000490, 3);
INSERT INTO `sys_region` VALUES (1000504, '大连市', NULL, '210200', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000505, '西岗区', NULL, '210203', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000506, '中山区', NULL, '210202', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000507, '沙河口区', NULL, '210204', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000508, '甘井子区', NULL, '210211', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000509, '旅顺口区', NULL, '210212', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000510, '金州区', NULL, '210213', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000511, '瓦房店市', NULL, '210281', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000512, '普兰店区', NULL, '210214', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000513, '庄河市', NULL, '210283', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000514, '长海县', NULL, '210224', 1000504, 3);
INSERT INTO `sys_region` VALUES (1000515, '鞍山市', NULL, '210300', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000516, '铁东区', NULL, '210302', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000517, '铁西区', NULL, '210303', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000518, '立山区', NULL, '210304', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000519, '千山区', NULL, '210311', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000520, '海城市', NULL, '210381', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000521, '台安县', NULL, '210321', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000522, '岫岩满族自治县', NULL, '210323', 1000515, 3);
INSERT INTO `sys_region` VALUES (1000523, '抚顺市', NULL, '210400', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000524, '顺城区', NULL, '210411', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000525, '新抚区', NULL, '210402', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000526, '东洲区', NULL, '210403', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000527, '望花区', NULL, '210404', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000528, '抚顺县', NULL, '210421', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000529, '新宾满族自治县', NULL, '210422', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000530, '清原满族自治县', NULL, '210423', 1000523, 3);
INSERT INTO `sys_region` VALUES (1000531, '本溪市', NULL, '210500', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000532, '平山区', NULL, '210502', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000533, '溪湖区', NULL, '210503', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000534, '明山区', NULL, '210504', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000535, '南芬区', NULL, '210505', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000536, '本溪满族自治县', NULL, '210521', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000537, '桓仁满族自治县', NULL, '210522', 1000531, 3);
INSERT INTO `sys_region` VALUES (1000538, '丹东市', NULL, '210600', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000539, '振兴区', NULL, '210603', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000540, '元宝区', NULL, '210602', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000541, '振安区', NULL, '210604', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000542, '东港市', NULL, '210681', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000543, '凤城市', NULL, '210682', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000544, '宽甸满族自治县', NULL, '210624', 1000538, 3);
INSERT INTO `sys_region` VALUES (1000545, '锦州市', NULL, '210700', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000546, '太和区', NULL, '210711', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000547, '古塔区', NULL, '210702', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000548, '凌河区', NULL, '210703', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000549, '凌海市', NULL, '210781', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000550, '北镇市', NULL, '210782', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000551, '黑山县', NULL, '210726', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000552, '义县', NULL, '210727', 1000545, 3);
INSERT INTO `sys_region` VALUES (1000553, '营口市', NULL, '210800', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000554, '站前区', NULL, '210802', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000555, '西市区', NULL, '210803', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000556, '鲅鱼圈区', NULL, '210804', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000557, '老边区', NULL, '210811', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000558, '盖州市', NULL, '210881', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000559, '大石桥市', NULL, '210882', 1000553, 3);
INSERT INTO `sys_region` VALUES (1000560, '阜新市', NULL, '210900', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000561, '细河区', NULL, '210911', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000562, '海州区', NULL, '210902', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000563, '新邱区', NULL, '210903', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000564, '太平区', NULL, '210904', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000565, '清河门区', NULL, '210905', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000566, '彰武县', NULL, '210922', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000567, '阜新蒙古族自治县', NULL, '210921', 1000560, 3);
INSERT INTO `sys_region` VALUES (1000568, '辽阳市', NULL, '211000', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000569, '白塔区', NULL, '211002', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000570, '文圣区', NULL, '211003', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000571, '宏伟区', NULL, '211004', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000572, '弓长岭区', NULL, '211005', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000573, '太子河区', NULL, '211011', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000574, '灯塔市', NULL, '211081', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000575, '辽阳县', NULL, '211021', 1000568, 3);
INSERT INTO `sys_region` VALUES (1000576, '盘锦市', NULL, '211100', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000577, '兴隆台区', NULL, '211103', 1000576, 3);
INSERT INTO `sys_region` VALUES (1000578, '双台子区', NULL, '211102', 1000576, 3);
INSERT INTO `sys_region` VALUES (1000579, '大洼区', NULL, '211104', 1000576, 3);
INSERT INTO `sys_region` VALUES (1000580, '盘山县', NULL, '211122', 1000576, 3);
INSERT INTO `sys_region` VALUES (1000581, '铁岭市', NULL, '211200', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000582, '银州区', NULL, '211202', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000583, '清河区', NULL, '211204', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000584, '调兵山市', NULL, '211281', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000585, '开原市', NULL, '211282', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000586, '铁岭县', NULL, '211221', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000587, '西丰县', NULL, '211223', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000588, '昌图县', NULL, '211224', 1000581, 3);
INSERT INTO `sys_region` VALUES (1000589, '朝阳市', NULL, '211300', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000590, '双塔区', NULL, '211302', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000591, '龙城区', NULL, '211303', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000592, '北票市', NULL, '211381', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000593, '凌源市', NULL, '211382', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000594, '朝阳县', NULL, '211321', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000595, '建平县', NULL, '211322', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000596, '喀喇沁左翼蒙古族自治县', NULL, '211324', 1000589, 3);
INSERT INTO `sys_region` VALUES (1000597, '葫芦岛市', NULL, '211400', 1000005, 2);
INSERT INTO `sys_region` VALUES (1000598, '龙港区', NULL, '211403', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000599, '连山区', NULL, '211402', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000600, '南票区', NULL, '211404', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000601, '兴城市', NULL, '211481', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000602, '绥中县', NULL, '211421', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000603, '建昌县', NULL, '211422', 1000597, 3);
INSERT INTO `sys_region` VALUES (1000604, '长春市', NULL, '220100', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000605, '南关区', NULL, '220102', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000606, '宽城区', NULL, '220103', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000607, '朝阳区', NULL, '220104', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000608, '二道区', NULL, '220105', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000609, '绿园区', NULL, '220106', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000610, '双阳区', NULL, '220112', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000611, '九台区', NULL, '220113', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000612, '榆树市', NULL, '220182', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000613, '德惠市', NULL, '220183', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000614, '农安县', NULL, '220122', 1000604, 3);
INSERT INTO `sys_region` VALUES (1000615, '吉林市', NULL, '220200', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000616, '船营区', NULL, '220204', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000617, '昌邑区', NULL, '220202', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000618, '龙潭区', NULL, '220203', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000619, '丰满区', NULL, '220211', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000620, '蛟河市', NULL, '220281', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000621, '桦甸市', NULL, '220282', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000622, '舒兰市', NULL, '220283', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000623, '磐石市', NULL, '220284', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000624, '永吉县', NULL, '220221', 1000615, 3);
INSERT INTO `sys_region` VALUES (1000625, '四平市', NULL, '220300', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000626, '铁西区', NULL, '220302', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000627, '铁东区', NULL, '220303', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000628, '公主岭市', NULL, '220381', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000629, '双辽市', NULL, '220382', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000630, '梨树县', NULL, '220322', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000631, '伊通满族自治县', NULL, '220323', 1000625, 3);
INSERT INTO `sys_region` VALUES (1000632, '辽源市', NULL, '220400', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000633, '龙山区', NULL, '220402', 1000632, 3);
INSERT INTO `sys_region` VALUES (1000634, '西安区', NULL, '220403', 1000632, 3);
INSERT INTO `sys_region` VALUES (1000635, '东丰县', NULL, '220421', 1000632, 3);
INSERT INTO `sys_region` VALUES (1000636, '东辽县', NULL, '220422', 1000632, 3);
INSERT INTO `sys_region` VALUES (1000637, '通化市', NULL, '220500', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000638, '东昌区', NULL, '220502', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000639, '二道江区', NULL, '220503', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000640, '梅河口市', NULL, '220581', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000641, '集安市', NULL, '220582', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000642, '通化县', NULL, '220521', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000643, '辉南县', NULL, '220523', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000644, '柳河县', NULL, '220524', 1000637, 3);
INSERT INTO `sys_region` VALUES (1000645, '白山市', NULL, '220600', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000646, '浑江区', NULL, '220602', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000647, '江源区', NULL, '220605', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000648, '临江市', NULL, '220681', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000649, '抚松县', NULL, '220621', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000650, '靖宇县', NULL, '220622', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000651, '长白朝鲜族自治县', NULL, '220623', 1000645, 3);
INSERT INTO `sys_region` VALUES (1000652, '松原市', NULL, '220700', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000653, '宁江区', NULL, '220702', 1000652, 3);
INSERT INTO `sys_region` VALUES (1000654, '扶余市', NULL, '220781', 1000652, 3);
INSERT INTO `sys_region` VALUES (1000655, '长岭县', NULL, '220722', 1000652, 3);
INSERT INTO `sys_region` VALUES (1000656, '乾安县', NULL, '220723', 1000652, 3);
INSERT INTO `sys_region` VALUES (1000657, '前郭尔罗斯蒙古族自治县', NULL, '220721', 1000652, 3);
INSERT INTO `sys_region` VALUES (1000658, '白城市', NULL, '220800', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000659, '洮北区', NULL, '220802', 1000658, 3);
INSERT INTO `sys_region` VALUES (1000660, '洮南市', NULL, '220881', 1000658, 3);
INSERT INTO `sys_region` VALUES (1000661, '大安市', NULL, '220882', 1000658, 3);
INSERT INTO `sys_region` VALUES (1000662, '镇赉县', NULL, '220821', 1000658, 3);
INSERT INTO `sys_region` VALUES (1000663, '通榆县', NULL, '220822', 1000658, 3);
INSERT INTO `sys_region` VALUES (1000664, '延边朝鲜族自治州', NULL, '222400', 1000006, 2);
INSERT INTO `sys_region` VALUES (1000665, '延吉市', NULL, '222401', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000666, '图们市', NULL, '222402', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000667, '敦化市', NULL, '222403', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000668, '珲春市', NULL, '222404', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000669, '龙井市', NULL, '222405', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000670, '和龙市', NULL, '222406', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000671, '汪清县', NULL, '222424', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000672, '安图县', NULL, '222426', 1000664, 3);
INSERT INTO `sys_region` VALUES (1000673, '哈尔滨市', NULL, '230100', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000674, '松北区', NULL, '230109', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000675, '道里区', NULL, '230102', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000676, '南岗区', NULL, '230103', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000677, '道外区', NULL, '230104', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000678, '平房区', NULL, '230108', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000679, '香坊区', NULL, '230110', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000680, '呼兰区', NULL, '230111', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000681, '阿城区', NULL, '230112', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000682, '双城区', NULL, '230113', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000683, '尚志市', NULL, '230183', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000684, '五常市', NULL, '230184', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000685, '依兰县', NULL, '230123', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000686, '方正县', NULL, '230124', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000687, '宾县', NULL, '230125', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000688, '巴彦县', NULL, '230126', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000689, '木兰县', NULL, '230127', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000690, '通河县', NULL, '230128', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000691, '延寿县', NULL, '230129', 1000673, 3);
INSERT INTO `sys_region` VALUES (1000692, '齐齐哈尔市', NULL, '230200', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000693, '建华区', NULL, '230203', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000694, '龙沙区', NULL, '230202', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000695, '铁锋区', NULL, '230204', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000696, '昂昂溪区', NULL, '230205', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000697, '富拉尔基区', NULL, '230206', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000698, '碾子山区', NULL, '230207', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000699, '梅里斯达斡尔族区', NULL, '230208', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000700, '讷河市', NULL, '230281', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000701, '龙江县', NULL, '230221', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000702, '依安县', NULL, '230223', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000703, '泰来县', NULL, '230224', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000704, '甘南县', NULL, '230225', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000705, '富裕县', NULL, '230227', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000706, '克山县', NULL, '230229', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000707, '克东县', NULL, '230230', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000708, '拜泉县', NULL, '230231', 1000692, 3);
INSERT INTO `sys_region` VALUES (1000709, '鸡西市', NULL, '230300', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000710, '鸡冠区', NULL, '230302', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000711, '恒山区', NULL, '230303', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000712, '滴道区', NULL, '230304', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000713, '梨树区', NULL, '230305', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000714, '城子河区', NULL, '230306', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000715, '麻山区', NULL, '230307', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000716, '虎林市', NULL, '230381', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000717, '密山市', NULL, '230382', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000718, '鸡东县', NULL, '230321', 1000709, 3);
INSERT INTO `sys_region` VALUES (1000719, '鹤岗市', NULL, '230400', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000720, '向阳区', NULL, '230402', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000721, '工农区', NULL, '230403', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000722, '南山区', NULL, '230404', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000723, '兴安区', NULL, '230405', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000724, '东山区', NULL, '230406', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000725, '兴山区', NULL, '230407', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000726, '萝北县', NULL, '230421', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000727, '绥滨县', NULL, '230422', 1000719, 3);
INSERT INTO `sys_region` VALUES (1000728, '双鸭山市', NULL, '230500', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000729, '尖山区', NULL, '230502', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000730, '岭东区', NULL, '230503', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000731, '四方台区', NULL, '230505', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000732, '宝山区', NULL, '230506', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000733, '集贤县', NULL, '230521', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000734, '友谊县', NULL, '230522', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000735, '宝清县', NULL, '230523', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000736, '饶河县', NULL, '230524', 1000728, 3);
INSERT INTO `sys_region` VALUES (1000737, '大庆市', NULL, '230600', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000738, '萨尔图区', NULL, '230602', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000739, '龙凤区', NULL, '230603', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000740, '让胡路区', NULL, '230604', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000741, '红岗区', NULL, '230605', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000742, '大同区', NULL, '230606', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000743, '肇州县', NULL, '230621', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000744, '肇源县', NULL, '230622', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000745, '林甸县', NULL, '230623', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000746, '杜尔伯特蒙古族自治县', NULL, '230624', 1000737, 3);
INSERT INTO `sys_region` VALUES (1000747, '伊春市', NULL, '230700', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000748, '伊春区', NULL, '230702', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000749, '南岔区', NULL, '230703', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000750, '友好区', NULL, '230704', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000751, '西林区', NULL, '230705', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000752, '翠峦区', NULL, '230706', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000753, '新青区', NULL, '230707', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000754, '美溪区', NULL, '230708', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000755, '金山屯区', NULL, '230709', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000756, '五营区', NULL, '230710', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000757, '乌马河区', NULL, '230711', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000758, '汤旺河区', NULL, '230712', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000759, '带岭区', NULL, '230713', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000760, '乌伊岭区', NULL, '230714', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000761, '红星区', NULL, '230715', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000762, '上甘岭区', NULL, '230716', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000763, '铁力市', NULL, '230781', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000764, '嘉荫县', NULL, '230722', 1000747, 3);
INSERT INTO `sys_region` VALUES (1000765, '佳木斯市', NULL, '230800', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000766, '前进区', NULL, '230804', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000767, '向阳区', NULL, '230803', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000768, '东风区', NULL, '230805', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000769, '郊区', NULL, '230811', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000770, '同江市', NULL, '230881', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000771, '富锦市', NULL, '230882', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000772, '抚远市', NULL, '230883', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000773, '桦南县', NULL, '230822', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000774, '桦川县', NULL, '230826', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000775, '汤原县', NULL, '230828', 1000765, 3);
INSERT INTO `sys_region` VALUES (1000776, '七台河市', NULL, '230900', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000777, '桃山区', NULL, '230903', 1000776, 3);
INSERT INTO `sys_region` VALUES (1000778, '新兴区', NULL, '230902', 1000776, 3);
INSERT INTO `sys_region` VALUES (1000779, '茄子河区', NULL, '230904', 1000776, 3);
INSERT INTO `sys_region` VALUES (1000780, '勃利县', NULL, '230921', 1000776, 3);
INSERT INTO `sys_region` VALUES (1000781, '牡丹江市', NULL, '231000', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000782, '东安区', NULL, '231002', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000783, '阳明区', NULL, '231003', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000784, '爱民区', NULL, '231004', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000785, '西安区', NULL, '231005', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000786, '绥芬河市', NULL, '231081', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000787, '海林市', NULL, '231083', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000788, '宁安市', NULL, '231084', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000789, '穆棱市', NULL, '231085', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000790, '东宁市', NULL, '231086', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000791, '林口县', NULL, '231025', 1000781, 3);
INSERT INTO `sys_region` VALUES (1000792, '黑河市', NULL, '231100', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000793, '爱辉区', NULL, '231102', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000794, '北安市', NULL, '231181', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000795, '五大连池市', NULL, '231182', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000796, '嫩江县', NULL, '231121', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000797, '逊克县', NULL, '231123', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000798, '孙吴县', NULL, '231124', 1000792, 3);
INSERT INTO `sys_region` VALUES (1000799, '绥化市', NULL, '231200', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000800, '北林区', NULL, '231202', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000801, '安达市', NULL, '231281', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000802, '肇东市', NULL, '231282', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000803, '海伦市', NULL, '231283', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000804, '望奎县', NULL, '231221', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000805, '兰西县', NULL, '231222', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000806, '青冈县', NULL, '231223', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000807, '庆安县', NULL, '231224', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000808, '明水县', NULL, '231225', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000809, '绥棱县', NULL, '231226', 1000799, 3);
INSERT INTO `sys_region` VALUES (1000810, '大兴安岭地区', NULL, '232700', 1000007, 2);
INSERT INTO `sys_region` VALUES (1000811, '呼玛县', NULL, '232721', 1000810, 3);
INSERT INTO `sys_region` VALUES (1000812, '塔河县', NULL, '232722', 1000810, 3);
INSERT INTO `sys_region` VALUES (1000813, '漠河县', NULL, '232723', 1000810, 3);
INSERT INTO `sys_region` VALUES (1000814, '黄浦区', NULL, '310101', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000815, '徐汇区', NULL, '310104', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000816, '长宁区', NULL, '310105', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000817, '静安区', NULL, '310106', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000818, '普陀区', NULL, '310107', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000819, '虹口区', NULL, '310109', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000820, '杨浦区', NULL, '310110', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000821, '闵行区', NULL, '310112', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000822, '宝山区', NULL, '310113', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000823, '嘉定区', NULL, '310114', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000824, '浦东新区', NULL, '310115', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000825, '金山区', NULL, '310116', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000826, '松江区', NULL, '310117', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000827, '青浦区', NULL, '310118', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000828, '奉贤区', NULL, '310120', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000829, '崇明区', NULL, '310151', 1000008, 2);
INSERT INTO `sys_region` VALUES (1000830, '南京市', NULL, '320100', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000831, '玄武区', NULL, '320102', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000832, '秦淮区', NULL, '320104', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000833, '建邺区', NULL, '320105', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000834, '鼓楼区', NULL, '320106', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000835, '浦口区', NULL, '320111', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000836, '栖霞区', NULL, '320113', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000837, '雨花台区', NULL, '320114', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000838, '江宁区', NULL, '320115', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000839, '六合区', NULL, '320116', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000840, '溧水区', NULL, '320117', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000841, '高淳区', NULL, '320118', 1000830, 3);
INSERT INTO `sys_region` VALUES (1000842, '无锡市', NULL, '320200', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000843, '锡山区', NULL, '320205', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000844, '惠山区', NULL, '320206', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000845, '滨湖区', NULL, '320211', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000846, '梁溪区', NULL, '320213', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000847, '新吴区', NULL, '320214', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000848, '江阴市', NULL, '320281', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000849, '宜兴市', NULL, '320282', 1000842, 3);
INSERT INTO `sys_region` VALUES (1000850, '徐州市', NULL, '320300', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000851, '云龙区', NULL, '320303', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000852, '鼓楼区', NULL, '320302', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000853, '贾汪区', NULL, '320305', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000854, '泉山区', NULL, '320311', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000855, '铜山区', NULL, '320312', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000856, '新沂市', NULL, '320381', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000857, '邳州市', NULL, '320382', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000858, '丰县', NULL, '320321', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000859, '沛县', NULL, '320322', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000860, '睢宁县', NULL, '320324', 1000850, 3);
INSERT INTO `sys_region` VALUES (1000861, '常州市', NULL, '320400', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000862, '新北区', NULL, '320411', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000863, '天宁区', NULL, '320402', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000864, '钟楼区', NULL, '320404', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000865, '武进区', NULL, '320412', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000866, '金坛区', NULL, '320413', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000867, '溧阳市', NULL, '320481', 1000861, 3);
INSERT INTO `sys_region` VALUES (1000868, '苏州市', NULL, '320500', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000869, '姑苏区', NULL, '320508', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000870, '虎丘区', NULL, '320505', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000871, '吴中区', NULL, '320506', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000872, '相城区', NULL, '320507', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000873, '吴江区', NULL, '320509', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000874, '常熟市', NULL, '320581', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000875, '张家港市', NULL, '320582', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000876, '昆山市', NULL, '320583', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000877, '太仓市', NULL, '320585', 1000868, 3);
INSERT INTO `sys_region` VALUES (1000878, '南通市', NULL, '320600', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000879, '崇川区', NULL, '320602', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000880, '港闸区', NULL, '320611', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000881, '通州区', NULL, '320612', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000882, '启东市', NULL, '320681', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000883, '如皋市', NULL, '320682', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000884, '海门市', NULL, '320684', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000885, '海安县', NULL, '320621', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000886, '如东县', NULL, '320623', 1000878, 3);
INSERT INTO `sys_region` VALUES (1000887, '连云港市', NULL, '320700', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000888, '海州区', NULL, '320706', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000889, '连云区', NULL, '320703', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000890, '赣榆区', NULL, '320707', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000891, '东海县', NULL, '320722', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000892, '灌云县', NULL, '320723', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000893, '灌南县', NULL, '320724', 1000887, 3);
INSERT INTO `sys_region` VALUES (1000894, '淮安市', NULL, '320800', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000895, '淮安区', NULL, '320803', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000896, '淮阴区', NULL, '320804', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000897, '清江浦区', NULL, '320812', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000898, '洪泽区', NULL, '320813', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000899, '涟水县', NULL, '320826', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000900, '盱眙县', NULL, '320830', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000901, '金湖县', NULL, '320831', 1000894, 3);
INSERT INTO `sys_region` VALUES (1000902, '盐城市', NULL, '320900', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000903, '亭湖区', NULL, '320902', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000904, '盐都区', NULL, '320903', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000905, '大丰区', NULL, '320904', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000906, '东台市', NULL, '320981', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000907, '响水县', NULL, '320921', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000908, '滨海县', NULL, '320922', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000909, '阜宁县', NULL, '320923', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000910, '射阳县', NULL, '320924', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000911, '建湖县', NULL, '320925', 1000902, 3);
INSERT INTO `sys_region` VALUES (1000912, '扬州市', NULL, '321000', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000913, '邗江区', NULL, '321003', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000914, '广陵区', NULL, '321002', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000915, '江都区', NULL, '321012', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000916, '仪征市', NULL, '321081', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000917, '高邮市', NULL, '321084', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000918, '宝应县', NULL, '321023', 1000912, 3);
INSERT INTO `sys_region` VALUES (1000919, '镇江市', NULL, '321100', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000920, '京口区', NULL, '321102', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000921, '润州区', NULL, '321111', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000922, '丹徒区', NULL, '321112', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000923, '丹阳市', NULL, '321181', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000924, '扬中市', NULL, '321182', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000925, '句容市', NULL, '321183', 1000919, 3);
INSERT INTO `sys_region` VALUES (1000926, '泰州市', NULL, '321200', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000927, '海陵区', NULL, '321202', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000928, '高港区', NULL, '321203', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000929, '姜堰区', NULL, '321204', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000930, '兴化市', NULL, '321281', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000931, '靖江市', NULL, '321282', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000932, '泰兴市', NULL, '321283', 1000926, 3);
INSERT INTO `sys_region` VALUES (1000933, '宿迁市', NULL, '321300', 1000009, 2);
INSERT INTO `sys_region` VALUES (1000934, '宿城区', NULL, '321302', 1000933, 3);
INSERT INTO `sys_region` VALUES (1000935, '宿豫区', NULL, '321311', 1000933, 3);
INSERT INTO `sys_region` VALUES (1000936, '沭阳县', NULL, '321322', 1000933, 3);
INSERT INTO `sys_region` VALUES (1000937, '泗阳县', NULL, '321323', 1000933, 3);
INSERT INTO `sys_region` VALUES (1000938, '泗洪县', NULL, '321324', 1000933, 3);
INSERT INTO `sys_region` VALUES (1000939, '杭州市', NULL, '330100', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000940, '拱墅区', NULL, '330105', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000941, '上城区', NULL, '330102', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000942, '下城区', NULL, '330103', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000943, '江干区', NULL, '330104', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000944, '西湖区', NULL, '330106', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000945, '滨江区', NULL, '330108', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000946, '萧山区', NULL, '330109', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000947, '余杭区', NULL, '330110', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000948, '富阳区', NULL, '330111', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000949, '临安区', NULL, '330112', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000950, '建德市', NULL, '330182', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000951, '桐庐县', NULL, '330122', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000952, '淳安县', NULL, '330127', 1000939, 3);
INSERT INTO `sys_region` VALUES (1000953, '宁波市', NULL, '330200', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000954, '海曙区', NULL, '330203', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000955, '江北区', NULL, '330205', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000956, '北仑区', NULL, '330206', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000957, '镇海区', NULL, '330211', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000958, '鄞州区', NULL, '330212', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000959, '奉化区', NULL, '330213', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000960, '余姚市', NULL, '330281', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000961, '慈溪市', NULL, '330282', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000962, '象山县', NULL, '330225', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000963, '宁海县', NULL, '330226', 1000953, 3);
INSERT INTO `sys_region` VALUES (1000964, '温州市', NULL, '330300', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000965, '鹿城区', NULL, '330302', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000966, '龙湾区', NULL, '330303', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000967, '瓯海区', NULL, '330304', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000968, '洞头区', NULL, '330305', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000969, '瑞安市', NULL, '330381', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000970, '乐清市', NULL, '330382', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000971, '永嘉县', NULL, '330324', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000972, '平阳县', NULL, '330326', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000973, '苍南县', NULL, '330327', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000974, '文成县', NULL, '330328', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000975, '泰顺县', NULL, '330329', 1000964, 3);
INSERT INTO `sys_region` VALUES (1000976, '嘉兴市', NULL, '330400', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000977, '南湖区', NULL, '330402', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000978, '秀洲区', NULL, '330411', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000979, '海宁市', NULL, '330481', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000980, '平湖市', NULL, '330482', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000981, '桐乡市', NULL, '330483', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000982, '嘉善县', NULL, '330421', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000983, '海盐县', NULL, '330424', 1000976, 3);
INSERT INTO `sys_region` VALUES (1000984, '湖州市', NULL, '330500', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000985, '吴兴区', NULL, '330502', 1000984, 3);
INSERT INTO `sys_region` VALUES (1000986, '南浔区', NULL, '330503', 1000984, 3);
INSERT INTO `sys_region` VALUES (1000987, '德清县', NULL, '330521', 1000984, 3);
INSERT INTO `sys_region` VALUES (1000988, '长兴县', NULL, '330522', 1000984, 3);
INSERT INTO `sys_region` VALUES (1000989, '安吉县', NULL, '330523', 1000984, 3);
INSERT INTO `sys_region` VALUES (1000990, '绍兴市', NULL, '330600', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000991, '越城区', NULL, '330602', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000992, '柯桥区', NULL, '330603', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000993, '上虞区', NULL, '330604', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000994, '诸暨市', NULL, '330681', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000995, '嵊州市', NULL, '330683', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000996, '新昌县', NULL, '330624', 1000990, 3);
INSERT INTO `sys_region` VALUES (1000997, '金华市', NULL, '330700', 1000010, 2);
INSERT INTO `sys_region` VALUES (1000998, '婺城区', NULL, '330702', 1000997, 3);
INSERT INTO `sys_region` VALUES (1000999, '金东区', NULL, '330703', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001000, '兰溪市', NULL, '330781', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001001, '义乌市', NULL, '330782', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001002, '东阳市', NULL, '330783', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001003, '永康市', NULL, '330784', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001004, '武义县', NULL, '330723', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001005, '浦江县', NULL, '330726', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001006, '磐安县', NULL, '330727', 1000997, 3);
INSERT INTO `sys_region` VALUES (1001007, '衢州市', NULL, '330800', 1000010, 2);
INSERT INTO `sys_region` VALUES (1001008, '柯城区', NULL, '330802', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001009, '衢江区', NULL, '330803', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001010, '江山市', NULL, '330881', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001011, '常山县', NULL, '330822', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001012, '开化县', NULL, '330824', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001013, '龙游县', NULL, '330825', 1001007, 3);
INSERT INTO `sys_region` VALUES (1001014, '舟山市', NULL, '330900', 1000010, 2);
INSERT INTO `sys_region` VALUES (1001015, '定海区', NULL, '330902', 1001014, 3);
INSERT INTO `sys_region` VALUES (1001016, '普陀区', NULL, '330903', 1001014, 3);
INSERT INTO `sys_region` VALUES (1001017, '岱山县', NULL, '330921', 1001014, 3);
INSERT INTO `sys_region` VALUES (1001018, '嵊泗县', NULL, '330922', 1001014, 3);
INSERT INTO `sys_region` VALUES (1001019, '台州市', NULL, '331000', 1000010, 2);
INSERT INTO `sys_region` VALUES (1001020, '椒江区', NULL, '331002', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001021, '黄岩区', NULL, '331003', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001022, '路桥区', NULL, '331004', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001023, '温岭市', NULL, '331081', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001024, '临海市', NULL, '331082', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001025, '玉环市', NULL, '331083', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001026, '三门县', NULL, '331022', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001027, '天台县', NULL, '331023', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001028, '仙居县', NULL, '331024', 1001019, 3);
INSERT INTO `sys_region` VALUES (1001029, '丽水市', NULL, '331100', 1000010, 2);
INSERT INTO `sys_region` VALUES (1001030, '莲都区', NULL, '331102', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001031, '龙泉市', NULL, '331181', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001032, '青田县', NULL, '331121', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001033, '缙云县', NULL, '331122', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001034, '遂昌县', NULL, '331123', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001035, '松阳县', NULL, '331124', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001036, '云和县', NULL, '331125', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001037, '庆元县', NULL, '331126', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001038, '景宁畲族自治县', NULL, '331127', 1001029, 3);
INSERT INTO `sys_region` VALUES (1001039, '合肥市', NULL, '340100', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001040, '蜀山区', NULL, '340104', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001041, '瑶海区', NULL, '340102', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001042, '庐阳区', NULL, '340103', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001043, '包河区', NULL, '340111', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001044, '巢湖市', NULL, '340181', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001045, '长丰县', NULL, '340121', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001046, '肥东县', NULL, '340122', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001047, '肥西县', NULL, '340123', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001048, '庐江县', NULL, '340124', 1001039, 3);
INSERT INTO `sys_region` VALUES (1001049, '芜湖市', NULL, '340200', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001050, '鸠江区', NULL, '340207', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001051, '镜湖区', NULL, '340202', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001052, '弋江区', NULL, '340203', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001053, '三山区', NULL, '340208', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001054, '芜湖县', NULL, '340221', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001055, '繁昌县', NULL, '340222', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001056, '南陵县', NULL, '340223', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001057, '无为县', NULL, '340225', 1001049, 3);
INSERT INTO `sys_region` VALUES (1001058, '蚌埠市', NULL, '340300', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001059, '蚌山区', NULL, '340303', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001060, '龙子湖区', NULL, '340302', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001061, '禹会区', NULL, '340304', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001062, '淮上区', NULL, '340311', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001063, '怀远县', NULL, '340321', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001064, '五河县', NULL, '340322', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001065, '固镇县', NULL, '340323', 1001058, 3);
INSERT INTO `sys_region` VALUES (1001066, '淮南市', NULL, '340400', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001067, '田家庵区', NULL, '340403', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001068, '大通区', NULL, '340402', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001069, '谢家集区', NULL, '340404', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001070, '八公山区', NULL, '340405', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001071, '潘集区', NULL, '340406', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001072, '凤台县', NULL, '340421', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001073, '寿县', NULL, '340422', 1001066, 3);
INSERT INTO `sys_region` VALUES (1001074, '马鞍山市', NULL, '340500', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001075, '雨山区', NULL, '340504', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001076, '花山区', NULL, '340503', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001077, '博望区', NULL, '340506', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001078, '当涂县', NULL, '340521', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001079, '含山县', NULL, '340522', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001080, '和县', NULL, '340523', 1001074, 3);
INSERT INTO `sys_region` VALUES (1001081, '淮北市', NULL, '340600', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001082, '相山区', NULL, '340603', 1001081, 3);
INSERT INTO `sys_region` VALUES (1001083, '杜集区', NULL, '340602', 1001081, 3);
INSERT INTO `sys_region` VALUES (1001084, '烈山区', NULL, '340604', 1001081, 3);
INSERT INTO `sys_region` VALUES (1001085, '濉溪县', NULL, '340621', 1001081, 3);
INSERT INTO `sys_region` VALUES (1001086, '铜陵市', NULL, '340700', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001087, '铜官区', NULL, '340705', 1001086, 3);
INSERT INTO `sys_region` VALUES (1001088, '义安区', NULL, '340706', 1001086, 3);
INSERT INTO `sys_region` VALUES (1001089, '郊区', NULL, '340711', 1001086, 3);
INSERT INTO `sys_region` VALUES (1001090, '枞阳县', NULL, '340722', 1001086, 3);
INSERT INTO `sys_region` VALUES (1001091, '安庆市', NULL, '340800', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001092, '大观区', NULL, '340803', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001093, '迎江区', NULL, '340802', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001094, '宜秀区', NULL, '340811', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001095, '桐城市', NULL, '340881', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001096, '怀宁县', NULL, '340822', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001097, '潜山县', NULL, '340824', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001098, '太湖县', NULL, '340825', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001099, '宿松县', NULL, '340826', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001100, '望江县', NULL, '340827', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001101, '岳西县', NULL, '340828', 1001091, 3);
INSERT INTO `sys_region` VALUES (1001102, '黄山市', NULL, '341000', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001103, '屯溪区', NULL, '341002', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001104, '黄山区', NULL, '341003', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001105, '徽州区', NULL, '341004', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001106, '歙县', NULL, '341021', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001107, '休宁县', NULL, '341022', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001108, '黟县', NULL, '341023', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001109, '祁门县', NULL, '341024', 1001102, 3);
INSERT INTO `sys_region` VALUES (1001110, '滁州市', NULL, '341100', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001111, '琅琊区', NULL, '341102', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001112, '南谯区', NULL, '341103', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001113, '天长市', NULL, '341181', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001114, '明光市', NULL, '341182', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001115, '来安县', NULL, '341122', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001116, '全椒县', NULL, '341124', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001117, '定远县', NULL, '341125', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001118, '凤阳县', NULL, '341126', 1001110, 3);
INSERT INTO `sys_region` VALUES (1001119, '阜阳市', NULL, '341200', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001120, '颍州区', NULL, '341202', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001121, '颍东区', NULL, '341203', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001122, '颍泉区', NULL, '341204', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001123, '界首市', NULL, '341282', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001124, '临泉县', NULL, '341221', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001125, '太和县', NULL, '341222', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001126, '阜南县', NULL, '341225', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001127, '颍上县', NULL, '341226', 1001119, 3);
INSERT INTO `sys_region` VALUES (1001128, '宿州市', NULL, '341300', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001129, '埇桥区', NULL, '341302', 1001128, 3);
INSERT INTO `sys_region` VALUES (1001130, '砀山县', NULL, '341321', 1001128, 3);
INSERT INTO `sys_region` VALUES (1001131, '萧县', NULL, '341322', 1001128, 3);
INSERT INTO `sys_region` VALUES (1001132, '灵璧县', NULL, '341323', 1001128, 3);
INSERT INTO `sys_region` VALUES (1001133, '泗县', NULL, '341324', 1001128, 3);
INSERT INTO `sys_region` VALUES (1001134, '六安市', NULL, '341500', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001135, '金安区', NULL, '341502', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001136, '裕安区', NULL, '341503', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001137, '叶集区', NULL, '341504', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001138, '霍邱县', NULL, '341522', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001139, '舒城县', NULL, '341523', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001140, '金寨县', NULL, '341524', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001141, '霍山县', NULL, '341525', 1001134, 3);
INSERT INTO `sys_region` VALUES (1001142, '亳州市', NULL, '341600', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001143, '谯城区', NULL, '341602', 1001142, 3);
INSERT INTO `sys_region` VALUES (1001144, '涡阳县', NULL, '341621', 1001142, 3);
INSERT INTO `sys_region` VALUES (1001145, '蒙城县', NULL, '341622', 1001142, 3);
INSERT INTO `sys_region` VALUES (1001146, '利辛县', NULL, '341623', 1001142, 3);
INSERT INTO `sys_region` VALUES (1001147, '池州市', NULL, '341700', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001148, '贵池区', NULL, '341702', 1001147, 3);
INSERT INTO `sys_region` VALUES (1001149, '东至县', NULL, '341721', 1001147, 3);
INSERT INTO `sys_region` VALUES (1001150, '石台县', NULL, '341722', 1001147, 3);
INSERT INTO `sys_region` VALUES (1001151, '青阳县', NULL, '341723', 1001147, 3);
INSERT INTO `sys_region` VALUES (1001152, '宣城市', NULL, '341800', 1000011, 2);
INSERT INTO `sys_region` VALUES (1001153, '宣州区', NULL, '341802', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001154, '宁国市', NULL, '341881', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001155, '郎溪县', NULL, '341821', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001156, '广德县', NULL, '341822', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001157, '泾县', NULL, '341823', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001158, '绩溪县', NULL, '341824', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001159, '旌德县', NULL, '341825', 1001152, 3);
INSERT INTO `sys_region` VALUES (1001160, '福州市', NULL, '350100', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001161, '鼓楼区', NULL, '350102', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001162, '台江区', NULL, '350103', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001163, '仓山区', NULL, '350104', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001164, '马尾区', NULL, '350105', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001165, '晋安区', NULL, '350111', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001166, '长乐区', NULL, '350112', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001167, '福清市', NULL, '350181', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001168, '闽侯县', NULL, '350121', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001169, '连江县', NULL, '350122', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001170, '罗源县', NULL, '350123', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001171, '闽清县', NULL, '350124', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001172, '永泰县', NULL, '350125', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001173, '平潭县', NULL, '350128', 1001160, 3);
INSERT INTO `sys_region` VALUES (1001174, '厦门市', NULL, '350200', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001175, '思明区', NULL, '350203', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001176, '海沧区', NULL, '350205', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001177, '湖里区', NULL, '350206', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001178, '集美区', NULL, '350211', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001179, '同安区', NULL, '350212', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001180, '翔安区', NULL, '350213', 1001174, 3);
INSERT INTO `sys_region` VALUES (1001181, '莆田市', NULL, '350300', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001182, '城厢区', NULL, '350302', 1001181, 3);
INSERT INTO `sys_region` VALUES (1001183, '涵江区', NULL, '350303', 1001181, 3);
INSERT INTO `sys_region` VALUES (1001184, '荔城区', NULL, '350304', 1001181, 3);
INSERT INTO `sys_region` VALUES (1001185, '秀屿区', NULL, '350305', 1001181, 3);
INSERT INTO `sys_region` VALUES (1001186, '仙游县', NULL, '350322', 1001181, 3);
INSERT INTO `sys_region` VALUES (1001187, '三明市', NULL, '350400', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001188, '梅列区', NULL, '350402', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001189, '三元区', NULL, '350403', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001190, '永安市', NULL, '350481', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001191, '明溪县', NULL, '350421', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001192, '清流县', NULL, '350423', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001193, '宁化县', NULL, '350424', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001194, '大田县', NULL, '350425', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001195, '尤溪县', NULL, '350426', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001196, '沙县', NULL, '350427', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001197, '将乐县', NULL, '350428', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001198, '泰宁县', NULL, '350429', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001199, '建宁县', NULL, '350430', 1001187, 3);
INSERT INTO `sys_region` VALUES (1001200, '泉州市', NULL, '350500', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001201, '丰泽区', NULL, '350503', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001202, '鲤城区', NULL, '350502', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001203, '洛江区', NULL, '350504', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001204, '泉港区', NULL, '350505', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001205, '石狮市', NULL, '350581', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001206, '晋江市', NULL, '350582', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001207, '南安市', NULL, '350583', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001208, '惠安县', NULL, '350521', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001209, '安溪县', NULL, '350524', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001210, '永春县', NULL, '350525', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001211, '德化县', NULL, '350526', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001212, '金门县', NULL, '350527', 1001200, 3);
INSERT INTO `sys_region` VALUES (1001213, '漳州市', NULL, '350600', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001214, '龙文区', NULL, '350603', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001215, '芗城区', NULL, '350602', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001216, '龙海市', NULL, '350681', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001217, '云霄县', NULL, '350622', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001218, '漳浦县', NULL, '350623', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001219, '诏安县', NULL, '350624', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001220, '长泰县', NULL, '350625', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001221, '东山县', NULL, '350626', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001222, '南靖县', NULL, '350627', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001223, '平和县', NULL, '350628', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001224, '华安县', NULL, '350629', 1001213, 3);
INSERT INTO `sys_region` VALUES (1001225, '南平市', NULL, '350700', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001226, '建阳区', NULL, '350703', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001227, '延平区', NULL, '350702', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001228, '邵武市', NULL, '350781', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001229, '武夷山市', NULL, '350782', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001230, '建瓯市', NULL, '350783', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001231, '顺昌县', NULL, '350721', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001232, '浦城县', NULL, '350722', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001233, '光泽县', NULL, '350723', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001234, '松溪县', NULL, '350724', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001235, '政和县', NULL, '350725', 1001225, 3);
INSERT INTO `sys_region` VALUES (1001236, '龙岩市', NULL, '350800', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001237, '新罗区', NULL, '350802', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001238, '永定区', NULL, '350803', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001239, '漳平市', NULL, '350881', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001240, '长汀县', NULL, '350821', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001241, '上杭县', NULL, '350823', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001242, '武平县', NULL, '350824', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001243, '连城县', NULL, '350825', 1001236, 3);
INSERT INTO `sys_region` VALUES (1001244, '宁德市', NULL, '350900', 1000012, 2);
INSERT INTO `sys_region` VALUES (1001245, '蕉城区', NULL, '350902', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001246, '福安市', NULL, '350981', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001247, '福鼎市', NULL, '350982', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001248, '霞浦县', NULL, '350921', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001249, '古田县', NULL, '350922', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001250, '屏南县', NULL, '350923', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001251, '寿宁县', NULL, '350924', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001252, '周宁县', NULL, '350925', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001253, '柘荣县', NULL, '350926', 1001244, 3);
INSERT INTO `sys_region` VALUES (1001254, '南昌市', NULL, '360100', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001255, '东湖区', NULL, '360102', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001256, '西湖区', NULL, '360103', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001257, '青云谱区', NULL, '360104', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001258, '湾里区', NULL, '360105', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001259, '青山湖区', NULL, '360111', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001260, '新建区', NULL, '360112', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001261, '南昌县', NULL, '360121', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001262, '安义县', NULL, '360123', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001263, '进贤县', NULL, '360124', 1001254, 3);
INSERT INTO `sys_region` VALUES (1001264, '景德镇市', NULL, '360200', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001265, '昌江区', NULL, '360202', 1001264, 3);
INSERT INTO `sys_region` VALUES (1001266, '珠山区', NULL, '360203', 1001264, 3);
INSERT INTO `sys_region` VALUES (1001267, '乐平市', NULL, '360281', 1001264, 3);
INSERT INTO `sys_region` VALUES (1001268, '浮梁县', NULL, '360222', 1001264, 3);
INSERT INTO `sys_region` VALUES (1001269, '萍乡市', NULL, '360300', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001270, '安源区', NULL, '360302', 1001269, 3);
INSERT INTO `sys_region` VALUES (1001271, '湘东区', NULL, '360313', 1001269, 3);
INSERT INTO `sys_region` VALUES (1001272, '莲花县', NULL, '360321', 1001269, 3);
INSERT INTO `sys_region` VALUES (1001273, '上栗县', NULL, '360322', 1001269, 3);
INSERT INTO `sys_region` VALUES (1001274, '芦溪县', NULL, '360323', 1001269, 3);
INSERT INTO `sys_region` VALUES (1001275, '九江市', NULL, '360400', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001276, '浔阳区', NULL, '360403', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001277, '濂溪区', NULL, '360402', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001278, '柴桑区', NULL, '360404', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001279, '瑞昌市', NULL, '360481', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001280, '共青城市', NULL, '360482', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001281, '庐山市', NULL, '360483', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001282, '武宁县', NULL, '360423', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001283, '修水县', NULL, '360424', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001284, '永修县', NULL, '360425', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001285, '德安县', NULL, '360426', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001286, '都昌县', NULL, '360428', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001287, '湖口县', NULL, '360429', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001288, '彭泽县', NULL, '360430', 1001275, 3);
INSERT INTO `sys_region` VALUES (1001289, '新余市', NULL, '360500', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001290, '渝水区', NULL, '360502', 1001289, 3);
INSERT INTO `sys_region` VALUES (1001291, '分宜县', NULL, '360521', 1001289, 3);
INSERT INTO `sys_region` VALUES (1001292, '鹰潭市', NULL, '360600', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001293, '月湖区', NULL, '360602', 1001292, 3);
INSERT INTO `sys_region` VALUES (1001294, '贵溪市', NULL, '360681', 1001292, 3);
INSERT INTO `sys_region` VALUES (1001295, '余江县', NULL, '360622', 1001292, 3);
INSERT INTO `sys_region` VALUES (1001296, '赣州市', NULL, '360700', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001297, '章贡区', NULL, '360702', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001298, '南康区', NULL, '360703', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001299, '赣县区', NULL, '360704', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001300, '瑞金市', NULL, '360781', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001301, '信丰县', NULL, '360722', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001302, '大余县', NULL, '360723', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001303, '上犹县', NULL, '360724', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001304, '崇义县', NULL, '360725', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001305, '安远县', NULL, '360726', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001306, '龙南县', NULL, '360727', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001307, '定南县', NULL, '360728', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001308, '全南县', NULL, '360729', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001309, '宁都县', NULL, '360730', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001310, '于都县', NULL, '360731', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001311, '兴国县', NULL, '360732', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001312, '会昌县', NULL, '360733', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001313, '寻乌县', NULL, '360734', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001314, '石城县', NULL, '360735', 1001296, 3);
INSERT INTO `sys_region` VALUES (1001315, '吉安市', NULL, '360800', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001316, '吉州区', NULL, '360802', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001317, '青原区', NULL, '360803', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001318, '井冈山市', NULL, '360881', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001319, '吉安县', NULL, '360821', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001320, '吉水县', NULL, '360822', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001321, '峡江县', NULL, '360823', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001322, '新干县', NULL, '360824', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001323, '永丰县', NULL, '360825', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001324, '泰和县', NULL, '360826', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001325, '遂川县', NULL, '360827', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001326, '万安县', NULL, '360828', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001327, '安福县', NULL, '360829', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001328, '永新县', NULL, '360830', 1001315, 3);
INSERT INTO `sys_region` VALUES (1001329, '宜春市', NULL, '360900', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001330, '袁州区', NULL, '360902', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001331, '丰城市', NULL, '360981', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001332, '樟树市', NULL, '360982', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001333, '高安市', NULL, '360983', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001334, '奉新县', NULL, '360921', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001335, '万载县', NULL, '360922', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001336, '上高县', NULL, '360923', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001337, '宜丰县', NULL, '360924', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001338, '靖安县', NULL, '360925', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001339, '铜鼓县', NULL, '360926', 1001329, 3);
INSERT INTO `sys_region` VALUES (1001340, '抚州市', NULL, '361000', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001341, '临川区', NULL, '361002', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001342, '东乡区', NULL, '361003', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001343, '南城县', NULL, '361021', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001344, '黎川县', NULL, '361022', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001345, '南丰县', NULL, '361023', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001346, '崇仁县', NULL, '361024', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001347, '乐安县', NULL, '361025', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001348, '宜黄县', NULL, '361026', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001349, '金溪县', NULL, '361027', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001350, '资溪县', NULL, '361028', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001351, '广昌县', NULL, '361030', 1001340, 3);
INSERT INTO `sys_region` VALUES (1001352, '上饶市', NULL, '361100', 1000013, 2);
INSERT INTO `sys_region` VALUES (1001353, '信州区', NULL, '361102', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001354, '广丰区', NULL, '361103', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001355, '德兴市', NULL, '361181', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001356, '上饶县', NULL, '361121', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001357, '玉山县', NULL, '361123', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001358, '铅山县', NULL, '361124', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001359, '横峰县', NULL, '361125', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001360, '弋阳县', NULL, '361126', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001361, '余干县', NULL, '361127', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001362, '鄱阳县', NULL, '361128', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001363, '万年县', NULL, '361129', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001364, '婺源县', NULL, '361130', 1001352, 3);
INSERT INTO `sys_region` VALUES (1001365, '济南市', NULL, '370100', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001366, '市中区', NULL, '370103', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001367, '历下区', NULL, '370102', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001368, '槐荫区', NULL, '370104', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001369, '天桥区', NULL, '370105', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001370, '历城区', NULL, '370112', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001371, '长清区', NULL, '370113', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001372, '章丘区', NULL, '370114', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001373, '平阴县', NULL, '370124', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001374, '济阳县', NULL, '370125', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001375, '商河县', NULL, '370126', 1001365, 3);
INSERT INTO `sys_region` VALUES (1001376, '青岛市', NULL, '370200', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001377, '市南区', NULL, '370202', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001378, '市北区', NULL, '370203', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001379, '黄岛区', NULL, '370211', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001380, '崂山区', NULL, '370212', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001381, '李沧区', NULL, '370213', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001382, '城阳区', NULL, '370214', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001383, '即墨区', NULL, '370215', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001384, '胶州市', NULL, '370281', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001385, '平度市', NULL, '370283', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001386, '莱西市', NULL, '370285', 1001376, 3);
INSERT INTO `sys_region` VALUES (1001387, '淄博市', NULL, '370300', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001388, '张店区', NULL, '370303', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001389, '淄川区', NULL, '370302', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001390, '博山区', NULL, '370304', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001391, '临淄区', NULL, '370305', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001392, '周村区', NULL, '370306', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001393, '桓台县', NULL, '370321', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001394, '高青县', NULL, '370322', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001395, '沂源县', NULL, '370323', 1001387, 3);
INSERT INTO `sys_region` VALUES (1001396, '枣庄市', NULL, '370400', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001397, '薛城区', NULL, '370403', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001398, '市中区', NULL, '370402', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001399, '峄城区', NULL, '370404', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001400, '台儿庄区', NULL, '370405', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001401, '山亭区', NULL, '370406', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001402, '滕州市', NULL, '370481', 1001396, 3);
INSERT INTO `sys_region` VALUES (1001403, '东营市', NULL, '370500', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001404, '东营区', NULL, '370502', 1001403, 3);
INSERT INTO `sys_region` VALUES (1001405, '河口区', NULL, '370503', 1001403, 3);
INSERT INTO `sys_region` VALUES (1001406, '垦利区', NULL, '370505', 1001403, 3);
INSERT INTO `sys_region` VALUES (1001407, '利津县', NULL, '370522', 1001403, 3);
INSERT INTO `sys_region` VALUES (1001408, '广饶县', NULL, '370523', 1001403, 3);
INSERT INTO `sys_region` VALUES (1001409, '烟台市', NULL, '370600', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001410, '莱山区', NULL, '370613', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001411, '芝罘区', NULL, '370602', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001412, '福山区', NULL, '370611', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001413, '牟平区', NULL, '370612', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001414, '龙口市', NULL, '370681', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001415, '莱阳市', NULL, '370682', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001416, '莱州市', NULL, '370683', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001417, '蓬莱市', NULL, '370684', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001418, '招远市', NULL, '370685', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001419, '栖霞市', NULL, '370686', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001420, '海阳市', NULL, '370687', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001421, '长岛县', NULL, '370634', 1001409, 3);
INSERT INTO `sys_region` VALUES (1001422, '潍坊市', NULL, '370700', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001423, '奎文区', NULL, '370705', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001424, '潍城区', NULL, '370702', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001425, '寒亭区', NULL, '370703', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001426, '坊子区', NULL, '370704', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001427, '青州市', NULL, '370781', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001428, '诸城市', NULL, '370782', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001429, '寿光市', NULL, '370783', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001430, '安丘市', NULL, '370784', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001431, '高密市', NULL, '370785', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001432, '昌邑市', NULL, '370786', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001433, '临朐县', NULL, '370724', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001434, '昌乐县', NULL, '370725', 1001422, 3);
INSERT INTO `sys_region` VALUES (1001435, '济宁市', NULL, '370800', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001436, '任城区', NULL, '370811', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001437, '兖州区', NULL, '370812', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001438, '曲阜市', NULL, '370881', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001439, '邹城市', NULL, '370883', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001440, '微山县', NULL, '370826', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001441, '鱼台县', NULL, '370827', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001442, '金乡县', NULL, '370828', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001443, '嘉祥县', NULL, '370829', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001444, '汶上县', NULL, '370830', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001445, '泗水县', NULL, '370831', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001446, '梁山县', NULL, '370832', 1001435, 3);
INSERT INTO `sys_region` VALUES (1001447, '泰安市', NULL, '370900', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001448, '泰山区', NULL, '370902', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001449, '岱岳区', NULL, '370911', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001450, '新泰市', NULL, '370982', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001451, '肥城市', NULL, '370983', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001452, '宁阳县', NULL, '370921', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001453, '东平县', NULL, '370923', 1001447, 3);
INSERT INTO `sys_region` VALUES (1001454, '威海市', NULL, '371000', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001455, '环翠区', NULL, '371002', 1001454, 3);
INSERT INTO `sys_region` VALUES (1001456, '文登区', NULL, '371003', 1001454, 3);
INSERT INTO `sys_region` VALUES (1001457, '荣成市', NULL, '371082', 1001454, 3);
INSERT INTO `sys_region` VALUES (1001458, '乳山市', NULL, '371083', 1001454, 3);
INSERT INTO `sys_region` VALUES (1001459, '日照市', NULL, '371100', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001460, '东港区', NULL, '371102', 1001459, 3);
INSERT INTO `sys_region` VALUES (1001461, '岚山区', NULL, '371103', 1001459, 3);
INSERT INTO `sys_region` VALUES (1001462, '五莲县', NULL, '371121', 1001459, 3);
INSERT INTO `sys_region` VALUES (1001463, '莒县', NULL, '371122', 1001459, 3);
INSERT INTO `sys_region` VALUES (1001464, '莱芜市', NULL, '371200', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001465, '莱城区', NULL, '371202', 1001464, 3);
INSERT INTO `sys_region` VALUES (1001466, '钢城区', NULL, '371203', 1001464, 3);
INSERT INTO `sys_region` VALUES (1001467, '临沂市', NULL, '371300', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001468, '兰山区', NULL, '371302', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001469, '罗庄区', NULL, '371311', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001470, '河东区', NULL, '371312', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001471, '沂南县', NULL, '371321', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001472, '郯城县', NULL, '371322', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001473, '沂水县', NULL, '371323', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001474, '兰陵县', NULL, '371324', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001475, '费县', NULL, '371325', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001476, '平邑县', NULL, '371326', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001477, '莒南县', NULL, '371327', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001478, '蒙阴县', NULL, '371328', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001479, '临沭县', NULL, '371329', 1001467, 3);
INSERT INTO `sys_region` VALUES (1001480, '德州市', NULL, '371400', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001481, '德城区', NULL, '371402', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001482, '陵城区', NULL, '371403', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001483, '乐陵市', NULL, '371481', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001484, '禹城市', NULL, '371482', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001485, '宁津县', NULL, '371422', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001486, '庆云县', NULL, '371423', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001487, '临邑县', NULL, '371424', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001488, '齐河县', NULL, '371425', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001489, '平原县', NULL, '371426', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001490, '夏津县', NULL, '371427', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001491, '武城县', NULL, '371428', 1001480, 3);
INSERT INTO `sys_region` VALUES (1001492, '聊城市', NULL, '371500', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001493, '东昌府区', NULL, '371502', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001494, '临清市', NULL, '371581', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001495, '阳谷县', NULL, '371521', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001496, '莘县', NULL, '371522', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001497, '茌平县', NULL, '371523', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001498, '东阿县', NULL, '371524', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001499, '冠县', NULL, '371525', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001500, '高唐县', NULL, '371526', 1001492, 3);
INSERT INTO `sys_region` VALUES (1001501, '滨州市', NULL, '371600', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001502, '滨城区', NULL, '371602', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001503, '沾化区', NULL, '371603', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001504, '惠民县', NULL, '371621', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001505, '阳信县', NULL, '371622', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001506, '无棣县', NULL, '371623', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001507, '博兴县', NULL, '371625', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001508, '邹平县', NULL, '371626', 1001501, 3);
INSERT INTO `sys_region` VALUES (1001509, '菏泽市', NULL, '371700', 1000014, 2);
INSERT INTO `sys_region` VALUES (1001510, '牡丹区', NULL, '371702', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001511, '定陶区', NULL, '371703', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001512, '曹县', NULL, '371721', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001513, '单县', NULL, '371722', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001514, '成武县', NULL, '371723', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001515, '巨野县', NULL, '371724', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001516, '郓城县', NULL, '371725', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001517, '鄄城县', NULL, '371726', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001518, '东明县', NULL, '371728', 1001509, 3);
INSERT INTO `sys_region` VALUES (1001519, '郑州市', NULL, '410100', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001520, '中原区', NULL, '410102', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001521, '二七区', NULL, '410103', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001522, '管城回族区', NULL, '410104', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001523, '金水区', NULL, '410105', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001524, '上街区', NULL, '410106', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001525, '惠济区', NULL, '410108', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001526, '巩义市', NULL, '410181', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001527, '荥阳市', NULL, '410182', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001528, '新密市', NULL, '410183', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001529, '新郑市', NULL, '410184', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001530, '登封市', NULL, '410185', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001531, '中牟县', NULL, '410122', 1001519, 3);
INSERT INTO `sys_region` VALUES (1001532, '开封市', NULL, '410200', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001533, '鼓楼区', NULL, '410204', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001534, '龙亭区', NULL, '410202', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001535, '顺河回族区', NULL, '410203', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001536, '禹王台区', NULL, '410205', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001537, '祥符区', NULL, '410212', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001538, '杞县', NULL, '410221', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001539, '通许县', NULL, '410222', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001540, '尉氏县', NULL, '410223', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001541, '兰考县', NULL, '410225', 1001532, 3);
INSERT INTO `sys_region` VALUES (1001542, '洛阳市', NULL, '410300', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001543, '西工区', NULL, '410303', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001544, '老城区', NULL, '410302', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001545, '瀍河回族区', NULL, '410304', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001546, '涧西区', NULL, '410305', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001547, '吉利区', NULL, '410306', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001548, '洛龙区', NULL, '410311', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001549, '偃师市', NULL, '410381', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001550, '孟津县', NULL, '410322', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001551, '新安县', NULL, '410323', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001552, '栾川县', NULL, '410324', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001553, '嵩县', NULL, '410325', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001554, '汝阳县', NULL, '410326', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001555, '宜阳县', NULL, '410327', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001556, '洛宁县', NULL, '410328', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001557, '伊川县', NULL, '410329', 1001542, 3);
INSERT INTO `sys_region` VALUES (1001558, '平顶山市', NULL, '410400', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001559, '新华区', NULL, '410402', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001560, '卫东区', NULL, '410403', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001561, '石龙区', NULL, '410404', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001562, '湛河区', NULL, '410411', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001563, '舞钢市', NULL, '410481', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001564, '汝州市', NULL, '410482', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001565, '宝丰县', NULL, '410421', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001566, '叶县', NULL, '410422', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001567, '鲁山县', NULL, '410423', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001568, '郏县', NULL, '410425', 1001558, 3);
INSERT INTO `sys_region` VALUES (1001569, '安阳市', NULL, '410500', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001570, '北关区', NULL, '410503', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001571, '文峰区', NULL, '410502', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001572, '殷都区', NULL, '410505', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001573, '龙安区', NULL, '410506', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001574, '林州市', NULL, '410581', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001575, '安阳县', NULL, '410522', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001576, '汤阴县', NULL, '410523', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001577, '滑县', NULL, '410526', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001578, '内黄县', NULL, '410527', 1001569, 3);
INSERT INTO `sys_region` VALUES (1001579, '鹤壁市', NULL, '410600', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001580, '淇滨区', NULL, '410611', 1001579, 3);
INSERT INTO `sys_region` VALUES (1001581, '鹤山区', NULL, '410602', 1001579, 3);
INSERT INTO `sys_region` VALUES (1001582, '山城区', NULL, '410603', 1001579, 3);
INSERT INTO `sys_region` VALUES (1001583, '浚县', NULL, '410621', 1001579, 3);
INSERT INTO `sys_region` VALUES (1001584, '淇县', NULL, '410622', 1001579, 3);
INSERT INTO `sys_region` VALUES (1001585, '新乡市', NULL, '410700', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001586, '卫滨区', NULL, '410703', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001587, '红旗区', NULL, '410702', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001588, '凤泉区', NULL, '410704', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001589, '牧野区', NULL, '410711', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001590, '卫辉市', NULL, '410781', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001591, '辉县市', NULL, '410782', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001592, '新乡县', NULL, '410721', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001593, '获嘉县', NULL, '410724', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001594, '原阳县', NULL, '410725', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001595, '延津县', NULL, '410726', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001596, '封丘县', NULL, '410727', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001597, '长垣县', NULL, '410728', 1001585, 3);
INSERT INTO `sys_region` VALUES (1001598, '焦作市', NULL, '410800', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001599, '解放区', NULL, '410802', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001600, '中站区', NULL, '410803', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001601, '马村区', NULL, '410804', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001602, '山阳区', NULL, '410811', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001603, '沁阳市', NULL, '410882', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001604, '孟州市', NULL, '410883', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001605, '修武县', NULL, '410821', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001606, '博爱县', NULL, '410822', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001607, '武陟县', NULL, '410823', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001608, '温县', NULL, '410825', 1001598, 3);
INSERT INTO `sys_region` VALUES (1001609, '濮阳市', NULL, '410900', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001610, '华龙区', NULL, '410902', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001611, '清丰县', NULL, '410922', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001612, '南乐县', NULL, '410923', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001613, '范县', NULL, '410926', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001614, '台前县', NULL, '410927', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001615, '濮阳县', NULL, '410928', 1001609, 3);
INSERT INTO `sys_region` VALUES (1001616, '许昌市', NULL, '411000', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001617, '魏都区', NULL, '411002', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001618, '建安区', NULL, '411003', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001619, '禹州市', NULL, '411081', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001620, '长葛市', NULL, '411082', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001621, '鄢陵县', NULL, '411024', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001622, '襄城县', NULL, '411025', 1001616, 3);
INSERT INTO `sys_region` VALUES (1001623, '漯河市', NULL, '411100', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001624, '郾城区', NULL, '411103', 1001623, 3);
INSERT INTO `sys_region` VALUES (1001625, '源汇区', NULL, '411102', 1001623, 3);
INSERT INTO `sys_region` VALUES (1001626, '召陵区', NULL, '411104', 1001623, 3);
INSERT INTO `sys_region` VALUES (1001627, '舞阳县', NULL, '411121', 1001623, 3);
INSERT INTO `sys_region` VALUES (1001628, '临颍县', NULL, '411122', 1001623, 3);
INSERT INTO `sys_region` VALUES (1001629, '三门峡市', NULL, '411200', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001630, '湖滨区', NULL, '411202', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001631, '陕州区', NULL, '411203', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001632, '义马市', NULL, '411281', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001633, '灵宝市', NULL, '411282', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001634, '渑池县', NULL, '411221', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001635, '卢氏县', NULL, '411224', 1001629, 3);
INSERT INTO `sys_region` VALUES (1001636, '南阳市', NULL, '411300', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001637, '卧龙区', NULL, '411303', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001638, '宛城区', NULL, '411302', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001639, '邓州市', NULL, '411381', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001640, '南召县', NULL, '411321', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001641, '方城县', NULL, '411322', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001642, '西峡县', NULL, '411323', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001643, '镇平县', NULL, '411324', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001644, '内乡县', NULL, '411325', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001645, '淅川县', NULL, '411326', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001646, '社旗县', NULL, '411327', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001647, '唐河县', NULL, '411328', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001648, '新野县', NULL, '411329', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001649, '桐柏县', NULL, '411330', 1001636, 3);
INSERT INTO `sys_region` VALUES (1001650, '商丘市', NULL, '411400', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001651, '梁园区', NULL, '411402', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001652, '睢阳区', NULL, '411403', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001653, '永城市', NULL, '411481', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001654, '民权县', NULL, '411421', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001655, '睢县', NULL, '411422', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001656, '宁陵县', NULL, '411423', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001657, '柘城县', NULL, '411424', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001658, '虞城县', NULL, '411425', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001659, '夏邑县', NULL, '411426', 1001650, 3);
INSERT INTO `sys_region` VALUES (1001660, '信阳市', NULL, '411500', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001661, '浉河区', NULL, '411502', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001662, '平桥区', NULL, '411503', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001663, '罗山县', NULL, '411521', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001664, '光山县', NULL, '411522', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001665, '新县', NULL, '411523', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001666, '商城县', NULL, '411524', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001667, '固始县', NULL, '411525', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001668, '潢川县', NULL, '411526', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001669, '淮滨县', NULL, '411527', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001670, '息县', NULL, '411528', 1001660, 3);
INSERT INTO `sys_region` VALUES (1001671, '周口市', NULL, '411600', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001672, '川汇区', NULL, '411602', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001673, '项城市', NULL, '411681', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001674, '扶沟县', NULL, '411621', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001675, '西华县', NULL, '411622', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001676, '商水县', NULL, '411623', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001677, '沈丘县', NULL, '411624', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001678, '郸城县', NULL, '411625', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001679, '淮阳县', NULL, '411626', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001680, '太康县', NULL, '411627', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001681, '鹿邑县', NULL, '411628', 1001671, 3);
INSERT INTO `sys_region` VALUES (1001682, '驻马店市', NULL, '411700', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001683, '驿城区', NULL, '411702', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001684, '西平县', NULL, '411721', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001685, '上蔡县', NULL, '411722', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001686, '平舆县', NULL, '411723', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001687, '正阳县', NULL, '411724', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001688, '确山县', NULL, '411725', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001689, '泌阳县', NULL, '411726', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001690, '汝南县', NULL, '411727', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001691, '遂平县', NULL, '411728', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001692, '新蔡县', NULL, '411729', 1001682, 3);
INSERT INTO `sys_region` VALUES (1001693, '济源市', NULL, '419001', 1000015, 2);
INSERT INTO `sys_region` VALUES (1001694, '武汉市', NULL, '420100', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001695, '江岸区', NULL, '420102', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001696, '江汉区', NULL, '420103', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001697, '硚口区', NULL, '420104', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001698, '汉阳区', NULL, '420105', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001699, '武昌区', NULL, '420106', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001700, '青山区', NULL, '420107', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001701, '洪山区', NULL, '420111', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001702, '东西湖区', NULL, '420112', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001703, '汉南区', NULL, '420113', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001704, '蔡甸区', NULL, '420114', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001705, '江夏区', NULL, '420115', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001706, '黄陂区', NULL, '420116', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001707, '新洲区', NULL, '420117', 1001694, 3);
INSERT INTO `sys_region` VALUES (1001708, '黄石市', NULL, '420200', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001709, '下陆区', NULL, '420204', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001710, '黄石港区', NULL, '420202', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001711, '西塞山区', NULL, '420203', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001712, '铁山区', NULL, '420205', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001713, '大冶市', NULL, '420281', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001714, '阳新县', NULL, '420222', 1001708, 3);
INSERT INTO `sys_region` VALUES (1001715, '十堰市', NULL, '420300', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001716, '茅箭区', NULL, '420302', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001717, '张湾区', NULL, '420303', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001718, '郧阳区', NULL, '420304', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001719, '丹江口市', NULL, '420381', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001720, '郧西县', NULL, '420322', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001721, '竹山县', NULL, '420323', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001722, '竹溪县', NULL, '420324', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001723, '房县', NULL, '420325', 1001715, 3);
INSERT INTO `sys_region` VALUES (1001724, '宜昌市', NULL, '420500', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001725, '西陵区', NULL, '420502', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001726, '伍家岗区', NULL, '420503', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001727, '点军区', NULL, '420504', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001728, '猇亭区', NULL, '420505', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001729, '夷陵区', NULL, '420506', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001730, '宜都市', NULL, '420581', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001731, '当阳市', NULL, '420582', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001732, '枝江市', NULL, '420583', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001733, '远安县', NULL, '420525', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001734, '兴山县', NULL, '420526', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001735, '秭归县', NULL, '420527', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001736, '长阳土家族自治县', NULL, '420528', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001737, '五峰土家族自治县', NULL, '420529', 1001724, 3);
INSERT INTO `sys_region` VALUES (1001738, '襄阳市', NULL, '420600', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001739, '襄城区', NULL, '420602', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001740, '樊城区', NULL, '420606', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001741, '襄州区', NULL, '420607', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001742, '老河口市', NULL, '420682', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001743, '枣阳市', NULL, '420683', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001744, '宜城市', NULL, '420684', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001745, '南漳县', NULL, '420624', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001746, '谷城县', NULL, '420625', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001747, '保康县', NULL, '420626', 1001738, 3);
INSERT INTO `sys_region` VALUES (1001748, '鄂州市', NULL, '420700', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001749, '鄂城区', NULL, '420704', 1001748, 3);
INSERT INTO `sys_region` VALUES (1001750, '梁子湖区', NULL, '420702', 1001748, 3);
INSERT INTO `sys_region` VALUES (1001751, '华容区', NULL, '420703', 1001748, 3);
INSERT INTO `sys_region` VALUES (1001752, '荆门市', NULL, '420800', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001753, '东宝区', NULL, '420802', 1001752, 3);
INSERT INTO `sys_region` VALUES (1001754, '掇刀区', NULL, '420804', 1001752, 3);
INSERT INTO `sys_region` VALUES (1001755, '钟祥市', NULL, '420881', 1001752, 3);
INSERT INTO `sys_region` VALUES (1001756, '京山县', NULL, '420821', 1001752, 3);
INSERT INTO `sys_region` VALUES (1001757, '沙洋县', NULL, '420822', 1001752, 3);
INSERT INTO `sys_region` VALUES (1001758, '孝感市', NULL, '420900', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001759, '孝南区', NULL, '420902', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001760, '应城市', NULL, '420981', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001761, '安陆市', NULL, '420982', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001762, '汉川市', NULL, '420984', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001763, '孝昌县', NULL, '420921', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001764, '大悟县', NULL, '420922', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001765, '云梦县', NULL, '420923', 1001758, 3);
INSERT INTO `sys_region` VALUES (1001766, '荆州市', NULL, '421000', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001767, '沙市区', NULL, '421002', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001768, '荆州区', NULL, '421003', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001769, '石首市', NULL, '421081', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001770, '洪湖市', NULL, '421083', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001771, '松滋市', NULL, '421087', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001772, '公安县', NULL, '421022', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001773, '监利县', NULL, '421023', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001774, '江陵县', NULL, '421024', 1001766, 3);
INSERT INTO `sys_region` VALUES (1001775, '黄冈市', NULL, '421100', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001776, '黄州区', NULL, '421102', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001777, '麻城市', NULL, '421181', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001778, '武穴市', NULL, '421182', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001779, '团风县', NULL, '421121', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001780, '红安县', NULL, '421122', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001781, '罗田县', NULL, '421123', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001782, '英山县', NULL, '421124', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001783, '浠水县', NULL, '421125', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001784, '蕲春县', NULL, '421126', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001785, '黄梅县', NULL, '421127', 1001775, 3);
INSERT INTO `sys_region` VALUES (1001786, '咸宁市', NULL, '421200', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001787, '咸安区', NULL, '421202', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001788, '赤壁市', NULL, '421281', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001789, '嘉鱼县', NULL, '421221', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001790, '通城县', NULL, '421222', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001791, '崇阳县', NULL, '421223', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001792, '通山县', NULL, '421224', 1001786, 3);
INSERT INTO `sys_region` VALUES (1001793, '随州市', NULL, '421300', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001794, '曾都区', NULL, '421303', 1001793, 3);
INSERT INTO `sys_region` VALUES (1001795, '广水市', NULL, '421381', 1001793, 3);
INSERT INTO `sys_region` VALUES (1001796, '随县', NULL, '421321', 1001793, 3);
INSERT INTO `sys_region` VALUES (1001797, '恩施土家族苗族自治州', NULL, '422800', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001798, '恩施市', NULL, '422801', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001799, '利川市', NULL, '422802', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001800, '建始县', NULL, '422822', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001801, '巴东县', NULL, '422823', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001802, '宣恩县', NULL, '422825', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001803, '咸丰县', NULL, '422826', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001804, '来凤县', NULL, '422827', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001805, '鹤峰县', NULL, '422828', 1001797, 3);
INSERT INTO `sys_region` VALUES (1001806, '仙桃市', NULL, '429004', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001807, '潜江市', NULL, '429005', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001808, '天门市', NULL, '429006', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001809, '神农架林区', NULL, '429021', 1000016, 2);
INSERT INTO `sys_region` VALUES (1001810, '长沙市', NULL, '430100', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001811, '岳麓区', NULL, '430104', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001812, '芙蓉区', NULL, '430102', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001813, '天心区', NULL, '430103', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001814, '开福区', NULL, '430105', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001815, '雨花区', NULL, '430111', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001816, '望城区', NULL, '430112', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001817, '浏阳市', NULL, '430181', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001818, '宁乡市', NULL, '430182', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001819, '长沙县', NULL, '430121', 1001810, 3);
INSERT INTO `sys_region` VALUES (1001820, '株洲市', NULL, '430200', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001821, '天元区', NULL, '430211', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001822, '荷塘区', NULL, '430202', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001823, '芦淞区', NULL, '430203', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001824, '石峰区', NULL, '430204', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001825, '醴陵市', NULL, '430281', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001826, '株洲县', NULL, '430221', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001827, '攸县', NULL, '430223', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001828, '茶陵县', NULL, '430224', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001829, '炎陵县', NULL, '430225', 1001820, 3);
INSERT INTO `sys_region` VALUES (1001830, '湘潭市', NULL, '430300', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001831, '岳塘区', NULL, '430304', 1001830, 3);
INSERT INTO `sys_region` VALUES (1001832, '雨湖区', NULL, '430302', 1001830, 3);
INSERT INTO `sys_region` VALUES (1001833, '湘乡市', NULL, '430381', 1001830, 3);
INSERT INTO `sys_region` VALUES (1001834, '韶山市', NULL, '430382', 1001830, 3);
INSERT INTO `sys_region` VALUES (1001835, '湘潭县', NULL, '430321', 1001830, 3);
INSERT INTO `sys_region` VALUES (1001836, '衡阳市', NULL, '430400', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001837, '蒸湘区', NULL, '430408', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001838, '珠晖区', NULL, '430405', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001839, '雁峰区', NULL, '430406', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001840, '石鼓区', NULL, '430407', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001841, '南岳区', NULL, '430412', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001842, '耒阳市', NULL, '430481', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001843, '常宁市', NULL, '430482', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001844, '衡阳县', NULL, '430421', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001845, '衡南县', NULL, '430422', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001846, '衡山县', NULL, '430423', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001847, '衡东县', NULL, '430424', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001848, '祁东县', NULL, '430426', 1001836, 3);
INSERT INTO `sys_region` VALUES (1001849, '邵阳市', NULL, '430500', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001850, '大祥区', NULL, '430503', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001851, '双清区', NULL, '430502', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001852, '北塔区', NULL, '430511', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001853, '武冈市', NULL, '430581', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001854, '邵东县', NULL, '430521', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001855, '新邵县', NULL, '430522', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001856, '邵阳县', NULL, '430523', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001857, '隆回县', NULL, '430524', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001858, '洞口县', NULL, '430525', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001859, '绥宁县', NULL, '430527', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001860, '新宁县', NULL, '430528', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001861, '城步苗族自治县', NULL, '430529', 1001849, 3);
INSERT INTO `sys_region` VALUES (1001862, '岳阳市', NULL, '430600', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001863, '岳阳楼区', NULL, '430602', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001864, '云溪区', NULL, '430603', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001865, '君山区', NULL, '430611', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001866, '汨罗市', NULL, '430681', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001867, '临湘市', NULL, '430682', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001868, '岳阳县', NULL, '430621', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001869, '华容县', NULL, '430623', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001870, '湘阴县', NULL, '430624', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001871, '平江县', NULL, '430626', 1001862, 3);
INSERT INTO `sys_region` VALUES (1001872, '常德市', NULL, '430700', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001873, '武陵区', NULL, '430702', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001874, '鼎城区', NULL, '430703', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001875, '津市市', NULL, '430781', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001876, '安乡县', NULL, '430721', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001877, '汉寿县', NULL, '430722', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001878, '澧县', NULL, '430723', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001879, '临澧县', NULL, '430724', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001880, '桃源县', NULL, '430725', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001881, '石门县', NULL, '430726', 1001872, 3);
INSERT INTO `sys_region` VALUES (1001882, '张家界市', NULL, '430800', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001883, '永定区', NULL, '430802', 1001882, 3);
INSERT INTO `sys_region` VALUES (1001884, '武陵源区', NULL, '430811', 1001882, 3);
INSERT INTO `sys_region` VALUES (1001885, '慈利县', NULL, '430821', 1001882, 3);
INSERT INTO `sys_region` VALUES (1001886, '桑植县', NULL, '430822', 1001882, 3);
INSERT INTO `sys_region` VALUES (1001887, '益阳市', NULL, '430900', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001888, '赫山区', NULL, '430903', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001889, '资阳区', NULL, '430902', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001890, '沅江市', NULL, '430981', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001891, '南县', NULL, '430921', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001892, '桃江县', NULL, '430922', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001893, '安化县', NULL, '430923', 1001887, 3);
INSERT INTO `sys_region` VALUES (1001894, '郴州市', NULL, '431000', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001895, '北湖区', NULL, '431002', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001896, '苏仙区', NULL, '431003', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001897, '资兴市', NULL, '431081', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001898, '桂阳县', NULL, '431021', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001899, '宜章县', NULL, '431022', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001900, '永兴县', NULL, '431023', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001901, '嘉禾县', NULL, '431024', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001902, '临武县', NULL, '431025', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001903, '汝城县', NULL, '431026', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001904, '桂东县', NULL, '431027', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001905, '安仁县', NULL, '431028', 1001894, 3);
INSERT INTO `sys_region` VALUES (1001906, '永州市', NULL, '431100', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001907, '冷水滩区', NULL, '431103', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001908, '零陵区', NULL, '431102', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001909, '祁阳县', NULL, '431121', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001910, '东安县', NULL, '431122', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001911, '双牌县', NULL, '431123', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001912, '道县', NULL, '431124', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001913, '江永县', NULL, '431125', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001914, '宁远县', NULL, '431126', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001915, '蓝山县', NULL, '431127', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001916, '新田县', NULL, '431128', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001917, '江华瑶族自治县', NULL, '431129', 1001906, 3);
INSERT INTO `sys_region` VALUES (1001918, '怀化市', NULL, '431200', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001919, '鹤城区', NULL, '431202', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001920, '洪江市', NULL, '431281', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001921, '中方县', NULL, '431221', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001922, '沅陵县', NULL, '431222', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001923, '辰溪县', NULL, '431223', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001924, '溆浦县', NULL, '431224', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001925, '会同县', NULL, '431225', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001926, '麻阳苗族自治县', NULL, '431226', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001927, '新晃侗族自治县', NULL, '431227', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001928, '芷江侗族自治县', NULL, '431228', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001929, '靖州苗族侗族自治县', NULL, '431229', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001930, '通道侗族自治县', NULL, '431230', 1001918, 3);
INSERT INTO `sys_region` VALUES (1001931, '娄底市', NULL, '431300', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001932, '娄星区', NULL, '431302', 1001931, 3);
INSERT INTO `sys_region` VALUES (1001933, '冷水江市', NULL, '431381', 1001931, 3);
INSERT INTO `sys_region` VALUES (1001934, '涟源市', NULL, '431382', 1001931, 3);
INSERT INTO `sys_region` VALUES (1001935, '双峰县', NULL, '431321', 1001931, 3);
INSERT INTO `sys_region` VALUES (1001936, '新化县', NULL, '431322', 1001931, 3);
INSERT INTO `sys_region` VALUES (1001937, '湘西土家族苗族自治州', NULL, '433100', 1000017, 2);
INSERT INTO `sys_region` VALUES (1001938, '吉首市', NULL, '433101', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001939, '泸溪县', NULL, '433122', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001940, '凤凰县', NULL, '433123', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001941, '花垣县', NULL, '433124', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001942, '保靖县', NULL, '433125', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001943, '古丈县', NULL, '433126', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001944, '永顺县', NULL, '433127', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001945, '龙山县', NULL, '433130', 1001937, 3);
INSERT INTO `sys_region` VALUES (1001946, '广州市', NULL, '440100', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001947, '越秀区', NULL, '440104', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001948, '荔湾区', NULL, '440103', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001949, '海珠区', NULL, '440105', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001950, '天河区', NULL, '440106', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001951, '白云区', NULL, '440111', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001952, '黄埔区', NULL, '440112', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001953, '番禺区', NULL, '440113', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001954, '花都区', NULL, '440114', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001955, '南沙区', NULL, '440115', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001956, '增城区', NULL, '440118', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001957, '从化区', NULL, '440117', 1001946, 3);
INSERT INTO `sys_region` VALUES (1001958, '韶关市', NULL, '440200', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001959, '浈江区', NULL, '440204', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001960, '武江区', NULL, '440203', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001961, '曲江区', NULL, '440205', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001962, '乐昌市', NULL, '440281', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001963, '南雄市', NULL, '440282', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001964, '始兴县', NULL, '440222', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001965, '仁化县', NULL, '440224', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001966, '翁源县', NULL, '440229', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001967, '新丰县', NULL, '440233', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001968, '乳源瑶族自治县', NULL, '440232', 1001958, 3);
INSERT INTO `sys_region` VALUES (1001969, '深圳市', NULL, '440300', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001970, '福田区', NULL, '440304', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001971, '罗湖区', NULL, '440303', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001972, '南山区', NULL, '440305', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001973, '宝安区', NULL, '440306', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001974, '龙岗区', NULL, '440307', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001975, '盐田区', NULL, '440308', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001976, '龙华区', NULL, '440309', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001977, '坪山区', NULL, '440310', 1001969, 3);
INSERT INTO `sys_region` VALUES (1001978, '珠海市', NULL, '440400', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001979, '香洲区', NULL, '440402', 1001978, 3);
INSERT INTO `sys_region` VALUES (1001980, '斗门区', NULL, '440403', 1001978, 3);
INSERT INTO `sys_region` VALUES (1001981, '金湾区', NULL, '440404', 1001978, 3);
INSERT INTO `sys_region` VALUES (1001982, '汕头市', NULL, '440500', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001983, '金平区', NULL, '440511', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001984, '龙湖区', NULL, '440507', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001985, '濠江区', NULL, '440512', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001986, '潮阳区', NULL, '440513', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001987, '潮南区', NULL, '440514', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001988, '澄海区', NULL, '440515', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001989, '南澳县', NULL, '440523', 1001982, 3);
INSERT INTO `sys_region` VALUES (1001990, '佛山市', NULL, '440600', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001991, '禅城区', NULL, '440604', 1001990, 3);
INSERT INTO `sys_region` VALUES (1001992, '南海区', NULL, '440605', 1001990, 3);
INSERT INTO `sys_region` VALUES (1001993, '顺德区', NULL, '440606', 1001990, 3);
INSERT INTO `sys_region` VALUES (1001994, '三水区', NULL, '440607', 1001990, 3);
INSERT INTO `sys_region` VALUES (1001995, '高明区', NULL, '440608', 1001990, 3);
INSERT INTO `sys_region` VALUES (1001996, '江门市', NULL, '440700', 1000018, 2);
INSERT INTO `sys_region` VALUES (1001997, '蓬江区', NULL, '440703', 1001996, 3);
INSERT INTO `sys_region` VALUES (1001998, '江海区', NULL, '440704', 1001996, 3);
INSERT INTO `sys_region` VALUES (1001999, '新会区', NULL, '440705', 1001996, 3);
INSERT INTO `sys_region` VALUES (1002000, '台山市', NULL, '440781', 1001996, 3);
INSERT INTO `sys_region` VALUES (1002001, '开平市', NULL, '440783', 1001996, 3);
INSERT INTO `sys_region` VALUES (1002002, '鹤山市', NULL, '440784', 1001996, 3);
INSERT INTO `sys_region` VALUES (1002003, '恩平市', NULL, '440785', 1001996, 3);
INSERT INTO `sys_region` VALUES (1002004, '湛江市', NULL, '440800', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002005, '赤坎区', NULL, '440802', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002006, '霞山区', NULL, '440803', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002007, '坡头区', NULL, '440804', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002008, '麻章区', NULL, '440811', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002009, '廉江市', NULL, '440881', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002010, '雷州市', NULL, '440882', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002011, '吴川市', NULL, '440883', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002012, '遂溪县', NULL, '440823', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002013, '徐闻县', NULL, '440825', 1002004, 3);
INSERT INTO `sys_region` VALUES (1002014, '茂名市', NULL, '440900', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002015, '茂南区', NULL, '440902', 1002014, 3);
INSERT INTO `sys_region` VALUES (1002016, '电白区', NULL, '440904', 1002014, 3);
INSERT INTO `sys_region` VALUES (1002017, '高州市', NULL, '440981', 1002014, 3);
INSERT INTO `sys_region` VALUES (1002018, '化州市', NULL, '440982', 1002014, 3);
INSERT INTO `sys_region` VALUES (1002019, '信宜市', NULL, '440983', 1002014, 3);
INSERT INTO `sys_region` VALUES (1002020, '肇庆市', NULL, '441200', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002021, '端州区', NULL, '441202', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002022, '鼎湖区', NULL, '441203', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002023, '高要区', NULL, '441204', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002024, '四会市', NULL, '441284', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002025, '广宁县', NULL, '441223', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002026, '怀集县', NULL, '441224', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002027, '封开县', NULL, '441225', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002028, '德庆县', NULL, '441226', 1002020, 3);
INSERT INTO `sys_region` VALUES (1002029, '惠州市', NULL, '441300', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002030, '惠城区', NULL, '441302', 1002029, 3);
INSERT INTO `sys_region` VALUES (1002031, '惠阳区', NULL, '441303', 1002029, 3);
INSERT INTO `sys_region` VALUES (1002032, '博罗县', NULL, '441322', 1002029, 3);
INSERT INTO `sys_region` VALUES (1002033, '惠东县', NULL, '441323', 1002029, 3);
INSERT INTO `sys_region` VALUES (1002034, '龙门县', NULL, '441324', 1002029, 3);
INSERT INTO `sys_region` VALUES (1002035, '梅州市', NULL, '441400', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002036, '梅江区', NULL, '441402', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002037, '梅县区', NULL, '441403', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002038, '兴宁市', NULL, '441481', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002039, '大埔县', NULL, '441422', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002040, '丰顺县', NULL, '441423', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002041, '五华县', NULL, '441424', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002042, '平远县', NULL, '441426', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002043, '蕉岭县', NULL, '441427', 1002035, 3);
INSERT INTO `sys_region` VALUES (1002044, '汕尾市', NULL, '441500', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002045, '城区', NULL, '441502', 1002044, 3);
INSERT INTO `sys_region` VALUES (1002046, '陆丰市', NULL, '441581', 1002044, 3);
INSERT INTO `sys_region` VALUES (1002047, '海丰县', NULL, '441521', 1002044, 3);
INSERT INTO `sys_region` VALUES (1002048, '陆河县', NULL, '441523', 1002044, 3);
INSERT INTO `sys_region` VALUES (1002049, '河源市', NULL, '441600', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002050, '源城区', NULL, '441602', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002051, '紫金县', NULL, '441621', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002052, '龙川县', NULL, '441622', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002053, '连平县', NULL, '441623', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002054, '和平县', NULL, '441624', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002055, '东源县', NULL, '441625', 1002049, 3);
INSERT INTO `sys_region` VALUES (1002056, '阳江市', NULL, '441700', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002057, '江城区', NULL, '441702', 1002056, 3);
INSERT INTO `sys_region` VALUES (1002058, '阳东区', NULL, '441704', 1002056, 3);
INSERT INTO `sys_region` VALUES (1002059, '阳春市', NULL, '441781', 1002056, 3);
INSERT INTO `sys_region` VALUES (1002060, '阳西县', NULL, '441721', 1002056, 3);
INSERT INTO `sys_region` VALUES (1002061, '清远市', NULL, '441800', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002062, '清城区', NULL, '441802', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002063, '清新区', NULL, '441803', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002064, '英德市', NULL, '441881', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002065, '连州市', NULL, '441882', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002066, '佛冈县', NULL, '441821', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002067, '阳山县', NULL, '441823', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002068, '连山壮族瑶族自治县', NULL, '441825', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002069, '连南瑶族自治县', NULL, '441826', 1002061, 3);
INSERT INTO `sys_region` VALUES (1002070, '东莞市', NULL, '441900', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002071, '中山市', NULL, '442000', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002072, '潮州市', NULL, '445100', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002073, '湘桥区', NULL, '445102', 1002072, 3);
INSERT INTO `sys_region` VALUES (1002074, '潮安区', NULL, '445103', 1002072, 3);
INSERT INTO `sys_region` VALUES (1002075, '饶平县', NULL, '445122', 1002072, 3);
INSERT INTO `sys_region` VALUES (1002076, '揭阳市', NULL, '445200', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002077, '榕城区', NULL, '445202', 1002076, 3);
INSERT INTO `sys_region` VALUES (1002078, '揭东区', NULL, '445203', 1002076, 3);
INSERT INTO `sys_region` VALUES (1002079, '普宁市', NULL, '445281', 1002076, 3);
INSERT INTO `sys_region` VALUES (1002080, '揭西县', NULL, '445222', 1002076, 3);
INSERT INTO `sys_region` VALUES (1002081, '惠来县', NULL, '445224', 1002076, 3);
INSERT INTO `sys_region` VALUES (1002082, '云浮市', NULL, '445300', 1000018, 2);
INSERT INTO `sys_region` VALUES (1002083, '云城区', NULL, '445302', 1002082, 3);
INSERT INTO `sys_region` VALUES (1002084, '云安区', NULL, '445303', 1002082, 3);
INSERT INTO `sys_region` VALUES (1002085, '罗定市', NULL, '445381', 1002082, 3);
INSERT INTO `sys_region` VALUES (1002086, '新兴县', NULL, '445321', 1002082, 3);
INSERT INTO `sys_region` VALUES (1002087, '郁南县', NULL, '445322', 1002082, 3);
INSERT INTO `sys_region` VALUES (1002088, '南宁市', NULL, '450100', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002089, '青秀区', NULL, '450103', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002090, '兴宁区', NULL, '450102', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002091, '江南区', NULL, '450105', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002092, '西乡塘区', NULL, '450107', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002093, '良庆区', NULL, '450108', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002094, '邕宁区', NULL, '450109', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002095, '武鸣区', NULL, '450110', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002096, '隆安县', NULL, '450123', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002097, '马山县', NULL, '450124', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002098, '上林县', NULL, '450125', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002099, '宾阳县', NULL, '450126', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002100, '横县', NULL, '450127', 1002088, 3);
INSERT INTO `sys_region` VALUES (1002101, '柳州市', NULL, '450200', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002102, '柳北区', NULL, '450205', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002103, '城中区', NULL, '450202', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002104, '鱼峰区', NULL, '450203', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002105, '柳南区', NULL, '450204', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002106, '柳江区', NULL, '450206', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002107, '柳城县', NULL, '450222', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002108, '鹿寨县', NULL, '450223', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002109, '融安县', NULL, '450224', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002110, '融水苗族自治县', NULL, '450225', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002111, '三江侗族自治县', NULL, '450226', 1002101, 3);
INSERT INTO `sys_region` VALUES (1002112, '桂林市', NULL, '450300', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002113, '临桂区', NULL, '450312', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002114, '秀峰区', NULL, '450302', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002115, '叠彩区', NULL, '450303', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002116, '象山区', NULL, '450304', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002117, '七星区', NULL, '450305', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002118, '雁山区', NULL, '450311', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002119, '阳朔县', NULL, '450321', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002120, '灵川县', NULL, '450323', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002121, '全州县', NULL, '450324', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002122, '兴安县', NULL, '450325', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002123, '永福县', NULL, '450326', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002124, '灌阳县', NULL, '450327', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002125, '资源县', NULL, '450329', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002126, '平乐县', NULL, '450330', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002127, '荔浦县', NULL, '450331', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002128, '龙胜各族自治县', NULL, '450328', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002129, '恭城瑶族自治县', NULL, '450332', 1002112, 3);
INSERT INTO `sys_region` VALUES (1002130, '梧州市', NULL, '450400', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002131, '长洲区', NULL, '450405', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002132, '万秀区', NULL, '450403', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002133, '龙圩区', NULL, '450406', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002134, '岑溪市', NULL, '450481', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002135, '苍梧县', NULL, '450421', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002136, '藤县', NULL, '450422', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002137, '蒙山县', NULL, '450423', 1002130, 3);
INSERT INTO `sys_region` VALUES (1002138, '北海市', NULL, '450500', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002139, '海城区', NULL, '450502', 1002138, 3);
INSERT INTO `sys_region` VALUES (1002140, '银海区', NULL, '450503', 1002138, 3);
INSERT INTO `sys_region` VALUES (1002141, '铁山港区', NULL, '450512', 1002138, 3);
INSERT INTO `sys_region` VALUES (1002142, '合浦县', NULL, '450521', 1002138, 3);
INSERT INTO `sys_region` VALUES (1002143, '防城港市', NULL, '450600', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002144, '港口区', NULL, '450602', 1002143, 3);
INSERT INTO `sys_region` VALUES (1002145, '防城区', NULL, '450603', 1002143, 3);
INSERT INTO `sys_region` VALUES (1002146, '东兴市', NULL, '450681', 1002143, 3);
INSERT INTO `sys_region` VALUES (1002147, '上思县', NULL, '450621', 1002143, 3);
INSERT INTO `sys_region` VALUES (1002148, '钦州市', NULL, '450700', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002149, '钦南区', NULL, '450702', 1002148, 3);
INSERT INTO `sys_region` VALUES (1002150, '钦北区', NULL, '450703', 1002148, 3);
INSERT INTO `sys_region` VALUES (1002151, '灵山县', NULL, '450721', 1002148, 3);
INSERT INTO `sys_region` VALUES (1002152, '浦北县', NULL, '450722', 1002148, 3);
INSERT INTO `sys_region` VALUES (1002153, '贵港市', NULL, '450800', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002154, '港北区', NULL, '450802', 1002153, 3);
INSERT INTO `sys_region` VALUES (1002155, '港南区', NULL, '450803', 1002153, 3);
INSERT INTO `sys_region` VALUES (1002156, '覃塘区', NULL, '450804', 1002153, 3);
INSERT INTO `sys_region` VALUES (1002157, '桂平市', NULL, '450881', 1002153, 3);
INSERT INTO `sys_region` VALUES (1002158, '平南县', NULL, '450821', 1002153, 3);
INSERT INTO `sys_region` VALUES (1002159, '玉林市', NULL, '450900', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002160, '玉州区', NULL, '450902', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002161, '福绵区', NULL, '450903', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002162, '北流市', NULL, '450981', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002163, '容县', NULL, '450921', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002164, '陆川县', NULL, '450922', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002165, '博白县', NULL, '450923', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002166, '兴业县', NULL, '450924', 1002159, 3);
INSERT INTO `sys_region` VALUES (1002167, '百色市', NULL, '451000', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002168, '右江区', NULL, '451002', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002169, '靖西市', NULL, '451081', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002170, '田阳县', NULL, '451021', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002171, '田东县', NULL, '451022', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002172, '平果县', NULL, '451023', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002173, '德保县', NULL, '451024', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002174, '那坡县', NULL, '451026', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002175, '凌云县', NULL, '451027', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002176, '乐业县', NULL, '451028', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002177, '田林县', NULL, '451029', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002178, '西林县', NULL, '451030', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002179, '隆林各族自治县', NULL, '451031', 1002167, 3);
INSERT INTO `sys_region` VALUES (1002180, '贺州市', NULL, '451100', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002181, '八步区', NULL, '451102', 1002180, 3);
INSERT INTO `sys_region` VALUES (1002182, '平桂区', NULL, '451103', 1002180, 3);
INSERT INTO `sys_region` VALUES (1002183, '昭平县', NULL, '451121', 1002180, 3);
INSERT INTO `sys_region` VALUES (1002184, '钟山县', NULL, '451122', 1002180, 3);
INSERT INTO `sys_region` VALUES (1002185, '富川瑶族自治县', NULL, '451123', 1002180, 3);
INSERT INTO `sys_region` VALUES (1002186, '河池市', NULL, '451200', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002187, '金城江区', NULL, '451202', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002188, '宜州区', NULL, '451203', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002189, '南丹县', NULL, '451221', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002190, '天峨县', NULL, '451222', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002191, '凤山县', NULL, '451223', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002192, '东兰县', NULL, '451224', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002193, '罗城仫佬族自治县', NULL, '451225', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002194, '环江毛南族自治县', NULL, '451226', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002195, '巴马瑶族自治县', NULL, '451227', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002196, '都安瑶族自治县', NULL, '451228', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002197, '大化瑶族自治县', NULL, '451229', 1002186, 3);
INSERT INTO `sys_region` VALUES (1002198, '来宾市', NULL, '451300', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002199, '兴宾区', NULL, '451302', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002200, '合山市', NULL, '451381', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002201, '忻城县', NULL, '451321', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002202, '象州县', NULL, '451322', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002203, '武宣县', NULL, '451323', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002204, '金秀瑶族自治县', NULL, '451324', 1002198, 3);
INSERT INTO `sys_region` VALUES (1002205, '崇左市', NULL, '451400', 1000019, 2);
INSERT INTO `sys_region` VALUES (1002206, '江州区', NULL, '451402', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002207, '凭祥市', NULL, '451481', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002208, '扶绥县', NULL, '451421', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002209, '宁明县', NULL, '451422', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002210, '龙州县', NULL, '451423', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002211, '大新县', NULL, '451424', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002212, '天等县', NULL, '451425', 1002205, 3);
INSERT INTO `sys_region` VALUES (1002213, '海口市', NULL, '460100', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002214, '龙华区', NULL, '460106', 1002213, 3);
INSERT INTO `sys_region` VALUES (1002215, '秀英区', NULL, '460105', 1002213, 3);
INSERT INTO `sys_region` VALUES (1002216, '琼山区', NULL, '460107', 1002213, 3);
INSERT INTO `sys_region` VALUES (1002217, '美兰区', NULL, '460108', 1002213, 3);
INSERT INTO `sys_region` VALUES (1002218, '三亚市', NULL, '460200', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002219, '吉阳区', NULL, '460203', 1002218, 3);
INSERT INTO `sys_region` VALUES (1002220, '海棠区', NULL, '460202', 1002218, 3);
INSERT INTO `sys_region` VALUES (1002221, '天涯区', NULL, '460204', 1002218, 3);
INSERT INTO `sys_region` VALUES (1002222, '崖州区', NULL, '460205', 1002218, 3);
INSERT INTO `sys_region` VALUES (1002223, '三沙市', NULL, '460300', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002224, '儋州市', NULL, '460400', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002225, '五指山市', NULL, '469001', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002226, '琼海市', NULL, '469002', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002227, '文昌市', NULL, '469005', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002228, '万宁市', NULL, '469006', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002229, '东方市', NULL, '469007', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002230, '定安县', NULL, '469021', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002231, '屯昌县', NULL, '469022', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002232, '澄迈县', NULL, '469023', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002233, '临高县', NULL, '469024', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002234, '白沙黎族自治县', NULL, '469025', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002235, '昌江黎族自治县', NULL, '469026', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002236, '乐东黎族自治县', NULL, '469027', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002237, '陵水黎族自治县', NULL, '469028', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002238, '保亭黎族苗族自治县', NULL, '469029', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002239, '琼中黎族苗族自治县', NULL, '469030', 1000020, 2);
INSERT INTO `sys_region` VALUES (1002240, '渝中区', NULL, '500103', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002241, '万州区', NULL, '500101', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002242, '涪陵区', NULL, '500102', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002243, '大渡口区', NULL, '500104', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002244, '江北区', NULL, '500105', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002245, '沙坪坝区', NULL, '500106', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002246, '九龙坡区', NULL, '500107', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002247, '南岸区', NULL, '500108', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002248, '北碚区', NULL, '500109', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002249, '綦江区', NULL, '500110', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002250, '大足区', NULL, '500111', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002251, '渝北区', NULL, '500112', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002252, '巴南区', NULL, '500113', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002253, '黔江区', NULL, '500114', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002254, '长寿区', NULL, '500115', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002255, '江津区', NULL, '500116', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002256, '合川区', NULL, '500117', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002257, '永川区', NULL, '500118', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002258, '南川区', NULL, '500119', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002259, '璧山区', NULL, '500120', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002260, '铜梁区', NULL, '500151', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002261, '潼南区', NULL, '500152', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002262, '荣昌区', NULL, '500153', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002263, '开州区', NULL, '500154', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002264, '梁平区', NULL, '500155', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002265, '武隆区', NULL, '500156', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002266, '城口县', NULL, '500229', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002267, '丰都县', NULL, '500230', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002268, '垫江县', NULL, '500231', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002269, '忠县', NULL, '500233', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002270, '云阳县', NULL, '500235', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002271, '奉节县', NULL, '500236', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002272, '巫山县', NULL, '500237', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002273, '巫溪县', NULL, '500238', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002274, '石柱土家族自治县', NULL, '500240', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002275, '秀山土家族苗族自治县', NULL, '500241', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002276, '酉阳土家族苗族自治县', NULL, '500242', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002277, '彭水苗族土家族自治县', NULL, '500243', 1000021, 2);
INSERT INTO `sys_region` VALUES (1002278, '成都市', NULL, '510100', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002279, '武侯区', NULL, '510107', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002280, '锦江区', NULL, '510104', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002281, '青羊区', NULL, '510105', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002282, '金牛区', NULL, '510106', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002283, '成华区', NULL, '510108', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002284, '龙泉驿区', NULL, '510112', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002285, '青白江区', NULL, '510113', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002286, '新都区', NULL, '510114', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002287, '温江区', NULL, '510115', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002288, '双流区', NULL, '510116', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002289, '郫都区', NULL, '510117', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002290, '都江堰市', NULL, '510181', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002291, '彭州市', NULL, '510182', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002292, '邛崃市', NULL, '510183', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002293, '崇州市', NULL, '510184', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002294, '简阳市', NULL, '510185', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002295, '金堂县', NULL, '510121', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002296, '大邑县', NULL, '510129', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002297, '蒲江县', NULL, '510131', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002298, '新津县', NULL, '510132', 1002278, 3);
INSERT INTO `sys_region` VALUES (1002299, '自贡市', NULL, '510300', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002300, '自流井区', NULL, '510302', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002301, '贡井区', NULL, '510303', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002302, '大安区', NULL, '510304', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002303, '沿滩区', NULL, '510311', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002304, '荣县', NULL, '510321', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002305, '富顺县', NULL, '510322', 1002299, 3);
INSERT INTO `sys_region` VALUES (1002306, '攀枝花市', NULL, '510400', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002307, '东区', NULL, '510402', 1002306, 3);
INSERT INTO `sys_region` VALUES (1002308, '西区', NULL, '510403', 1002306, 3);
INSERT INTO `sys_region` VALUES (1002309, '仁和区', NULL, '510411', 1002306, 3);
INSERT INTO `sys_region` VALUES (1002310, '米易县', NULL, '510421', 1002306, 3);
INSERT INTO `sys_region` VALUES (1002311, '盐边县', NULL, '510422', 1002306, 3);
INSERT INTO `sys_region` VALUES (1002312, '泸州市', NULL, '510500', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002313, '江阳区', NULL, '510502', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002314, '纳溪区', NULL, '510503', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002315, '龙马潭区', NULL, '510504', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002316, '泸县', NULL, '510521', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002317, '合江县', NULL, '510522', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002318, '叙永县', NULL, '510524', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002319, '古蔺县', NULL, '510525', 1002312, 3);
INSERT INTO `sys_region` VALUES (1002320, '德阳市', NULL, '510600', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002321, '旌阳区', NULL, '510603', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002322, '罗江区', NULL, '510604', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002323, '广汉市', NULL, '510681', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002324, '什邡市', NULL, '510682', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002325, '绵竹市', NULL, '510683', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002326, '中江县', NULL, '510623', 1002320, 3);
INSERT INTO `sys_region` VALUES (1002327, '绵阳市', NULL, '510700', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002328, '涪城区', NULL, '510703', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002329, '游仙区', NULL, '510704', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002330, '安州区', NULL, '510705', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002331, '江油市', NULL, '510781', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002332, '三台县', NULL, '510722', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002333, '盐亭县', NULL, '510723', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002334, '梓潼县', NULL, '510725', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002335, '平武县', NULL, '510727', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002336, '北川羌族自治县', NULL, '510726', 1002327, 3);
INSERT INTO `sys_region` VALUES (1002337, '广元市', NULL, '510800', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002338, '利州区', NULL, '510802', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002339, '昭化区', NULL, '510811', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002340, '朝天区', NULL, '510812', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002341, '旺苍县', NULL, '510821', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002342, '青川县', NULL, '510822', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002343, '剑阁县', NULL, '510823', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002344, '苍溪县', NULL, '510824', 1002337, 3);
INSERT INTO `sys_region` VALUES (1002345, '遂宁市', NULL, '510900', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002346, '船山区', NULL, '510903', 1002345, 3);
INSERT INTO `sys_region` VALUES (1002347, '安居区', NULL, '510904', 1002345, 3);
INSERT INTO `sys_region` VALUES (1002348, '蓬溪县', NULL, '510921', 1002345, 3);
INSERT INTO `sys_region` VALUES (1002349, '射洪县', NULL, '510922', 1002345, 3);
INSERT INTO `sys_region` VALUES (1002350, '大英县', NULL, '510923', 1002345, 3);
INSERT INTO `sys_region` VALUES (1002351, '内江市', NULL, '511000', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002352, '市中区', NULL, '511002', 1002351, 3);
INSERT INTO `sys_region` VALUES (1002353, '东兴区', NULL, '511011', 1002351, 3);
INSERT INTO `sys_region` VALUES (1002354, '隆昌市', NULL, '511083', 1002351, 3);
INSERT INTO `sys_region` VALUES (1002355, '威远县', NULL, '511024', 1002351, 3);
INSERT INTO `sys_region` VALUES (1002356, '资中县', NULL, '511025', 1002351, 3);
INSERT INTO `sys_region` VALUES (1002357, '乐山市', NULL, '511100', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002358, '市中区', NULL, '511102', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002359, '沙湾区', NULL, '511111', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002360, '五通桥区', NULL, '511112', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002361, '金口河区', NULL, '511113', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002362, '峨眉山市', NULL, '511181', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002363, '犍为县', NULL, '511123', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002364, '井研县', NULL, '511124', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002365, '夹江县', NULL, '511126', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002366, '沐川县', NULL, '511129', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002367, '峨边彝族自治县', NULL, '511132', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002368, '马边彝族自治县', NULL, '511133', 1002357, 3);
INSERT INTO `sys_region` VALUES (1002369, '南充市', NULL, '511300', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002370, '顺庆区', NULL, '511302', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002371, '高坪区', NULL, '511303', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002372, '嘉陵区', NULL, '511304', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002373, '阆中市', NULL, '511381', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002374, '南部县', NULL, '511321', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002375, '营山县', NULL, '511322', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002376, '蓬安县', NULL, '511323', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002377, '仪陇县', NULL, '511324', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002378, '西充县', NULL, '511325', 1002369, 3);
INSERT INTO `sys_region` VALUES (1002379, '眉山市', NULL, '511400', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002380, '东坡区', NULL, '511402', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002381, '彭山区', NULL, '511403', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002382, '仁寿县', NULL, '511421', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002383, '洪雅县', NULL, '511423', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002384, '丹棱县', NULL, '511424', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002385, '青神县', NULL, '511425', 1002379, 3);
INSERT INTO `sys_region` VALUES (1002386, '宜宾市', NULL, '511500', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002387, '翠屏区', NULL, '511502', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002388, '南溪区', NULL, '511503', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002389, '宜宾县', NULL, '511521', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002390, '江安县', NULL, '511523', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002391, '长宁县', NULL, '511524', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002392, '高县', NULL, '511525', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002393, '珙县', NULL, '511526', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002394, '筠连县', NULL, '511527', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002395, '兴文县', NULL, '511528', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002396, '屏山县', NULL, '511529', 1002386, 3);
INSERT INTO `sys_region` VALUES (1002397, '广安市', NULL, '511600', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002398, '广安区', NULL, '511602', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002399, '前锋区', NULL, '511603', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002400, '华蓥市', NULL, '511681', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002401, '岳池县', NULL, '511621', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002402, '武胜县', NULL, '511622', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002403, '邻水县', NULL, '511623', 1002397, 3);
INSERT INTO `sys_region` VALUES (1002404, '达州市', NULL, '511700', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002405, '通川区', NULL, '511702', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002406, '达川区', NULL, '511703', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002407, '万源市', NULL, '511781', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002408, '宣汉县', NULL, '511722', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002409, '开江县', NULL, '511723', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002410, '大竹县', NULL, '511724', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002411, '渠县', NULL, '511725', 1002404, 3);
INSERT INTO `sys_region` VALUES (1002412, '雅安市', NULL, '511800', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002413, '雨城区', NULL, '511802', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002414, '名山区', NULL, '511803', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002415, '荥经县', NULL, '511822', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002416, '汉源县', NULL, '511823', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002417, '石棉县', NULL, '511824', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002418, '天全县', NULL, '511825', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002419, '芦山县', NULL, '511826', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002420, '宝兴县', NULL, '511827', 1002412, 3);
INSERT INTO `sys_region` VALUES (1002421, '巴中市', NULL, '511900', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002422, '巴州区', NULL, '511902', 1002421, 3);
INSERT INTO `sys_region` VALUES (1002423, '恩阳区', NULL, '511903', 1002421, 3);
INSERT INTO `sys_region` VALUES (1002424, '通江县', NULL, '511921', 1002421, 3);
INSERT INTO `sys_region` VALUES (1002425, '南江县', NULL, '511922', 1002421, 3);
INSERT INTO `sys_region` VALUES (1002426, '平昌县', NULL, '511923', 1002421, 3);
INSERT INTO `sys_region` VALUES (1002427, '资阳市', NULL, '512000', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002428, '雁江区', NULL, '512002', 1002427, 3);
INSERT INTO `sys_region` VALUES (1002429, '乐至县', NULL, '512022', 1002427, 3);
INSERT INTO `sys_region` VALUES (1002430, '安岳县', NULL, '512021', 1002427, 3);
INSERT INTO `sys_region` VALUES (1002431, '阿坝藏族羌族自治州', NULL, '513200', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002432, '马尔康市', NULL, '513201', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002433, '汶川县', NULL, '513221', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002434, '理县', NULL, '513222', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002435, '茂县', NULL, '513223', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002436, '松潘县', NULL, '513224', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002437, '九寨沟县', NULL, '513225', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002438, '金川县', NULL, '513226', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002439, '小金县', NULL, '513227', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002440, '黑水县', NULL, '513228', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002441, '壤塘县', NULL, '513230', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002442, '阿坝县', NULL, '513231', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002443, '若尔盖县', NULL, '513232', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002444, '红原县', NULL, '513233', 1002431, 3);
INSERT INTO `sys_region` VALUES (1002445, '甘孜藏族自治州', NULL, '513300', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002446, '康定市', NULL, '513301', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002447, '泸定县', NULL, '513322', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002448, '丹巴县', NULL, '513323', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002449, '九龙县', NULL, '513324', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002450, '雅江县', NULL, '513325', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002451, '道孚县', NULL, '513326', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002452, '炉霍县', NULL, '513327', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002453, '甘孜县', NULL, '513328', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002454, '新龙县', NULL, '513329', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002455, '德格县', NULL, '513330', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002456, '白玉县', NULL, '513331', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002457, '石渠县', NULL, '513332', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002458, '色达县', NULL, '513333', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002459, '理塘县', NULL, '513334', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002460, '巴塘县', NULL, '513335', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002461, '乡城县', NULL, '513336', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002462, '稻城县', NULL, '513337', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002463, '得荣县', NULL, '513338', 1002445, 3);
INSERT INTO `sys_region` VALUES (1002464, '凉山彝族自治州', NULL, '513400', 1000022, 2);
INSERT INTO `sys_region` VALUES (1002465, '西昌市', NULL, '513401', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002466, '盐源县', NULL, '513423', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002467, '德昌县', NULL, '513424', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002468, '会理县', NULL, '513425', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002469, '会东县', NULL, '513426', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002470, '宁南县', NULL, '513427', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002471, '普格县', NULL, '513428', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002472, '布拖县', NULL, '513429', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002473, '金阳县', NULL, '513430', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002474, '昭觉县', NULL, '513431', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002475, '喜德县', NULL, '513432', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002476, '冕宁县', NULL, '513433', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002477, '越西县', NULL, '513434', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002478, '甘洛县', NULL, '513435', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002479, '美姑县', NULL, '513436', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002480, '雷波县', NULL, '513437', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002481, '木里藏族自治县', NULL, '513422', 1002464, 3);
INSERT INTO `sys_region` VALUES (1002482, '贵阳市', NULL, '520100', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002483, '乌当区', NULL, '520112', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002484, '南明区', NULL, '520102', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002485, '云岩区', NULL, '520103', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002486, '花溪区', NULL, '520111', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002487, '白云区', NULL, '520113', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002488, '观山湖区', NULL, '520115', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002489, '清镇市', NULL, '520181', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002490, '开阳县', NULL, '520121', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002491, '息烽县', NULL, '520122', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002492, '修文县', NULL, '520123', 1002482, 3);
INSERT INTO `sys_region` VALUES (1002493, '六盘水市', NULL, '520200', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002494, '钟山区', NULL, '520201', 1002493, 3);
INSERT INTO `sys_region` VALUES (1002495, '盘州市', NULL, '520281', 1002493, 3);
INSERT INTO `sys_region` VALUES (1002496, '水城县', NULL, '520221', 1002493, 3);
INSERT INTO `sys_region` VALUES (1002497, '六枝特区', NULL, '520203', 1002493, 3);
INSERT INTO `sys_region` VALUES (1002498, '遵义市', NULL, '520300', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002499, '汇川区', NULL, '520303', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002500, '红花岗区', NULL, '520302', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002501, '播州区', NULL, '520304', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002502, '赤水市', NULL, '520381', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002503, '仁怀市', NULL, '520382', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002504, '桐梓县', NULL, '520322', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002505, '绥阳县', NULL, '520323', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002506, '正安县', NULL, '520324', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002507, '凤冈县', NULL, '520327', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002508, '湄潭县', NULL, '520328', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002509, '余庆县', NULL, '520329', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002510, '习水县', NULL, '520330', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002511, '道真仡佬族苗族自治县', NULL, '520325', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002512, '务川仡佬族苗族自治县', NULL, '520326', 1002498, 3);
INSERT INTO `sys_region` VALUES (1002513, '安顺市', NULL, '520400', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002514, '西秀区', NULL, '520402', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002515, '平坝区', NULL, '520403', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002516, '普定县', NULL, '520422', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002517, '镇宁布依族苗族自治县', NULL, '520423', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002518, '关岭布依族苗族自治县', NULL, '520424', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002519, '紫云苗族布依族自治县', NULL, '520425', 1002513, 3);
INSERT INTO `sys_region` VALUES (1002520, '毕节市', NULL, '520500', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002521, '七星关区', NULL, '520502', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002522, '大方县', NULL, '520521', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002523, '黔西县', NULL, '520522', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002524, '金沙县', NULL, '520523', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002525, '织金县', NULL, '520524', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002526, '纳雍县', NULL, '520525', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002527, '赫章县', NULL, '520527', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002528, '威宁彝族回族苗族自治县', NULL, '520526', 1002520, 3);
INSERT INTO `sys_region` VALUES (1002529, '铜仁市', NULL, '520600', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002530, '碧江区', NULL, '520602', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002531, '万山区', NULL, '520603', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002532, '江口县', NULL, '520621', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002533, '石阡县', NULL, '520623', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002534, '思南县', NULL, '520624', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002535, '德江县', NULL, '520626', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002536, '玉屏侗族自治县', NULL, '520622', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002537, '印江土家族苗族自治县', NULL, '520625', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002538, '沿河土家族自治县', NULL, '520627', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002539, '松桃苗族自治县', NULL, '520628', 1002529, 3);
INSERT INTO `sys_region` VALUES (1002540, '黔西南布依族苗族自治州', NULL, '522300', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002541, '兴义市', NULL, '522301', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002542, '兴仁县', NULL, '522322', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002543, '普安县', NULL, '522323', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002544, '晴隆县', NULL, '522324', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002545, '贞丰县', NULL, '522325', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002546, '望谟县', NULL, '522326', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002547, '册亨县', NULL, '522327', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002548, '安龙县', NULL, '522328', 1002540, 3);
INSERT INTO `sys_region` VALUES (1002549, '黔东南苗族侗族自治州', NULL, '522600', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002550, '凯里市', NULL, '522601', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002551, '黄平县', NULL, '522622', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002552, '施秉县', NULL, '522623', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002553, '三穗县', NULL, '522624', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002554, '镇远县', NULL, '522625', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002555, '岑巩县', NULL, '522626', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002556, '天柱县', NULL, '522627', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002557, '锦屏县', NULL, '522628', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002558, '剑河县', NULL, '522629', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002559, '台江县', NULL, '522630', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002560, '黎平县', NULL, '522631', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002561, '榕江县', NULL, '522632', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002562, '从江县', NULL, '522633', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002563, '雷山县', NULL, '522634', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002564, '麻江县', NULL, '522635', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002565, '丹寨县', NULL, '522636', 1002549, 3);
INSERT INTO `sys_region` VALUES (1002566, '黔南布依族苗族自治州', NULL, '522700', 1000023, 2);
INSERT INTO `sys_region` VALUES (1002567, '都匀市', NULL, '522701', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002568, '福泉市', NULL, '522702', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002569, '荔波县', NULL, '522722', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002570, '贵定县', NULL, '522723', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002571, '瓮安县', NULL, '522725', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002572, '独山县', NULL, '522726', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002573, '平塘县', NULL, '522727', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002574, '罗甸县', NULL, '522728', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002575, '长顺县', NULL, '522729', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002576, '龙里县', NULL, '522730', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002577, '惠水县', NULL, '522731', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002578, '三都水族自治县', NULL, '522732', 1002566, 3);
INSERT INTO `sys_region` VALUES (1002579, '昆明市', NULL, '530100', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002580, '呈贡区', NULL, '530114', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002581, '五华区', NULL, '530102', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002582, '盘龙区', NULL, '530103', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002583, '官渡区', NULL, '530111', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002584, '西山区', NULL, '530112', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002585, '东川区', NULL, '530113', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002586, '晋宁区', NULL, '530115', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002587, '安宁市', NULL, '530181', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002588, '富民县', NULL, '530124', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002589, '宜良县', NULL, '530125', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002590, '嵩明县', NULL, '530127', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002591, '石林彝族自治县', NULL, '530126', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002592, '禄劝彝族苗族自治县', NULL, '530128', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002593, '寻甸回族彝族自治县', NULL, '530129', 1002579, 3);
INSERT INTO `sys_region` VALUES (1002594, '曲靖市', NULL, '530300', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002595, '麒麟区', NULL, '530302', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002596, '沾益区', NULL, '530303', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002597, '宣威市', NULL, '530381', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002598, '马龙县', NULL, '530321', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002599, '陆良县', NULL, '530322', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002600, '师宗县', NULL, '530323', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002601, '罗平县', NULL, '530324', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002602, '富源县', NULL, '530325', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002603, '会泽县', NULL, '530326', 1002594, 3);
INSERT INTO `sys_region` VALUES (1002604, '玉溪市', NULL, '530400', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002605, '红塔区', NULL, '530402', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002606, '江川区', NULL, '530403', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002607, '澄江县', NULL, '530422', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002608, '通海县', NULL, '530423', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002609, '华宁县', NULL, '530424', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002610, '易门县', NULL, '530425', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002611, '峨山彝族自治县', NULL, '530426', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002612, '新平彝族傣族自治县', NULL, '530427', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002613, '元江哈尼族彝族傣族自治县', NULL, '530428', 1002604, 3);
INSERT INTO `sys_region` VALUES (1002614, '保山市', NULL, '530500', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002615, '隆阳区', NULL, '530502', 1002614, 3);
INSERT INTO `sys_region` VALUES (1002616, '腾冲市', NULL, '530581', 1002614, 3);
INSERT INTO `sys_region` VALUES (1002617, '施甸县', NULL, '530521', 1002614, 3);
INSERT INTO `sys_region` VALUES (1002618, '龙陵县', NULL, '530523', 1002614, 3);
INSERT INTO `sys_region` VALUES (1002619, '昌宁县', NULL, '530524', 1002614, 3);
INSERT INTO `sys_region` VALUES (1002620, '昭通市', NULL, '530600', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002621, '昭阳区', NULL, '530602', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002622, '鲁甸县', NULL, '530621', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002623, '巧家县', NULL, '530622', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002624, '盐津县', NULL, '530623', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002625, '大关县', NULL, '530624', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002626, '永善县', NULL, '530625', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002627, '绥江县', NULL, '530626', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002628, '镇雄县', NULL, '530627', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002629, '彝良县', NULL, '530628', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002630, '威信县', NULL, '530629', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002631, '水富县', NULL, '530630', 1002620, 3);
INSERT INTO `sys_region` VALUES (1002632, '丽江市', NULL, '530700', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002633, '古城区', NULL, '530702', 1002632, 3);
INSERT INTO `sys_region` VALUES (1002634, '永胜县', NULL, '530722', 1002632, 3);
INSERT INTO `sys_region` VALUES (1002635, '华坪县', NULL, '530723', 1002632, 3);
INSERT INTO `sys_region` VALUES (1002636, '玉龙纳西族自治县', NULL, '530721', 1002632, 3);
INSERT INTO `sys_region` VALUES (1002637, '宁蒗彝族自治县', NULL, '530724', 1002632, 3);
INSERT INTO `sys_region` VALUES (1002638, '普洱市', NULL, '530800', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002639, '思茅区', NULL, '530802', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002640, '宁洱哈尼族彝族自治县', NULL, '530821', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002641, '墨江哈尼族自治县', NULL, '530822', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002642, '景东彝族自治县', NULL, '530823', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002643, '景谷傣族彝族自治县', NULL, '530824', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002644, '镇沅彝族哈尼族拉祜族自治县', NULL, '530825', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002645, '江城哈尼族彝族自治县', NULL, '530826', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002646, '孟连傣族拉祜族佤族自治县', NULL, '530827', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002647, '澜沧拉祜族自治县', NULL, '530828', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002648, '西盟佤族自治县', NULL, '530829', 1002638, 3);
INSERT INTO `sys_region` VALUES (1002649, '临沧市', NULL, '530900', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002650, '临翔区', NULL, '530902', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002651, '凤庆县', NULL, '530921', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002652, '云县', NULL, '530922', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002653, '永德县', NULL, '530923', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002654, '镇康县', NULL, '530924', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002655, '双江拉祜族佤族布朗族傣族自治县', NULL, '530925', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002656, '耿马傣族佤族自治县', NULL, '530926', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002657, '沧源佤族自治县', NULL, '530927', 1002649, 3);
INSERT INTO `sys_region` VALUES (1002658, '楚雄彝族自治州', NULL, '532300', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002659, '楚雄市', NULL, '532301', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002660, '双柏县', NULL, '532322', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002661, '牟定县', NULL, '532323', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002662, '南华县', NULL, '532324', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002663, '姚安县', NULL, '532325', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002664, '大姚县', NULL, '532326', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002665, '永仁县', NULL, '532327', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002666, '元谋县', NULL, '532328', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002667, '武定县', NULL, '532329', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002668, '禄丰县', NULL, '532331', 1002658, 3);
INSERT INTO `sys_region` VALUES (1002669, '红河哈尼族彝族自治州', NULL, '532500', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002670, '蒙自市', NULL, '532503', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002671, '个旧市', NULL, '532501', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002672, '开远市', NULL, '532502', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002673, '弥勒市', NULL, '532504', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002674, '建水县', NULL, '532524', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002675, '石屏县', NULL, '532525', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002676, '泸西县', NULL, '532527', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002677, '元阳县', NULL, '532528', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002678, '红河县', NULL, '532529', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002679, '绿春县', NULL, '532531', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002680, '屏边苗族自治县', NULL, '532523', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002681, '金平苗族瑶族傣族自治县', NULL, '532530', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002682, '河口瑶族自治县', NULL, '532532', 1002669, 3);
INSERT INTO `sys_region` VALUES (1002683, '文山壮族苗族自治州', NULL, '532600', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002684, '文山市', NULL, '532601', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002685, '砚山县', NULL, '532622', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002686, '西畴县', NULL, '532623', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002687, '麻栗坡县', NULL, '532624', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002688, '马关县', NULL, '532625', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002689, '丘北县', NULL, '532626', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002690, '广南县', NULL, '532627', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002691, '富宁县', NULL, '532628', 1002683, 3);
INSERT INTO `sys_region` VALUES (1002692, '西双版纳傣族自治州', NULL, '532800', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002693, '景洪市', NULL, '532801', 1002692, 3);
INSERT INTO `sys_region` VALUES (1002694, '勐海县', NULL, '532822', 1002692, 3);
INSERT INTO `sys_region` VALUES (1002695, '勐腊县', NULL, '532823', 1002692, 3);
INSERT INTO `sys_region` VALUES (1002696, '大理白族自治州', NULL, '532900', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002697, '大理市', NULL, '532901', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002698, '祥云县', NULL, '532923', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002699, '宾川县', NULL, '532924', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002700, '弥渡县', NULL, '532925', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002701, '永平县', NULL, '532928', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002702, '云龙县', NULL, '532929', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002703, '洱源县', NULL, '532930', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002704, '剑川县', NULL, '532931', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002705, '鹤庆县', NULL, '532932', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002706, '漾濞彝族自治县', NULL, '532922', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002707, '南涧彝族自治县', NULL, '532926', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002708, '巍山彝族回族自治县', NULL, '532927', 1002696, 3);
INSERT INTO `sys_region` VALUES (1002709, '德宏傣族景颇族自治州', NULL, '533100', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002710, '芒市', NULL, '533103', 1002709, 3);
INSERT INTO `sys_region` VALUES (1002711, '瑞丽市', NULL, '533102', 1002709, 3);
INSERT INTO `sys_region` VALUES (1002712, '梁河县', NULL, '533122', 1002709, 3);
INSERT INTO `sys_region` VALUES (1002713, '盈江县', NULL, '533123', 1002709, 3);
INSERT INTO `sys_region` VALUES (1002714, '陇川县', NULL, '533124', 1002709, 3);
INSERT INTO `sys_region` VALUES (1002715, '怒江傈僳族自治州', NULL, '533300', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002716, '泸水市', NULL, '533301', 1002715, 3);
INSERT INTO `sys_region` VALUES (1002717, '福贡县', NULL, '533323', 1002715, 3);
INSERT INTO `sys_region` VALUES (1002718, '贡山独龙族怒族自治县', NULL, '533324', 1002715, 3);
INSERT INTO `sys_region` VALUES (1002719, '兰坪白族普米族自治县', NULL, '533325', 1002715, 3);
INSERT INTO `sys_region` VALUES (1002720, '迪庆藏族自治州', NULL, '533400', 1000024, 2);
INSERT INTO `sys_region` VALUES (1002721, '香格里拉市', NULL, '533401', 1002720, 3);
INSERT INTO `sys_region` VALUES (1002722, '德钦县', NULL, '533422', 1002720, 3);
INSERT INTO `sys_region` VALUES (1002723, '维西傈僳族自治县', NULL, '533423', 1002720, 3);
INSERT INTO `sys_region` VALUES (1002724, '拉萨市', NULL, '540100', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002725, '城关区', NULL, '540102', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002726, '堆龙德庆区', NULL, '540103', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002727, '达孜区', NULL, '540104', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002728, '林周县', NULL, '540121', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002729, '当雄县', NULL, '540122', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002730, '尼木县', NULL, '540123', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002731, '曲水县', NULL, '540124', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002732, '墨竹工卡县', NULL, '540127', 1002724, 3);
INSERT INTO `sys_region` VALUES (1002733, '日喀则市', NULL, '540200', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002734, '桑珠孜区', NULL, '540202', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002735, '南木林县', NULL, '540221', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002736, '江孜县', NULL, '540222', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002737, '定日县', NULL, '540223', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002738, '萨迦县', NULL, '540224', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002739, '拉孜县', NULL, '540225', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002740, '昂仁县', NULL, '540226', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002741, '谢通门县', NULL, '540227', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002742, '白朗县', NULL, '540228', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002743, '仁布县', NULL, '540229', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002744, '康马县', NULL, '540230', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002745, '定结县', NULL, '540231', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002746, '仲巴县', NULL, '540232', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002747, '亚东县', NULL, '540233', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002748, '吉隆县', NULL, '540234', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002749, '聂拉木县', NULL, '540235', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002750, '萨嘎县', NULL, '540236', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002751, '岗巴县', NULL, '540237', 1002733, 3);
INSERT INTO `sys_region` VALUES (1002752, '昌都市', NULL, '540300', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002753, '卡若区', NULL, '540302', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002754, '江达县', NULL, '540321', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002755, '贡觉县', NULL, '540322', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002756, '类乌齐县', NULL, '540323', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002757, '丁青县', NULL, '540324', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002758, '察雅县', NULL, '540325', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002759, '八宿县', NULL, '540326', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002760, '左贡县', NULL, '540327', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002761, '芒康县', NULL, '540328', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002762, '洛隆县', NULL, '540329', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002763, '边坝县', NULL, '540330', 1002752, 3);
INSERT INTO `sys_region` VALUES (1002764, '林芝市', NULL, '540400', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002765, '巴宜区', NULL, '540402', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002766, '工布江达县', NULL, '540421', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002767, '米林县', NULL, '540422', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002768, '墨脱县', NULL, '540423', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002769, '波密县', NULL, '540424', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002770, '察隅县', NULL, '540425', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002771, '朗县', NULL, '540426', 1002764, 3);
INSERT INTO `sys_region` VALUES (1002772, '山南市', NULL, '540500', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002773, '乃东区', NULL, '540502', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002774, '扎囊县', NULL, '540521', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002775, '贡嘎县', NULL, '540522', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002776, '桑日县', NULL, '540523', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002777, '琼结县', NULL, '540524', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002778, '曲松县', NULL, '540525', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002779, '措美县', NULL, '540526', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002780, '洛扎县', NULL, '540527', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002781, '加查县', NULL, '540528', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002782, '隆子县', NULL, '540529', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002783, '错那县', NULL, '540530', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002784, '浪卡子县', NULL, '540531', 1002772, 3);
INSERT INTO `sys_region` VALUES (1002785, '那曲市', NULL, '540600', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002786, '色尼区', NULL, '540602', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002787, '嘉黎县', NULL, '540621', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002788, '比如县', NULL, '540622', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002789, '聂荣县', NULL, '540623', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002790, '安多县', NULL, '540624', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002791, '申扎县', NULL, '540625', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002792, '索县', NULL, '540626', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002793, '班戈县', NULL, '540627', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002794, '巴青县', NULL, '540628', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002795, '尼玛县', NULL, '540629', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002796, '双湖县', NULL, '540630', 1002785, 3);
INSERT INTO `sys_region` VALUES (1002797, '阿里地区', NULL, '542500', 1000025, 2);
INSERT INTO `sys_region` VALUES (1002798, '噶尔县', NULL, '542523', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002799, '普兰县', NULL, '542521', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002800, '札达县', NULL, '542522', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002801, '日土县', NULL, '542524', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002802, '革吉县', NULL, '542525', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002803, '改则县', NULL, '542526', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002804, '措勤县', NULL, '542527', 1002797, 3);
INSERT INTO `sys_region` VALUES (1002805, '西安市', NULL, '610100', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002806, '未央区', NULL, '610112', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002807, '新城区', NULL, '610102', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002808, '碑林区', NULL, '610103', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002809, '莲湖区', NULL, '610104', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002810, '灞桥区', NULL, '610111', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002811, '雁塔区', NULL, '610113', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002812, '阎良区', NULL, '610114', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002813, '临潼区', NULL, '610115', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002814, '长安区', NULL, '610116', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002815, '高陵区', NULL, '610117', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002816, '鄠邑区', NULL, '610118', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002817, '蓝田县', NULL, '610122', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002818, '周至县', NULL, '610124', 1002805, 3);
INSERT INTO `sys_region` VALUES (1002819, '铜川市', NULL, '610200', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002820, '耀州区', NULL, '610204', 1002819, 3);
INSERT INTO `sys_region` VALUES (1002821, '王益区', NULL, '610202', 1002819, 3);
INSERT INTO `sys_region` VALUES (1002822, '印台区', NULL, '610203', 1002819, 3);
INSERT INTO `sys_region` VALUES (1002823, '宜君县', NULL, '610222', 1002819, 3);
INSERT INTO `sys_region` VALUES (1002824, '宝鸡市', NULL, '610300', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002825, '金台区', NULL, '610303', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002826, '渭滨区', NULL, '610302', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002827, '陈仓区', NULL, '610304', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002828, '凤翔县', NULL, '610322', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002829, '岐山县', NULL, '610323', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002830, '扶风县', NULL, '610324', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002831, '眉县', NULL, '610326', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002832, '陇县', NULL, '610327', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002833, '千阳县', NULL, '610328', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002834, '麟游县', NULL, '610329', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002835, '凤县', NULL, '610330', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002836, '太白县', NULL, '610331', 1002824, 3);
INSERT INTO `sys_region` VALUES (1002837, '咸阳市', NULL, '610400', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002838, '秦都区', NULL, '610402', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002839, '杨陵区', NULL, '610403', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002840, '渭城区', NULL, '610404', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002841, '兴平市', NULL, '610481', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002842, '三原县', NULL, '610422', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002843, '泾阳县', NULL, '610423', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002844, '乾县', NULL, '610424', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002845, '礼泉县', NULL, '610425', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002846, '永寿县', NULL, '610426', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002847, '彬县', NULL, '610427', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002848, '长武县', NULL, '610428', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002849, '旬邑县', NULL, '610429', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002850, '淳化县', NULL, '610430', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002851, '武功县', NULL, '610431', 1002837, 3);
INSERT INTO `sys_region` VALUES (1002852, '渭南市', NULL, '610500', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002853, '临渭区', NULL, '610502', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002854, '韩城市', NULL, '610581', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002855, '华阴市', NULL, '610582', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002856, '华州区', NULL, '610503', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002857, '潼关县', NULL, '610522', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002858, '大荔县', NULL, '610523', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002859, '合阳县', NULL, '610524', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002860, '澄城县', NULL, '610525', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002861, '蒲城县', NULL, '610526', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002862, '白水县', NULL, '610527', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002863, '富平县', NULL, '610528', 1002852, 3);
INSERT INTO `sys_region` VALUES (1002864, '延安市', NULL, '610600', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002865, '宝塔区', NULL, '610602', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002866, '安塞区', NULL, '610603', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002867, '延长县', NULL, '610621', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002868, '延川县', NULL, '610622', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002869, '子长县', NULL, '610623', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002870, '志丹县', NULL, '610625', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002871, '吴起县', NULL, '610626', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002872, '甘泉县', NULL, '610627', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002873, '富县', NULL, '610628', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002874, '洛川县', NULL, '610629', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002875, '宜川县', NULL, '610630', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002876, '黄龙县', NULL, '610631', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002877, '黄陵县', NULL, '610632', 1002864, 3);
INSERT INTO `sys_region` VALUES (1002878, '汉中市', NULL, '610700', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002879, '汉台区', NULL, '610702', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002880, '南郑区', NULL, '610703', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002881, '城固县', NULL, '610722', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002882, '洋县', NULL, '610723', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002883, '西乡县', NULL, '610724', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002884, '勉县', NULL, '610725', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002885, '宁强县', NULL, '610726', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002886, '略阳县', NULL, '610727', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002887, '镇巴县', NULL, '610728', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002888, '留坝县', NULL, '610729', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002889, '佛坪县', NULL, '610730', 1002878, 3);
INSERT INTO `sys_region` VALUES (1002890, '榆林市', NULL, '610800', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002891, '榆阳区', NULL, '610802', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002892, '神木市', NULL, '610881', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002893, '府谷县', NULL, '610822', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002894, '横山区', NULL, '610803', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002895, '靖边县', NULL, '610824', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002896, '定边县', NULL, '610825', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002897, '绥德县', NULL, '610826', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002898, '米脂县', NULL, '610827', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002899, '佳县', NULL, '610828', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002900, '吴堡县', NULL, '610829', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002901, '清涧县', NULL, '610830', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002902, '子洲县', NULL, '610831', 1002890, 3);
INSERT INTO `sys_region` VALUES (1002903, '安康市', NULL, '610900', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002904, '汉滨区', NULL, '610902', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002905, '汉阴县', NULL, '610921', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002906, '石泉县', NULL, '610922', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002907, '宁陕县', NULL, '610923', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002908, '紫阳县', NULL, '610924', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002909, '岚皋县', NULL, '610925', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002910, '平利县', NULL, '610926', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002911, '镇坪县', NULL, '610927', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002912, '旬阳县', NULL, '610928', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002913, '白河县', NULL, '610929', 1002903, 3);
INSERT INTO `sys_region` VALUES (1002914, '商洛市', NULL, '611000', 1000026, 2);
INSERT INTO `sys_region` VALUES (1002915, '商州区', NULL, '611002', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002916, '洛南县', NULL, '611021', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002917, '丹凤县', NULL, '611022', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002918, '商南县', NULL, '611023', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002919, '山阳县', NULL, '611024', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002920, '镇安县', NULL, '611025', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002921, '柞水县', NULL, '611026', 1002914, 3);
INSERT INTO `sys_region` VALUES (1002922, '兰州市', NULL, '620100', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002923, '城关区', NULL, '620102', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002924, '七里河区', NULL, '620103', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002925, '西固区', NULL, '620104', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002926, '安宁区', NULL, '620105', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002927, '红古区', NULL, '620111', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002928, '永登县', NULL, '620121', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002929, '皋兰县', NULL, '620122', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002930, '榆中县', NULL, '620123', 1002922, 3);
INSERT INTO `sys_region` VALUES (1002931, '嘉峪关市', NULL, '620200', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002932, '金昌市', NULL, '620300', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002933, '金川区', NULL, '620302', 1002932, 3);
INSERT INTO `sys_region` VALUES (1002934, '永昌县', NULL, '620321', 1002932, 3);
INSERT INTO `sys_region` VALUES (1002935, '白银市', NULL, '620400', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002936, '白银区', NULL, '620402', 1002935, 3);
INSERT INTO `sys_region` VALUES (1002937, '平川区', NULL, '620403', 1002935, 3);
INSERT INTO `sys_region` VALUES (1002938, '靖远县', NULL, '620421', 1002935, 3);
INSERT INTO `sys_region` VALUES (1002939, '会宁县', NULL, '620422', 1002935, 3);
INSERT INTO `sys_region` VALUES (1002940, '景泰县', NULL, '620423', 1002935, 3);
INSERT INTO `sys_region` VALUES (1002941, '天水市', NULL, '620500', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002942, '秦州区', NULL, '620502', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002943, '麦积区', NULL, '620503', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002944, '清水县', NULL, '620521', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002945, '秦安县', NULL, '620522', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002946, '甘谷县', NULL, '620523', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002947, '武山县', NULL, '620524', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002948, '张家川回族自治县', NULL, '620525', 1002941, 3);
INSERT INTO `sys_region` VALUES (1002949, '武威市', NULL, '620600', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002950, '凉州区', NULL, '620602', 1002949, 3);
INSERT INTO `sys_region` VALUES (1002951, '民勤县', NULL, '620621', 1002949, 3);
INSERT INTO `sys_region` VALUES (1002952, '古浪县', NULL, '620622', 1002949, 3);
INSERT INTO `sys_region` VALUES (1002953, '天祝藏族自治县', NULL, '620623', 1002949, 3);
INSERT INTO `sys_region` VALUES (1002954, '张掖市', NULL, '620700', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002955, '甘州区', NULL, '620702', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002956, '民乐县', NULL, '620722', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002957, '临泽县', NULL, '620723', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002958, '高台县', NULL, '620724', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002959, '山丹县', NULL, '620725', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002960, '肃南裕固族自治县', NULL, '620721', 1002954, 3);
INSERT INTO `sys_region` VALUES (1002961, '平凉市', NULL, '620800', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002962, '崆峒区', NULL, '620802', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002963, '泾川县', NULL, '620821', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002964, '灵台县', NULL, '620822', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002965, '崇信县', NULL, '620823', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002966, '华亭县', NULL, '620824', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002967, '庄浪县', NULL, '620825', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002968, '静宁县', NULL, '620826', 1002961, 3);
INSERT INTO `sys_region` VALUES (1002969, '酒泉市', NULL, '620900', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002970, '肃州区', NULL, '620902', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002971, '玉门市', NULL, '620981', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002972, '敦煌市', NULL, '620982', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002973, '金塔县', NULL, '620921', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002974, '瓜州县', NULL, '620922', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002975, '肃北蒙古族自治县', NULL, '620923', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002976, '阿克塞哈萨克族自治县', NULL, '620924', 1002969, 3);
INSERT INTO `sys_region` VALUES (1002977, '庆阳市', NULL, '621000', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002978, '西峰区', NULL, '621002', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002979, '庆城县', NULL, '621021', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002980, '环县', NULL, '621022', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002981, '华池县', NULL, '621023', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002982, '合水县', NULL, '621024', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002983, '正宁县', NULL, '621025', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002984, '宁县', NULL, '621026', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002985, '镇原县', NULL, '621027', 1002977, 3);
INSERT INTO `sys_region` VALUES (1002986, '定西市', NULL, '621100', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002987, '安定区', NULL, '621102', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002988, '通渭县', NULL, '621121', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002989, '陇西县', NULL, '621122', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002990, '渭源县', NULL, '621123', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002991, '临洮县', NULL, '621124', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002992, '漳县', NULL, '621125', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002993, '岷县', NULL, '621126', 1002986, 3);
INSERT INTO `sys_region` VALUES (1002994, '陇南市', NULL, '621200', 1000027, 2);
INSERT INTO `sys_region` VALUES (1002995, '武都区', NULL, '621202', 1002994, 3);
INSERT INTO `sys_region` VALUES (1002996, '成县', NULL, '621221', 1002994, 3);
INSERT INTO `sys_region` VALUES (1002997, '文县', NULL, '621222', 1002994, 3);
INSERT INTO `sys_region` VALUES (1002998, '宕昌县', NULL, '621223', 1002994, 3);
INSERT INTO `sys_region` VALUES (1002999, '康县', NULL, '621224', 1002994, 3);
INSERT INTO `sys_region` VALUES (1003000, '西和县', NULL, '621225', 1002994, 3);
INSERT INTO `sys_region` VALUES (1003001, '礼县', NULL, '621226', 1002994, 3);
INSERT INTO `sys_region` VALUES (1003002, '徽县', NULL, '621227', 1002994, 3);
INSERT INTO `sys_region` VALUES (1003003, '两当县', NULL, '621228', 1002994, 3);
INSERT INTO `sys_region` VALUES (1003004, '临夏回族自治州', NULL, '622900', 1000027, 2);
INSERT INTO `sys_region` VALUES (1003005, '临夏市', NULL, '622901', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003006, '临夏县', NULL, '622921', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003007, '康乐县', NULL, '622922', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003008, '永靖县', NULL, '622923', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003009, '广河县', NULL, '622924', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003010, '和政县', NULL, '622925', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003011, '东乡族自治县', NULL, '622926', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003012, '积石山保安族东乡族撒拉族自治县', NULL, '622927', 1003004, 3);
INSERT INTO `sys_region` VALUES (1003013, '甘南藏族自治州', NULL, '623000', 1000027, 2);
INSERT INTO `sys_region` VALUES (1003014, '合作市', NULL, '623001', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003015, '临潭县', NULL, '623021', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003016, '卓尼县', NULL, '623022', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003017, '舟曲县', NULL, '623023', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003018, '迭部县', NULL, '623024', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003019, '玛曲县', NULL, '623025', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003020, '碌曲县', NULL, '623026', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003021, '夏河县', NULL, '623027', 1003013, 3);
INSERT INTO `sys_region` VALUES (1003022, '西宁市', NULL, '630100', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003023, '城中区', NULL, '630103', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003024, '城东区', NULL, '630102', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003025, '城西区', NULL, '630104', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003026, '城北区', NULL, '630105', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003027, '湟中县', NULL, '630122', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003028, '湟源县', NULL, '630123', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003029, '大通回族土族自治县', NULL, '630121', 1003022, 3);
INSERT INTO `sys_region` VALUES (1003030, '海东市', NULL, '630200', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003031, '乐都区', NULL, '630202', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003032, '平安区', NULL, '630203', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003033, '民和回族土族自治县', NULL, '630222', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003034, '互助土族自治县', NULL, '630223', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003035, '化隆回族自治县', NULL, '630224', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003036, '循化撒拉族自治县', NULL, '630225', 1003030, 3);
INSERT INTO `sys_region` VALUES (1003037, '海北藏族自治州', NULL, '632200', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003038, '海晏县', NULL, '632223', 1003037, 3);
INSERT INTO `sys_region` VALUES (1003039, '祁连县', NULL, '632222', 1003037, 3);
INSERT INTO `sys_region` VALUES (1003040, '刚察县', NULL, '632224', 1003037, 3);
INSERT INTO `sys_region` VALUES (1003041, '门源回族自治县', NULL, '632221', 1003037, 3);
INSERT INTO `sys_region` VALUES (1003042, '黄南藏族自治州', NULL, '632300', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003043, '同仁县', NULL, '632321', 1003042, 3);
INSERT INTO `sys_region` VALUES (1003044, '尖扎县', NULL, '632322', 1003042, 3);
INSERT INTO `sys_region` VALUES (1003045, '泽库县', NULL, '632323', 1003042, 3);
INSERT INTO `sys_region` VALUES (1003046, '河南蒙古族自治县', NULL, '632324', 1003042, 3);
INSERT INTO `sys_region` VALUES (1003047, '海南藏族自治州', NULL, '632500', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003048, '共和县', NULL, '632521', 1003047, 3);
INSERT INTO `sys_region` VALUES (1003049, '同德县', NULL, '632522', 1003047, 3);
INSERT INTO `sys_region` VALUES (1003050, '贵德县', NULL, '632523', 1003047, 3);
INSERT INTO `sys_region` VALUES (1003051, '兴海县', NULL, '632524', 1003047, 3);
INSERT INTO `sys_region` VALUES (1003052, '贵南县', NULL, '632525', 1003047, 3);
INSERT INTO `sys_region` VALUES (1003053, '果洛藏族自治州', NULL, '632600', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003054, '玛沁县', NULL, '632621', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003055, '班玛县', NULL, '632622', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003056, '甘德县', NULL, '632623', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003057, '达日县', NULL, '632624', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003058, '久治县', NULL, '632625', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003059, '玛多县', NULL, '632626', 1003053, 3);
INSERT INTO `sys_region` VALUES (1003060, '玉树藏族自治州', NULL, '632700', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003061, '玉树市', NULL, '632701', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003062, '杂多县', NULL, '632722', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003063, '称多县', NULL, '632723', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003064, '治多县', NULL, '632724', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003065, '囊谦县', NULL, '632725', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003066, '曲麻莱县', NULL, '632726', 1003060, 3);
INSERT INTO `sys_region` VALUES (1003067, '海西蒙古族藏族自治州', NULL, '632800', 1000028, 2);
INSERT INTO `sys_region` VALUES (1003068, '德令哈市', NULL, '632802', 1003067, 3);
INSERT INTO `sys_region` VALUES (1003069, '格尔木市', NULL, '632801', 1003067, 3);
INSERT INTO `sys_region` VALUES (1003070, '乌兰县', NULL, '632821', 1003067, 3);
INSERT INTO `sys_region` VALUES (1003071, '都兰县', NULL, '632822', 1003067, 3);
INSERT INTO `sys_region` VALUES (1003072, '天峻县', NULL, '632823', 1003067, 3);
INSERT INTO `sys_region` VALUES (1003073, '银川市', NULL, '640100', 1000029, 2);
INSERT INTO `sys_region` VALUES (1003074, '金凤区', NULL, '640106', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003075, '兴庆区', NULL, '640104', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003076, '西夏区', NULL, '640105', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003077, '灵武市', NULL, '640181', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003078, '永宁县', NULL, '640121', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003079, '贺兰县', NULL, '640122', 1003073, 3);
INSERT INTO `sys_region` VALUES (1003080, '石嘴山市', NULL, '640200', 1000029, 2);
INSERT INTO `sys_region` VALUES (1003081, '大武口区', NULL, '640202', 1003080, 3);
INSERT INTO `sys_region` VALUES (1003082, '惠农区', NULL, '640205', 1003080, 3);
INSERT INTO `sys_region` VALUES (1003083, '平罗县', NULL, '640221', 1003080, 3);
INSERT INTO `sys_region` VALUES (1003084, '吴忠市', NULL, '640300', 1000029, 2);
INSERT INTO `sys_region` VALUES (1003085, '利通区', NULL, '640302', 1003084, 3);
INSERT INTO `sys_region` VALUES (1003086, '红寺堡区', NULL, '640303', 1003084, 3);
INSERT INTO `sys_region` VALUES (1003087, '青铜峡市', NULL, '640381', 1003084, 3);
INSERT INTO `sys_region` VALUES (1003088, '盐池县', NULL, '640323', 1003084, 3);
INSERT INTO `sys_region` VALUES (1003089, '同心县', NULL, '640324', 1003084, 3);
INSERT INTO `sys_region` VALUES (1003090, '固原市', NULL, '640400', 1000029, 2);
INSERT INTO `sys_region` VALUES (1003091, '原州区', NULL, '640402', 1003090, 3);
INSERT INTO `sys_region` VALUES (1003092, '西吉县', NULL, '640422', 1003090, 3);
INSERT INTO `sys_region` VALUES (1003093, '隆德县', NULL, '640423', 1003090, 3);
INSERT INTO `sys_region` VALUES (1003094, '泾源县', NULL, '640424', 1003090, 3);
INSERT INTO `sys_region` VALUES (1003095, '彭阳县', NULL, '640425', 1003090, 3);
INSERT INTO `sys_region` VALUES (1003096, '中卫市', NULL, '640500', 1000029, 2);
INSERT INTO `sys_region` VALUES (1003097, '沙坡头区', NULL, '640502', 1003096, 3);
INSERT INTO `sys_region` VALUES (1003098, '中宁县', NULL, '640521', 1003096, 3);
INSERT INTO `sys_region` VALUES (1003099, '海原县', NULL, '640522', 1003096, 3);
INSERT INTO `sys_region` VALUES (1003100, '乌鲁木齐市', NULL, '650100', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003101, '天山区', NULL, '650102', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003102, '沙依巴克区', NULL, '650103', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003103, '新市区', NULL, '650104', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003104, '水磨沟区', NULL, '650105', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003105, '头屯河区', NULL, '650106', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003106, '达坂城区', NULL, '650107', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003107, '米东区', NULL, '650109', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003108, '乌鲁木齐县', NULL, '650121', 1003100, 3);
INSERT INTO `sys_region` VALUES (1003109, '克拉玛依市', NULL, '650200', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003110, '克拉玛依区', NULL, '650203', 1003109, 3);
INSERT INTO `sys_region` VALUES (1003111, '独山子区', NULL, '650202', 1003109, 3);
INSERT INTO `sys_region` VALUES (1003112, '白碱滩区', NULL, '650204', 1003109, 3);
INSERT INTO `sys_region` VALUES (1003113, '乌尔禾区', NULL, '650205', 1003109, 3);
INSERT INTO `sys_region` VALUES (1003114, '吐鲁番市', NULL, '650400', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003115, '高昌区', NULL, '650402', 1003114, 3);
INSERT INTO `sys_region` VALUES (1003116, '鄯善县', NULL, '650421', 1003114, 3);
INSERT INTO `sys_region` VALUES (1003117, '托克逊县', NULL, '650422', 1003114, 3);
INSERT INTO `sys_region` VALUES (1003118, '哈密市', NULL, '650500', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003119, '伊州区', NULL, '650502', 1003118, 3);
INSERT INTO `sys_region` VALUES (1003120, '伊吾县', NULL, '650522', 1003118, 3);
INSERT INTO `sys_region` VALUES (1003121, '巴里坤哈萨克自治县', NULL, '650521', 1003118, 3);
INSERT INTO `sys_region` VALUES (1003122, '阿克苏地区', NULL, '652900', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003123, '阿克苏市', NULL, '652901', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003124, '温宿县', NULL, '652922', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003125, '库车县', NULL, '652923', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003126, '沙雅县', NULL, '652924', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003127, '新和县', NULL, '652925', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003128, '拜城县', NULL, '652926', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003129, '乌什县', NULL, '652927', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003130, '阿瓦提县', NULL, '652928', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003131, '柯坪县', NULL, '652929', 1003122, 3);
INSERT INTO `sys_region` VALUES (1003132, '喀什地区', NULL, '653100', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003133, '喀什市', NULL, '653101', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003134, '疏附县', NULL, '653121', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003135, '疏勒县', NULL, '653122', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003136, '英吉沙县', NULL, '653123', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003137, '泽普县', NULL, '653124', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003138, '莎车县', NULL, '653125', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003139, '叶城县', NULL, '653126', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003140, '麦盖提县', NULL, '653127', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003141, '岳普湖县', NULL, '653128', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003142, '伽师县', NULL, '653129', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003143, '巴楚县', NULL, '653130', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003144, '塔什库尔干塔吉克自治县', NULL, '653131', 1003132, 3);
INSERT INTO `sys_region` VALUES (1003145, '和田地区', NULL, '653200', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003146, '和田市', NULL, '653201', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003147, '和田县', NULL, '653221', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003148, '墨玉县', NULL, '653222', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003149, '皮山县', NULL, '653223', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003150, '洛浦县', NULL, '653224', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003151, '策勒县', NULL, '653225', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003152, '于田县', NULL, '653226', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003153, '民丰县', NULL, '653227', 1003145, 3);
INSERT INTO `sys_region` VALUES (1003154, '昌吉回族自治州', NULL, '652300', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003155, '昌吉市', NULL, '652301', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003156, '阜康市', NULL, '652302', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003157, '呼图壁县', NULL, '652323', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003158, '玛纳斯县', NULL, '652324', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003159, '奇台县', NULL, '652325', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003160, '吉木萨尔县', NULL, '652327', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003161, '木垒哈萨克自治县', NULL, '652328', 1003154, 3);
INSERT INTO `sys_region` VALUES (1003162, '博尔塔拉蒙古自治州', NULL, '652700', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003163, '博乐市', NULL, '652701', 1003162, 3);
INSERT INTO `sys_region` VALUES (1003164, '阿拉山口市', NULL, '652702', 1003162, 3);
INSERT INTO `sys_region` VALUES (1003165, '精河县', NULL, '652722', 1003162, 3);
INSERT INTO `sys_region` VALUES (1003166, '温泉县', NULL, '652723', 1003162, 3);
INSERT INTO `sys_region` VALUES (1003167, '巴音郭楞蒙古自治州', NULL, '652800', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003168, '库尔勒市', NULL, '652801', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003169, '轮台县', NULL, '652822', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003170, '尉犁县', NULL, '652823', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003171, '若羌县', NULL, '652824', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003172, '且末县', NULL, '652825', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003173, '和静县', NULL, '652827', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003174, '和硕县', NULL, '652828', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003175, '博湖县', NULL, '652829', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003176, '焉耆回族自治县', NULL, '652826', 1003167, 3);
INSERT INTO `sys_region` VALUES (1003177, '克孜勒苏柯尔克孜自治州', NULL, '653000', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003178, '阿图什市', NULL, '653001', 1003177, 3);
INSERT INTO `sys_region` VALUES (1003179, '阿克陶县', NULL, '653022', 1003177, 3);
INSERT INTO `sys_region` VALUES (1003180, '阿合奇县', NULL, '653023', 1003177, 3);
INSERT INTO `sys_region` VALUES (1003181, '乌恰县', NULL, '653024', 1003177, 3);
INSERT INTO `sys_region` VALUES (1003182, '伊犁哈萨克自治州', NULL, '654000', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003183, '伊宁市', NULL, '654002', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003184, '奎屯市', NULL, '654003', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003185, '霍尔果斯市', NULL, '654004', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003186, '伊宁县', NULL, '654021', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003187, '霍城县', NULL, '654023', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003188, '巩留县', NULL, '654024', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003189, '新源县', NULL, '654025', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003190, '昭苏县', NULL, '654026', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003191, '特克斯县', NULL, '654027', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003192, '尼勒克县', NULL, '654028', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003193, '察布查尔锡伯自治县', NULL, '654022', 1003182, 3);
INSERT INTO `sys_region` VALUES (1003194, '塔城地区', NULL, '654200', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003195, '塔城市', NULL, '654201', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003196, '乌苏市', NULL, '654202', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003197, '额敏县', NULL, '654221', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003198, '沙湾县', NULL, '654223', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003199, '托里县', NULL, '654224', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003200, '裕民县', NULL, '654225', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003201, '和布克赛尔蒙古自治县', NULL, '654226', 1003194, 3);
INSERT INTO `sys_region` VALUES (1003202, '阿勒泰地区', NULL, '654300', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003203, '阿勒泰市', NULL, '654301', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003204, '布尔津县', NULL, '654321', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003205, '富蕴县', NULL, '654322', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003206, '福海县', NULL, '654323', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003207, '哈巴河县', NULL, '654324', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003208, '青河县', NULL, '654325', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003209, '吉木乃县', NULL, '654326', 1003202, 3);
INSERT INTO `sys_region` VALUES (1003210, '石河子市', NULL, '659001', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003211, '阿拉尔市', NULL, '659002', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003212, '图木舒克市', NULL, '659003', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003213, '五家渠市', NULL, '659004', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003214, '北屯市', NULL, '659005', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003215, '铁门关市', NULL, '659006', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003216, '双河市', NULL, '659007', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003217, '可克达拉市', NULL, '659008', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003218, '昆玉市', NULL, '659009', 1000030, 2);
INSERT INTO `sys_region` VALUES (1003219, '中西区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003220, '东区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003221, '九龙城区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003222, '观塘区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003223, '南区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003224, '深水埗区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003225, '湾仔区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003226, '黄大仙区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003227, '油尖旺区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003228, '离岛区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003229, '葵青区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003230, '北区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003231, '西贡区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003232, '沙田区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003233, '屯门区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003234, '大埔区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003235, '荃湾区', NULL, '', 1000031, 2);
INSERT INTO `sys_region` VALUES (1003236, '元朗区', NULL, '', 1000031, 2);

SET FOREIGN_KEY_CHECKS = 1;
