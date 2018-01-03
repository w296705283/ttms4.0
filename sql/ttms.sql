DROP database IF EXISTS ttms;
CREATE database ttms DEFAULT CHARACTER SET 'utf8';
use ttms;

-- ----------------------------
-- Table structure for sys_companies
-- ----------------------------
DROP TABLE IF EXISTS `sys_companies`;
CREATE TABLE `sys_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `category` varchar(50) DEFAULT NULL COMMENT '类型',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '电话',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `valid` tinyint(1) DEFAULT '1' COMMENT '有效标志',
  `createdTime` datetime DEFAULT NULL COMMENT '新增时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_companies
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `type` int(11) DEFAULT NULL COMMENT '类型     1：菜单   2：按钮',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  `parentId` int(11) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `permission` varchar(500) DEFAULT NULL COMMENT '授权(如：user:create)',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='资源管理';

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1', '信息面板', '请求路径', '1', '1', null, null, '', '2017-07-12 15:15:59', '2017-07-21 11:07:49', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('3', '产品管理', '请求路径', '1', '3', null, null, 'product:list', '2017-07-12 15:15:59', '2017-07-21 11:16:10', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('4', '销售管理', '请求路径', '1', '4', null, null, null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('5', '资源管理', '请求路径', '1', '5', null, null, null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('6', '财务管理', '请求路径', '1', '6', null, null, null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('7', '供销管理', '请求路径', '1', '7', null, null, 'dist:list', '2017-07-12 15:15:59', '2017-07-21 11:16:55', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('8', '系统管理', '请求路径', '1', '8', null, null, 'sys:list', '2017-07-12 15:15:59', '2017-07-21 11:16:00', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('11', '项目信息', 'project/listUI.do', '1', '11', null, '3', 'product:project:view', '2017-07-12 15:15:59', '2017-07-21 17:35:34', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('12', '团信息', 'team/listUI.do', '1', '12', null, '3', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('13', '产品信息', 'product/listUI.do', '1', '13', null, '3', '', '2017-07-12 15:15:59', '2017-07-24 14:34:08', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('14', '产品分类', 'productType/listUI.do', '1', '14', null, '3', '', '2017-07-12 15:15:59', '2017-07-24 14:34:50', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('24', '系统配置', '请求路径', '1', '24', null, '8', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('25', '日志管理', '请求路径', '1', '25', null, '8', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('26', '发布通知', '请求路径', '1', '26', null, '1', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('27', '通知管理', '请求路径', '1', '27', null, '1', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('34', '分销商管理', '请求路径', '1', '34', null, '7', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('35', '订单管理', '请求路径', '1', '35', null, '4', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('36', '世界大洲', '请求路径', '1', '36', null, '5', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('37', '国家地区', '请求路径', '1', '37', null, '5', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('38', '城市', '请求路径', '1', '38', null, '5', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('39', '导游管理', '请求路径', '1', '39', null, '5', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('40', '附件管理', '请求路径', '1', '40', null, '5', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('41', '供应商管理', '请求路径', '1', '41', null, '7', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('42', '成本信息', '请求路径', '1', '42', null, '6', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('43', '渠道信息管理', '请求路径', '1', '43', null, '7', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('44', '渠道商管理', '请求路径', '1', '44', null, '7', null, '2017-07-12 15:15:59', '2017-07-12 15:15:59', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('45', '用户管理', 'user/listUI.do', '1', '45', null, '8', 'sys:user:view', '2017-07-12 15:15:59', '2017-07-21 17:36:01', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('46', '菜单管理', 'menu/listUI.do', '1', '46', null, '8', 'sys:menu:view', '2017-07-12 15:15:59', '2017-07-21 17:36:16', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('47', '角色管理', 'role/listUI.do', '1', '47', null, '8', 'sys:role:view', '2017-07-12 15:15:59', '2017-07-21 17:38:03', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('48', '组织管理', '请求路径', '1', '48', null, '8', 'sys:org:view', '2017-07-12 15:15:59', '2017-07-21 18:37:57', 'admin', 'admin');
INSERT INTO `sys_menus` VALUES ('115', '查看', '', '2', '1', null, '46', 'sys:menu:view', '2017-07-13 16:33:41', '2017-07-21 11:09:05', null, null);
INSERT INTO `sys_menus` VALUES ('116', '新增', '', '2', '2', null, '46', 'sys:menu:add', '2017-07-13 16:34:02', '2017-07-21 11:09:22', null, null);
INSERT INTO `sys_menus` VALUES ('117', '修改', '', '2', '3', null, '46', 'sys:menu:update', '2017-07-13 16:34:25', '2017-07-21 11:09:45', null, null);
INSERT INTO `sys_menus` VALUES ('118', '删除', '', '2', '4', null, '46', 'sys:menu:delete', '2017-07-13 16:34:46', '2017-07-21 11:10:12', null, null);
INSERT INTO `sys_menus` VALUES ('119', '查看', '', '2', '1', null, '45', 'sys:user:view', '2017-07-13 16:35:05', '2017-07-21 11:12:46', null, null);
INSERT INTO `sys_menus` VALUES ('120', '查看', '', '2', '1', null, '47', 'sys:role:view', '2017-07-13 16:35:26', '2017-07-21 11:13:43', null, null);
INSERT INTO `sys_menus` VALUES ('126', '新增', '', '2', '2', null, '45', 'sys:user:add', '2017-07-21 11:11:34', '2017-07-21 11:11:34', null, null);
INSERT INTO `sys_menus` VALUES ('127', '修改', '', '2', '3', null, '45', 'sys:user:update', '2017-07-21 11:11:56', '2017-07-21 11:11:56', null, null);
INSERT INTO `sys_menus` VALUES ('128', '新增', '', '2', '2', null, '47', 'sys:role:add', '2017-07-21 11:14:24', '2017-07-21 11:14:24', null, null);
INSERT INTO `sys_menus` VALUES ('129', '修改', '', '2', '3', null, '47', 'sys:role:update', '2017-07-21 11:14:48', '2017-07-21 11:14:48', null, null);
INSERT INTO `sys_menus` VALUES ('130', '删除', '', '2', '4', null, '47', 'sys:role:delete', '2017-07-21 11:15:09', '2017-07-21 11:15:09', null, null);
INSERT INTO `sys_menus` VALUES ('135', '查询', '', '2', '1', null, '11', 'product:project:view', '2017-07-21 17:21:40', '2017-07-21 17:21:40', null, null);
INSERT INTO `sys_menus` VALUES ('136', '新增', '', '2', '2', null, '11', 'product:project:add', '2017-07-21 17:22:02', '2017-07-21 17:22:02', null, null);
INSERT INTO `sys_menus` VALUES ('137', '启用', '', '2', '3', null, '11', 'product:project:open', '2017-07-21 17:22:23', '2017-07-21 17:22:23', null, null);
INSERT INTO `sys_menus` VALUES ('138', '禁用', '', '2', '4', null, '11', 'product:project:close', '2017-07-21 17:22:44', '2017-07-21 17:22:44', null, null);
INSERT INTO `sys_menus` VALUES ('139', '修改', '', '2', '5', null, '11', 'product:project:update', '2017-07-21 17:25:20', '2017-07-21 17:25:20', null, null);

-- ----------------------------
-- Table structure for sys_organizations
-- ----------------------------
DROP TABLE IF EXISTS `sys_organizations`;
CREATE TABLE `sys_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `code` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `parentId` int(11) DEFAULT NULL COMMENT '父机构id',
  `parentIds` int(11) DEFAULT NULL COMMENT '父机构ids 0/1/2/3',
  `valid` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organizations
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1068 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
INSERT INTO `sys_role_menus` VALUES ('973', '1', '1');
INSERT INTO `sys_role_menus` VALUES ('974', '1', '26');
INSERT INTO `sys_role_menus` VALUES ('975', '1', '27');
INSERT INTO `sys_role_menus` VALUES ('976', '1', '3');
INSERT INTO `sys_role_menus` VALUES ('977', '1', '11');
INSERT INTO `sys_role_menus` VALUES ('978', '1', '135');
INSERT INTO `sys_role_menus` VALUES ('979', '1', '136');
INSERT INTO `sys_role_menus` VALUES ('980', '1', '137');
INSERT INTO `sys_role_menus` VALUES ('981', '1', '138');
INSERT INTO `sys_role_menus` VALUES ('982', '1', '139');
INSERT INTO `sys_role_menus` VALUES ('983', '1', '12');
INSERT INTO `sys_role_menus` VALUES ('984', '1', '13');
INSERT INTO `sys_role_menus` VALUES ('985', '1', '14');
INSERT INTO `sys_role_menus` VALUES ('986', '1', '4');
INSERT INTO `sys_role_menus` VALUES ('987', '1', '35');
INSERT INTO `sys_role_menus` VALUES ('988', '1', '5');
INSERT INTO `sys_role_menus` VALUES ('989', '1', '36');
INSERT INTO `sys_role_menus` VALUES ('990', '1', '37');
INSERT INTO `sys_role_menus` VALUES ('991', '1', '38');
INSERT INTO `sys_role_menus` VALUES ('992', '1', '39');
INSERT INTO `sys_role_menus` VALUES ('993', '1', '40');
INSERT INTO `sys_role_menus` VALUES ('994', '1', '6');
INSERT INTO `sys_role_menus` VALUES ('995', '1', '42');
INSERT INTO `sys_role_menus` VALUES ('996', '1', '7');
INSERT INTO `sys_role_menus` VALUES ('997', '1', '34');
INSERT INTO `sys_role_menus` VALUES ('998', '1', '41');
INSERT INTO `sys_role_menus` VALUES ('999', '1', '43');
INSERT INTO `sys_role_menus` VALUES ('1000', '1', '44');
INSERT INTO `sys_role_menus` VALUES ('1001', '1', '8');
INSERT INTO `sys_role_menus` VALUES ('1002', '1', '24');
INSERT INTO `sys_role_menus` VALUES ('1003', '1', '25');
INSERT INTO `sys_role_menus` VALUES ('1004', '1', '45');
INSERT INTO `sys_role_menus` VALUES ('1005', '1', '119');
INSERT INTO `sys_role_menus` VALUES ('1006', '1', '126');
INSERT INTO `sys_role_menus` VALUES ('1007', '1', '127');
INSERT INTO `sys_role_menus` VALUES ('1008', '1', '46');
INSERT INTO `sys_role_menus` VALUES ('1009', '1', '115');
INSERT INTO `sys_role_menus` VALUES ('1010', '1', '116');
INSERT INTO `sys_role_menus` VALUES ('1011', '1', '117');
INSERT INTO `sys_role_menus` VALUES ('1012', '1', '118');
INSERT INTO `sys_role_menus` VALUES ('1013', '1', '47');
INSERT INTO `sys_role_menus` VALUES ('1014', '1', '120');
INSERT INTO `sys_role_menus` VALUES ('1015', '1', '128');
INSERT INTO `sys_role_menus` VALUES ('1016', '1', '129');
INSERT INTO `sys_role_menus` VALUES ('1017', '1', '130');
INSERT INTO `sys_role_menus` VALUES ('1018', '1', '48');
INSERT INTO `sys_role_menus` VALUES ('1019', '2', '3');
INSERT INTO `sys_role_menus` VALUES ('1020', '2', '11');
INSERT INTO `sys_role_menus` VALUES ('1021', '2', '135');
INSERT INTO `sys_role_menus` VALUES ('1022', '2', '136');
INSERT INTO `sys_role_menus` VALUES ('1023', '2', '137');
INSERT INTO `sys_role_menus` VALUES ('1024', '2', '138');
INSERT INTO `sys_role_menus` VALUES ('1025', '2', '139');
INSERT INTO `sys_role_menus` VALUES ('1026', '2', '12');
INSERT INTO `sys_role_menus` VALUES ('1027', '2', '13');
INSERT INTO `sys_role_menus` VALUES ('1028', '2', '14');
INSERT INTO `sys_role_menus` VALUES ('1029', '2', '4');
INSERT INTO `sys_role_menus` VALUES ('1030', '2', '35');
INSERT INTO `sys_role_menus` VALUES ('1031', '2', '5');
INSERT INTO `sys_role_menus` VALUES ('1032', '2', '36');
INSERT INTO `sys_role_menus` VALUES ('1033', '2', '37');
INSERT INTO `sys_role_menus` VALUES ('1034', '2', '38');
INSERT INTO `sys_role_menus` VALUES ('1035', '2', '39');
INSERT INTO `sys_role_menus` VALUES ('1036', '2', '40');
INSERT INTO `sys_role_menus` VALUES ('1051', '38', '3');
INSERT INTO `sys_role_menus` VALUES ('1052', '38', '11');
INSERT INTO `sys_role_menus` VALUES ('1053', '38', '135');
INSERT INTO `sys_role_menus` VALUES ('1054', '38', '12');
INSERT INTO `sys_role_menus` VALUES ('1055', '38', '13');
INSERT INTO `sys_role_menus` VALUES ('1056', '38', '14');
INSERT INTO `sys_role_menus` VALUES ('1057', '38', '5');
INSERT INTO `sys_role_menus` VALUES ('1058', '38', '36');
INSERT INTO `sys_role_menus` VALUES ('1059', '38', '37');
INSERT INTO `sys_role_menus` VALUES ('1060', '38', '38');
INSERT INTO `sys_role_menus` VALUES ('1061', '38', '39');
INSERT INTO `sys_role_menus` VALUES ('1062', '38', '40');
INSERT INTO `sys_role_menus` VALUES ('1063', '38', '7');
INSERT INTO `sys_role_menus` VALUES ('1064', '38', '34');
INSERT INTO `sys_role_menus` VALUES ('1065', '38', '41');
INSERT INTO `sys_role_menus` VALUES ('1066', '38', '43');
INSERT INTO `sys_role_menus` VALUES ('1067', '38', '44');

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('1', '系统管理员', '系统管理员', '2017-07-13 17:44:11', '2017-07-24 09:27:38', 'admin', 'admin');
INSERT INTO `sys_roles` VALUES ('2', '产品经理', '产品经理', '2017-07-13 17:44:47', '2017-07-24 09:28:57', 'admin', 'admin');
INSERT INTO `sys_roles` VALUES ('38', '团负责人', '只能查看项目', '2017-07-21 17:09:23', '2017-07-24 15:11:52', null, null);

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES ('13', '1', '1');
INSERT INTO `sys_user_roles` VALUES ('19', '4', '2');
INSERT INTO `sys_user_roles` VALUES ('20', '5', '1');
INSERT INTO `sys_user_roles` VALUES ('22', '6', '2');
INSERT INTO `sys_user_roles` VALUES ('23', '2', '38');
INSERT INTO `sys_user_roles` VALUES ('25', '3', '2');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐  密码加密时前缀，使加密后的值不同',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `valid` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常  默认值 ：1',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'admin', '174d6f4c544799e0bd1323759687aa9e', '9052e391-2efa-4643-9332-585a4e657473', 'admin@tedu.cn', '13624356789', '1', null, '2017-07-18 17:13:39', null, null);
INSERT INTO `sys_users` VALUES ('2', 'zhangli', 'a398038062b23fead34dd22399fbaf41', '5e7cbd36-e897-4951-b42b-19809caf3caa', 'zhangli@tedu.cn', '13678909876', '1', '2017-07-18 10:01:51', '2017-07-21 17:09:58', null, null);
INSERT INTO `sys_users` VALUES ('3', 'wangke', 'c5dc32ec66041aeddf432b3146bd2257', '5e3e1475-1ea9-4a6a-976e-b07545827139', 'wangke@tedu.cn', '18678900987', '1', '2017-07-18 11:40:53', '2017-07-21 17:40:28', null, null);
INSERT INTO `sys_users` VALUES ('4', 'zhangql', '+HBpqtPuj9KLBIpneR5X0A==', 'ed487fac-9952-45c9-acaa-21dab9c689cc', 'zhangql@tedu.cn', '13678909876', '1', '2017-07-18 12:17:30', '2017-07-18 17:40:09', null, null);
INSERT INTO `sys_users` VALUES ('5', 'fanwei', '1acab7425d6dfae670f26bd160518902', '34fbedb2-e135-4f8d-b595-24360edc348d', 'fanwei@tedu.cn', '13876545678', '1', '2017-07-20 17:03:22', '2017-07-20 17:03:22', null, null);
INSERT INTO `sys_users` VALUES ('6', 'wumei', '431ebdcccf3404787a144f9ba669a8e2', '8a14f46f-7a17-4dfe-85ab-08e63cb618ce', 'wumei@tedu.cn', '13567898765', '1', '2017-07-21 10:57:40', '2017-07-21 10:58:21', null, null);

-- ----------------------------
-- Table structure for tms_attachements
-- ----------------------------
DROP TABLE IF EXISTS `tms_attachements`;
CREATE TABLE `tms_attachements` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `fileName` varchar(200) DEFAULT NULL COMMENT '文件名称 ',
  `contentType` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `filePath` varchar(200) DEFAULT NULL COMMENT '备注',
  `fileDisgest` varchar(200) DEFAULT NULL COMMENT '文件摘要',
  `athType` int(3) DEFAULT NULL COMMENT '附件归属类型',
  `belongId` int(11) DEFAULT NULL COMMENT '归属对象id',
  `createdUser` varchar(255) DEFAULT NULL COMMENT '创建人用户名',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedUser` varchar(255) DEFAULT NULL COMMENT '修改人用户名',
  `modifiedTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_attachements
-- ----------------------------

-- ----------------------------
-- Table structure for tms_classes
-- ----------------------------
DROP TABLE IF EXISTS `tms_classes`;
CREATE TABLE `tms_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类主键',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL COMMENT '分类序号',
  `parentId` int(11) DEFAULT NULL COMMENT '父类id ',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdUser` varchar(255) DEFAULT NULL COMMENT '创建人用户名',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedUser` varchar(255) DEFAULT NULL COMMENT '修改人用户名',
  `modifiedTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_classes
-- ----------------------------

-- ----------------------------
-- Table structure for tms_products
-- ----------------------------
DROP TABLE IF EXISTS `tms_products`;
CREATE TABLE `tms_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `code` varchar(50) NOT NULL COMMENT '产品编号',
  `name` varchar(200) DEFAULT '' COMMENT '产品名称',
  `teamId` int(11) DEFAULT NULL COMMENT '团号Id',
  `exText` varchar(500) DEFAULT NULL COMMENT '特殊提示',
  `onlineDate` date DEFAULT NULL COMMENT '上架时间',
  `offlineDate` date DEFAULT NULL COMMENT '下架时间',
  `quantity` int(11) DEFAULT '0' COMMENT '预售数量',
  `minQty` int(11) DEFAULT '0' COMMENT '最低数量',
  `soldQty` int(11) DEFAULT '0' COMMENT '已售数量',
  `price` decimal(10,0) DEFAULT '0' COMMENT '产品价格',
  `classId` int(11) DEFAULT '0' COMMENT '产品分类编号',
  `nights` int(11) DEFAULT '0' COMMENT '晚数',
  `state` int(11) DEFAULT '0' COMMENT '产品状态  0：待售  1：上架   2：下架',
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `createdUser` varchar(255) DEFAULT NULL COMMENT '创建人用户名',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedUser` varchar(255) DEFAULT NULL COMMENT '最后修改人用户名',
  `modifiedTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_products
-- ----------------------------

-- ----------------------------
-- Table structure for tms_projects
-- ----------------------------
DROP TABLE IF EXISTS `tms_projects`;
CREATE TABLE `tms_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `beginDate` date DEFAULT NULL COMMENT '电话',
  `endDate` date DEFAULT NULL COMMENT '电子邮箱',
  `valid` tinyint(1) DEFAULT '1' COMMENT '有效标志',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdTime` datetime DEFAULT NULL COMMENT '新增时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_projects
-- ----------------------------
INSERT INTO `tms_projects` VALUES ('4', 'TPCN-20170701-CHN-PEK-001', '2017年澳大利亚乌鲁鲁马拉松', '2017-07-21', '2017-07-25', '1', '专属红土马拉松，乌鲁鲁巨岩10km排酸跑，高碳晚餐，赛后安排乌鲁鲁日落，卡塔丘塔徒步，特色原野星光秀', '2017-07-05 14:19:13', '2017-07-07 14:30:48', null, null);
INSERT INTO `tms_projects` VALUES ('5', 'TP-20170710-USA-NY-001', '2017美国纽约马拉松', '2017-08-01', '2017-08-08', '1', '跑步纵览纽约城市魅力，热情的观众和专业的跑步组织', '2017-07-05 14:19:14', '2017-07-24 15:09:47', null, null);
INSERT INTO `tms_projects` VALUES ('6', 'TP-20170710-DEU-BER-001', '2017德国柏林马拉松自由行', '2017-08-11', '2017-08-20', '1', '落地参团，往返接送机服务,赛前晚餐+赛后特色餐，全程专业摄影摄像', '2017-07-05 14:19:14', '2017-07-06 15:52:44', null, null);
INSERT INTO `tms_projects` VALUES ('7', 'TP-20170710-FIN-HEL-001', '2017 徒步北欧探梦布道石', '2017-09-10', '2017-09-20', '1', '勇攀布道石，全程四星酒店，浮士德，诗丽雅双游轮，畅游三峡湾，安徒生博物馆，伊埃斯科城堡', '2017-07-05 14:19:14', '2017-07-05 14:19:14', null, null);

-- ----------------------------
-- Table structure for tms_teams
-- ----------------------------
DROP TABLE IF EXISTS `tms_teams`;
CREATE TABLE `tms_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '团名称',
  `projectId` int(11) DEFAULT NULL COMMENT '项目id',
  `valid` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(20) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tms_teams
-- ----------------------------
INSERT INTO `tms_teams` VALUES ('11', '2017美国纽约马拉松3日团', '5', '1', '2017美国纽约马拉松3日团Happy', '2017-07-06 10:34:23', '2017-07-06 10:34:23', null, null);
INSERT INTO `tms_teams` VALUES ('12', '2017美国纽约马拉松5日团', '5', '1', '2017美国纽约马拉松3日团Happy', '2017-07-06 10:34:23', '2017-07-06 10:34:23', null, null);
INSERT INTO `tms_teams` VALUES ('23', '2017美国纽约马拉松6日团', '5', '1', '2017美国纽约马拉松6日团.....', '2017-07-06 14:46:51', '2017-07-07 11:23:36', null, null);
INSERT INTO `tms_teams` VALUES ('24', '2017美国纽约马拉松7日团', '5', '1', '2017美国纽约马拉松7日团', '2017-07-06 14:53:57', '2017-07-07 11:23:36', null, null);
INSERT INTO `tms_teams` VALUES ('25', '2017 德国柏林马拉松3日游', '6', '0', '2017 德国柏林马拉松3日游。。。', '2017-07-06 16:00:37', '2017-07-06 16:43:50', null, null);
INSERT INTO `tms_teams` VALUES ('26', '2017 德国柏林马拉松4日游', '6', '0', '2017 德国柏林马拉松4日游.。。。', '2017-07-06 16:04:12', '2017-07-06 16:43:50', null, null);
