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

 Date: 05/05/2016 16:36:17 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `COURSE_ASSISTANT`
-- ----------------------------
DROP TABLE IF EXISTS `COURSE_ASSISTANT`;
CREATE TABLE `COURSE_ASSISTANT` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  UNIQUE KEY `UK_am3q4pm5ij1taq74v3kqpsrlh` (`USER_ID`),
  CONSTRAINT `FK_am3q4pm5ij1taq74v3kqpsrlh` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_r3dhcqxfxgqpcgdc7q2euf6de` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `COURSE_ASSISTANT`
-- ----------------------------
BEGIN;
INSERT INTO `COURSE_ASSISTANT` VALUES ('20', '3'), ('4', '11'), ('2', '12'), ('23', '13'), ('2', '14'), ('1', '15'), ('28', '19');
COMMIT;

-- ----------------------------
--  Table structure for `COURSE_TEACHER`
-- ----------------------------
DROP TABLE IF EXISTS `COURSE_TEACHER`;
CREATE TABLE `COURSE_TEACHER` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  KEY `FK_ewt621bl7gi63l076roebr16b` (`USER_ID`),
  CONSTRAINT `FK_9arn52yp2skru03vfr6okpsak` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_ewt621bl7gi63l076roebr16b` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `COURSE_TEACHER`
-- ----------------------------
BEGIN;
INSERT INTO `COURSE_TEACHER` VALUES ('1', '2'), ('2', '2'), ('4', '2'), ('6', '2'), ('18', '2'), ('19', '2'), ('20', '2'), ('23', '2'), ('27', '2'), ('28', '2'), ('3', '4'), ('6', '4'), ('7', '4'), ('10', '4'), ('21', '4'), ('22', '4'), ('24', '4'), ('26', '4'), ('5', '10'), ('10', '10'), ('18', '17'), ('25', '18');
COMMIT;

-- ----------------------------
--  Table structure for `COURSE_USER`
-- ----------------------------
DROP TABLE IF EXISTS `COURSE_USER`;
CREATE TABLE `COURSE_USER` (
  `COURSE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`USER_ID`),
  KEY `FK_mnt58v6lrw9p8sa2ket0l17pp` (`USER_ID`),
  CONSTRAINT `FK_hntrplhu1sj5758af7ifdy4j5` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_mnt58v6lrw9p8sa2ket0l17pp` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `COURSE_USER`
-- ----------------------------
BEGIN;
INSERT INTO `COURSE_USER` VALUES ('2', '3'), ('4', '3'), ('23', '3'), ('1', '11'), ('2', '11'), ('20', '11'), ('27', '11'), ('28', '11'), ('1', '12'), ('4', '12'), ('20', '12'), ('27', '12'), ('28', '12'), ('1', '13'), ('6', '13'), ('20', '13'), ('28', '13'), ('4', '14'), ('6', '14'), ('20', '14'), ('27', '14'), ('4', '15');
COMMIT;

-- ----------------------------
--  Table structure for `Message`
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(300) NOT NULL,
  `type` varchar(100) NOT NULL,
  `createdTime` datetime NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ljelkubmwbi0msw6o3x2woifd` (`course_id`),
  CONSTRAINT `FK_ljelkubmwbi0msw6o3x2woifd` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Message`
-- ----------------------------
BEGIN;
INSERT INTO `Message` VALUES ('1', '生命科学布置了新作业', '作业标题：生命科学的第二个作业', 'publishHomework', '2016-03-06 15:33:41', '1'), ('2', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-06 17:29:35', '2'), ('3', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-06 17:32:27', '2'), ('4', '生命科学布置了新作业', '作业标题：这是一个作业', 'publishHomework', '2016-03-06 22:36:25', '1'), ('5', '生命科学布置了新作业', '作业标题：课程作业', 'publishHomework', '2016-03-06 22:38:29', '1'), ('6', '生命科学布置了新作业', '作业标题：我要给这个课程添加附件', 'publishHomework', '2016-03-06 22:45:25', '1'), ('7', '生命科学布置了新作业', '作业标题：认真地添加附件', 'publishHomework', '2016-03-06 22:47:54', '1'), ('8', '222布置了新作业', '作业标题：为什么无法显示', 'publishHomework', '2016-03-06 23:26:33', '4'), ('9', '生命科学布置了新作业', '作业标题：一个有附件的作业', 'publishHomework', '2016-03-06 23:30:48', '1'), ('10', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:02:31', '2'), ('11', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:05:33', '2'), ('12', '电子商务的作业已经批改完', '本课程的这是一个作业呵呵已经批改完', 'correctionOver', '2016-03-07 00:08:26', '2'), ('13', '电子商务公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-07 19:30:57', '2'), ('14', '生命科学的作业已经批改完', '本课程的生命科学的作业已经批改完', 'correctionOver', '2016-03-07 21:27:57', '1'), ('15', '生命科学作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-07 21:30:56', '1'), ('16', '需求工程布置了新作业', '作业标题：写一份需求', 'publishHomework', '2016-03-10 18:06:18', '20'), ('17', '需求工程布置了新作业', '作业标题：需求文档', 'publishHomework', '2016-03-13 21:26:29', '20'), ('18', '数据库设计的作业已经批改完', '本课程的为什么无法显示已经批改完', 'correctionOver', '2016-03-14 11:09:25', '4'), ('19', '需求工程的作业已经批改完', '本课程的需求文档已经批改完', 'correctionOver', '2016-03-14 14:22:08', '20'), ('20', '需求工程作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-14 14:38:39', '20'), ('21', '需求工程的作业已经批改完', '本课程的需求文档已经批改完', 'correctionOver', '2016-03-14 14:43:15', '20'), ('22', '需求工程公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-14 14:45:25', '20'), ('23', '需求工程布置了新作业', '作业标题：设计原型', 'publishHomework', '2016-03-19 00:13:20', '20'), ('24', '需求工程布置了新作业', '作业标题：设计原型。请注意按时批改', 'toCorrectHomework', '2016-03-19 00:13:20', '20'), ('25', '数据库设计公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-20 13:48:24', '4'), ('26', '需求工程布置了新作业', '作业标题：新的作业', 'publishHomework', '2016-03-21 10:42:26', '20'), ('27', '需求工程布置了新作业', '作业标题：新的作业。请注意按时批改', 'toCorrectHomework', '2016-03-21 10:42:27', '20'), ('28', '需求工程的作业已经批改完', '本课程的写一份需求已经批改完', 'correctionOver', '2016-03-21 10:45:07', '20'), ('29', '需求工程作业重新批改', '不合格，请重新批改', 'reCorrect', '2016-03-21 10:45:27', '20'), ('30', '需求工程的作业已经批改完', '本课程的写一份需求已经批改完', 'correctionOver', '2016-03-21 10:45:42', '20'), ('31', '需求工程公布作业成绩', '快去查看作业成绩吧', 'publishGrade', '2016-03-21 10:46:03', '20');
COMMIT;

-- ----------------------------
--  Table structure for `SEMESTER_COURSE`
-- ----------------------------
DROP TABLE IF EXISTS `SEMESTER_COURSE`;
CREATE TABLE `SEMESTER_COURSE` (
  `semester_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`semester_id`,`course_id`),
  UNIQUE KEY `UK_67pwbpie6veyg510crth6lsq1` (`course_id`),
  CONSTRAINT `FK_67pwbpie6veyg510crth6lsq1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_slxefabaf0knvpy14f3tf1y52` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `SEMESTER_COURSE`
-- ----------------------------
BEGIN;
INSERT INTO `SEMESTER_COURSE` VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('2', '4'), ('2', '5'), ('2', '6'), ('3', '7'), ('3', '8'), ('3', '9'), ('3', '10'), ('4', '18'), ('4', '19'), ('4', '20'), ('4', '21'), ('4', '22'), ('2', '23'), ('2', '24'), ('4', '25'), ('5', '26'), ('5', '27'), ('5', '28');
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
INSERT INTO `course` VALUES ('1', '100', '生命科学', '通修', '1', '周二 第3-4节', '仙一 111', '1'), ('2', '111', '电子商务', '选修', '2', '周三 第5-6节', '仙二 100', '1'), ('3', '123', '111', 'tong', '1', '周一  第2-3节', '1', '1'), ('4', '2', '数据库设计', '通修', '1', '周一  第1-1节', '仙2 111', '2'), ('5', '123', ' 离散数学', '通修', '3', '周一  第2-3节', '仙一 111', '2'), ('6', '1111', '历史', '通修', '1', '周三  第1-3节', '仙一 222', '2'), ('7', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('8', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('9', '232', '233', 'tong', '1', '周一  第2-3节', '3', '3'), ('10', '1010101', 'Linux基础', '选修', '2', '周一  第2-4节', '教1 111', '3'), ('18', '2015201', '软件工程', '通修', '3', '周一  第3-4节', '仙一 110', '4'), ('19', '2015202', '软件工程2', '通修', '3', '周一  第5-6节', '教 110', '4'), ('20', '2015203', '需求工程', '平台', '2', '周一  第1-4节', '教110', '4'), ('21', '2015204', '程序设计', '通修', '2', '周三  第3-4节', '仙一 222', '4'), ('22', '2015205', '操作系统', '通修', '1', '周一  第2-4节', '逸 110', '4'), ('23', '201405001', '钢琴赏析', '平台', '2', '周四  第9-10节', '馆 202', '2'), ('24', '123423', '测试课程', '通修', '3', '周一 第3-4节', '仙一 222', '2'), ('25', '20150223', 'Web程序设计', '选修', '3', '周二 第3-4节', '教 111', '4'), ('26', '201601001', 'Java基础', '通修', '2', '周二 第5-6节', '仙一 111', '5'), ('27', '201601002', 'Linux程序设计', '通修', '3', '周三 第3-4节', '教 222', '5'), ('28', '2016010004', '一门课', '通修', '3', '周一 第5-6节', '教 111', '5');
COMMIT;

-- ----------------------------
--  Table structure for `courseFile`
-- ----------------------------
DROP TABLE IF EXISTS `courseFile`;
CREATE TABLE `courseFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `course_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d7ou2rkt8ruag64pjdd46bsse` (`course_fk`),
  CONSTRAINT `FK_d7ou2rkt8ruag64pjdd46bsse` FOREIGN KEY (`course_fk`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `courseFile`
-- ----------------------------
BEGIN;
INSERT INTO `courseFile` VALUES ('15', 'course1.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course1', '1'), ('16', 'course2.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course2', '2'), ('17', 'course3.xls', '/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload/Course3', '3');
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
INSERT INTO `course_homework` VALUES ('1', '50'), ('2', '51'), ('2', '52'), ('1', '53'), ('1', '54'), ('1', '55'), ('1', '56'), ('1', '57'), ('4', '58'), ('1', '59'), ('20', '60'), ('20', '61'), ('20', '62'), ('20', '63');
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
  CONSTRAINT `FK_nwljgnxxexuo2x4jll1d9bm47` FOREIGN KEY (`message_id`) REFERENCES `Message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `grade`
-- ----------------------------
BEGIN;
INSERT INTO `grade` VALUES ('5', '90.0', '51', '11', null), ('6', '92.0', '51', '3', null), ('9', '0.0', '50', '11', '居然没有提交'), ('10', '0.0', '50', '12', '也没有提交'), ('11', '91.0', '50', '13', '还可以'), ('12', '100.0', '58', '15', '很好'), ('13', '90.0', '58', '12', '还可以'), ('14', '80.0', '58', '14', '啧'), ('15', '90.0', '58', '3', '可以可以'), ('16', '100.0', '61', '11', '很好'), ('17', '0.0', '61', '14', '没有提交'), ('18', '0.0', '61', '12', '没有提交'), ('19', '0.0', '61', '13', '没有提交'), ('20', '90.0', '60', '11', '勉强'), ('21', '90.0', '60', '12', '太不认真'), ('22', '80.0', '60', '14', '恩'), ('23', '100.0', '60', '13', '啧');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `homework`
-- ----------------------------
BEGIN;
INSERT INTO `homework` VALUES ('50', '生命科学的作业', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-03 15:07:25', '2016-03-11 21:28:09', 'pass', '0', '1'), ('51', '这是一个作业', '', '0', '', '2016-03-05 23:59:59', '2016-05-04 23:59:59', '2', '2016-03-04 15:07:36', '2016-03-14 21:28:00', 'pass', '10', '0'), ('52', '数据库设计', '这是一个作业描述', '0', 'PDF', '2016-04-05 23:59:59', '2016-05-05 23:59:59', '2', '2016-03-06 15:30:22', null, 'commit', '0', '0'), ('53', '生命科学的第二个作业', '', '0', 'PDF', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 15:33:41', null, 'commit', '0', '0'), ('54', '这是一个作业', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:36:24', null, 'commit', '0', '0'), ('55', '课程作业', '', '0', 'PDF', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:38:29', null, 'commit', '0', '0'), ('56', '我要给这个课程添加附件', '123', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:45:24', null, 'commit', '0', '0'), ('57', '认真地添加附件', '', '0', '', '2014-09-05 23:59:59', '2014-10-04 23:59:59', '1', '2016-03-06 22:47:53', null, 'commit', '0', '0'), ('58', '作业1', '', '0', '', '2016-03-08 23:59:59', '2016-06-06 23:59:59', '4', '2016-03-06 23:26:32', '2016-03-20 13:48:23', 'pass', '0', '0'), ('59', '一个有附件的作业', '', '4', '', '2016-05-05 23:59:59', '2016-05-06 23:59:59', '1', '2016-03-06 23:30:48', null, 'commit', '0', '0'), ('60', '写一份需求', '需求要认真写', '9', 'PDF', '2016-03-15 23:59:59', '2016-03-23 23:59:59', '20', '2016-03-10 18:06:18', '2016-03-21 10:46:03', 'pass', '19', '1'), ('61', '需求文档', '最多7页', '11', 'PDF', '2016-03-13 23:59:59', '2016-05-05 23:59:59', '20', '2016-03-13 21:26:29', '2016-03-15 21:27:37', 'pass', '13', '1'), ('62', '设计原型', '设计一份原型', '14', 'PDF', '2016-04-04 23:59:59', '2016-05-05 23:59:59', '20', '2016-03-19 00:13:19', null, 'commit', '0', '0'), ('63', '新的作业', '作业', '17', '', '2016-03-24 23:59:59', '2016-03-27 23:59:59', '20', '2016-03-21 10:42:26', null, 'commit', '0', '0');
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
INSERT INTO `homework_grade` VALUES ('51', '5'), ('51', '6'), ('50', '9'), ('50', '10'), ('50', '11'), ('58', '12'), ('58', '13'), ('58', '14'), ('58', '15'), ('61', '16'), ('61', '17'), ('61', '18'), ('61', '19'), ('60', '20'), ('60', '21'), ('60', '22'), ('60', '23');
COMMIT;

-- ----------------------------
--  Table structure for `messageUser`
-- ----------------------------
DROP TABLE IF EXISTS `messageUser`;
CREATE TABLE `messageUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `messageUser`
-- ----------------------------
BEGIN;
INSERT INTO `messageUser` VALUES ('5', '1', '11', '2016-03-06 16:58:24'), ('6', '1', '13', '2016-03-10 18:21:04'), ('7', '1', '12', '2016-03-06 17:03:28'), ('8', '1', '15', '2016-03-07 20:35:30'), ('9', '2', '2', '2016-03-06 23:56:09'), ('10', '3', '2', '2016-03-06 23:56:09'), ('11', '4', '12', null), ('12', '4', '11', '2016-03-14 14:54:44'), ('13', '4', '13', '2016-03-10 18:21:04'), ('14', '4', '15', '2016-03-07 20:35:30'), ('15', '5', '13', '2016-03-10 18:21:04'), ('16', '5', '11', '2016-03-14 14:54:44'), ('17', '5', '12', null), ('18', '5', '15', '2016-03-07 20:35:30'), ('19', '6', '11', '2016-03-14 14:54:44'), ('20', '6', '13', '2016-03-10 18:21:04'), ('21', '6', '12', null), ('22', '6', '15', '2016-03-07 20:35:30'), ('23', '7', '11', '2016-03-14 14:54:44'), ('24', '7', '13', '2016-03-10 18:21:04'), ('25', '7', '12', null), ('26', '7', '15', '2016-03-07 20:35:30'), ('27', '8', '3', '2016-03-14 19:41:02'), ('28', '9', '11', '2016-03-14 14:54:44'), ('29', '9', '12', null), ('30', '9', '13', '2016-03-10 18:21:05'), ('31', '9', '15', '2016-03-07 20:35:30'), ('32', '10', '2', '2016-03-07 21:30:16'), ('33', '11', '2', '2016-03-07 21:30:16'), ('34', '12', '2', '2016-03-07 21:30:16'), ('35', '13', '11', '2016-03-14 14:54:44'), ('36', '13', '3', '2016-03-14 19:41:02'), ('37', '14', '2', '2016-03-14 15:28:02'), ('38', '15', '15', '2016-03-07 21:31:27'), ('39', '16', '11', '2016-03-14 14:54:44'), ('40', '16', '13', '2016-03-10 18:21:05'), ('41', '16', '14', null), ('42', '16', '12', null), ('43', '16', '3', '2016-03-14 19:41:02'), ('44', '17', '13', '2016-03-21 10:42:52'), ('45', '17', '11', '2016-03-14 14:54:44'), ('46', '17', '14', null), ('47', '17', '12', null), ('48', '17', '3', '2016-03-14 19:41:02'), ('49', '18', '2', '2016-03-14 13:48:21'), ('50', '19', '2', '2016-03-14 15:06:43'), ('51', '20', '3', '2016-03-14 19:41:02'), ('52', '21', '2', '2016-03-14 15:06:43'), ('53', '22', '12', null), ('54', '22', '11', '2016-03-14 14:54:44'), ('55', '22', '14', null), ('56', '22', '13', '2016-03-21 10:42:52'), ('57', '23', '11', '2016-03-20 13:49:13'), ('58', '23', '13', '2016-03-21 10:42:52'), ('59', '23', '15', null), ('60', '23', '12', null), ('61', '23', '14', null), ('62', '24', '3', '2016-03-19 00:13:41'), ('63', '25', '3', '2016-03-21 10:43:33'), ('64', '25', '14', null), ('65', '25', '15', null), ('66', '25', '12', null), ('67', '26', '12', null), ('68', '26', '14', null), ('69', '26', '13', '2016-03-21 10:42:52'), ('70', '26', '11', null), ('71', '27', '3', '2016-03-21 10:43:33'), ('72', '28', '2', '2016-03-21 10:45:16'), ('73', '29', '3', '2016-03-21 10:45:39'), ('74', '30', '2', '2016-03-21 10:45:57'), ('75', '31', '12', null), ('76', '31', '13', '2016-03-21 10:46:43'), ('77', '31', '11', null), ('78', '31', '14', null);
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
INSERT INTO `semester` VALUES ('1', '2014-2015学年第一学期', '2014-09-01', '2016-03-20'), ('2', '2014-2015学年第二学期', '2015-03-01', '2015-07-15'), ('3', '2015-2016学年第一学期', '2015-09-01', '2016-01-16'), ('4', '2015-2016学年第二学期', '2016-03-01', '2016-07-12'), ('5', '2016-2017学年第一学期', '2016-09-01', '2017-01-14');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '159', '159', '管理员', 'admin', null, null), ('2', '123', '123', '王老师', 'teacher', '2016-02-25 19:30:21', null), ('3', '131250159', '123', '曾同学', 'student', '2016-02-25 19:49:16', '20'), ('4', 'JS0002', '111', '蔡老师', 'teacher', '2016-02-25 20:08:27', null), ('10', 'JS0003', '120', '张老师', 'teacher', '2016-02-25 23:19:51', null), ('11', '131313', '1313', '刘同学', 'student', '2016-02-28 11:34:42', '4'), ('12', '123456', '123123', '黄同学', 'student', '2016-02-28 11:35:00', '2'), ('13', '1414', '1414', '邱同学', 'student', '2016-02-29 11:45:15', null), ('14', '131250', '111', '林同学', 'student', '2016-03-01 15:29:56', '2'), ('15', '131250300', '123', '周宇宸', 'student', '2016-03-01 15:54:06', '1'), ('16', 'JX0001', '123', '教学负责人', 'director', '2016-03-03 21:58:59', null), ('17', 'JS0001', '123', '李老师', 'teacher', '2016-03-10 15:27:33', null), ('18', '02859', '123', '肖老师', 'teacher', '2016-03-18 23:13:49', null), ('19', '2342', '111', '陈同学', 'student', '2016-03-18 23:24:08', '28'), ('20', '5643', '123', '吴同学', 'student', '2016-03-21 10:38:16', null), ('21', '1111111', '123', '张老师', 'teacher', '2016-03-21 10:38:31', null);
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
INSERT INTO `user_course` VALUES ('11', '1'), ('12', '1'), ('13', '1'), ('3', '2'), ('11', '2'), ('3', '4'), ('12', '4'), ('14', '4'), ('15', '4'), ('13', '6'), ('14', '6'), ('11', '20'), ('12', '20'), ('13', '20'), ('14', '20'), ('3', '23'), ('11', '27'), ('12', '27'), ('14', '27'), ('11', '28'), ('12', '28'), ('13', '28');
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
INSERT INTO `user_grade` VALUES ('11', '5'), ('3', '6'), ('11', '9'), ('12', '10'), ('13', '11'), ('15', '12'), ('12', '13'), ('14', '14'), ('3', '15'), ('11', '16'), ('14', '17'), ('12', '18'), ('13', '19'), ('11', '20'), ('12', '21'), ('14', '22'), ('13', '23');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
