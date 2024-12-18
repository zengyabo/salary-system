/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : finish-employee

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 07/08/2023 20:16:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendrecords
-- ----------------------------
DROP TABLE IF EXISTS `attendrecords`;
CREATE TABLE `attendrecords`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NULL DEFAULT NULL COMMENT '员工ID',
  `employee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工',
  `attendance_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出勤日期',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上班时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下班时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '正常出勤' COMMENT '出勤状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attendrecords
-- ----------------------------
INSERT INTO `attendrecords` VALUES (14, 5, '黑耀', '2023-07-21', '09:30', '17:30', '迟到，早退');
INSERT INTO `attendrecords` VALUES (15, 5, '黑耀', '2023-07-20', '08:30', '16:30', '早退');
INSERT INTO `attendrecords` VALUES (16, 7, '帅哥', '2023-07-20', '08:45', '15:00', '早退');
INSERT INTO `attendrecords` VALUES (17, 7, '帅哥', '2023-07-21', '08:30', '16:15', '早退');
INSERT INTO `attendrecords` VALUES (19, 14, '李四', '2023-07-28', '09:00', '18:00', '正常出勤');
INSERT INTO `attendrecords` VALUES (20, 7, '帅哥', '2023-08-09', '08:30', '14:45', '早退');
INSERT INTO `attendrecords` VALUES (21, 16, '张三', '2023-08-17', '10:00', '16:00', '迟到，早退');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门代码',
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '部门经理ID',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '技术部', '1', 1001, '有技术');
INSERT INTO `department` VALUES (2, '后勤', '2', 1002, '后勤');
INSERT INTO `department` VALUES (3, '混沌部', '3', 1003, '混沌初开');
INSERT INTO `department` VALUES (4, '合欢部', '4', 1004, '合合欢欢');
INSERT INTO `department` VALUES (9, '保安部', '5', 1005, '保安大队');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工姓名',
  `department_id` int(11) NULL DEFAULT NULL COMMENT '所属部门ID',
  `departmenter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `hire_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '薪水',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (5, '黑耀', 2, '后勤', '保安', '2023-07-12', NULL, '2554364378@qq.com', '13255446655', '福建南平', '2023-07-13 11:04:19', '2023-08-07 14:57:12');
INSERT INTO `employee` VALUES (7, '帅哥', 1, '技术部', NULL, '2023-08-18', NULL, '2593224458@qq.com', '13466554477', '福建福州', '2023-07-13 11:11:35', '2023-08-07 14:56:30');
INSERT INTO `employee` VALUES (14, '李四', 4, '合欢部', '合欢快乐啊', '2023-08-07', NULL, '222@163.com', '13755447766', '福建厦门', '2023-08-07 14:56:09', '2023-08-07 14:57:57');
INSERT INTO `employee` VALUES (16, '张三', 9, '保安部', '保安', '2023-08-07', NULL, '233@qq.com', '14577668888', '福建泉州', '2023-08-07 19:49:06', '2023-08-07 19:49:34');

-- ----------------------------
-- Table structure for leaverecords
-- ----------------------------
DROP TABLE IF EXISTS `leaverecords`;
CREATE TABLE `leaverecords`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假人姓名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假理由',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假起始日期',
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假结束日期',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详情图片',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '待审核，审核通过，审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leaverecords
-- ----------------------------
INSERT INTO `leaverecords` VALUES (45, 'zhang', '本帅哥要请假', '2023-08-07 10:44:04', '2023-08-07 10', '2023-08-09 10', 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', '审核不通过...就不让你过嘿嘿');
INSERT INTO `leaverecords` VALUES (46, '张三', '我就要请假，听到没有！快点给我通过', '2023-08-07 19:52:27', '2023-08-07 19', '2023-09-08 00', 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', '审核通过...你可以滚回去了');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NULL DEFAULT NULL COMMENT '员工ID',
  `employee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工',
  `salary_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工资日期',
  `basic_salary` int(11) NULL DEFAULT 0 COMMENT '基本工资',
  `bonus` int(11) NULL DEFAULT 0 COMMENT '奖金',
  `deduction` int(11) NULL DEFAULT 0 COMMENT '扣款',
  `total_salary` int(11) NULL DEFAULT NULL COMMENT '总工资',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 5, '黑耀', '2023-08-07', 500, 200, 200, 500);
INSERT INTO `salary` VALUES (5, 5, '黑耀', '2023-08-07', 2000, 1000, 100, 3000);
INSERT INTO `salary` VALUES (12, 5, '黑耀', '2023-08-07', 1222, 0, 222, 1000);
INSERT INTO `salary` VALUES (13, 5, '黑耀', '2023-08-07', 1000, 0, 0, 1000);
INSERT INTO `salary` VALUES (14, 8, 'zhang', '2023-08-07', 1000, 2000, 500, 2500);
INSERT INTO `salary` VALUES (15, 5, '黑耀', '2023-08-07', 20000, 1000, 500, 20500);
INSERT INTO `salary` VALUES (16, 7, '帅哥', '2023-07-28', 1000, 50, 0, 1050);
INSERT INTO `salary` VALUES (21, 14, '李四', '2023-08-07', 3000, 1000, 500, 3500);
INSERT INTO `salary` VALUES (26, 16, '张三', '2023-08-10', 3000, 3000, 0, 6000);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES (2, 'house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES (3, 'menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES (4, 's-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES (5, 's-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES (6, 'document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES (7, 'coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES (8, 's-marketing', 'el-icon-s-marketing', 'icon');
INSERT INTO `sys_dict` VALUES (9, 'phone-outline', 'el-icon-phone-outline', 'icon');
INSERT INTO `sys_dict` VALUES (10, 'platform-eleme', 'el-icon-platform-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (11, 'eleme', 'el-icon-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (12, 'delete-solid', 'el-icon-delete-solid', 'icon');
INSERT INTO `sys_dict` VALUES (13, 'delete', 'el-icon-delete', 'icon');
INSERT INTO `sys_dict` VALUES (14, 's-tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` VALUES (15, 'setting', 'el-icon-setting', 'icon');
INSERT INTO `sys_dict` VALUES (16, 'user-solid', 'el-icon-user-solid', 'icon');
INSERT INTO `sys_dict` VALUES (17, 'phone', 'el-icon-phone', 'icon');
INSERT INTO `sys_dict` VALUES (18, 'more', 'el-icon-more', 'icon');
INSERT INTO `sys_dict` VALUES (19, 'more-outline', 'el-icon-more-outline', 'icon');
INSERT INTO `sys_dict` VALUES (20, 'star-on', 'el-icon-star-on', 'icon');
INSERT INTO `sys_dict` VALUES (21, 'star-off', 'el-icon-star-off', 'icon');
INSERT INTO `sys_dict` VALUES (22, 's-goods', 'el-icon-s-goods', 'icon');
INSERT INTO `sys_dict` VALUES (23, 'goods', 'el-icon-goods', 'icon');
INSERT INTO `sys_dict` VALUES (24, 'warning', 'el-icon-warning', 'icon');
INSERT INTO `sys_dict` VALUES (25, 'warning-outline', 'el-icon-warning-outline', 'icon');
INSERT INTO `sys_dict` VALUES (26, 'question', 'el-icon-question', 'icon');
INSERT INTO `sys_dict` VALUES (27, 'info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` VALUES (28, 'remove', 'el-icon-remove', 'icon');
INSERT INTO `sys_dict` VALUES (29, 'circle-plus', 'el-icon-circle-plus', 'icon');
INSERT INTO `sys_dict` VALUES (30, 'success', 'el-icon-success', 'icon');
INSERT INTO `sys_dict` VALUES (31, 'error', 'el-icon-error', 'icon');
INSERT INTO `sys_dict` VALUES (32, 'zoom-in', 'el-icon-zoom-in', 'icon');
INSERT INTO `sys_dict` VALUES (33, 'zoom-out', 'el-icon-zoom-out', 'icon');
INSERT INTO `sys_dict` VALUES (34, 'remove-outline', 'el-icon-remove-outline', 'icon');
INSERT INTO `sys_dict` VALUES (35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon');
INSERT INTO `sys_dict` VALUES (36, 'circle-check', 'el-icon-circle-check', 'icon');
INSERT INTO `sys_dict` VALUES (37, 'circle-close', 'el-icon-circle-close', 'icon');
INSERT INTO `sys_dict` VALUES (38, 's-help', 'el-icon-s-help', 'icon');
INSERT INTO `sys_dict` VALUES (39, 'help', 'el-icon-help', 'icon');
INSERT INTO `sys_dict` VALUES (40, 'minus', 'el-icon-minus', 'icon');
INSERT INTO `sys_dict` VALUES (41, 'plus', 'el-icon-plus', 'icon');
INSERT INTO `sys_dict` VALUES (42, 'check', 'el-icon-check', 'icon');
INSERT INTO `sys_dict` VALUES (43, 'close', 'el-icon-close', 'icon');
INSERT INTO `sys_dict` VALUES (44, 'picture', 'el-icon-picture', 'icon');
INSERT INTO `sys_dict` VALUES (45, 'picture-outline', 'el-icon-picture-outline', 'icon');
INSERT INTO `sys_dict` VALUES (46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon');
INSERT INTO `sys_dict` VALUES (47, 'upload', 'el-icon-upload', 'icon');
INSERT INTO `sys_dict` VALUES (48, 'upload2', 'el-icon-upload2', 'icon');
INSERT INTO `sys_dict` VALUES (49, 'download', 'el-icon-download', 'icon');
INSERT INTO `sys_dict` VALUES (50, 'camera-solid', 'el-icon-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (51, 'camera', 'el-icon-camera', 'icon');
INSERT INTO `sys_dict` VALUES (52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (53, 'video-camera', 'el-icon-video-camera', 'icon');
INSERT INTO `sys_dict` VALUES (54, 'message-solid', 'el-icon-message-solid', 'icon');
INSERT INTO `sys_dict` VALUES (55, 'bell', 'el-icon-bell', 'icon');
INSERT INTO `sys_dict` VALUES (56, 's-cooperation', 'el-icon-s-cooperation', 'icon');
INSERT INTO `sys_dict` VALUES (57, 's-order', 'el-icon-s-order', 'icon');
INSERT INTO `sys_dict` VALUES (58, 's-platform', 'el-icon-s-platform', 'icon');
INSERT INTO `sys_dict` VALUES (59, 's-fold', 'el-icon-s-fold', 'icon');
INSERT INTO `sys_dict` VALUES (60, 's-unfold', 'el-icon-s-unfold', 'icon');
INSERT INTO `sys_dict` VALUES (61, 's-operation', 'el-icon-s-operation', 'icon');
INSERT INTO `sys_dict` VALUES (62, 's-promotion', 'el-icon-s-promotion', 'icon');
INSERT INTO `sys_dict` VALUES (63, 's-home', 'el-icon-s-home', 'icon');
INSERT INTO `sys_dict` VALUES (64, 's-release', 'el-icon-s-release', 'icon');
INSERT INTO `sys_dict` VALUES (65, 's-ticket', 'el-icon-s-ticket', 'icon');
INSERT INTO `sys_dict` VALUES (66, 's-management', 'el-icon-s-management', 'icon');
INSERT INTO `sys_dict` VALUES (67, 's-open', 'el-icon-s-open', 'icon');
INSERT INTO `sys_dict` VALUES (68, 's-shop', 'el-icon-s-shop', 'icon');
INSERT INTO `sys_dict` VALUES (69, 's-flag', 'el-icon-s-flag', 'icon');
INSERT INTO `sys_dict` VALUES (70, 's-comment', 'el-icon-s-comment', 'icon');
INSERT INTO `sys_dict` VALUES (71, 's-finance', 'el-icon-s-finance', 'icon');
INSERT INTO `sys_dict` VALUES (72, 's-claim', 'el-icon-s-claim', 'icon');
INSERT INTO `sys_dict` VALUES (73, 's-opportunity', 'el-icon-s-opportunity', 'icon');
INSERT INTO `sys_dict` VALUES (74, 's-data', 'el-icon-s-data', 'icon');
INSERT INTO `sys_dict` VALUES (75, 's-check', 'el-icon-s-check', 'icon');
INSERT INTO `sys_dict` VALUES (76, 'share', 'el-icon-share', 'icon');
INSERT INTO `sys_dict` VALUES (77, 'd-caret', 'el-icon-d-caret', 'icon');
INSERT INTO `sys_dict` VALUES (78, 'caret-left', 'el-icon-caret-left', 'icon');
INSERT INTO `sys_dict` VALUES (79, 'caret-right', 'el-icon-caret-right', 'icon');
INSERT INTO `sys_dict` VALUES (80, 'caret-bottom', 'el-icon-caret-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (81, 'caret-top', 'el-icon-caret-top', 'icon');
INSERT INTO `sys_dict` VALUES (82, 'bottom-left', 'el-icon-bottom-left', 'icon');
INSERT INTO `sys_dict` VALUES (83, 'bottom-right', 'el-icon-bottom-right', 'icon');
INSERT INTO `sys_dict` VALUES (84, 'back', 'el-icon-back', 'icon');
INSERT INTO `sys_dict` VALUES (85, 'right', 'el-icon-right', 'icon');
INSERT INTO `sys_dict` VALUES (86, 'bottom', 'el-icon-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (87, 'top', 'el-icon-top', 'icon');
INSERT INTO `sys_dict` VALUES (88, 'top-left', 'el-icon-top-left', 'icon');
INSERT INTO `sys_dict` VALUES (89, 'top-right', 'el-icon-top-right', 'icon');
INSERT INTO `sys_dict` VALUES (90, 'arrow-left', 'el-icon-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (91, 'arrow-right', 'el-icon-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (92, 'arrow-down', 'el-icon-arrow-down', 'icon');
INSERT INTO `sys_dict` VALUES (93, 'arrow-up', 'el-icon-arrow-up', 'icon');
INSERT INTO `sys_dict` VALUES (94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (96, 'video-pause', 'el-icon-video-pause', 'icon');
INSERT INTO `sys_dict` VALUES (97, 'video-play', 'el-icon-video-play', 'icon');
INSERT INTO `sys_dict` VALUES (98, 'refresh', 'el-icon-refresh', 'icon');
INSERT INTO `sys_dict` VALUES (99, 'refresh-right', 'el-icon-refresh-right', 'icon');
INSERT INTO `sys_dict` VALUES (100, 'refresh-left', 'el-icon-refresh-left', 'icon');
INSERT INTO `sys_dict` VALUES (101, 'finished', 'el-icon-finished', 'icon');
INSERT INTO `sys_dict` VALUES (102, 'sort', 'el-icon-sort', 'icon');
INSERT INTO `sys_dict` VALUES (103, 'sort-up', 'el-icon-sort-up', 'icon');
INSERT INTO `sys_dict` VALUES (104, 'sort-down', 'el-icon-sort-down', 'icon');
INSERT INTO `sys_dict` VALUES (105, 'rank', 'el-icon-rank', 'icon');
INSERT INTO `sys_dict` VALUES (106, 'loading', 'el-icon-loading', 'icon');
INSERT INTO `sys_dict` VALUES (107, 'view', 'el-icon-view', 'icon');
INSERT INTO `sys_dict` VALUES (108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon');
INSERT INTO `sys_dict` VALUES (109, 'date', 'el-icon-date', 'icon');
INSERT INTO `sys_dict` VALUES (110, 'edit', 'el-icon-edit', 'icon');
INSERT INTO `sys_dict` VALUES (111, 'edit-outline', 'el-icon-edit-outline', 'icon');
INSERT INTO `sys_dict` VALUES (112, 'folder', 'el-icon-folder', 'icon');
INSERT INTO `sys_dict` VALUES (113, 'folder-opened', 'el-icon-folder-opened', 'icon');
INSERT INTO `sys_dict` VALUES (114, 'folder-add', 'el-icon-folder-add', 'icon');
INSERT INTO `sys_dict` VALUES (115, 'folder-remove', 'el-icon-folder-remove', 'icon');
INSERT INTO `sys_dict` VALUES (116, 'folder-delete', 'el-icon-folder-delete', 'icon');
INSERT INTO `sys_dict` VALUES (117, 'folder-checked', 'el-icon-folder-checked', 'icon');
INSERT INTO `sys_dict` VALUES (118, 'tickets', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` VALUES (119, 'document-remove', 'el-icon-document-remove', 'icon');
INSERT INTO `sys_dict` VALUES (120, 'document-delete', 'el-icon-document-delete', 'icon');
INSERT INTO `sys_dict` VALUES (121, 'document-copy', 'el-icon-document-copy', 'icon');
INSERT INTO `sys_dict` VALUES (122, 'document-checked', 'el-icon-document-checked', 'icon');
INSERT INTO `sys_dict` VALUES (123, 'document-add', 'el-icon-document-add', 'icon');
INSERT INTO `sys_dict` VALUES (124, 'printer', 'el-icon-printer', 'icon');
INSERT INTO `sys_dict` VALUES (125, 'paperclip', 'el-icon-paperclip', 'icon');
INSERT INTO `sys_dict` VALUES (126, 'takeaway-box', 'el-icon-takeaway-box', 'icon');
INSERT INTO `sys_dict` VALUES (127, 'search', 'el-icon-search', 'icon');
INSERT INTO `sys_dict` VALUES (128, 'monitor', 'el-icon-monitor', 'icon');
INSERT INTO `sys_dict` VALUES (129, 'attract', 'el-icon-attract', 'icon');
INSERT INTO `sys_dict` VALUES (130, 'mobile', 'el-icon-mobile', 'icon');
INSERT INTO `sys_dict` VALUES (131, 'scissors', 'el-icon-scissors', 'icon');
INSERT INTO `sys_dict` VALUES (132, 'umbrella', 'el-icon-umbrella', 'icon');
INSERT INTO `sys_dict` VALUES (133, 'headset', 'el-icon-headset', 'icon');
INSERT INTO `sys_dict` VALUES (134, 'brush', 'el-icon-brush', 'icon');
INSERT INTO `sys_dict` VALUES (135, 'mouse', 'el-icon-mouse', 'icon');
INSERT INTO `sys_dict` VALUES (136, 'coordinate', 'el-icon-coordinate', 'icon');
INSERT INTO `sys_dict` VALUES (137, 'magic-stick', 'el-icon-magic-stick', 'icon');
INSERT INTO `sys_dict` VALUES (138, 'reading', 'el-icon-reading', 'icon');
INSERT INTO `sys_dict` VALUES (139, 'data-line', 'el-icon-data-line', 'icon');
INSERT INTO `sys_dict` VALUES (140, 'data-board', 'el-icon-data-board', 'icon');
INSERT INTO `sys_dict` VALUES (141, 'pie-chart', 'el-icon-pie-chart', 'icon');
INSERT INTO `sys_dict` VALUES (142, 'data-analysis', 'el-icon-data-analysis', 'icon');
INSERT INTO `sys_dict` VALUES (143, 'collection-tag', 'el-icon-collection-tag', 'icon');
INSERT INTO `sys_dict` VALUES (144, 'film', 'el-icon-film', 'icon');
INSERT INTO `sys_dict` VALUES (145, 'suitcase', 'el-icon-suitcase', 'icon');
INSERT INTO `sys_dict` VALUES (146, 'suitcase-1', 'el-icon-suitcase-1', 'icon');
INSERT INTO `sys_dict` VALUES (147, 'receiving', 'el-icon-receiving', 'icon');
INSERT INTO `sys_dict` VALUES (148, 'collection', 'el-icon-collection', 'icon');
INSERT INTO `sys_dict` VALUES (149, 'files', 'el-icon-files', 'icon');
INSERT INTO `sys_dict` VALUES (150, 'notebook-1', 'el-icon-notebook-1', 'icon');
INSERT INTO `sys_dict` VALUES (151, 'notebook-2', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES (152, 'toilet-paper', 'el-icon-toilet-paper', 'icon');
INSERT INTO `sys_dict` VALUES (153, 'office-building', 'el-icon-office-building', 'icon');
INSERT INTO `sys_dict` VALUES (154, 'school', 'el-icon-school', 'icon');
INSERT INTO `sys_dict` VALUES (155, 'table-lamp', 'el-icon-table-lamp', 'icon');
INSERT INTO `sys_dict` VALUES (156, 'no-smoking', 'el-icon-no-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (157, 'smoking', 'el-icon-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon');
INSERT INTO `sys_dict` VALUES (159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` VALUES (160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` VALUES (161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon');
INSERT INTO `sys_dict` VALUES (162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon');
INSERT INTO `sys_dict` VALUES (163, 'sold-out', 'el-icon-sold-out', 'icon');
INSERT INTO `sys_dict` VALUES (164, 'sell', 'el-icon-sell', 'icon');
INSERT INTO `sys_dict` VALUES (165, 'present', 'el-icon-present', 'icon');
INSERT INTO `sys_dict` VALUES (166, 'box', 'el-icon-box', 'icon');
INSERT INTO `sys_dict` VALUES (167, 'bank-card', 'el-icon-bank-card', 'icon');
INSERT INTO `sys_dict` VALUES (168, 'money', 'el-icon-money', 'icon');
INSERT INTO `sys_dict` VALUES (169, 'coin', 'el-icon-coin', 'icon');
INSERT INTO `sys_dict` VALUES (170, 'wallet', 'el-icon-wallet', 'icon');
INSERT INTO `sys_dict` VALUES (171, 'discount', 'el-icon-discount', 'icon');
INSERT INTO `sys_dict` VALUES (172, 'price-tag', 'el-icon-price-tag', 'icon');
INSERT INTO `sys_dict` VALUES (173, 'news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` VALUES (174, 'guide', 'el-icon-guide', 'icon');
INSERT INTO `sys_dict` VALUES (175, 'male', 'el-icon-male', 'icon');
INSERT INTO `sys_dict` VALUES (176, 'female', 'el-icon-female', 'icon');
INSERT INTO `sys_dict` VALUES (177, 'thumb', 'el-icon-thumb', 'icon');
INSERT INTO `sys_dict` VALUES (178, 'cpu', 'el-icon-cpu', 'icon');
INSERT INTO `sys_dict` VALUES (179, 'link', 'el-icon-link', 'icon');
INSERT INTO `sys_dict` VALUES (180, 'connection', 'el-icon-connection', 'icon');
INSERT INTO `sys_dict` VALUES (181, 'open', 'el-icon-open', 'icon');
INSERT INTO `sys_dict` VALUES (182, 'turn-off', 'el-icon-turn-off', 'icon');
INSERT INTO `sys_dict` VALUES (183, 'set-up', 'el-icon-set-up', 'icon');
INSERT INTO `sys_dict` VALUES (184, 'chat-round', 'el-icon-chat-round', 'icon');
INSERT INTO `sys_dict` VALUES (185, 'chat-line-round', 'el-icon-chat-line-round', 'icon');
INSERT INTO `sys_dict` VALUES (186, 'chat-square', 'el-icon-chat-square', 'icon');
INSERT INTO `sys_dict` VALUES (187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon');
INSERT INTO `sys_dict` VALUES (188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon');
INSERT INTO `sys_dict` VALUES (189, 'chat-line-square', 'el-icon-chat-line-square', 'icon');
INSERT INTO `sys_dict` VALUES (190, 'message', 'el-icon-message', 'icon');
INSERT INTO `sys_dict` VALUES (191, 'postcard', 'el-icon-postcard', 'icon');
INSERT INTO `sys_dict` VALUES (192, 'position', 'el-icon-position', 'icon');
INSERT INTO `sys_dict` VALUES (193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (194, 'microphone', 'el-icon-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (195, 'close-notification', 'el-icon-close-notification', 'icon');
INSERT INTO `sys_dict` VALUES (196, 'bangzhu', 'el-icon-bangzhu', 'icon');
INSERT INTO `sys_dict` VALUES (197, 'time', 'el-icon-time', 'icon');
INSERT INTO `sys_dict` VALUES (198, 'odometer', 'el-icon-odometer', 'icon');
INSERT INTO `sys_dict` VALUES (199, 'crop', 'el-icon-crop', 'icon');
INSERT INTO `sys_dict` VALUES (200, 'aim', 'el-icon-aim', 'icon');
INSERT INTO `sys_dict` VALUES (201, 'switch-button', 'el-icon-switch-button', 'icon');
INSERT INTO `sys_dict` VALUES (202, 'full-screen', 'el-icon-full-screen', 'icon');
INSERT INTO `sys_dict` VALUES (203, 'copy-document', 'el-icon-copy-document', 'icon');
INSERT INTO `sys_dict` VALUES (204, 'mic', 'el-icon-mic', 'icon');
INSERT INTO `sys_dict` VALUES (205, 'stopwatch', 'el-icon-stopwatch', 'icon');
INSERT INTO `sys_dict` VALUES (206, 'medal-1', 'el-icon-medal-1', 'icon');
INSERT INTO `sys_dict` VALUES (207, 'medal', 'el-icon-medal', 'icon');
INSERT INTO `sys_dict` VALUES (208, 'trophy', 'el-icon-trophy', 'icon');
INSERT INTO `sys_dict` VALUES (209, 'trophy-1', 'el-icon-trophy-1', 'icon');
INSERT INTO `sys_dict` VALUES (210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon');
INSERT INTO `sys_dict` VALUES (211, 'discover', 'el-icon-discover', 'icon');
INSERT INTO `sys_dict` VALUES (212, 'place', 'el-icon-place', 'icon');
INSERT INTO `sys_dict` VALUES (213, 'location', 'el-icon-location', 'icon');
INSERT INTO `sys_dict` VALUES (214, 'location-outline', 'el-icon-location-outline', 'icon');
INSERT INTO `sys_dict` VALUES (215, 'location-information', 'el-icon-location-information', 'icon');
INSERT INTO `sys_dict` VALUES (216, 'add-location', 'el-icon-add-location', 'icon');
INSERT INTO `sys_dict` VALUES (217, 'delete-location', 'el-icon-delete-location', 'icon');
INSERT INTO `sys_dict` VALUES (218, 'map-location', 'el-icon-map-location', 'icon');
INSERT INTO `sys_dict` VALUES (219, 'alarm-clock', 'el-icon-alarm-clock', 'icon');
INSERT INTO `sys_dict` VALUES (220, 'timer', 'el-icon-timer', 'icon');
INSERT INTO `sys_dict` VALUES (221, 'watch-1', 'el-icon-watch-1', 'icon');
INSERT INTO `sys_dict` VALUES (222, 'watch', 'el-icon-watch', 'icon');
INSERT INTO `sys_dict` VALUES (223, 'lock', 'el-icon-lock', 'icon');
INSERT INTO `sys_dict` VALUES (224, 'unlock', 'el-icon-unlock', 'icon');
INSERT INTO `sys_dict` VALUES (225, 'key', 'el-icon-key', 'icon');
INSERT INTO `sys_dict` VALUES (226, 'service', 'el-icon-service', 'icon');
INSERT INTO `sys_dict` VALUES (227, 'mobile-phone', 'el-icon-mobile-phone', 'icon');
INSERT INTO `sys_dict` VALUES (228, 'bicycle', 'el-icon-bicycle', 'icon');
INSERT INTO `sys_dict` VALUES (229, 'truck', 'el-icon-truck', 'icon');
INSERT INTO `sys_dict` VALUES (230, 'ship', 'el-icon-ship', 'icon');
INSERT INTO `sys_dict` VALUES (231, 'basketball', 'el-icon-basketball', 'icon');
INSERT INTO `sys_dict` VALUES (232, 'football', 'el-icon-football', 'icon');
INSERT INTO `sys_dict` VALUES (233, 'soccer', 'el-icon-soccer', 'icon');
INSERT INTO `sys_dict` VALUES (234, 'baseball', 'el-icon-baseball', 'icon');
INSERT INTO `sys_dict` VALUES (235, 'wind-power', 'el-icon-wind-power', 'icon');
INSERT INTO `sys_dict` VALUES (236, 'light-rain', 'el-icon-light-rain', 'icon');
INSERT INTO `sys_dict` VALUES (237, 'lightning', 'el-icon-lightning', 'icon');
INSERT INTO `sys_dict` VALUES (238, 'heavy-rain', 'el-icon-heavy-rain', 'icon');
INSERT INTO `sys_dict` VALUES (239, 'sunrise', 'el-icon-sunrise', 'icon');
INSERT INTO `sys_dict` VALUES (240, 'sunrise-1', 'el-icon-sunrise-1', 'icon');
INSERT INTO `sys_dict` VALUES (241, 'sunset', 'el-icon-sunset', 'icon');
INSERT INTO `sys_dict` VALUES (242, 'sunny', 'el-icon-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (243, 'cloudy', 'el-icon-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (246, 'moon', 'el-icon-moon', 'icon');
INSERT INTO `sys_dict` VALUES (247, 'moon-night', 'el-icon-moon-night', 'icon');
INSERT INTO `sys_dict` VALUES (248, 'dish', 'el-icon-dish', 'icon');
INSERT INTO `sys_dict` VALUES (249, 'dish-1', 'el-icon-dish-1', 'icon');
INSERT INTO `sys_dict` VALUES (250, 'food', 'el-icon-food', 'icon');
INSERT INTO `sys_dict` VALUES (251, 'chicken', 'el-icon-chicken', 'icon');
INSERT INTO `sys_dict` VALUES (252, 'fork-spoon', 'el-icon-fork-spoon', 'icon');
INSERT INTO `sys_dict` VALUES (253, 'knife-fork', 'el-icon-knife-fork', 'icon');
INSERT INTO `sys_dict` VALUES (254, 'burger', 'el-icon-burger', 'icon');
INSERT INTO `sys_dict` VALUES (255, 'tableware', 'el-icon-tableware', 'icon');
INSERT INTO `sys_dict` VALUES (256, 'sugar', 'el-icon-sugar', 'icon');
INSERT INTO `sys_dict` VALUES (257, 'dessert', 'el-icon-dessert', 'icon');
INSERT INTO `sys_dict` VALUES (258, 'ice-cream', 'el-icon-ice-cream', 'icon');
INSERT INTO `sys_dict` VALUES (259, 'hot-water', 'el-icon-hot-water', 'icon');
INSERT INTO `sys_dict` VALUES (260, 'water-cup', 'el-icon-water-cup', 'icon');
INSERT INTO `sys_dict` VALUES (261, 'coffee-cup', 'el-icon-coffee-cup', 'icon');
INSERT INTO `sys_dict` VALUES (262, 'cold-drink', 'el-icon-cold-drink', 'icon');
INSERT INTO `sys_dict` VALUES (263, 'goblet', 'el-icon-goblet', 'icon');
INSERT INTO `sys_dict` VALUES (264, 'goblet-full', 'el-icon-goblet-full', 'icon');
INSERT INTO `sys_dict` VALUES (265, 'goblet-square', 'el-icon-goblet-square', 'icon');
INSERT INTO `sys_dict` VALUES (266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon');
INSERT INTO `sys_dict` VALUES (267, 'refrigerator', 'el-icon-refrigerator', 'icon');
INSERT INTO `sys_dict` VALUES (268, 'grape', 'el-icon-grape', 'icon');
INSERT INTO `sys_dict` VALUES (269, 'watermelon', 'el-icon-watermelon', 'icon');
INSERT INTO `sys_dict` VALUES (270, 'cherry', 'el-icon-cherry', 'icon');
INSERT INTO `sys_dict` VALUES (271, 'apple', 'el-icon-apple', 'icon');
INSERT INTO `sys_dict` VALUES (272, 'pear', 'el-icon-pear', 'icon');
INSERT INTO `sys_dict` VALUES (273, 'orange', 'el-icon-orange', 'icon');
INSERT INTO `sys_dict` VALUES (274, 'ice-tea', 'el-icon-ice-tea', 'icon');
INSERT INTO `sys_dict` VALUES (275, 'ice-drink', 'el-icon-ice-drink', 'icon');
INSERT INTO `sys_dict` VALUES (276, 'milk-tea', 'el-icon-milk-tea', 'icon');
INSERT INTO `sys_dict` VALUES (277, 'potato-strips', 'el-icon-potato-strips', 'icon');
INSERT INTO `sys_dict` VALUES (278, 'lollipop', 'el-icon-lollipop', 'icon');
INSERT INTO `sys_dict` VALUES (279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon');
INSERT INTO `sys_dict` VALUES (280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, 'b6237e7c882711ebb6edd017c2d2eca2.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (2, 'wallhaven-728vy3.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 1, 1);
INSERT INTO `sys_file` VALUES (3, '35fcfe7f24b344cdbb39e02705ca585a.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (4, '35fcfe7f24b344cdbb39e02705ca585a.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (5, '35fcfe7f24b344cdbb39e02705ca585a.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (6, '706c030b18e64b3ba4a91f3627fcc607.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 1, 1);
INSERT INTO `sys_file` VALUES (7, 'fileb5355d194b704087a77a29dae8924542.png', 'png', 15471, 'http://localhost:9090/file/d39326e197474f0aa1a7f421ba8af213.png', '05f23d26197195eca186d887debadb35', 1, 1);
INSERT INTO `sys_file` VALUES (8, 'b9ff4b63a7e548c3a61eab96db421edb.jpg', 'jpg', 2816, 'http://localhost:9090/file/f302db20ef6f488384d89a7f8e4fa85f.jpg', '5936102b537398687b7aad5c7ea1d617', 1, 1);
INSERT INTO `sys_file` VALUES (9, '35fcfe7f24b344cdbb39e02705ca585a.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (10, '4.jpg', 'jpg', 2816, 'http://localhost:9090/file/f302db20ef6f488384d89a7f8e4fa85f.jpg', '5936102b537398687b7aad5c7ea1d617', 1, 1);
INSERT INTO `sys_file` VALUES (11, '4.jpg', 'jpg', 2816, 'http://localhost:9090/file/f302db20ef6f488384d89a7f8e4fa85f.jpg', '5936102b537398687b7aad5c7ea1d617', 1, 1);
INSERT INTO `sys_file` VALUES (12, '4.jpg', 'jpg', 2816, 'http://localhost:9090/file/f302db20ef6f488384d89a7f8e4fa85f.jpg', '5936102b537398687b7aad5c7ea1d617', 1, 1);
INSERT INTO `sys_file` VALUES (13, '67f650685fcd457d892888d9b4bd8fa1.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 1, 1);
INSERT INTO `sys_file` VALUES (14, '67f650685fcd457d892888d9b4bd8fa1.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 1, 1);
INSERT INTO `sys_file` VALUES (15, '67f650685fcd457d892888d9b4bd8fa1.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 1, 1);
INSERT INTO `sys_file` VALUES (16, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 1, 1);
INSERT INTO `sys_file` VALUES (17, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 0, 1);
INSERT INTO `sys_file` VALUES (18, '67f650685fcd457d892888d9b4bd8fa1.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 0, 1);
INSERT INTO `sys_file` VALUES (19, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 0, 1);
INSERT INTO `sys_file` VALUES (20, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 0, 1);
INSERT INTO `sys_file` VALUES (21, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 0, 1);
INSERT INTO `sys_file` VALUES (22, '67f650685fcd457d892888d9b4bd8fa1.png', 'png', 2814, 'http://localhost:9090/file/706c030b18e64b3ba4a91f3627fcc607.png', 'b25603ea555ecadefbb194f91cd4510a', 0, 1);
INSERT INTO `sys_file` VALUES (23, '1.png', 'png', 569, 'http://localhost:9090/file/35fcfe7f24b344cdbb39e02705ca585a.png', 'bace11dfecccfa28de13222005a07071', 0, 1);
INSERT INTO `sys_file` VALUES (24, '证件照.jpg', 'jpg', 478, 'http://localhost:9090/file/e88efee6ce8b4d4e845d642aa9560737.jpg', 'b4c6eb625016a4f520cb301e461e39ea', 0, 1);
INSERT INTO `sys_file` VALUES (25, 'WIN_20230428_16_12_51_Pro.jpg', 'jpg', 150, 'http://localhost:9090/file/f2328724b5f9431995c96f9fe82ae48d.jpg', '9e0392eb27ece0a6e849d14968ade6e1', 0, 1);
INSERT INTO `sys_file` VALUES (26, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (27, 'WIN_20220911_13_35_55_Pro.jpg', 'jpg', 197, 'http://localhost:9090/file/ea3ba07c78514d1399fba117e52e9602.jpg', '81baf5981f8892c73866848c1719a894', 0, 1);
INSERT INTO `sys_file` VALUES (28, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (29, 'WIN_20220911_13_35_55_Pro.jpg', 'jpg', 197, 'http://localhost:9090/file/ea3ba07c78514d1399fba117e52e9602.jpg', '81baf5981f8892c73866848c1719a894', 0, 1);
INSERT INTO `sys_file` VALUES (30, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (31, 'WIN_20220911_13_35_55_Pro.jpg', 'jpg', 197, 'http://localhost:9090/file/ea3ba07c78514d1399fba117e52e9602.jpg', '81baf5981f8892c73866848c1719a894', 0, 1);
INSERT INTO `sys_file` VALUES (32, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (33, 'WIN_20220911_13_35_55_Pro.jpg', 'jpg', 197, 'http://localhost:9090/file/ea3ba07c78514d1399fba117e52e9602.jpg', '81baf5981f8892c73866848c1719a894', 0, 1);
INSERT INTO `sys_file` VALUES (34, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (35, 'WIN_20220911_13_35_55_Pro.jpg', 'jpg', 197, 'http://localhost:9090/file/ea3ba07c78514d1399fba117e52e9602.jpg', '81baf5981f8892c73866848c1719a894', 0, 1);
INSERT INTO `sys_file` VALUES (36, 'WIN_20230428_16_13_43_Pro.jpg', 'jpg', 154, 'http://localhost:9090/file/ad3630af0b114fffad89173dacd0a63a.jpg', '830381526bf2cdb452eae68cf5818725', 0, 1);
INSERT INTO `sys_file` VALUES (37, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (38, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (39, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (40, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (41, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (42, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (43, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (44, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (45, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);
INSERT INTO `sys_file` VALUES (46, '1.jpg', 'jpg', 81, 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'bba868e231fbd30198d5f829b0836727', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (12, '部门管理', '/department', 'el-icon-menu', NULL, NULL, 'Department', 999);
INSERT INTO `sys_menu` VALUES (13, '员工管理', '/employee', 'el-icon-user', NULL, NULL, 'Employee', 999);
INSERT INTO `sys_menu` VALUES (15, '工资管理', '/salary', 'el-icon-star-on', NULL, NULL, 'Salary', 999);
INSERT INTO `sys_menu` VALUES (20, '前端页面', '/front/home', 'el-icon-eleme', NULL, NULL, '/front/home', NULL);
INSERT INTO `sys_menu` VALUES (21, '请假管理', '/leaverecords', 'el-icon-user-solid', NULL, NULL, 'Leaverecords', 999);
INSERT INTO `sys_menu` VALUES (22, '出勤管理', '/attendrecords', 'el-icon-phone', NULL, NULL, 'Attendrecords', 999);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 20);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '帅哥', 'admin@qq.com', '13988997788', '福建福州', '2023-07-28 21:10:27', 'http://localhost:9090/file/b3335cd3fae54706b75abd947c309235.jpg', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (2, 'zhang', '123', '张张', 'zhang@qq.com', '13677889900', '南京', '2023-07-28 22:10:14', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (3, 'wang', '123', '我是王五', 'wang@qq.com', '13877668855', '上海', '2023-07-28 22:10:18', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (8, '张三', '123', '张三', NULL, NULL, NULL, '2023-08-07 19:51:06', NULL, 'ROLE_USER');

SET FOREIGN_KEY_CHECKS = 1;
