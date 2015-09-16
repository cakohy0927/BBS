/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.28 : Database - bbs
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `t_platform_menu` */

DROP TABLE IF EXISTS `t_platform_menu`;

CREATE TABLE `t_platform_menu` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_platform_menu` */

/*Table structure for table `t_platform_user` */

DROP TABLE IF EXISTS `t_platform_user`;

CREATE TABLE `t_platform_user` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `brithday` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_platform_user` */

insert  into `t_platform_user`(`id`,`create_time`,`update_time`,`delete_status`,`display_status`,`brithday`,`email`,`login_name`,`nick_name`,`password`,`user_status`,`user_type`) values ('5ce682e8-16d2-46a7-81ea-cd2de9757698','2015-09-13 20:34:55','2015-09-13 20:43:58',0,0,'2015-09-23','nickhy@126.com','8234293479234','loginName','d41d8cd98f00b204e9800998ecf8427e',0,1);

/*Table structure for table `t_topic_column` */

DROP TABLE IF EXISTS `t_topic_column`;

CREATE TABLE `t_topic_column` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `column_type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `column_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l1sfu2dj7q6v8dnrsp6gt3myp` (`column_id`),
  CONSTRAINT `FK_l1sfu2dj7q6v8dnrsp6gt3myp` FOREIGN KEY (`column_id`) REFERENCES `t_topic_column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_topic_column` */

insert  into `t_topic_column`(`id`,`create_time`,`update_time`,`delete_status`,`display_status`,`column_type`,`name`,`number`,`column_id`) values ('2b245ec4-0b46-4ad2-8b0d-7f9dfeae48a0','2015-09-15 23:02:26','2015-09-15 23:02:26',0,0,2,'校园新闻','TC20150915230219503','a70c9430-ea8f-4bef-8a1c-ad2f5afe8cb0'),('31a8bd83-423b-40a1-878b-ffaac183617c','2015-09-14 23:57:34','2015-09-14 23:57:39',0,0,2,'焦点新闻','TC20150914235717105',NULL),('4b125bb3-fa3c-4031-b95b-2e3047c7a58b','2015-09-15 23:03:32','2015-09-15 23:03:32',0,0,2,'科技新闻','TC20150915230320610','a70c9430-ea8f-4bef-8a1c-ad2f5afe8cb0'),('4ccf091d-af52-45ea-9c6f-b6b0ce3f48d0','2015-09-15 23:16:30','2015-09-15 23:16:30',0,0,1,'测试模块','TC20150915231608773',NULL),('68dce23f-f3c8-4b2a-816d-84c5508c3af3','2015-09-15 23:01:53','2015-09-15 23:01:53',0,0,2,'军事新闻','TC20150915230142225',NULL),('7e605a40-91c5-4e02-89b8-ae1618942e49','2015-09-15 23:02:40','2015-09-15 23:02:40',0,0,2,'娱乐新闻','TC20150915230228915','a70c9430-ea8f-4bef-8a1c-ad2f5afe8cb0'),('8197b276-7be3-4196-92f1-7aeb31c45611','2015-09-15 23:03:18','2015-09-15 23:03:18',0,0,2,'社会新闻','TC20150915230304526',NULL),('9c419bf1-8a75-4237-baa8-78e5a3d00d42','2015-09-15 23:03:02','2015-09-15 23:03:02',0,0,2,'国外新闻','TC20150915230243857','a70c9430-ea8f-4bef-8a1c-ad2f5afe8cb0'),('a1aa298f-ac11-4c50-ae35-e3b2770f1d84','2015-09-15 00:05:27','2015-09-15 00:05:32',0,0,2,'�?级栏�?','TC20150915000433485',NULL),('a2ac84f3-d393-4971-adec-b0510c306c92','2015-09-15 00:05:51','2015-09-15 00:05:51',0,0,2,'二级栏目','TC20150915000541785',NULL),('a70c9430-ea8f-4bef-8a1c-ad2f5afe8cb0','2015-09-15 23:02:17','2015-09-15 23:02:17',0,0,2,'新闻','TC20150915230157682',NULL),('aeb99e39-aae9-4eb6-b751-3883161e6c3a','2015-09-15 00:08:33','2015-09-15 00:08:48',0,0,2,'三级栏目','TC20150915000819175','a1aa298f-ac11-4c50-ae35-e3b2770f1d84');

/*Table structure for table `t_topic_info` */

DROP TABLE IF EXISTS `t_topic_info`;

CREATE TABLE `t_topic_info` (
  'id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `column_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7xqixo5sov1o5em0v5at4ypbq` (`column_id`),
  KEY `FK_fwgc4hlgjthrdt0nenqs1v12e` (`user_id`),
  CONSTRAINT `FK_7xqixo5sov1o5em0v5at4ypbq` FOREIGN KEY (`column_id`) REFERENCES `t_topic_column` (`id`),
  CONSTRAINT `FK_fwgc4hlgjthrdt0nenqs1v12e` FOREIGN KEY (`user_id`) REFERENCES `t_platform_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_topic_info` */

/*Table structure for table `tribune_user_note` */

DROP TABLE IF EXISTS `tribune_user_note`;

CREATE TABLE `tribune_user_note` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `note_content` longtext,
  `note_title` varchar(255) DEFAULT NULL,
  `column_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s6lyywqavg5sabktb5jc47g86` (`column_id`),
  KEY `FK_8ofjq1f8i417xl1yadxlyuggo` (`user_id`),
  CONSTRAINT `FK_8ofjq1f8i417xl1yadxlyuggo` FOREIGN KEY (`user_id`) REFERENCES `t_platform_user` (`id`),
  CONSTRAINT `FK_s6lyywqavg5sabktb5jc47g86` FOREIGN KEY (`column_id`) REFERENCES `t_topic_column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tribune_user_note` */

/*Table structure for table `tribune_user_reply` */

DROP TABLE IF EXISTS `tribune_user_reply`;

CREATE TABLE `tribune_user_reply` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `display_status` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_note_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hdsm0onqxyt502jswjmgt3k95` (`user_id`),
  KEY `FK_9l79836cfv7peth73ayarpbi9` (`user_note_id`),
  CONSTRAINT `FK_9l79836cfv7peth73ayarpbi9` FOREIGN KEY (`user_note_id`) REFERENCES `tribune_user_note` (`id`),
  CONSTRAINT `FK_hdsm0onqxyt502jswjmgt3k95` FOREIGN KEY (`user_id`) REFERENCES `t_platform_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tribune_user_reply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
