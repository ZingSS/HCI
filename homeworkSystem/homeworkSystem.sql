/*
 Navicat Premium Data Transfer

 Source Server         : location
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : 127.0.0.1
 Source Database       : homeworkSystem

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : utf-8

 Date: 06/24/2016 00:48:34 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cid` int(8) NOT NULL,
  `atime` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `announcement`
-- ----------------------------
BEGIN;
INSERT INTO `announcement` VALUES ('26', '课程前准备', 'Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。希望同学们可以在学习Linux程序设计的过程中感受到它的魅力！', '27', '2016-06-23 21:50:46', '王老师'), ('27', '第一次实验DDL和要求变更 ', '第一次实验相比往届少了一页PPT，是一种比较容易实现实验要求所需运行环境的，可能提高了难度，所以相应的，第一次实验DDL延期4月8日，而且NASM和MASM都可以。具体情况发在forum里。当面检查的日期待定。', '27', '2016-06-23 21:51:05', '王老师'), ('28', '助教联系方式 ', '闫庆庆：xueluobushi@163.com \r\n张 鑫：mf1532096@smail.nju.edu.cn \r\n吴彦文：mf1532072@smail.nju.edu.cn \r\n\r\n请迟交作业的同学直接发给助教。按照本课程规定，迟交一天扣除0.5分，依次类推，迟交一周及以上者此次作业没有成绩。', '28', '2016-06-23 22:04:29', '王老师'), ('29', '2016课后应用题作业1 & 作业2含答案   ', '人机交互2016课后应用题作业1 & 作业2含答案 已经上传本课程TSS页面。 \r\n供大家复习参考。 \r\n祝大家期末考试顺利！', '28', '2016-06-23 22:10:04', '王老师'), ('30', '问题分配最终版已定，请大家查看 ', '一切以最终版为定，有分组错误问题请继续向我反馈 \r\n\r\n41组和46组同学，你们没有修改自己的问题，影响其他组的作业情况，故将你们安排互做对方组的问题，40组改做第52组的问题，34组改做第53组的问题，请这几组核对。', '20', '2016-06-23 22:12:44', '王老师');
COMMIT;

-- ----------------------------
--  Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(2) NOT NULL,
  `time` varchar(40) NOT NULL,
  `location` varchar(50) NOT NULL,
  `semester_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rycs8w7ludava0ahssdyy2i8k` (`semester_id`),
  CONSTRAINT `FK_rycs8w7ludava0ahssdyy2i8k` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `course`
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES ('1', '201401002', '生命科学', '通修', '1', '周二 第3-4节', '仙一 111', '1'), ('2', '201401003', '电子商务', '选修', '2', '周三 第5-6节', '仙二 100', '1'), ('3', '123', '111', 'tong', '1', '周一  第2-3节', '1', '1'), ('4', '201402001', '数据库设计', '通修', '1', '周一  第1-1节', '仙2 111', '2'), ('5', '123', ' 离散数学', '通修', '3', '周一  第2-3节', '仙一 111', '2'), ('6', '201402002', '历史', '通修', '1', '周三  第1-3节', '仙一 222', '2'), ('7', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('8', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('9', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('10', '1010101', 'Linux基础', '选修', '2', '周一  第2-4节', '教1 111', '3'), ('18', '201502001', '软件工程', '通修', '3', '周一  第3-4节', '仙一 110', '4'), ('19', '201502002', '软件工程2', '通修', '3', '周一  第5-6节', '教 110', '4'), ('20', '201502003', '需求工程', '平台', '2', '周一  第1-4节', '教110', '4'), ('21', '201502004', '程序设计', '通修', '2', '周三  第3-4节', '仙一 222', '4'), ('22', '201502005', '操作系统', '通修', '1', '周一  第2-4节', '逸 110', '4'), ('23', '201402001', '钢琴赏析', '平台', '2', '周四  第9-10节', '馆 202', '2'), ('24', '123423', '测试课程', '通修', '3', '周一 第3-4节', '仙一 222', '2'), ('25', '201502003', 'Web程序设计', '选修', '3', '周二 第3-4节', '教 111', '4'), ('26', '2016010001', 'Java基础', '通修', '2', '周二 第5-6节', '仙一 111', '5'), ('27', '201601002', '服务计算与SOA开发', '通修', '3', '周一  第3-4节', '教 222', '5'), ('28', '201601004', '人机交互', '通修', '3', '周一 第5-6节', '教 111', '5');
COMMIT;

-- ----------------------------
--  Table structure for `course_assistant`
-- ----------------------------
DROP TABLE IF EXISTS `course_assistant`;
CREATE TABLE `course_assistant` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  UNIQUE KEY `UK_am3q4pm5ij1taq74v3kqpsrlh` (`USER_ID`),
  CONSTRAINT `FK_am3q4pm5ij1taq74v3kqpsrlh` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r3dhcqxfxgqpcgdc7q2euf6de` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `course_assistant`
-- ----------------------------
BEGIN;
INSERT INTO `course_assistant` VALUES ('20', '3'), ('4', '11'), ('2', '12'), ('23', '13'), ('2', '14'), ('1', '15'), ('28', '19'), ('27', '20');
COMMIT;

-- ----------------------------
--  Table structure for `course_homework`
-- ----------------------------
DROP TABLE IF EXISTS `course_homework`;
CREATE TABLE `course_homework` (
  `course_id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`homework_id`),
  UNIQUE KEY `UK_7gfdg7fflrjsxobtehlw87s0y` (`homework_id`),
  CONSTRAINT `FK_6n40c56h9qox4yn3s0nx7bnk3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_7gfdg7fflrjsxobtehlw87s0y` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `course_homework`
-- ----------------------------
BEGIN;
INSERT INTO `course_homework` VALUES ('1', '50'), ('2', '51'), ('2', '52'), ('1', '53'), ('1', '54'), ('1', '55'), ('1', '56'), ('1', '57'), ('4', '58'), ('1', '59'), ('20', '60'), ('20', '61'), ('20', '62'), ('20', '63'), ('20', '64'), ('20', '65'), ('27', '66'), ('28', '67'), ('18', '68'), ('27', '69');
COMMIT;

-- ----------------------------
--  Table structure for `course_message`
-- ----------------------------
DROP TABLE IF EXISTS `course_message`;
CREATE TABLE `course_message` (
  `course_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`message_id`),
  UNIQUE KEY `UK_nwljgnxxexuo2x4jll1d9bm47` (`message_id`),
  CONSTRAINT `FK_kaco2mkvjess35i0ed9ddypo6` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_nwljgnxxexuo2x4jll1d9bm47` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `course_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  KEY `FK_ewt621bl7gi63l076roebr16b` (`USER_ID`),
  CONSTRAINT `FK_9arn52yp2skru03vfr6okpsak` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_ewt621bl7gi63l076roebr16b` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `course_teacher`
-- ----------------------------
BEGIN;
INSERT INTO `course_teacher` VALUES ('1', '2'), ('2', '2'), ('4', '2'), ('6', '2'), ('18', '2'), ('19', '2'), ('20', '2'), ('23', '2'), ('27', '2'), ('28', '2'), ('3', '4'), ('6', '4'), ('7', '4'), ('10', '4'), ('21', '4'), ('22', '4'), ('24', '4'), ('26', '4'), ('5', '10'), ('10', '10'), ('18', '17'), ('25', '18');
COMMIT;

-- ----------------------------
--  Table structure for `course_user`
-- ----------------------------
DROP TABLE IF EXISTS `course_user`;
CREATE TABLE `course_user` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  KEY `FK_mnt58v6lrw9p8sa2ket0l17pp` (`USER_ID`),
  CONSTRAINT `FK_hntrplhu1sj5758af7ifdy4j5` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_mnt58v6lrw9p8sa2ket0l17pp` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `course_user`
-- ----------------------------
BEGIN;
INSERT INTO `course_user` VALUES ('2', '3'), ('4', '3'), ('23', '3'), ('27', '3'), ('28', '3'), ('1', '11'), ('2', '11'), ('20', '11'), ('28', '11'), ('1', '12'), ('4', '12'), ('20', '12'), ('27', '12'), ('1', '13'), ('6', '13'), ('20', '13'), ('27', '13'), ('28', '13'), ('4', '14'), ('6', '14'), ('20', '14'), ('27', '14'), ('28', '14'), ('4', '15'), ('27', '15'), ('28', '15'), ('27', '19'), ('28', '20'), ('27', '22'), ('28', '22'), ('20', '28'), ('20', '29'), ('20', '30'), ('20', '31'), ('20', '32'), ('20', '33'), ('20', '34'), ('20', '35'), ('20', '36'), ('20', '37'), ('20', '38'), ('20', '39'), ('20', '40'), ('20', '41'), ('20', '42'), ('20', '43'), ('20', '44'), ('20', '45'), ('20', '46'), ('20', '47'), ('20', '48'), ('20', '49'), ('20', '50'), ('20', '51'), ('20', '52'), ('20', '53'), ('20', '54'), ('20', '55'), ('20', '56'), ('20', '57'), ('20', '58'), ('20', '59'), ('20', '60'), ('20', '61'), ('20', '62'), ('20', '63'), ('20', '64'), ('20', '65'), ('20', '66'), ('20', '67'), ('20', '68'), ('20', '69'), ('20', '70'), ('20', '71'), ('20', '72'), ('20', '73'), ('20', '74'), ('20', '75'), ('20', '76'), ('20', '77'), ('20', '78'), ('20', '79'), ('20', '80'), ('20', '81'), ('20', '82'), ('20', '83'), ('20', '84'), ('20', '85'), ('20', '86'), ('20', '87'), ('20', '88'), ('20', '89'), ('20', '90'), ('20', '91'), ('20', '92'), ('20', '93'), ('20', '94'), ('20', '95'), ('20', '96'), ('20', '97'), ('20', '98'), ('20', '99'), ('20', '100'), ('20', '101'), ('20', '102'), ('20', '103'), ('20', '104'), ('20', '105'), ('20', '106'), ('20', '107'), ('20', '108'), ('20', '109'), ('20', '110'), ('20', '111'), ('20', '112'), ('20', '113'), ('20', '114'), ('20', '115'), ('20', '116'), ('20', '117'), ('20', '118'), ('20', '119'), ('20', '120'), ('20', '121'), ('20', '122'), ('20', '123'), ('20', '124'), ('20', '125'), ('20', '126'), ('20', '127'), ('20', '128'), ('20', '129'), ('20', '130'), ('20', '131'), ('20', '132'), ('20', '133'), ('20', '134'), ('20', '135'), ('20', '136'), ('20', '137'), ('20', '138'), ('20', '139'), ('20', '140'), ('20', '141'), ('20', '142');
COMMIT;

-- ----------------------------
--  Table structure for `coursefile`
-- ----------------------------
DROP TABLE IF EXISTS `coursefile`;
CREATE TABLE `coursefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `course_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d7ou2rkt8ruag64pjdd46bsse` (`course_fk`),
  CONSTRAINT `FK_d7ou2rkt8ruag64pjdd46bsse` FOREIGN KEY (`course_fk`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `coursefile`
-- ----------------------------
BEGIN;
INSERT INTO `coursefile` VALUES ('15', 'course1.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1', '1'), ('16', 'course2.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course2', '2'), ('17', 'course3.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course3', '3');
COMMIT;

-- ----------------------------
--  Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `path` varchar(300) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_enx0f93xat5cayfsauo9u4mbh` (`homework_id`),
  KEY `FK_531rkvqn45lw9t2djf0c2mw9h` (`user_id`),
  CONSTRAINT `FK_531rkvqn45lw9t2djf0c2mw9h` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_enx0f93xat5cayfsauo9u4mbh` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `file`
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES ('1', '1414_小红.zip', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1/Homework50', '50', '13'), ('2', '131250159_曾曾.zip', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course2/Homework51', '51', '3'), ('3', '作业附件.html', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1/Homework57', '57', '2'), ('4', '作业附件.html', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1/Homework59', '59', '2'), ('5', '131313_阿阿.html', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course2/Homework52', '52', '11'), ('7', '131313_阿阿.html', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1/Homework59', '59', '11'), ('8', '131313_阿阿.html', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1/Homework57', '57', '11'), ('9', '作业附件.zip', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework60', '60', '2'), ('10', '作业样例&点评.zip', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course2/Homework51', '51', '2'), ('11', '作业附件.jpg', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework61', '61', '2'), ('12', '131313_阿阿.jpg', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework61', '61', '11'), ('13', '作业样例&点评.jpg', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework61', '61', '2'), ('14', '作业附件.docx', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework62', '62', '2'), ('15', '1414_邱同学.docx', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework62', '62', '13'), ('16', '131313_刘同学.zip', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework62', '62', '11'), ('17', '作业附件.pdf', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework63', '63', '2'), ('18', '1414_邱同学.jpg', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework63', '63', '13'), ('19', '作业样例&点评.ppt', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course20/Homework60', '60', '2');
COMMIT;

-- ----------------------------
--  Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_92vx2mlgl19uj7pllhuhrxw7p` (`homework_id`),
  KEY `FK_7l887snygdlg97qcgwifi2sel` (`user_id`),
  CONSTRAINT `FK_7l887snygdlg97qcgwifi2sel` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_92vx2mlgl19uj7pllhuhrxw7p` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `grade`
-- ----------------------------
BEGIN;
INSERT INTO `grade` VALUES ('5', '90.0', '51', '11', null), ('6', '92.0', '51', '3', null), ('9', '0.0', '50', '11', '居然没有提交'), ('10', '0.0', '50', '12', '也没有提交'), ('11', '91.0', '50', '13', '还可以'), ('12', '100.0', '58', '15', '很好'), ('13', '90.0', '58', '12', '还可以'), ('14', '80.0', '58', '14', '啧'), ('15', '90.0', '58', '3', '可以可以'), ('16', '100.0', '61', '11', '很好'), ('17', '0.0', '61', '14', '没有提交'), ('18', '0.0', '61', '12', '没有提交'), ('19', '0.0', '61', '13', '没有提交'), ('20', '90.0', '60', '11', '勉强'), ('21', '90.0', '60', '12', '太不认真'), ('22', '80.0', '60', '14', '恩'), ('23', '100.0', '60', '13', '啧'), ('24', '100.0', '63', '13', '很好'), ('25', '100', '64', '13', ''), ('26', '39', '64', '12', ''), ('27', '40', '64', '14', ''), ('28', '50', '64', '11', ''), ('29', '0', '63', '11', ''), ('30', '12', '52', '11', ''), ('31', '31', '52', '3', '');
COMMIT;

-- ----------------------------
--  Table structure for `homework`
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `fileId` int(11) DEFAULT NULL,
  `fileType` varchar(10) NOT NULL,
  `studentDDL` datetime NOT NULL,
  `assistantDDL` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `createdTime` datetime NOT NULL,
  `publishedTime` datetime DEFAULT NULL,
  `state` varchar(100) NOT NULL DEFAULT '',
  `publishFileId` int(11) DEFAULT NULL,
  `failedTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_6h3se442emeoqsq5w9p9w8mw4` (`course_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `homework`
-- ----------------------------
BEGIN;
INSERT INTO `homework` VALUES ('50', '生命科学的作业', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-03 15:07:25', '2016-03-11 21:28:09', 'pass', '0', '1'), ('51', '这是一个作业', '', '0', '', '2016-03-05 23:59:59', '2016-05-04 23:59:59', '2', '2016-03-04 15:07:36', '2016-03-14 21:28:00', 'pass', '10', '0'), ('52', '数据库设计', '这是一个作业描述', '0', 'PDF', '2016-04-05 23:59:59', '2016-06-28 23:59:59', '2', '2016-03-06 15:30:22', null, 'commit', '0', '0'), ('53', '生命科学的第二个作业', '', '0', 'PDF', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 15:33:41', null, 'commit', '0', '0'), ('54', '这是一个作业', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:36:24', null, 'commit', '0', '0'), ('55', '课程作业', '', '0', 'PDF', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:38:29', null, 'commit', '0', '0'), ('56', '我要给这个课程添加附件', '123', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:45:24', null, 'commit', '0', '0'), ('57', '认真地添加附件', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:47:53', null, 'commit', '0', '0'), ('58', '作业1', '爆炸爆炸', '0', '', '2016-03-08 23:59:59', '2016-06-06 23:59:59', '4', '2016-03-06 23:26:32', '2016-03-20 13:48:23', 'pass', '0', '0'), ('59', '一个有附件的作业', '', '4', '', '2016-05-05 23:59:59', '2016-05-06 23:59:59', '1', '2016-03-06 23:30:48', null, 'commit', '0', '0'), ('60', '提交需求分析模型', '1、完整的需求分析模型：将第二阶段提交的模型补充完整；  \n2、软件需求规格说明文档。 \n3、业务需求、用户需求与系统级需求的跟踪矩阵。', '9', 'PDF', '2016-03-15 23:59:59', '2016-03-23 23:59:59', '20', '2016-03-10 18:06:18', '2016-03-21 10:46:03', 'pass', '19', '1'), ('61', 'schema设计', '采用XSLT将该XML文档转换为符合ScoreList.xsd格式要求的成绩册文档XML文档3，并依据成绩对每门课程进行排序\n采用SAX处理XML文档3 ，仅保留出现任意不及格成绩的课程成绩记录，保存为XML文档4\n提交相关脚本、程序和readme.txt\n注意：如相关schema与ScoreList.xsd不兼容，则需要对相关schema作出修改', '11', 'PDF', '2016-03-13 23:59:59', '2016-05-05 23:59:59', '20', '2016-03-13 21:26:29', '2016-03-15 21:27:37', 'approval', '13', '1'), ('62', '设计原型', '采用DOM生成符合StudentList.xsd要求的XML文档2\n除写入Assignment2 中的XML文档1 的同学信息外，还需要加入本小组及相邻前后两组中其他同学的相关信息，并为每位同学随机生成五门课程的成绩（包含平时成绩、期末成绩和总评成绩），要求至少有部分同学，任意成绩低于60分', '14', 'PDF', '2016-06-29 23:59:59', '2016-07-06 23:59:59', '20', '2016-07-07 00:13:19', null, 'commit', '0', '0'), ('63', '目标模型描述文档', '说明目标模型描述文档；  \n\n1.2（可选）业务过程模型描述：仅针对存在复杂业务过程的项目； \n\n1.3（可选）领域分析（即特征模型）：仅针对面向用户群较大的创新性产品。  \n\n1.4 涉众分析过程：重点包括涉众识别过程、优先级划分、各自的描述和共赢分析。  \n\n2、前景与范围文档。 ', '17', '', '2016-05-24 23:59:59', '2016-06-20 23:59:59', '20', '2016-03-21 10:42:26', null, 'approval', '0', '0'), ('64', '需求获取过程', '1、下列文档说明你们的获取过程，没有严格格式规范要求，以说清楚获取过程为第一目的  \n1.1 获取过程的计划与安排  \n1.2 各次获取活动的材料（面谈：准备的问题与面谈报告；原型：原型制品、使用的线索、结果；头脑风暴：第一阶段结果与第二阶段结果；集体面谈：准备材料与过程简要描述）；观察：准备的材料与观察结果；其他：自主决定） \n1.3 获取过程中使用的分析模型（仅提供初步模型即可） \n2、用户需求文档（用例文档）  \n3、用户需求列表  \n4、提供 业务需求 与 用户需求 的跟踪矩阵 ', '0', '', '2016-06-21 23:59:59', '2016-07-07 23:59:59', '20', '2016-06-15 19:30:48', null, 'commit', '0', '0'), ('65', '需求的获取与分析', '使用Servlet, 遵循SOAP Response message exchange pattern 按照学号查询学生成绩\n\n要求：\n\n使用HTTP绑定，以带参数的GET方法传递学号，并返回以SOAP封装的学生成绩信息\n如发生错误，则返回恰当的SOAP报错消息\n以小组为单位提交工程、代码，提交使用浏览器获取不同学生成绩查询信息及出错信息的相关截图', '0', 'PDF', '2016-06-24 23:59:59', '2016-06-28 23:59:59', '20', '2016-06-21 21:54:00', null, 'commit', '0', '0'), ('66', 'Schem设计', '设计关于学生信息的相关schema，要求\r\n按要求分离公共数据\r\n数据结构合理且满足实际应用需求\r\n使用任意工具（WTP XML Schema Editor）\r\n以小组中学号最小的同学作为例，编写一个符合Student.xsd数据类型的XML文档1\r\n设计StudentList.xsd', '0', 'zip', '2016-06-24 23:59:59', '2016-06-29 23:59:59', '27', '2016-06-23 22:03:24', null, 'commit', '0', '0'), ('67', '海报制作', '	请为人机交互全国研究生暑期学校制作海报、展架和胸牌，暑期学校相关信息可见：http://software.nju.edu.cn/fgh/summer2015/，各展示信息的用途及具体要求为： \r\n1）海报：张贴在海报栏等户外场所，用作活动的对外宣传；长宽比为：1.4：1； \r\n2）展架：置于活动举办场所内或所在建筑物内用作活动宣传及布景；长宽比为：2.25：1； \r\n3）胸牌：活动期间参与人员挂置在胸前，便于参会者相互交流；长宽比为：1.4：1 \r\n\r\n注意：作业完成过程中一方面要注意信息的视觉展示，同时也需要根据具体场景对网页信息进行裁剪，有选择性地放置于各处。', '0', 'png', '2016-06-25 23:59:59', '2016-06-27 23:59:59', '28', '2016-06-23 22:05:44', null, 'commit', '0', '0'), ('68', '软工迭代一提交', '请各小组按组提交，提交内容包括代码、图片、说明文件、readme等。\r\n希望大家准时提交！', '0', 'zip', '2016-06-23 23:59:59', '2016-06-26 23:59:59', '18', '2016-06-23 22:11:45', null, 'commit', '0', '0'), ('69', 'github提交', '请1、2、4、5、6、9、10、15、18、21、27、32、33、38、39、41、42、45、48、51、52、53、54、56、57小组提交工具配置截图，截图包括： \r\n1. 小组github主页 \r\n2. 本地运行mvn install的结果 \r\n3. Jenkins构建通过的Console Output \r\n4. 使用mvn checkstyle:checkstyle 生成的checkstyle-result.xml文件 \r\n\r\n另外，请各小组在Forum下回复各自的大作业github地址。', '0', '任意', '2016-06-25 23:59:59', '2016-06-28 23:59:59', '27', '2016-06-23 22:18:58', null, 'commit', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `homework_file`
-- ----------------------------
DROP TABLE IF EXISTS `homework_file`;
CREATE TABLE `homework_file` (
  `homework_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`homework_id`,`file_id`),
  UNIQUE KEY `UK_7yecndaakqq7hy0iko5wf3w5b` (`file_id`),
  CONSTRAINT `FK_7yecndaakqq7hy0iko5wf3w5b` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FK_b7ojxwu4a397b6qpnjo124iml` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `homework_file`
-- ----------------------------
BEGIN;
INSERT INTO `homework_file` VALUES ('50', '1'), ('51', '2'), ('57', '3'), ('52', '5'), ('59', '7'), ('57', '8'), ('61', '12'), ('62', '15'), ('62', '16'), ('63', '18');
COMMIT;

-- ----------------------------
--  Table structure for `homework_grade`
-- ----------------------------
DROP TABLE IF EXISTS `homework_grade`;
CREATE TABLE `homework_grade` (
  `homework_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  PRIMARY KEY (`homework_id`,`grade_id`),
  UNIQUE KEY `UK_mvpr7th64vse7sv8jw71mvv84` (`grade_id`),
  CONSTRAINT `FK_d7o6vc77rfw1yhc5voo73aj9f` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`),
  CONSTRAINT `FK_mvpr7th64vse7sv8jw71mvv84` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `homework_grade`
-- ----------------------------
BEGIN;
INSERT INTO `homework_grade` VALUES ('51', '5'), ('51', '6'), ('50', '9'), ('50', '10'), ('50', '11'), ('58', '12'), ('58', '13'), ('58', '14'), ('58', '15'), ('61', '16'), ('61', '17'), ('61', '18'), ('61', '19'), ('60', '20'), ('60', '21'), ('60', '22'), ('60', '23'), ('63', '24'), ('64', '25'), ('64', '26'), ('64', '27'), ('64', '28'), ('63', '29'), ('52', '30'), ('52', '31');
COMMIT;

-- ----------------------------
--  Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(300) NOT NULL,
  `type` varchar(100) NOT NULL,
  `createdTime` datetime NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ljelkubmwbi0msw6o3x2woifd` (`course_id`),
  CONSTRAINT `FK_ljelkubmwbi0msw6o3x2woifd` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `message`
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES ('1', '生命科学布置了新作业', '作业标题：生命科学的第二个作业', 'publishHomework', '2016-03-06 15:33:41', '1'), ('2', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-06 17:29:35', '2'), ('3', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-06 17:32:27', '2'), ('4', '生命科学布置了新作业', '作业标题：这是一个作业', 'publishHomework', '2016-03-06 22:36:25', '1'), ('5', '生命科学布置了新作业', '作业标题：课程作业', 'publishHomework', '2016-03-06 22:38:29', '1'), ('6', '生命科学布置了新作业', '作业标题：我要给这个课程添加附件', 'publishHomework', '2016-03-06 22:45:25', '1'), ('7', '生命科学布置了新作业', '作业标题：认真地添加附件', 'publishHomework', '2016-03-06 22:47:54', '1'), ('8', '222布置了新作业', '作业标题：为什么无法显示', 'publishHomework', '2016-03-06 23:26:33', '4'), ('9', '生命科学布置了新作业', '作业标题：一个有附件的作业', 'publishHomework', '2016-03-06 23:30:48', '1'), ('10', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:02:31', '2'), ('11', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:05:33', '2'), ('12', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:08:26', '2'), ('13', '电子商务公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-07 19:30:57', '2'), ('14', '生命科学的作业已经批改完', '本课程的生命科学的作业已经批改完', 'correctionOver', '2016-03-07 21:27:57', '1'), ('15', '生命科学作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-07 21:30:56', '1'), ('16', '需求工程布置了新作业', '作业标题：写一份需求', 'publishHomework', '2016-03-10 18:06:18', '20'), ('17', '需求工程布置了新作业', '作业标题：需求文档', 'publishHomework', '2016-03-13 21:26:29', '20'), ('18', '数据库设计的作业已经批改完', '本课程的为什么无法显示已经批改完', 'correctionOver', '2016-03-14 11:09:25', '4'), ('19', '需求工程的作业已经批改完', '本课程的需求文档已经批改完', 'correctionOver', '2016-03-14 14:22:08', '20'), ('20', '需求工程作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-14 14:38:39', '20'), ('21', '需求工程的作业已经批改完', '本课程的需求文档已经批改完', 'correctionOver', '2016-03-14 14:43:15', '20'), ('22', '需求工程公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-14 14:45:25', '20'), ('23', '需求工程布置了新作业', '作业标题：设计原型', 'publishHomework', '2016-03-19 00:13:20', '20'), ('24', '需求工程布置了新作业', '作业标题：设计原型。请注意按时批改', 'toCorrectHomework', '2016-03-19 00:13:20', '20'), ('25', '数据库设计公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-20 13:48:24', '4'), ('26', '需求工程布置了新作业', '作业标题：新的作业', 'publishHomework', '2016-03-21 10:42:26', '20'), ('27', '需求工程布置了新作业', '作业标题：新的作业。请注意按时批改', 'toCorrectHomework', '2016-03-21 10:42:27', '20'), ('28', '需求工程的作业已经批改完', '本课程的写一份需求已经批改完', 'correctionOver', '2016-03-21 10:45:07', '20'), ('29', '需求工程作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-21 10:45:27', '20'), ('30', '需求工程的作业已经批改完', '本课程的写一份需求已经批改完', 'correctionOver', '2016-03-21 10:45:42', '20'), ('31', '需求工程公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-21 10:46:03', '20'), ('32', '需求工程布置了新作业', '作业标题：一个作业', 'publishHomework', '2016-05-07 13:34:20', '20'), ('33', '需求工程布置了新作业', '作业标题：一个作业。请注意按时批改', 'toCorrectHomework', '2016-05-07 13:34:20', '20'), ('35', '需求工程布置了新作业', '作业标题：写一份需求', 'publishHomework', '2016-06-21 21:54:00', '20'), ('36', '需求工程布置了新作业', '作业标题：写一份需求。请注意按时批改', 'toCorrectHomework', '2016-06-21 21:54:00', '20'), ('41', 'Linux程序设计有了新公告', '公告标题：课程前准备', 'newAnnouncement', '2016-06-23 21:50:46', '27'), ('42', 'Linux程序设计有了新公告', '公告标题：第一次实验DDL和要求变更 ', 'newAnnouncement', '2016-06-23 21:51:05', '27'), ('43', '计算机与操作系统布置了新作业', '作业标题：Schem设计', 'publishHomework', '2016-06-23 22:03:25', '27'), ('44', '计算机与操作系统布置了新作业', '作业标题：Schem设计。请注意按时批改', 'toCorrectHomework', '2016-06-23 22:03:25', '27'), ('45', '人机交互有了新公告', '公告标题：助教联系方式 ', 'newAnnouncement', '2016-06-23 22:04:29', '28'), ('46', '人机交互布置了新作业', '作业标题：海报制作', 'publishHomework', '2016-06-23 22:05:44', '28'), ('47', '人机交互布置了新作业', '作业标题：海报制作。请注意按时批改', 'toCorrectHomework', '2016-06-23 22:05:44', '28'), ('48', '人机交互有了新公告', '公告标题：2016课后应用题作业1 & 作业2含答案   ', 'newAnnouncement', '2016-06-23 22:10:05', '28'), ('49', '软件工程布置了新作业', '作业标题：软工迭代一提交', 'publishHomework', '2016-06-23 22:11:45', '18'), ('50', '软件工程布置了新作业', '作业标题：软工迭代一提交。请注意按时批改', 'toCorrectHomework', '2016-06-23 22:11:45', '18'), ('51', '需求工程有了新公告', '公告标题：问题分配最终版已定，请大家查看 ', 'newAnnouncement', '2016-06-23 22:12:44', '20'), ('52', '服务计算与SOA开发布置了新作业', '作业标题：github提交', 'publishHomework', '2016-06-23 22:18:58', '27'), ('53', '服务计算与SOA开发布置了新作业', '作业标题：github提交。请注意按时批改', 'toCorrectHomework', '2016-06-23 22:18:58', '27');
COMMIT;

-- ----------------------------
--  Table structure for `messageuser`
-- ----------------------------
DROP TABLE IF EXISTS `messageuser`;
CREATE TABLE `messageuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `messageuser`
-- ----------------------------
BEGIN;
INSERT INTO `messageuser` VALUES ('5', '1', '11', '2016-03-06 16:58:24'), ('6', '1', '13', '2016-03-10 18:21:04'), ('7', '1', '12', '2016-03-06 17:03:28'), ('8', '1', '15', '2016-03-07 20:35:30'), ('9', '2', '2', '2016-03-06 23:56:09'), ('10', '3', '2', '2016-03-06 23:56:09'), ('11', '4', '12', null), ('12', '4', '11', '2016-03-14 14:54:44'), ('13', '4', '13', '2016-03-10 18:21:04'), ('14', '4', '15', '2016-03-07 20:35:30'), ('15', '5', '13', '2016-03-10 18:21:04'), ('16', '5', '11', '2016-03-14 14:54:44'), ('17', '5', '12', null), ('18', '5', '15', '2016-03-07 20:35:30'), ('19', '6', '11', '2016-03-14 14:54:44'), ('20', '6', '13', '2016-03-10 18:21:04'), ('21', '6', '12', null), ('22', '6', '15', '2016-03-07 20:35:30'), ('23', '7', '11', '2016-03-14 14:54:44'), ('24', '7', '13', '2016-03-10 18:21:04'), ('25', '7', '12', null), ('26', '7', '15', '2016-03-07 20:35:30'), ('27', '8', '3', '2016-03-14 19:41:02'), ('28', '9', '11', '2016-03-14 14:54:44'), ('29', '9', '12', null), ('30', '9', '13', '2016-03-10 18:21:05'), ('31', '9', '15', '2016-03-07 20:35:30'), ('32', '10', '2', '2016-03-07 21:30:16'), ('33', '11', '2', '2016-03-07 21:30:16'), ('34', '12', '2', '2016-03-07 21:30:16'), ('35', '13', '11', '2016-03-14 14:54:44'), ('36', '13', '3', '2016-03-14 19:41:02'), ('37', '14', '2', '2016-03-14 15:28:02'), ('38', '15', '15', '2016-03-07 21:31:27'), ('39', '16', '11', '2016-03-14 14:54:44'), ('40', '16', '13', '2016-03-10 18:21:05'), ('41', '16', '14', null), ('42', '16', '12', null), ('43', '16', '3', '2016-03-14 19:41:02'), ('44', '17', '13', '2016-03-21 10:42:52'), ('45', '17', '11', '2016-03-14 14:54:44'), ('46', '17', '14', null), ('47', '17', '12', null), ('48', '17', '3', '2016-03-14 19:41:02'), ('49', '18', '2', '2016-03-14 13:48:21'), ('50', '19', '2', '2016-03-14 15:06:43'), ('51', '20', '3', '2016-03-14 19:41:02'), ('52', '21', '2', '2016-03-14 15:06:43'), ('53', '22', '12', null), ('54', '22', '11', '2016-03-14 14:54:44'), ('55', '22', '14', null), ('56', '22', '13', '2016-03-21 10:42:52'), ('57', '23', '11', '2016-03-20 13:49:13'), ('58', '23', '13', '2016-03-21 10:42:52'), ('59', '23', '15', null), ('60', '23', '12', null), ('61', '23', '14', null), ('62', '24', '3', '2016-03-19 00:13:41'), ('63', '25', '3', '2016-03-21 10:43:33'), ('64', '25', '14', null), ('65', '25', '15', null), ('66', '25', '12', null), ('67', '26', '12', null), ('68', '26', '14', null), ('69', '26', '13', '2016-03-21 10:42:52'), ('70', '26', '11', '2016-05-07 13:35:37'), ('71', '27', '3', '2016-03-21 10:43:33'), ('72', '28', '2', '2016-03-21 10:45:16'), ('73', '29', '3', '2016-03-21 10:45:39'), ('74', '30', '2', '2016-03-21 10:45:57'), ('75', '31', '12', null), ('76', '31', '13', '2016-03-21 10:46:43'), ('77', '31', '11', '2016-05-07 13:35:37'), ('78', '31', '14', null), ('79', '32', '14', null), ('80', '32', '13', '2016-05-07 13:34:46'), ('81', '32', '11', '2016-05-07 13:35:37'), ('82', '32', '12', null), ('83', '33', '3', '2016-06-16 20:49:58'), ('91', '35', '12', null), ('92', '35', '13', null), ('93', '35', '11', null), ('94', '35', '14', null), ('125', '41', '3', null), ('126', '41', '14', null), ('127', '41', '19', null), ('128', '41', '22', null), ('129', '41', '15', null), ('130', '41', '12', null), ('131', '41', '13', null), ('132', '41', '20', null), ('133', '42', '12', null), ('134', '42', '13', null), ('135', '42', '3', null), ('136', '42', '19', null), ('137', '42', '15', null), ('138', '42', '22', null), ('139', '42', '14', null), ('140', '42', '20', null), ('141', '43', '12', null), ('142', '43', '19', null), ('143', '43', '22', null), ('144', '43', '13', null), ('145', '43', '3', null), ('146', '43', '14', null), ('147', '43', '15', null), ('148', '44', '20', null), ('149', '45', '14', null), ('150', '45', '15', null), ('151', '45', '3', null), ('152', '45', '20', null), ('153', '45', '11', null), ('154', '45', '13', null), ('155', '45', '22', null), ('156', '45', '19', null), ('157', '46', '22', null), ('158', '46', '13', null), ('159', '46', '3', null), ('160', '46', '14', null), ('161', '46', '11', null), ('162', '46', '20', null), ('163', '46', '15', null), ('164', '47', '19', null), ('165', '48', '15', null), ('166', '48', '13', null), ('167', '48', '22', null), ('168', '48', '20', null), ('169', '48', '14', null), ('170', '48', '11', null), ('171', '48', '3', null), ('172', '48', '19', null), ('173', '51', '13', null), ('174', '51', '12', null), ('175', '51', '14', null), ('176', '51', '11', null), ('177', '51', '3', null), ('178', '52', '12', null), ('179', '52', '19', null), ('180', '52', '15', null), ('181', '52', '14', null), ('182', '52', '13', null), ('183', '52', '22', null), ('184', '52', '3', null), ('185', '53', '20', null);
COMMIT;

-- ----------------------------
--  Table structure for `semester`
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `semester`
-- ----------------------------
BEGIN;
INSERT INTO `semester` VALUES ('1', '2014-2015学年第一学期', '2014-09-01', '2016-03-20'), ('2', '2014-2015学年第二学期', '2015-03-01', '2015-07-15'), ('3', '2015-2016学年第一学期', '2015-09-01', '2016-01-16'), ('4', '2015-2016学年第二学期', '2016-03-01', '2016-07-12'), ('5', '2016-2017学年第一学期', '2016-05-01', '2017-01-14');
COMMIT;

-- ----------------------------
--  Table structure for `semester_course`
-- ----------------------------
DROP TABLE IF EXISTS `semester_course`;
CREATE TABLE `semester_course` (
  `semester_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`semester_id`,`course_id`),
  UNIQUE KEY `UK_67pwbpie6veyg510crth6lsq1` (`course_id`),
  CONSTRAINT `FK_67pwbpie6veyg510crth6lsq1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_slxefabaf0knvpy14f3tf1y52` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `semester_course`
-- ----------------------------
BEGIN;
INSERT INTO `semester_course` VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('2', '4'), ('2', '5'), ('2', '6'), ('3', '7'), ('3', '8'), ('3', '9'), ('3', '10'), ('4', '18'), ('4', '19'), ('4', '20'), ('4', '21'), ('4', '22'), ('2', '23'), ('2', '24'), ('4', '25'), ('5', '26'), ('5', '27'), ('5', '28');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  `createdTime` datetime DEFAULT NULL,
  `assistantCourse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f2m0j82fsim2oju5jn139dw3k` (`assistantCourse_id`),
  CONSTRAINT `FK_f2m0j82fsim2oju5jn139dw3k` FOREIGN KEY (`assistantCourse_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '159', '159', '管理员', 'admin', null, null), ('2', 'JS0002', '123', '王皓', 'teacher', '2016-02-25 19:30:21', null), ('3', '131250159', '123', '曾生生', 'student', '2016-02-25 19:49:16', '20'), ('4', 'JS0002', '111', '蔡燃', 'teacher', '2016-02-25 20:08:27', null), ('10', 'JS0003', '120', '张娴升', 'teacher', '2016-02-25 23:19:51', null), ('11', '131250001', '131250001', '刘小同', 'student', '2016-02-28 11:34:42', '4'), ('12', '131250002', '131250002', '锐伟诚', 'student', '2016-02-28 11:35:00', '2'), ('13', '131250003', '131250003', '李和风', 'student', '2016-02-29 11:45:15', null), ('14', '131250004', '131250004', '姚文轩', 'student', '2016-03-01 15:29:56', '2'), ('15', '131250005', '131250005', '鄂元冬', 'student', '2016-03-01 15:54:06', '1'), ('16', 'JX0001', '123', '教学负责人', 'director', '2016-03-03 21:58:59', null), ('17', 'JS0001', '123', '李跃康', 'teacher', '2016-03-10 15:27:33', null), ('18', '02859', '123', '肖劲良', 'teacher', '2016-03-18 23:13:49', null), ('19', '131250006', '131250006', '陈高远', 'student', '2016-03-18 23:24:08', '28'), ('20', '131250007', '131250007', '邬白亦', 'student', '2016-03-21 10:38:16', '27'), ('21', '1111111', '123', '张吾任', 'teacher', '2016-03-21 10:38:31', null), ('22', '131250008', '131250008', '王灿灿', 'student', '2016-05-07 13:10:42', null), ('23', '141250001', '123', '杨潇涵', 'student', '2016-06-24 00:00:00', null), ('24', '141250002', '123', '牛梦雨', 'student', '2016-06-24 00:00:00', null), ('25', '141250003', '123', '温云迪', 'student', '2016-06-24 00:00:00', null), ('26', '141250004', '123', '胡波', 'student', '2016-06-24 00:00:00', null), ('27', '141250005', '123', '郑心蓓', 'student', '2016-06-24 00:00:00', null), ('28', '141250006', '123', '王思思', 'student', '2016-06-24 00:00:00', null), ('29', '141250007', '123', '周婧', 'student', '2016-06-24 00:00:00', null), ('30', '141250008', '123', '文彦宏', 'student', '2016-06-24 00:00:00', null), ('31', '141250009', '123', '马云', 'student', '2016-06-24 00:00:00', null), ('32', '141250010', '123', '周洪波', 'student', '2016-06-24 00:00:00', null), ('33', '141250011', '123', '文建国', 'student', '2016-06-24 00:00:00', null), ('34', '141250012', '123', '马富贵', 'student', '2016-06-24 00:00:00', null), ('35', '141250013', '123', '钱爽', 'student', '2016-06-24 00:00:00', null), ('36', '141250014', '123', '赵馨予', 'student', '2016-06-24 00:00:00', null), ('37', '141250015', '123', '金方平', 'student', '2016-06-24 00:00:00', null), ('38', '141250016', '123', '杨淑怡', 'student', '2016-06-24 00:00:00', null), ('39', '141250017', '123', '牛薇薇', 'student', '2016-06-24 00:00:00', null), ('40', '141250018', '123', '温潇涵', 'student', '2016-06-24 00:00:00', null), ('41', '141250019', '123', '胡梦雨', 'student', '2016-06-24 00:00:00', null), ('42', '141250020', '123', '牛心蓓', 'student', '2016-06-24 00:00:00', null), ('43', '141250021', '123', '温思思', 'student', '2016-06-24 00:00:00', null), ('44', '141250022', '123', '胡婧', 'student', '2016-06-24 00:00:00', null), ('45', '141250023', '123', '郑彦宏', 'student', '2016-06-24 00:00:00', null), ('46', '141250024', '123', '王云', 'student', '2016-06-24 00:00:00', null), ('47', '141250025', '123', '周志军', 'student', '2016-06-24 00:00:00', null), ('48', '141250026', '123', '文煊义', 'student', '2016-06-24 00:00:00', null), ('49', '141250027', '123', '马洪波', 'student', '2016-06-24 00:00:00', null), ('50', '141250028', '123', '钱建国', 'student', '2016-06-24 00:00:00', null), ('51', '141250029', '123', '赵富贵', 'student', '2016-06-24 00:00:00', null), ('52', '141250030', '123', '马方平', 'student', '2016-06-24 00:00:00', null), ('53', '141250031', '123', '钱淑怡', 'student', '2016-06-24 00:00:00', null), ('54', '141250032', '123', '赵薇薇', 'student', '2016-06-24 00:00:00', null), ('55', '141250033', '123', '金潇涵', 'student', '2016-06-24 00:00:00', null), ('56', '141250034', '123', '杨梦雨', 'student', '2016-06-24 00:00:00', null), ('57', '141250035', '123', '牛云迪', 'student', '2016-06-24 00:00:00', null), ('58', '141250036', '123', '温波', 'student', '2016-06-24 00:00:00', null), ('59', '141250037', '123', '胡心蓓', 'student', '2016-06-24 00:00:00', null), ('60', '141250038', '123', '郑思思', 'student', '2016-06-24 00:00:00', null), ('61', '141250039', '123', '王婧', 'student', '2016-06-24 00:00:00', null), ('62', '141250040', '123', '胡志军', 'student', '2016-06-24 00:00:00', null), ('63', '141250041', '123', '郑煊义', 'student', '2016-06-24 00:00:00', null), ('64', '141250042', '123', '王洪波', 'student', '2016-06-24 00:00:00', null), ('65', '141250043', '123', '周建国', 'student', '2016-06-24 00:00:00', null), ('66', '141250044', '123', '文富贵', 'student', '2016-06-24 00:00:00', null), ('67', '141250045', '123', '马爽', 'student', '2016-06-24 00:00:00', null), ('68', '141250046', '123', '钱馨予', 'student', '2016-06-24 00:00:00', null), ('69', '141250047', '123', '赵方平', 'student', '2016-06-24 00:00:00', null), ('70', '141250048', '123', '金淑怡', 'student', '2016-06-24 00:00:00', null), ('71', '141250049', '123', '杨薇薇', 'student', '2016-06-24 00:00:00', null), ('72', '141250050', '123', '赵云迪', 'student', '2016-06-24 00:00:00', null), ('73', '141250051', '123', '金波', 'student', '2016-06-24 00:00:00', null), ('74', '141250052', '123', '杨心蓓', 'student', '2016-06-24 00:00:00', null), ('75', '141250053', '123', '牛思思', 'student', '2016-06-24 00:00:00', null), ('76', '141250054', '123', '温婧', 'student', '2016-06-24 00:00:00', null), ('77', '141250055', '123', '胡彦宏', 'student', '2016-06-24 00:00:00', null), ('78', '141250056', '123', '郑云', 'student', '2016-06-24 00:00:00', null), ('79', '141250057', '123', '王志军', 'student', '2016-06-24 00:00:00', null), ('80', '141250058', '123', '周煊义', 'student', '2016-06-24 00:00:00', null), ('81', '141250059', '123', '文洪波', 'student', '2016-06-24 00:00:00', null), ('82', '141250060', '123', '王爽', 'student', '2016-06-24 00:00:00', null), ('83', '141250061', '123', '周馨予', 'student', '2016-06-24 00:00:00', null), ('84', '141250062', '123', '文方平', 'student', '2016-06-24 00:00:00', null), ('85', '141250063', '123', '马淑怡', 'student', '2016-06-24 00:00:00', null), ('86', '141250064', '123', '钱薇薇', 'student', '2016-06-24 00:00:00', null), ('87', '141250065', '123', '赵潇涵', 'student', '2016-06-24 00:00:00', null), ('88', '141250066', '123', '金梦雨', 'student', '2016-06-24 00:00:00', null), ('89', '141250067', '123', '杨云迪', 'student', '2016-06-24 00:00:00', null), ('90', '141250068', '123', '牛波', 'student', '2016-06-24 00:00:00', null), ('91', '141250069', '123', '温心蓓', 'student', '2016-06-24 00:00:00', null), ('92', '141250070', '123', '杨彦宏', 'student', '2016-06-24 00:00:00', null), ('93', '141250071', '123', '牛云', 'student', '2016-06-24 00:00:00', null), ('94', '141250072', '123', '温志军', 'student', '2016-06-24 00:00:00', null), ('95', '141250073', '123', '胡煊义', 'student', '2016-06-24 00:00:00', null), ('96', '141250074', '123', '郑洪波', 'student', '2016-06-24 00:00:00', null), ('97', '141250075', '123', '王建国', 'student', '2016-06-24 00:00:00', null), ('98', '141250076', '123', '周富贵', 'student', '2016-06-24 00:00:00', null), ('99', '141250077', '123', '文爽', 'student', '2016-06-24 00:00:00', null), ('100', '141250078', '123', '马馨予', 'student', '2016-06-24 00:00:00', null), ('101', '141250079', '123', '钱方平', 'student', '2016-06-24 00:00:00', null), ('102', '141250080', '123', '文潇涵', 'student', '2016-06-24 00:00:00', null), ('103', '141250081', '123', '马梦雨', 'student', '2016-06-24 00:00:00', null), ('104', '141250082', '123', '钱云迪', 'student', '2016-06-24 00:00:00', null), ('105', '141250083', '123', '赵波', 'student', '2016-06-24 00:00:00', null), ('106', '141250084', '123', '金心蓓', 'student', '2016-06-24 00:00:00', null), ('107', '141250085', '123', '杨思思', 'student', '2016-06-24 00:00:00', null), ('108', '141250086', '123', '牛婧', 'student', '2016-06-24 00:00:00', null), ('109', '141250087', '123', '温彦宏', 'student', '2016-06-24 00:00:00', null), ('110', '141250088', '123', '胡云', 'student', '2016-06-24 00:00:00', null), ('111', '141250089', '123', '郑志军', 'student', '2016-06-24 00:00:00', null), ('112', '141250090', '123', '温建国', 'student', '2016-06-24 00:00:00', null), ('113', '141250091', '123', '胡富贵', 'student', '2016-06-24 00:00:00', null), ('114', '141250092', '123', '郑爽', 'student', '2016-06-24 00:00:00', null), ('115', '141250093', '123', '王馨予', 'student', '2016-06-24 00:00:00', null), ('116', '141250094', '123', '周方平', 'student', '2016-06-24 00:00:00', null), ('117', '141250095', '123', '文淑怡', 'student', '2016-06-24 00:00:00', null), ('118', '141250096', '123', '马薇薇', 'student', '2016-06-24 00:00:00', null), ('119', '141250097', '123', '钱潇涵', 'student', '2016-06-24 00:00:00', null), ('120', '141250098', '123', '赵梦雨', 'student', '2016-06-24 00:00:00', null), ('121', '141250099', '123', '金云迪', 'student', '2016-06-24 00:00:00', null), ('122', '141250100', '123', '杨煊义', 'student', '2016-06-24 00:00:00', null), ('123', '141250101', '123', '牛洪波', 'student', '2016-06-24 00:00:00', null), ('124', '141250102', '123', '温建国', 'student', '2016-06-24 00:00:00', null), ('125', '141250103', '123', '胡富贵', 'student', '2016-06-24 00:00:00', null), ('126', '141250104', '123', '郑爽', 'student', '2016-06-24 00:00:00', null), ('127', '141250105', '123', '王馨予', 'student', '2016-06-24 00:00:00', null), ('128', '141250106', '123', '周方平', 'student', '2016-06-24 00:00:00', null), ('129', '141250107', '123', '文淑怡', 'student', '2016-06-24 00:00:00', null), ('130', '141250108', '123', '马薇薇', 'student', '2016-06-24 00:00:00', null), ('131', '141250109', '123', '钱潇涵', 'student', '2016-06-24 00:00:00', null), ('132', '141250110', '123', '文波', 'student', '2016-06-24 00:00:00', null), ('133', '141250111', '123', '马心蓓', 'student', '2016-06-24 00:00:00', null), ('134', '141250112', '123', '钱思思', 'student', '2016-06-24 00:00:00', null), ('135', '141250113', '123', '赵婧', 'student', '2016-06-24 00:00:00', null), ('136', '141250114', '123', '金彦宏', 'student', '2016-06-24 00:00:00', null), ('137', '141250115', '123', '杨云', 'student', '2016-06-24 00:00:00', null), ('138', '141250116', '123', '牛志军', 'student', '2016-06-24 00:00:00', null), ('139', '141250117', '123', '温煊义', 'student', '2016-06-24 00:00:00', null), ('140', '141250118', '123', '胡洪波', 'student', '2016-06-24 00:00:00', null), ('141', '141250119', '123', '郑建国', 'student', '2016-06-24 00:00:00', null), ('142', '141250120', '123', '温馨予', 'student', '2016-06-24 00:00:00', null);
COMMIT;

-- ----------------------------
--  Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `user_id` int(11) NOT NULL,
  `studentCourse_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`studentCourse_id`),
  KEY `FK_i6qyxo0nbhbyn4wun4y6jhqsp` (`studentCourse_id`),
  CONSTRAINT `FK_i2dbtnitev973madsa3efqp9a` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_i6qyxo0nbhbyn4wun4y6jhqsp` FOREIGN KEY (`studentCourse_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `user_course`
-- ----------------------------
BEGIN;
INSERT INTO `user_course` VALUES ('11', '1'), ('12', '1'), ('13', '1'), ('3', '2'), ('11', '2'), ('3', '4'), ('12', '4'), ('14', '4'), ('15', '4'), ('13', '6'), ('14', '6'), ('11', '20'), ('12', '20'), ('13', '20'), ('14', '20'), ('3', '23'), ('3', '27'), ('12', '27'), ('13', '27'), ('14', '27'), ('15', '27'), ('19', '27'), ('22', '27'), ('3', '28'), ('11', '28'), ('13', '28'), ('14', '28'), ('15', '28'), ('20', '28'), ('22', '28');
COMMIT;

-- ----------------------------
--  Table structure for `user_file`
-- ----------------------------
DROP TABLE IF EXISTS `user_file`;
CREATE TABLE `user_file` (
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`file_id`),
  UNIQUE KEY `UK_gex7o53wit5nd6xsulccj93di` (`file_id`),
  CONSTRAINT `FK_gex7o53wit5nd6xsulccj93di` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FK_polh11imju6b0w34orybum365` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `user_file`
-- ----------------------------
BEGIN;
INSERT INTO `user_file` VALUES ('13', '1'), ('3', '2'), ('2', '3'), ('11', '5'), ('11', '7'), ('11', '8'), ('11', '12'), ('13', '15'), ('11', '16'), ('13', '18');
COMMIT;

-- ----------------------------
--  Table structure for `user_grade`
-- ----------------------------
DROP TABLE IF EXISTS `user_grade`;
CREATE TABLE `user_grade` (
  `user_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`grade_id`),
  UNIQUE KEY `UK_a0oqo9dcyswkb528u1uorj0bx` (`grade_id`),
  CONSTRAINT `FK_a0oqo9dcyswkb528u1uorj0bx` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `FK_t1kf06uc11i6b55oqd97w9rm6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `user_grade`
-- ----------------------------
BEGIN;
INSERT INTO `user_grade` VALUES ('11', '5'), ('3', '6'), ('11', '9'), ('12', '10'), ('13', '11'), ('15', '12'), ('12', '13'), ('14', '14'), ('3', '15'), ('11', '16'), ('14', '17'), ('12', '18'), ('13', '19'), ('11', '20'), ('12', '21'), ('14', '22'), ('13', '23'), ('13', '24'), ('13', '25'), ('12', '26'), ('14', '27'), ('11', '28'), ('11', '29'), ('11', '30'), ('3', '31');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
