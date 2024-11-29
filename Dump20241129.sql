-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wechatspring
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friend_relationship`
--

DROP TABLE IF EXISTS `friend_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_relationship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id1` varchar(20) NOT NULL,
  `user_id2` varchar(20) NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id1` (`user_id1`),
  KEY `user_id2` (`user_id2`),
  CONSTRAINT `friend_relationship_ibfk_1` FOREIGN KEY (`user_id1`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `friend_relationship_ibfk_2` FOREIGN KEY (`user_id2`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_user_id_order` CHECK ((`user_id1` < `user_id2`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_relationship`
--

LOCK TABLES `friend_relationship` WRITE;
/*!40000 ALTER TABLE `friend_relationship` DISABLE KEYS */;
INSERT INTO `friend_relationship` VALUES (1,'001','002',20241110171946),(2,'001','003',20241110171946),(3,'001','004',20241110171946),(4,'002','004',20241110171946),(5,'001','005',20241110171946),(6,'001','006',20241110171946),(7,'001','007',20241110171946),(8,'002','005',20241110171946),(9,'001','008',20241110171946),(10,'001','009',20241110171946);
/*!40000 ALTER TABLE `friend_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_chat_message`
--

DROP TABLE IF EXISTS `private_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private_chat_message` (
  `message_id` bigint NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(20) NOT NULL,
  `receiver_id` varchar(20) NOT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `timestamp` bigint NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `private_chat_message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `private_chat_message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_chat_message`
--

LOCK TABLES `private_chat_message` WRITE;
/*!40000 ALTER TABLE `private_chat_message` DISABLE KEYS */;
INSERT INTO `private_chat_message` VALUES (6,'001','002','我是前端','empty',1731063245409),(7,'002','001','你好','empty',1731143089606),(10,'002','001','大家我ID好几','empty',1731150882008),(11,'001','002','Jo的我觉得','empty',1731151191216),(12,'001','002','今天天气好啊','empty',1731151321140),(13,'001','002','123','empty',1731151336399),(14,'001','002','这不错','empty',1731151531258),(15,'001','002','?','empty',1731315824121),(18,'001','003','你好啊','empty',1731319025632),(19,'001','002','往往','empty',1731330408396),(20,'002','001','哈喽','empty',1731330694565),(21,'001','002','你好呀','empty',1731331474922),(22,'001','002','真不错','empty',1731332526074),(24,'001','002','力量','empty',1731468324049),(25,'001','002','623','empty',1731468383720),(26,'001','002','泼皮','empty',1731468749591),(31,'001','002','[图片]','http://10.0.2.2:9090/1731495377703_image.jpg',1731495377458),(32,'001','002','[图片]','http://10.0.2.2:9090/1731495391029_image.jpg',1731495390778),(33,'001','002','[图片]','http://10.0.2.2:9090/1731495435747_image.jpg',1731495435495),(34,'001','002','[图片]','http://10.0.2.2:9090/1731495667845_image.jpg',1731495667608),(35,'001','002','eeee','empty',1731496293250),(36,'001','002','tui','empty',1731503981455),(37,'001','002','loop','empty',1731504322050),(38,'001','002','4848','empty',1731504417736),(39,'001','002','trw','empty',1731504460788),(40,'002','001','yyy','empty',1731505008849),(41,'001','002','wop','empty',1731504975408),(42,'001','002','adasd','empty',1731505226391),(43,'002','001','jk','empty',1731505324823),(44,'002','001','rdss','empty',1731505327544),(45,'001','002','[图片]','http://10.0.2.2:9090/1731505336314_image.jpg',1731505336188),(46,'002','001','zhenhao','empty',1731505427815),(47,'001','002','[图片]','http://10.0.2.2:9090/1731654125538_image.jpg',1731654125726),(48,'001','004','你好啊','empty',1732102775420),(49,'001','004','你也好啊','empty',1732102797079),(50,'004','001','?','empty',1732102822076),(51,'001','004','[图片]','http://10.0.2.2:9090/1732102831285_image.jpg',1732102830918),(52,'004','002','?','empty',1732102973634),(53,'001','002','哈哈哈','empty',1732104771637),(54,'001','004','？','empty',1732104778793),(55,'001','002','这样吗','empty',1732104799347),(56,'002','001','[图片]','http://10.0.2.2:9090/1732106365469_image.jpg',1732106364432),(57,'002','004','，，','empty',1732106575633),(58,'002','004','123','empty',1732106603333),(59,'002','001','?','empty',1732106723361),(60,'001','002','1','empty',1732707623778),(61,'002','001','2','empty',1732707628799),(62,'002','001','[图片]','http://10.0.2.2:9090/1732707928330_image.jpg',1732707928666),(63,'002','001','123','empty',1732708408021),(64,'001','002','456','empty',1732708415189),(65,'001','002','[图片]','http://10.0.2.2:9090/1732708428414_image.jpg',1732708428277),(66,'002','001','[图片]','http://10.0.2.2:9090/1732708438368_image.jpg',1732708438329),(67,'002','005','[图片]','http://10.0.2.2:9090/1732708788331_image.jpg',1732708788283),(68,'001','005','什么时候的事','empty',1732708814789),(69,'001','006','我怎么不知道','empty',1732708820920),(70,'001','007','没听明白','empty',1732708827895),(71,'001','008','明天出来玩吗','empty',1732708837278),(72,'001','009','[图片]','http://10.0.2.2:9090/1732708843776_image.jpg',1732708843562),(73,'001','002','1','empty',1732709040421),(74,'002','001','2','empty',1732709045599),(75,'002','001','[图片]','http://10.0.2.2:9090/1732709057612_image.jpg',1732709057826),(76,'001','002','[图片]','http://10.0.2.2:9090/1732709066201_image.jpg',1732709065852),(77,'001','003','111','empty',1732709141936),(78,'001','002','001','empty',1732709381823),(79,'002','001','002','empty',1732709387260),(80,'002','001','[图片]','http://10.0.2.2:9090/1732709406718_image.jpg',1732709406385),(81,'001','002','[图片]','http://10.0.2.2:9090/1732709419542_image.jpg',1732709419936),(82,'001','003','[图片]','http://10.0.2.2:9090/1732709439854_image.jpg',1732709440222),(83,'001','003','123','empty',1732709443351),(84,'003','001','收到了','empty',1732709473545),(85,'001','002','你好我是张三','empty',1732710043672),(86,'002','001','你好啊我是李四','empty',1732710054740),(87,'001','002','[图片]','http://10.0.2.2:9090/1732710077336_image.jpg',1732710077600),(88,'002','001','[图片]','http://10.0.2.2:9090/1732710092902_image.jpg',1732710092917),(89,'001','003','我是张三，我给你发送历史消息','empty',1732710132791),(90,'001','003','[图片]','http://10.0.2.2:9090/1732710136886_image.jpg',1732710137143),(91,'003','001','收到你的消息','empty',1732710171466);
/*!40000 ALTER TABLE `private_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('001','张三','001.jpg','2024-11-08 04:30:00','789'),('002','李四','002.jpg','2024-11-08 04:30:00','456'),('003','王五','003.jpg','2024-11-08 04:30:00','123'),('004','老刘','004.jpg','2024-11-08 04:30:00','110'),('005','老唐','005.jpg','2024-11-08 04:30:00','110'),('006','老习','006.jpg','2024-11-08 04:30:00','110'),('007','老吴','007.jpg','2024-11-08 04:30:00','110'),('008','老魏','008.jpg','2024-11-08 04:30:00','110'),('009','老徐','009.jpg','2024-11-08 04:30:00','110');
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

-- Dump completed on 2024-11-29 21:08:17
