/*
Navicat MySQL Data Transfer

Source Server         : Dango_test
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : minicms

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-10-15 20:28:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 教程', '7', 'add_article');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 教程', '7', 'change_article');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 教程', '7', 'delete_article');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 栏目', '8', 'add_column');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 栏目', '8', 'change_column');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 栏目', '8', 'delete_column');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$398lLKji8yzV$t+X0Q8DavWf6pU0dtAnzIt4auxMDhocMYRSwFSTWXGM=', '2017-10-12 14:35:59.746522', '1', 'lqh', '', '', '123@123.com', '1', '1', '2017-09-21 10:09:45.332184');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'news', 'article');
INSERT INTO `django_content_type` VALUES ('8', 'news', 'column');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-09-21 10:03:46.737673');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-09-21 10:03:47.622724');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-09-21 10:03:48.031747');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-09-21 10:03:48.050749');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-09-21 10:03:48.279762');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-09-21 10:03:48.340765');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-09-21 10:03:48.400769');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-09-21 10:03:48.426770');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-09-21 10:03:48.505775');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-09-21 10:03:48.510775');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-09-21 10:03:48.528776');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-09-21 10:03:48.676784');
INSERT INTO `django_migrations` VALUES ('13', 'news', '0001_initial', '2017-09-21 10:03:48.940799');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2017-09-21 10:03:48.975801');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('8mg2a5vn0r9qttgauasi6emcf6jq7ru7', 'NWRiMGVhOGE3MGQyZTc1YTJjYTFkNTZiY2NjOWY1NzhkNWY5OWI1ODp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0NzU0YjllOGUxZmZlNzc5ZThmMjMyMzBlNTk4MjEyNDFkOTc2YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-10-26 14:35:59.830527');
INSERT INTO `django_session` VALUES ('us9cudjp5mn2lnl1foqy6gtegytjv8nb', 'NWRiMGVhOGE3MGQyZTc1YTJjYTFkNTZiY2NjOWY1NzhkNWY5OWI1ODp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0NzU0YjllOGUxZmZlNzc5ZThmMjMyMzBlNTk4MjEyNDFkOTc2YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-10-05 10:10:55.759212');

-- ----------------------------
-- Table structure for news_article
-- ----------------------------
DROP TABLE IF EXISTS `news_article`;
CREATE TABLE `news_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_article_author_id_11c60ced_fk_auth_user_id` (`author_id`),
  KEY `news_article_slug_5328fdc5` (`slug`),
  CONSTRAINT `news_article_author_id_11c60ced_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_article
-- ----------------------------
INSERT INTO `news_article` VALUES ('1', '体育新闻_1', 'article_1', '新闻详细内容： 体育新闻 1', '1', '2017-09-21 10:04:09.432971', '2017-09-21 10:04:09.432971', null);
INSERT INTO `news_article` VALUES ('2', '体育新闻_2', 'article_2', '新闻详细内容： 体育新闻 2', '1', '2017-09-21 10:04:09.445972', '2017-09-21 10:04:09.445972', null);
INSERT INTO `news_article` VALUES ('3', '体育新闻_3', 'article_3', '新闻详细内容： 体育新闻 3', '1', '2017-09-21 10:04:09.457973', '2017-09-21 10:04:09.457973', null);
INSERT INTO `news_article` VALUES ('4', '体育新闻_4', 'article_4', '新闻详细内容： 体育新闻 4', '1', '2017-09-21 10:04:09.467973', '2017-09-21 10:04:09.467973', null);
INSERT INTO `news_article` VALUES ('5', '体育新闻_5', 'article_5', '新闻详细内容： 体育新闻 5', '1', '2017-09-21 10:04:09.476974', '2017-09-21 10:04:09.476974', null);
INSERT INTO `news_article` VALUES ('6', '体育新闻_6', 'article_6', '新闻详细内容： 体育新闻 6', '1', '2017-09-21 10:04:09.486975', '2017-09-21 10:04:09.486975', null);
INSERT INTO `news_article` VALUES ('7', '体育新闻_7', 'article_7', '新闻详细内容： 体育新闻 7', '1', '2017-09-21 10:04:09.494975', '2017-09-21 10:04:09.494975', null);
INSERT INTO `news_article` VALUES ('8', '体育新闻_8', 'article_8', '新闻详细内容： 体育新闻 8', '1', '2017-09-21 10:04:09.502975', '2017-09-21 10:04:09.502975', null);
INSERT INTO `news_article` VALUES ('9', '体育新闻_9', 'article_9', '新闻详细内容： 体育新闻 9', '1', '2017-09-21 10:04:09.510976', '2017-09-21 10:04:09.510976', null);
INSERT INTO `news_article` VALUES ('10', '体育新闻_10', 'article_10', '新闻详细内容： 体育新闻 10', '1', '2017-09-21 10:04:09.518976', '2017-09-21 10:04:09.518976', null);
INSERT INTO `news_article` VALUES ('11', '社会新闻_1', 'article_1', '新闻详细内容： 社会新闻 1', '1', '2017-09-21 10:04:09.528977', '2017-09-21 10:04:09.529977', null);
INSERT INTO `news_article` VALUES ('12', '社会新闻_2', 'article_2', '新闻详细内容： 社会新闻 2', '1', '2017-09-21 10:04:09.537978', '2017-09-21 10:04:09.537978', null);
INSERT INTO `news_article` VALUES ('13', '社会新闻_3', 'article_3', '新闻详细内容： 社会新闻 3', '1', '2017-09-21 10:04:09.545978', '2017-09-21 10:04:09.545978', null);
INSERT INTO `news_article` VALUES ('14', '社会新闻_4', 'article_4', '新闻详细内容： 社会新闻 4', '1', '2017-09-21 10:04:09.553978', '2017-09-21 10:04:09.553978', null);
INSERT INTO `news_article` VALUES ('15', '社会新闻_5', 'article_5', '新闻详细内容： 社会新闻 5', '1', '2017-09-21 10:04:09.562979', '2017-09-21 10:04:09.562979', null);
INSERT INTO `news_article` VALUES ('16', '社会新闻_6', 'article_6', '新闻详细内容： 社会新闻 6', '1', '2017-09-21 10:04:09.570979', '2017-09-21 10:04:09.570979', null);
INSERT INTO `news_article` VALUES ('17', '社会新闻_7', 'article_7', '新闻详细内容： 社会新闻 7', '1', '2017-09-21 10:04:09.578980', '2017-09-21 10:04:09.578980', null);
INSERT INTO `news_article` VALUES ('18', '社会新闻_8', 'article_8', '新闻详细内容： 社会新闻 8', '1', '2017-09-21 10:04:09.587980', '2017-09-21 10:04:09.587980', null);
INSERT INTO `news_article` VALUES ('19', '社会新闻_9', 'article_9', '新闻详细内容： 社会新闻 9', '1', '2017-09-21 10:04:09.595981', '2017-09-21 10:04:09.595981', null);
INSERT INTO `news_article` VALUES ('20', '社会新闻_10', 'article_10', '新闻详细内容： 社会新闻 10', '1', '2017-09-21 10:04:09.603981', '2017-09-21 10:04:09.603981', null);
INSERT INTO `news_article` VALUES ('21', '科技新闻_1', 'article_1', '新闻详细内容： 科技新闻 1', '1', '2017-09-21 10:04:09.615982', '2017-09-21 10:04:09.615982', null);
INSERT INTO `news_article` VALUES ('22', '科技新闻_2', 'article_2', '新闻详细内容： 科技新闻 2', '1', '2017-09-21 10:04:09.623982', '2017-09-21 10:04:09.624982', null);
INSERT INTO `news_article` VALUES ('23', '科技新闻_3', 'article_3', '新闻详细内容： 科技新闻 3', '1', '2017-09-21 10:04:09.631983', '2017-09-21 10:04:09.631983', null);
INSERT INTO `news_article` VALUES ('24', '科技新闻_4', 'article_4', '新闻详细内容： 科技新闻 4', '1', '2017-09-21 10:04:09.640983', '2017-09-21 10:04:09.641983', null);
INSERT INTO `news_article` VALUES ('25', '科技新闻_5', 'article_5', '新闻详细内容： 科技新闻 5', '1', '2017-09-21 10:04:09.649984', '2017-09-21 10:04:09.649984', null);
INSERT INTO `news_article` VALUES ('26', '科技新闻_6', 'article_6', '新闻详细内容： 科技新闻 6', '1', '2017-09-21 10:04:09.657984', '2017-09-21 10:04:09.657984', null);
INSERT INTO `news_article` VALUES ('27', '科技新闻_7', 'article_7', '新闻详细内容： 科技新闻 7', '1', '2017-09-21 10:04:09.666985', '2017-09-21 10:04:09.666985', null);
INSERT INTO `news_article` VALUES ('28', '科技新闻_8', 'article_8', '新闻详细内容： 科技新闻 8', '1', '2017-09-21 10:04:09.674985', '2017-09-21 10:04:09.674985', null);
INSERT INTO `news_article` VALUES ('29', '科技新闻_9', 'article_9', '新闻详细内容： 科技新闻 9', '1', '2017-09-21 10:04:09.681986', '2017-09-21 10:04:09.682986', null);
INSERT INTO `news_article` VALUES ('30', '科技新闻_10', 'article_10', '新闻详细内容： 科技新闻 10', '1', '2017-09-21 10:04:09.690986', '2017-09-21 10:04:09.690986', null);

-- ----------------------------
-- Table structure for news_article_column
-- ----------------------------
DROP TABLE IF EXISTS `news_article_column`;
CREATE TABLE `news_article_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_article_column_article_id_column_id_11b59831_uniq` (`article_id`,`column_id`),
  KEY `news_article_column_column_id_202a915e_fk_news_column_id` (`column_id`),
  CONSTRAINT `news_article_column_article_id_19dc8d15_fk_news_article_id` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`id`),
  CONSTRAINT `news_article_column_column_id_202a915e_fk_news_column_id` FOREIGN KEY (`column_id`) REFERENCES `news_column` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_article_column
-- ----------------------------
INSERT INTO `news_article_column` VALUES ('1', '1', '1');
INSERT INTO `news_article_column` VALUES ('2', '2', '1');
INSERT INTO `news_article_column` VALUES ('3', '3', '1');
INSERT INTO `news_article_column` VALUES ('4', '4', '1');
INSERT INTO `news_article_column` VALUES ('5', '5', '1');
INSERT INTO `news_article_column` VALUES ('6', '6', '1');
INSERT INTO `news_article_column` VALUES ('7', '7', '1');
INSERT INTO `news_article_column` VALUES ('8', '8', '1');
INSERT INTO `news_article_column` VALUES ('9', '9', '1');
INSERT INTO `news_article_column` VALUES ('10', '10', '1');
INSERT INTO `news_article_column` VALUES ('11', '11', '2');
INSERT INTO `news_article_column` VALUES ('12', '12', '2');
INSERT INTO `news_article_column` VALUES ('13', '13', '2');
INSERT INTO `news_article_column` VALUES ('14', '14', '2');
INSERT INTO `news_article_column` VALUES ('15', '15', '2');
INSERT INTO `news_article_column` VALUES ('16', '16', '2');
INSERT INTO `news_article_column` VALUES ('17', '17', '2');
INSERT INTO `news_article_column` VALUES ('18', '18', '2');
INSERT INTO `news_article_column` VALUES ('19', '19', '2');
INSERT INTO `news_article_column` VALUES ('20', '20', '2');
INSERT INTO `news_article_column` VALUES ('21', '21', '3');
INSERT INTO `news_article_column` VALUES ('22', '22', '3');
INSERT INTO `news_article_column` VALUES ('23', '23', '3');
INSERT INTO `news_article_column` VALUES ('24', '24', '3');
INSERT INTO `news_article_column` VALUES ('25', '25', '3');
INSERT INTO `news_article_column` VALUES ('26', '26', '3');
INSERT INTO `news_article_column` VALUES ('27', '27', '3');
INSERT INTO `news_article_column` VALUES ('28', '28', '3');
INSERT INTO `news_article_column` VALUES ('29', '29', '3');
INSERT INTO `news_article_column` VALUES ('30', '30', '3');

-- ----------------------------
-- Table structure for news_column
-- ----------------------------
DROP TABLE IF EXISTS `news_column`;
CREATE TABLE `news_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `intro` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_column_slug_74d85c37` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_column
-- ----------------------------
INSERT INTO `news_column` VALUES ('1', '体育新闻', 'sports', '');
INSERT INTO `news_column` VALUES ('2', '社会新闻', 'society', '');
INSERT INTO `news_column` VALUES ('3', '科技新闻', 'tech', '');
