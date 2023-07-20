/*
MySQL Data Transfer
Source Host: localhost
Source Database: securefile
Target Host: localhost
Target Database: securefile
Date: 22-May-19 4:16:33 PM
*/

Create database securefile;

use securefile;



SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for attacker
-- ----------------------------
DROP TABLE IF EXISTS `attacker`;
CREATE TABLE `attacker` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `fname` text,
  `sk` text,
  `dt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloud
-- ----------------------------
DROP TABLE IF EXISTS `cloud`;
CREATE TABLE `cloud` (
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloudserver
-- ----------------------------
DROP TABLE IF EXISTS `cloudserver`;
CREATE TABLE `cloudserver` (
  `id` int(11) NOT NULL auto_increment,
  `fname` text,
  `ct` text,
  `trapdoor` text,
  `sk` text,
  `rank` int(11) default NULL,
  `dt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ownerreg
-- ----------------------------
DROP TABLE IF EXISTS `ownerreg`;
CREATE TABLE `ownerreg` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `search` text,
  `download` text,
  `ownerper` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for search
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `keyword` text,
  `permission` text,
  `dt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `fname` text,
  `sk` text,
  `task` text,
  `dt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('Cloud', 'Cloud');
INSERT INTO `cloud` VALUES ('cloud', 'cloud');
INSERT INTO `owner` VALUES ('owner', 'owner');
