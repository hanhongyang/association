-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: association
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activityid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `activitystatus` int(11) NOT NULL,
  `associationId` int(11) NOT NULL,
  `starttime` date NOT NULL,
  `endtime` date NOT NULL,
  `location` varchar(30) NOT NULL,
  `material` float NOT NULL DEFAULT '0',
  `picture` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (2,'山东省物理比赛','        等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖荣获一等奖',2,10,'2018-12-06','2019-12-05','山东省济南市',111,'../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(3,'北京市物理竞赛','荣获一等奖',1,10,'2018-12-07','2018-12-08','北京市',0,'../static/images/prod-1.jpg;../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(4,'校园街舞大赛','海选10强',1,6,'2019-12-01','2019-12-03','石家庄',0,'../static/images/prod-1.jpg;../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(5,'航模比赛','123123123123',1,2,'2020-12-10','2019-12-06','哈尔滨',0,'../static/images/prod-1.jpg;../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(6,'吉他比赛','31231231',1,3,'2019-07-09','2019-06-11','东京',0,'../static/images/prod-1.jpg;../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(7,'南京物理比赛','123213',1,10,'2019-07-10','2019-07-27','南京',0,'../static/images/prod-1.jpg;../static/images/prod-2.jpg;../static/images/prod-3.jpg'),(34,'测试数据','123',1,10,'2019-12-15','2019-12-01','123',213,'../upload/6fb9d150-9f7f-417d-85e4-ac61a62d816e.png'),(35,'123','321',1,10,'2019-12-13','2019-12-14','321',312,'../upload/0c24376f-9caa-4fbc-9d61-fbe50a80d4b8.png'),(36,'测试数据','312',2,10,'2019-12-15','2019-12-28','213',321,'../upload/c90c3c91-6453-4c1a-ab1a-253a006ca459.png;../upload/55e4ea5b-859a-4e58-ba78-42afaeb2d52f.jpg'),(37,'312qwe','321',2,1,'2019-12-08','2019-12-21','321',321,'../upload/edaa742a-8147-4a06-b2ab-949dfba810a8.png;../upload/0d825d93-e252-4624-83bc-768bca0e83f6.jpg;../upload/f7cfb206-0fa0-495d-9ed8-cdb067c87598.png'),(38,'测试数据','3',2,1,'2019-12-05','2019-12-14','测试数据',3,'../upload/db7482c8-adf5-4e5c-9adf-387468dcabc7.png'),(39,'测试数据445','',2,2,'2019-12-08','2019-12-15','测试数据',3,'../upload/fa180ec8-c368-46b9-a9f0-8fbd847baf2e.png'),(40,'test','wae',2,10,'2019-11-30','2019-12-08','test',3,'../upload/bdf0e30b-a12b-497b-ac68-b115db8c0cdc.png'),(41,'测试数据','12',1,1,'2019-12-21','2019-12-28','测试数据',3,'../upload/8afd0dbb-329b-41c9-84ec-9aa24608050f.png;../upload/c4502319-b9c7-4cd4-bc1e-572d1e5dd025.jpg;../upload/e7b00a1b-a28b-44ae-bac4-97fc0d88321a.png'),(42,'校园物理比赛','ajdiojadjiao',1,10,'2019-12-08','2019-12-15','大学生活动中心',4300,'../upload/b72d0bf7-cdbb-41ea-935d-0083812faee4.jpg;../upload/a87c2a8b-e174-42ec-9362-104c3a31b908.png;../upload/a58a393f-a633-424a-b4f7-564ff4866673.png');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `association`
--

DROP TABLE IF EXISTS `association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `association` (
  `associationId` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `ownerId` int(11) NOT NULL,
  `description` text,
  `name` varchar(20) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `associationstatus` int(11) DEFAULT '0',
  `signatureActivity` int(11) DEFAULT NULL,
  PRIMARY KEY (`associationId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `association`
--

LOCK TABLES `association` WRITE;
/*!40000 ALTER TABLE `association` DISABLE KEYS */;
INSERT INTO `association` VALUES (1,'2019-12-02',1,1,'篮球协会','欢迎各位参加篮球协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,41),(2,'2019-12-05',2,14040406,'我是航模协会','航模协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,5),(3,'2019-12-01',1,14040407,'吉他协会','吉他协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,6),(4,'2019-12-08',3,15050502,'为了公益前行','红十字协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(5,'2019-06-04',1,15050503,'拉丁舞全国冠军','拉丁舞协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(6,'2019-12-05',1,15050504,'这就是街舞','街舞协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,4),(7,'2019-12-13',1,15050505,'乒乓球协会','欢迎','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(8,'2019-12-13',1,15050506,'滑板协会','滑板协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(9,'2019-12-20',1,15050507,'武术协会','武术协会','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(10,'2019-12-06',2,14040404,'物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会物理协会','物理社团','upload/5069283b-4384-4570-851a-3dfc3b0cbebf.jpg',1,NULL),(12,'2019-12-16',2,17070709,'大家好','辩论社','upload/bdcfdd5e-c136-4dad-afe1-b34e30500924.jpg',1,NULL);
/*!40000 ALTER TABLE `association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associationmember`
--

DROP TABLE IF EXISTS `associationmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associationmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `associationId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associationmember`
--

LOCK TABLES `associationmember` WRITE;
/*!40000 ALTER TABLE `associationmember` DISABLE KEYS */;
INSERT INTO `associationmember` VALUES (1,1,1,1,'大家好，我是赵篮球。获得过***********************************'),(2,14040406,2,1,'大家好，我是赵航模。获得过***********************************'),(3,14040407,3,1,'大家好，我是赵吉他。获得过***********************************'),(4,15050502,4,1,'大家好，我是赵红石。获得过***********************************'),(5,15050503,5,1,'大家好，我是赵拉丁。获得过***********************************'),(6,15050504,6,1,'大家好，我是赵街舞。获得过***********************************'),(7,15050505,7,1,'大家好，我是赵乒乓。获得过***********************************'),(8,15050506,8,1,'大家好，我是赵滑板。获得过***********************************'),(9,15050507,9,1,'大家好，我是赵武术。获得过***********************************'),(10,14040404,10,1,'。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得大家好，我是赵物理。获得'),(12,16060601,10,2,'你好，我是钱物理。物理是sadasdasda'),(13,16060602,10,2,'你好，我是钱物理2。物理是sadasdasda'),(14,16060603,10,3,'同学们好，我是孙物理1'),(15,16060604,10,3,'同学们好，我是孙物理2'),(16,16060605,10,3,'同学们好，我是孙物理3');
/*!40000 ALTER TABLE `associationmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'我是第1条新闻','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','2019-12-05'),(2,'我是第2条新闻','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','2019-12-20'),(3,'我是第3条新闻','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','2019-12-28'),(4,'我是第4条新闻','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','2019-12-18'),(5,'我是第5条新闻','测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据','2019-12-01'),(6,'测试数据6','123','2019-12-16'),(7,'我是第七条新闻','哇额哇饿','2019-12-16');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `password` char(16) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123',1),(13030303,'123',0),(14040404,'123',2),(14040405,'123',2),(14040406,'123',2),(14040407,'123',2),(14040409,'123',0),(15050502,'123',2),(15050503,'123',2),(15050504,'123',2),(15050505,'123',2),(15050506,'123',2),(15050507,'123',2),(16060601,'123',0),(16060602,'123',0),(16060603,'123',0),(16060604,'123',0),(16060605,'123',0),(16060607,'123',0),(16060608,'123',0),(17070707,'123',0),(17070708,'123',0);
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

-- Dump completed on 2019-12-27 21:54:08
