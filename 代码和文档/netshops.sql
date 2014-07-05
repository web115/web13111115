/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : netshops

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2014-07-04 23:53:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) unsigned DEFAULT '0',
  `goodsID` bigint(20) unsigned DEFAULT '0',
  `tag` int(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of attention
-- ----------------------------

-- ----------------------------
-- Table structure for `discussion`
-- ----------------------------
DROP TABLE IF EXISTS `discussion`;
CREATE TABLE `discussion` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goodsID` bigint(20) unsigned DEFAULT '0',
  `authorID` bigint(20) unsigned DEFAULT '0',
  `authorName` varchar(100) COLLATE gb2312_bin DEFAULT NULL,
  `content` text COLLATE gb2312_bin,
  `createDate` date DEFAULT '0000-00-00',
  `disType` int(4) unsigned DEFAULT '1',
  `tag` int(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of discussion
-- ----------------------------

-- ----------------------------
-- Table structure for `email`
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) COLLATE gb2312_bin NOT NULL DEFAULT '',
  `content` text COLLATE gb2312_bin,
  `sender` varchar(200) COLLATE gb2312_bin NOT NULL DEFAULT '',
  `receiver` varchar(200) COLLATE gb2312_bin NOT NULL DEFAULT '',
  `createDatetime` datetime DEFAULT '0000-00-00 00:00:00',
  `mailType` int(10) DEFAULT '0',
  `tag` int(10) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO email VALUES ('1', 'aa', 0x68656C6C6F, 'abc', 'hello', '2014-07-01 16:07:16', '0', '1');
INSERT INTO email VALUES ('2', 'aa', 0x68656C6C6F, 'abc', 'hello', '2014-07-01 16:07:16', '1', '0');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE gb2312_bin DEFAULT NULL,
  `description` text COLLATE gb2312_bin,
  `issuer` bigint(20) unsigned DEFAULT '0',
  `goodsField` bigint(20) unsigned DEFAULT '0',
  `linkMan` varchar(50) COLLATE gb2312_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE gb2312_bin DEFAULT NULL,
  `goodsURL` varchar(50) COLLATE gb2312_bin DEFAULT NULL,
  `price` bigint(20) unsigned DEFAULT '0',
  `createDate` date DEFAULT '0000-00-00',
  `goodsType` int(4) unsigned DEFAULT '2',
  `tag` int(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO goods VALUES ('2', 'baidu', 0x612070696374757265, '2', '1', 'the one', '110', '20140630120717.jpg', '12', '2014-06-30', '2', '0');
INSERT INTO goods VALUES ('3', '360', 0x612070696374757265, '2', '1', 'the two', '120', '20140630120750.jpg', '12', '2014-06-30', '2', '0');
INSERT INTO goods VALUES ('4', 'abc', 0x68656C6C6F, '2', '1', 'ke', '1234123333', '', '300', '2014-07-01', '2', '0');
INSERT INTO goods VALUES ('5', 'abc', 0x616263616263, '4', '1', 'abc', '134566777', '', '400', '2014-07-01', '2', '0');
INSERT INTO goods VALUES ('6', 'abc', 0x616263616263, '4', '1', 'abc', '134566777', '', '400', '2014-07-01', '2', '0');

-- ----------------------------
-- Table structure for `goodsfield`
-- ----------------------------
DROP TABLE IF EXISTS `goodsfield`;
CREATE TABLE `goodsfield` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE gb2312_bin DEFAULT NULL,
  `tag` int(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of goodsfield
-- ----------------------------
INSERT INTO goodsfield VALUES ('1', 'kind A', '0');
INSERT INTO goodsfield VALUES ('2', 'kind B', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE gb2312_bin NOT NULL DEFAULT '',
  `userPassword` varchar(50) COLLATE gb2312_bin NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE gb2312_bin DEFAULT NULL,
  `sex` int(4) DEFAULT '0',
  `identityID` varchar(20) COLLATE gb2312_bin DEFAULT '000000000000000000',
  `shopName` varchar(100) COLLATE gb2312_bin DEFAULT NULL,
  `shopIntro` text COLLATE gb2312_bin,
  `shopper` varchar(100) COLLATE gb2312_bin DEFAULT NULL,
  `realName` varchar(20) COLLATE gb2312_bin DEFAULT NULL,
  `mainFields` bigint(20) unsigned DEFAULT '0',
  `telephone` varchar(20) COLLATE gb2312_bin DEFAULT NULL,
  `createDate` date DEFAULT '0000-00-00',
  `sysRole` int(4) unsigned DEFAULT '1',
  `tag` int(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'admin', 'admin', '123@qq.com', '0', '000000000000000000', 'no', null, null, null, '0', null, '0000-00-00', '0', '0');
INSERT INTO users VALUES ('2', 'hello', 'hello', '123@qq.com', '0', '445222199102120000', 'hello world', 0x77656C636F6D65, 'hello2', 'kester', '1', '18392100000', '2014-06-30', '2', '1');
INSERT INTO users VALUES ('3', 'liujiang', 'liujiang', '123@qq.com', '0', '123', 'ende', 0x686F772061726520796F75, 'hihi', 'kest', '2', '123', '2014-07-01', '2', '1');
INSERT INTO users VALUES ('4', 'abc', 'abc', '234@qq.com', '0', '45222222222', 'abc', 0x616263, 'abc', 'abc', '1', '18111111111', '2014-07-01', '2', '1');
