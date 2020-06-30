-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: comoencasa
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `cartNumber` int(10) unsigned NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `idCart` int(10) unsigned NOT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idSeller` (`idSeller`),
  KEY `idCart` (`idCart`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`),
  CONSTRAINT `cartItem_ibfk_3` FOREIGN KEY (`idCart`) REFERENCES `cart` (`id`),
  CONSTRAINT `cartItem_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Desayuno',NULL,'2020-06-25 23:25:04',NULL),(2,'Almuerzo',NULL,'2020-06-25 23:28:07',NULL),(3,'Merienda',NULL,'2020-06-25 23:28:22',NULL),(4,'Cena',NULL,'2020-06-25 23:28:22',NULL),(5,'snack',NULL,'2020-06-26 19:03:11',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `idSeller` (`idSeller`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,0) NOT NULL,
  `img` varchar(255) NOT NULL,
  `idSeller` int(10) unsigned NOT NULL,
  `idCategory` int(10) unsigned NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idCategory` (`idCategory`),
  KEY `idUser` (`idSeller`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`idSeller`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Floyd','5 Kings Lane',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,4,NULL,'2020-06-26 16:25:34',NULL),(2,'Rozele','6 American Lane',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,4,NULL,'2020-06-26 16:25:34',NULL),(3,'Herbert','5 Morning Center',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,1,NULL,'2020-06-26 16:25:34',NULL),(4,'Tina','2 Eastlawn Way',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,3,NULL,'2020-06-26 16:25:34',NULL),(5,'Marchelle','9 Ludington Lane',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,3,NULL,'2020-06-26 16:25:34',NULL),(6,'Demetris','52 Mifflin Avenue',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,2,NULL,'2020-06-26 16:25:34',NULL),(7,'Thorndike','06 Mayfield Hill',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,3,NULL,'2020-06-26 16:25:34',NULL),(8,'Elyssa','3230 Armistice Avenue',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,4,NULL,'2020-06-26 16:25:34',NULL),(9,'Rica','4590 Killdeer Center',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,2,NULL,'2020-06-26 16:25:34',NULL),(10,'Salome','248 Carpenter Court',0,'https://chequeado.com/wp-content/plugins/accelerated-mobile-pages/images/SD-default-image.png',1,2,NULL,'2020-06-26 16:25:34',NULL),(50,'Tostado','Jamon y queso',125,'img-1593370536503.png',4,1,NULL,'2020-06-28 18:55:36','2020-06-28 18:55:36'),(51,'Tarta de pollo','Tarta hojaldrada de pollo condimentado con chorizo colorado y azafrán',250,'img-1593380160739.png',4,2,NULL,'2020-06-28 21:36:00','2020-06-28 21:36:00'),(52,'Hamburguesas caseras','Hamburguesa de rost beef de 150g con queso chedar, cebolla crispy y pepinos frescos',300,'img-1593380260346.png',4,2,NULL,'2020-06-28 21:37:40','2020-06-28 21:37:40'),(53,'Torta de Chocolate','Buzcochuelo riki riki',1000,'img-1593380347402.png',4,3,NULL,'2020-06-28 21:39:07','2020-06-28 21:39:07'),(54,'Pollo al espiedo','Poio',150000,'img-1593380472482.png',4,4,NULL,'2020-06-28 21:41:12','2020-06-28 21:41:12'),(55,'Vino tinto','Malbec, bodega mendoza 2010',2500,'img-1593384608307.png',2,2,NULL,'2020-06-28 22:50:08','2020-06-28 22:50:08'),(56,'Pancakes','Pancakes de chocolate bien riki',250,'img-1593386806941.png',10,3,NULL,'2020-06-28 23:26:46','2020-06-28 23:26:46'),(57,'Empanada Gallega','Rica tarta de pollo con azafran y chorizo coloreta',1500,'img-1593387989821.png',11,4,NULL,'2020-06-28 23:46:29','2020-06-28 23:46:29'),(58,'a','123456',1200,'img-1593388363588.png',2,2,NULL,'2020-06-28 23:52:43','2020-06-28 23:52:43');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` tinyint(4) DEFAULT '0',
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jere@gmail.com','$2a$10$GUKtoj6a8YpuYAD6k5ba5uM3r6pTRIw0zAJs.BuV0FCZ7BF6DIts.',0,NULL,'2020-06-24 00:59:06','2020-06-24 00:59:06','Jeremias'),(2,'lmarelli17@gmail.com','$2a$10$RqfKPq9GC4Untf37LFgPRuUg114WZL07njQjht0MQETzbkPrcySDK',0,NULL,'2020-06-24 17:40:15','2020-06-24 17:40:15','Leandro'),(3,'mili@gmail.com','$2a$10$os5qw02Z09yzaHE4EW.MPu7vYokoLw5dDchnGS77e6ZatH4HIwQ9C',0,NULL,'2020-06-24 19:59:22','2020-06-24 19:59:22','Milagros'),(4,'lma@gmail.com','$2a$10$1JJ72i.ybyjuo6fgcW2eE.iorfeU8akDgXkIUxSylRA2CMFFdc2sm',0,NULL,'2020-06-25 02:58:29','2020-06-25 02:58:29','Leandro'),(5,'lmaasdf@gmail.com','$2a$10$aRKOfJRH/4DvvowExc/R3uJ16yhr2KvDgo9Fvy6HmWo8AObhNidGu',0,NULL,'2020-06-25 04:22:27','2020-06-25 04:22:27','Leandro'),(6,'juli@gmail.com','$2a$10$3wlHV3Rvw7jPDhHAm4i70Olvhl4dxa9lRhBzj7tCueZoFQsMb49cC',0,NULL,'2020-06-26 02:20:31','2020-06-26 02:20:31','Julian'),(8,'micho@gmail.com','$2a$10$CR2Za.WHD7KbYYWwTWZmHuuBlhE.N906CAVKFxK//VZKGWYkCaAo2',0,NULL,'2020-06-26 22:55:56','2020-06-26 22:55:56','Leandro'),(9,'seba@gmail.com','$2a$10$D1c6ilBQn4DslE47UYR9E.htsd/bDJdEdhdme6LGfJ93k7EgKqn76',0,NULL,'2020-06-27 20:34:29','2020-06-27 20:34:29','Sebita'),(10,'luk@gmail.com','$2a$10$xtuo3Q8gpY48VPPW0rL6LOsebKAH0HzT2k/12glnkn1pC86gPxxMm',0,NULL,'2020-06-28 23:25:44','2020-06-28 23:25:44','Luquitas'),(11,'karina@gmail.com','$2a$10$vICrWWBju9S.pOhRyyxuQO/c.7JS0yd37JUQ1bsV5GG.6KWye1I4e',0,NULL,'2020-06-28 23:44:11','2020-06-28 23:44:11','Karina');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 15:12:01
