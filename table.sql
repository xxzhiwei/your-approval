-- MySQL dump 10.13  Distrib 5.7.8-rc, for osx10.8 (x86_64)
--
-- Host: localhost    Database: your_approval
-- ------------------------------------------------------
-- Server version	5.7.8-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secret` varchar(50) DEFAULT NULL,
  `redirect_uris` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='oauth客户端';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'easyblog@12321','http://localhost:9528/easyblog/admin/#/oauth2/callback','openid profile email test','easyblog','',1),(2,'easyums@demo1','http://localhost:8887/#/oauth2/callback','openid profile email','测试客户端2',NULL,1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` varchar(32) NOT NULL,
  `access_token` varchar(300) DEFAULT NULL COMMENT '访问令牌（长度先限定为300）',
  `refresh_token` varchar(300) DEFAULT NULL COMMENT '刷新令牌',
  `client_id` int(11) DEFAULT NULL COMMENT '客户端id',
  `scope` varchar(255) DEFAULT NULL COMMENT '授权范围',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_pk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('df199ee06775438f9cea00068364874a','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6MSwidXNlcklkIjoxLCJ0b2tlbklkIjoiZGYxOTllZTA2Nzc1NDM4ZjljZWEwMDA2ODM2NDg3NGEiLCJ0eXBlIjoiYWNjZXNzX3Rva2VuIiwiaWF0IjoxNzI1NDI1OTg1LCJleHAiOjE3MjU0MzMxODUsImlzcyI6InlvdXItYXBwcm92YWwifQ.dHAQkdINR2JV9YjsSCyL4bS4YWk9Pd5b-w8XvizR4-o','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6MSwidXNlcklkIjoxLCJ0b2tlbklkIjoiZGYxOTllZTA2Nzc1NDM4ZjljZWEwMDA2ODM2NDg3NGEiLCJ0eXBlIjoicmVmcmVzaF90b2tlbiIsImlhdCI6MTcyNTQyNTk4NSwiZXhwIjoxNzI2MDMwNzg1LCJpc3MiOiJ5b3VyLWFwcHJvdmFsIn0.FPOTnAUdfDieuEDCLBolFDg3Qxy5KiLoKFO-TnwzWko',1,'openid profile email',1);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `avatar` varchar(500) DEFAULT NULL COMMENT '用户头像，为一串url地址，默认为空。',
  `created_at` datetime(3) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `state` tinyint(4) DEFAULT '1' COMMENT '1正常，2禁用',
  `introduction` mediumtext COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'errol','e10adc3949ba59abbe56e057f20f883e','','2024-04-22 20:12:55.452','2444016558@qq.com',1,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04 13:41:50
