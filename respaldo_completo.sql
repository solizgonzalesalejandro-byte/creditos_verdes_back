-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billetera`
--

DROP TABLE IF EXISTS `billetera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billetera` (
  `idbilletera` int NOT NULL AUTO_INCREMENT,
  `saldoActual` decimal(14,2) NOT NULL DEFAULT '0.00',
  `saldoRetenido` decimal(14,2) NOT NULL DEFAULT '0.00',
  `fechaUltima` datetime DEFAULT NULL,
  PRIMARY KEY (`idbilletera`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billetera`
--

LOCK TABLES `billetera` WRITE;
/*!40000 ALTER TABLE `billetera` DISABLE KEYS */;
INSERT INTO `billetera` VALUES (8,159.01,590.00,'2025-12-28 01:33:45'),(9,175.00,0.00,'2025-12-27 18:00:35'),(10,11.00,0.00,'2025-12-27 18:54:42'),(11,249.00,235.00,'2025-12-27 23:11:55');
/*!40000 ALTER TABLE `billetera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_acceso`
--

DROP TABLE IF EXISTS `bitacora_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_acceso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `exito` tinyint(1) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_acceso`
--

LOCK TABLES `bitacora_acceso` WRITE;
/*!40000 ALTER TABLE `bitacora_acceso` DISABLE KEYS */;
INSERT INTO `bitacora_acceso` VALUES (1,'alejadro','','',0,'Credenciales inválidas','2025-12-27 19:07:05'),(2,'alejadro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:07:05'),(3,'alejadro soliz','','',0,'Credenciales inválidas','2025-12-27 19:07:10'),(4,'alejadro soliz','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:07:10'),(5,'alejandro soliz','','',0,'Credenciales inválidas','2025-12-27 19:07:16'),(6,'alejandro soliz','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:07:16'),(7,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:07:33'),(8,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:07:33'),(9,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:07:38'),(10,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:07:38'),(11,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:07:41'),(12,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:07:41'),(13,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:07:48'),(14,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:07:48'),(15,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:07:51'),(16,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:07:51'),(17,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:23'),(18,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:23'),(19,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:28'),(20,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:28'),(21,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:28'),(22,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:28'),(23,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:28'),(24,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:28'),(25,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:29'),(26,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:29'),(27,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:29'),(28,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:29'),(29,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:29'),(30,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:29'),(31,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:47'),(32,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:47'),(33,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:08:48'),(34,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:08:48'),(35,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:29:53'),(36,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:29:53'),(37,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:00'),(38,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:00'),(39,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:01'),(40,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:01'),(41,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:01'),(42,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:01'),(43,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(44,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(45,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(46,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(47,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(48,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(49,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(50,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(51,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(52,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(53,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(54,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(55,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(56,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(57,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:02'),(58,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:02'),(59,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(60,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(61,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(62,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(63,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(64,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(65,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(66,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(67,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(68,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(69,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:03'),(70,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:03'),(71,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:16'),(72,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:16'),(73,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:16'),(74,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:16'),(75,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:16'),(76,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:16'),(77,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(78,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(79,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(80,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(81,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(82,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(83,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(84,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(85,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(86,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(87,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:17'),(88,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:17'),(89,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:18'),(90,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:18'),(91,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:18'),(92,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:18'),(93,'alejandro','','',0,'Credenciales inválidas','2025-12-27 19:30:18'),(94,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',0,'Usuario o contraseña incorrectos','2025-12-27 19:30:18'),(95,'alejandro','','',0,'Roles no autorizados','2025-12-27 19:33:27'),(96,'alejandro','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:33:27'),(97,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:16'),(98,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:16'),(99,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:16'),(100,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:16'),(101,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:17'),(102,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:17'),(103,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:17'),(104,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:17'),(105,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:17'),(106,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:17'),(107,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:17'),(108,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:17'),(109,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(110,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(111,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(112,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(113,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(114,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(115,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(116,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(117,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(118,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(119,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(120,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(121,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(122,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(123,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:18'),(124,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:18'),(125,'miktejere','','',0,'Roles no autorizados','2025-12-27 19:34:19'),(126,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',0,'No tienes los roles requeridos','2025-12-27 19:34:19'),(127,'miktejere','','',1,'Login OK','2025-12-27 19:36:45'),(128,'miktejere','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36 Edg/143.0.0.0',1,'Login OK','2025-12-27 19:36:45'),(129,'alejandro','','',1,'Login OK','2025-12-27 22:34:08'),(130,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',1,'Login OK','2025-12-27 22:34:08'),(131,'alejandro','','',1,'Login OK','2025-12-27 23:31:33'),(132,'alejandro','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0',1,'Login OK','2025-12-27 23:31:33');
/*!40000 ALTER TABLE `bitacora_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_billetera`
--

DROP TABLE IF EXISTS `bitacora_billetera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_billetera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billetera_id` int NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `detalle` text,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `billetera_id` (`billetera_id`),
  CONSTRAINT `bitacora_billetera_ibfk_1` FOREIGN KEY (`billetera_id`) REFERENCES `billetera` (`idbilletera`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_billetera`
--

LOCK TABLES `bitacora_billetera` WRITE;
/*!40000 ALTER TABLE `bitacora_billetera` DISABLE KEYS */;
INSERT INTO `bitacora_billetera` VALUES (2,8,'bono','monto=5.00, desc=\"Bono de bienvenida por suscripción\"','2025-12-27 15:31:32'),(3,9,'bono','monto=5.00, desc=\"Bono de bienvenida por suscripción\"','2025-12-27 17:35:33'),(4,8,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=1)\"','2025-12-27 17:58:22'),(5,8,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=1\"','2025-12-27 17:58:24'),(6,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=2)\"','2025-12-27 17:58:43'),(7,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=2\"','2025-12-27 17:58:45'),(8,8,'suscripcion','monto=49.99, desc=\"Compra suscripción 1 mes(es) - cobro automatico\"','2025-12-27 17:58:52'),(9,9,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=3)\"','2025-12-27 18:00:27'),(10,9,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=3\"','2025-12-27 18:00:28'),(11,9,'recarga_compra_creditos','monto=30.00, desc=\"Compra de 30.00 cred. (compra id=4)\"','2025-12-27 18:00:34'),(12,9,'recarga_compra_creditos','monto=30.00, desc=\"Confirmación compra id=4\"','2025-12-27 18:00:35'),(13,8,'retencion','monto=20.00, desc=\"Retención para intercambio #2\", intercambio_id=2','2025-12-27 18:26:23'),(14,8,'retencion','monto=20.00, desc=\"Retencion para intercambio #3\", intercambio_id=3','2025-12-27 18:29:14'),(15,8,'retencion','monto=20.00, desc=\"Retencion para intercambio #4\", intercambio_id=4','2025-12-27 18:31:49'),(16,8,'retencion','monto=20.00, desc=\"Retencion para intercambio #5\", intercambio_id=5','2025-12-27 18:36:19'),(17,10,'bono','monto=5.00, desc=\"Bono de bienvenida por suscripción\"','2025-12-27 18:50:37'),(18,11,'bono','monto=5.00, desc=\"Bono de bienvenida por suscripción\"','2025-12-27 19:09:26'),(19,11,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=5)\"','2025-12-27 20:00:31'),(20,11,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=5\"','2025-12-27 20:00:33'),(21,11,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=6)\"','2025-12-27 20:00:39'),(22,11,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=6\"','2025-12-27 20:00:40'),(23,11,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=7)\"','2025-12-27 20:00:45'),(24,11,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=7\"','2025-12-27 20:00:47'),(25,11,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=8)\"','2025-12-27 20:00:50'),(26,11,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=8\"','2025-12-27 20:00:51'),(27,11,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=9)\"','2025-12-27 20:01:06'),(28,11,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=9\"','2025-12-27 20:01:07'),(29,11,'retencion','monto=20.00, desc=\"Retencion para intercambio #6\", intercambio_id=6','2025-12-27 20:01:22'),(30,11,'retencion','monto=50.00, desc=\"Retencion para intercambio #7\", intercambio_id=7','2025-12-27 20:03:56'),(31,11,'retencion','monto=50.00, desc=\"Retencion para intercambio #8\", intercambio_id=8','2025-12-27 20:05:06'),(32,11,'retencion','monto=20.00, desc=\"Retencion para intercambio #9\", intercambio_id=9','2025-12-27 20:14:25'),(33,9,'pago','monto=20.00, desc=\"Pago de intercambio #9\"','2025-12-27 20:14:25'),(34,11,'liberacion','monto=20.00, desc=\"Liberación de retención intercambio #9\"','2025-12-27 20:14:25'),(35,11,'retencion','monto=20.00, desc=\"Retencion para intercambio #10\", intercambio_id=10','2025-12-27 20:24:04'),(36,9,'pago','monto=20.00, desc=\"Pago de intercambio #10\"','2025-12-27 20:24:04'),(37,11,'liberacion','monto=20.00, desc=\"Liberación de retención intercambio #10\"','2025-12-27 20:24:04'),(38,11,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=10)\"','2025-12-27 20:25:34'),(39,11,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=10\"','2025-12-27 20:25:35'),(40,11,'recarga_compra_creditos','monto=30.00, desc=\"Compra de 30.00 cred. (compra id=11)\"','2025-12-27 22:32:58'),(41,11,'recarga_compra_creditos','monto=30.00, desc=\"Confirmación compra id=11\"','2025-12-27 22:33:00'),(42,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #11\", intercambio_id=11','2025-12-27 22:35:47'),(43,8,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=12)\"','2025-12-27 22:36:50'),(44,8,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=12\"','2025-12-27 22:36:52'),(45,8,'recarga_compra_creditos','monto=30.00, desc=\"Compra de 30.00 cred. (compra id=13)\"','2025-12-27 22:37:46'),(46,8,'recarga_compra_creditos','monto=30.00, desc=\"Confirmación compra id=13\"','2025-12-27 22:37:47'),(47,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #12\", intercambio_id=12','2025-12-27 22:37:57'),(48,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #13\", intercambio_id=13','2025-12-27 22:38:23'),(49,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #14\", intercambio_id=14','2025-12-27 22:38:59'),(50,8,'retencion','monto=45.00, desc=\"Retencion para intercambio #15\", intercambio_id=15','2025-12-27 22:39:25'),(51,8,'retencion','monto=20.00, desc=\"Retencion para intercambio #16\", intercambio_id=16','2025-12-27 22:39:38'),(52,9,'pago','monto=20.00, desc=\"Pago de intercambio #16\"','2025-12-27 22:39:38'),(53,8,'liberacion','monto=20.00, desc=\"Liberación de retención intercambio #16\"','2025-12-27 22:39:38'),(54,11,'retencion','monto=5.00, desc=\"Retencion para intercambio #17\", intercambio_id=17','2025-12-27 23:05:06'),(55,11,'retencion','monto=50.00, desc=\"Retencion para intercambio #18\", intercambio_id=18','2025-12-27 23:05:25'),(56,11,'pago','monto=50.00, desc=\"Pago de intercambio #18\"','2025-12-27 23:05:25'),(57,11,'liberacion','monto=50.00, desc=\"Liberación de retención intercambio #18\"','2025-12-27 23:05:25'),(58,11,'retencion','monto=45.00, desc=\"Retencion para intercambio #19\", intercambio_id=19','2025-12-27 23:05:32'),(59,11,'retencion','monto=5.00, desc=\"Retencion para intercambio #20\", intercambio_id=20','2025-12-27 23:06:29'),(60,11,'retencion','monto=45.00, desc=\"Retencion para intercambio #21\", intercambio_id=21','2025-12-27 23:07:57'),(61,11,'retencion','monto=5.00, desc=\"Retencion para intercambio #22\", intercambio_id=22','2025-12-27 23:08:06'),(62,11,'retencion','monto=5.00, desc=\"Retencion para intercambio #23\", intercambio_id=23','2025-12-27 23:10:42'),(63,11,'retencion','monto=5.00, desc=\"Retencion para intercambio #24\", intercambio_id=24','2025-12-27 23:11:55'),(64,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #25\", intercambio_id=25','2025-12-27 23:32:39'),(65,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #26\", intercambio_id=26','2025-12-27 23:41:21'),(66,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #27\", intercambio_id=27','2025-12-27 23:43:21'),(67,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #28\", intercambio_id=28','2025-12-27 23:44:18'),(68,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #29\", intercambio_id=29','2025-12-27 23:56:49'),(69,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #30\", intercambio_id=30','2025-12-27 23:58:46'),(70,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #31\", intercambio_id=31','2025-12-28 00:00:24'),(71,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=14)\"','2025-12-28 00:18:58'),(72,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=14\"','2025-12-28 00:18:59'),(73,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=15)\"','2025-12-28 00:19:04'),(74,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=15\"','2025-12-28 00:19:05'),(75,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=16)\"','2025-12-28 00:19:08'),(76,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=16\"','2025-12-28 00:19:10'),(77,8,'retencion','monto=20.00, desc=\"Retencion para intercambio #32\", intercambio_id=32','2025-12-28 00:19:22'),(78,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #33\", intercambio_id=33','2025-12-28 00:19:29'),(79,8,'retencion','monto=45.00, desc=\"Retencion para intercambio #34\", intercambio_id=34','2025-12-28 00:19:50'),(80,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=17)\"','2025-12-28 00:20:01'),(81,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=17\"','2025-12-28 00:20:03'),(82,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=18)\"','2025-12-28 00:20:06'),(83,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=18\"','2025-12-28 00:20:08'),(84,8,'recarga_compra_creditos','monto=40.00, desc=\"Compra de 40.00 cred. (compra id=19)\"','2025-12-28 00:20:11'),(85,8,'recarga_compra_creditos','monto=40.00, desc=\"Confirmación compra id=19\"','2025-12-28 00:20:12'),(86,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #35\", intercambio_id=35','2025-12-28 00:21:31'),(87,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #36\", intercambio_id=36','2025-12-28 00:23:00'),(88,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #37\", intercambio_id=37','2025-12-28 00:28:02'),(89,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #38\", intercambio_id=38','2025-12-28 00:28:05'),(90,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #39\", intercambio_id=39','2025-12-28 00:30:46'),(91,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #40\", intercambio_id=40','2025-12-28 00:42:53'),(92,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #41\", intercambio_id=41','2025-12-28 00:43:05'),(93,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #42\", intercambio_id=42','2025-12-28 00:43:38'),(94,8,'retencion','monto=5.00, desc=\"Retencion para intercambio #43\", intercambio_id=43','2025-12-28 00:45:02'),(95,8,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=20)\"','2025-12-28 00:48:33'),(96,8,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=20\"','2025-12-28 00:48:35'),(97,8,'retencion','monto=300.00, desc=\"Retencion para intercambio #44\", intercambio_id=44','2025-12-28 01:07:25'),(98,8,'retencion','monto=10.00, desc=\"Retencion para intercambio #45\", intercambio_id=45','2025-12-28 01:10:27'),(99,8,'recarga_compra_creditos','monto=25.00, desc=\"Compra de 25.00 cred. (compra id=21)\"','2025-12-28 01:33:43'),(100,8,'recarga_compra_creditos','monto=25.00, desc=\"Confirmación compra id=21\"','2025-12-28 01:33:45');
/*!40000 ALTER TABLE `bitacora_billetera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_intercambio`
--

DROP TABLE IF EXISTS `bitacora_intercambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_intercambio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idintercambio` int NOT NULL,
  `estado_old` varchar(45) DEFAULT NULL,
  `estado_new` varchar(45) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idintercambio` (`idintercambio`),
  CONSTRAINT `bitacora_intercambio_ibfk_1` FOREIGN KEY (`idintercambio`) REFERENCES `intercambio` (`idintercambio`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_intercambio`
--

LOCK TABLES `bitacora_intercambio` WRITE;
/*!40000 ALTER TABLE `bitacora_intercambio` DISABLE KEYS */;
INSERT INTO `bitacora_intercambio` VALUES (1,9,'pendiente','finalizado','2025-12-27 20:14:25'),(2,10,'pendiente','finalizado','2025-12-27 20:24:04'),(8,16,'pendiente','finalizado','2025-12-27 22:39:38'),(10,18,'pendiente','finalizado','2025-12-27 23:05:25'),(25,36,'pendiente','finalizado','2025-12-28 00:23:00'),(26,37,'pendiente','finalizado','2025-12-28 00:28:02'),(29,43,'pendiente','finalizado','2025-12-28 00:45:02');
/*!40000 ALTER TABLE `bitacora_intercambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_publicacion`
--

DROP TABLE IF EXISTS `bitacora_publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idpublicacion` int NOT NULL,
  `usuario_id` int NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `detalle` text,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idpublicacion` (`idpublicacion`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `bitacora_publicacion_ibfk_1` FOREIGN KEY (`idpublicacion`) REFERENCES `publicacion` (`idpublicacion`),
  CONSTRAINT `bitacora_publicacion_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_publicacion`
--

LOCK TABLES `bitacora_publicacion` WRITE;
/*!40000 ALTER TABLE `bitacora_publicacion` DISABLE KEYS */;
INSERT INTO `bitacora_publicacion` VALUES (1,8,9,'UPDATE','estado: activa -> inactiva; ','2025-12-27 18:29:14'),(2,9,11,'UPDATE','estado: activa -> inactiva; ','2025-12-27 20:03:56'),(3,16,12,'UPDATE','estado: activa -> inactiva; ','2025-12-27 22:35:47'),(4,18,12,'UPDATE','estado: activa -> inactiva; ','2025-12-27 22:39:25'),(5,10,11,'UPDATE','estado: activa -> inactiva; ','2025-12-28 01:07:25'),(6,19,9,'UPDATE','estado: activa -> inactiva; ','2025-12-28 01:10:27');
/*!40000 ALTER TABLE `bitacora_publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_usuario`
--

DROP TABLE IF EXISTS `bitacora_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `accion` varchar(100) NOT NULL,
  `detalle` text,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `bitacora_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_usuario`
--

LOCK TABLES `bitacora_usuario` WRITE;
/*!40000 ALTER TABLE `bitacora_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_categoria`
--

DROP TABLE IF EXISTS `catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_categoria` (
  `idcatalogo` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) NOT NULL,
  `tipoCategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcatalogo`),
  UNIQUE KEY `uk_catalogo_nombre` (`nombreCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_categoria`
--

LOCK TABLES `catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `catalogo_categoria` DISABLE KEYS */;
INSERT INTO `catalogo_categoria` VALUES (7,'Ropa','producto'),(8,'Tecnología','producto'),(9,'Educación','servicio'),(10,'Transporte','servicio'),(11,'Hogar','producto'),(12,'Servicios','servicio');
/*!40000 ALTER TABLE `catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `publicacion_id` int NOT NULL,
  `tablaEquivalencia_id` int NOT NULL,
  `catalogo_id` int NOT NULL,
  `cantidadUnidad` decimal(14,4) DEFAULT NULL COMMENT 'Cantidad de unidades de la equivalencia asociada a esta publicación (ej: kg_plastico, kWh_solar, etc.)',
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `uq_categoria_pub_cat_eq` (`publicacion_id`,`catalogo_id`,`tablaEquivalencia_id`),
  KEY `publicacion_id` (`publicacion_id`),
  KEY `tablaEquivalencia_id` (`tablaEquivalencia_id`),
  KEY `catalogo_id` (`catalogo_id`),
  KEY `ix_categoria_catalogo_pub` (`catalogo_id`,`publicacion_id`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`idpublicacion`) ON DELETE CASCADE,
  CONSTRAINT `categoria_ibfk_2` FOREIGN KEY (`tablaEquivalencia_id`) REFERENCES `tabla_equivalencia` (`idtablaEquivalencia`) ON DELETE RESTRICT,
  CONSTRAINT `categoria_ibfk_3` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo_categoria` (`idcatalogo`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (7,7,8,8,1.0000),(8,8,8,11,2.0000),(9,9,7,8,2.0000),(10,10,7,8,3.5000),(11,16,6,11,1.5000),(12,17,8,8,10.0000),(13,18,7,9,3.5000),(14,19,6,11,2.0000);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_credito`
--

DROP TABLE IF EXISTS `compra_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_credito` (
  `idcompra` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `montoBs` decimal(14,2) NOT NULL,
  `creditosComprados` decimal(14,2) NOT NULL,
  `fechaCompra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metodoPago` varchar(50) DEFAULT 'tarjeta',
  PRIMARY KEY (`idcompra`),
  KEY `fk_compra_usuario` (`usuario_id`),
  KEY `ix_compra_fecha` (`fechaCompra`),
  KEY `ix_compra_metodo` (`metodoPago`),
  CONSTRAINT `fk_compra_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_credito`
--

LOCK TABLES `compra_credito` WRITE;
/*!40000 ALTER TABLE `compra_credito` DISABLE KEYS */;
INSERT INTO `compra_credito` VALUES (1,9,25.00,25.00,'2025-12-27 17:58:24','pago_marketplace'),(2,9,40.00,40.00,'2025-12-27 17:58:45','pago_marketplace'),(3,10,25.00,25.00,'2025-12-27 18:00:28','pago_marketplace'),(4,10,30.00,30.00,'2025-12-27 18:00:35','pago_marketplace'),(5,12,25.00,25.00,'2025-12-27 20:00:33','pago_marketplace'),(6,12,40.00,40.00,'2025-12-27 20:00:40','pago_marketplace'),(7,12,40.00,40.00,'2025-12-27 20:00:47','pago_marketplace'),(8,12,40.00,40.00,'2025-12-27 20:00:51','pago_marketplace'),(9,12,40.00,40.00,'2025-12-27 20:01:07','pago_marketplace'),(10,12,40.00,40.00,'2025-12-27 20:25:35','pago_marketplace'),(11,12,30.00,30.00,'2025-12-27 22:33:00','pago_marketplace'),(12,9,25.00,25.00,'2025-12-27 22:36:52','pago_marketplace'),(13,9,30.00,30.00,'2025-12-27 22:37:47','pago_marketplace'),(14,9,40.00,40.00,'2025-12-28 00:18:59','pago_marketplace'),(15,9,40.00,40.00,'2025-12-28 00:19:05','pago_marketplace'),(16,9,40.00,40.00,'2025-12-28 00:19:10','pago_marketplace'),(17,9,40.00,40.00,'2025-12-28 00:20:03','pago_marketplace'),(18,9,40.00,40.00,'2025-12-28 00:20:08','pago_marketplace'),(19,9,40.00,40.00,'2025-12-28 00:20:12','pago_marketplace'),(20,9,25.00,25.00,'2025-12-28 00:48:35','pago_marketplace'),(21,9,25.00,25.00,'2025-12-28 01:33:45','pago_marketplace');
/*!40000 ALTER TABLE `compra_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custodio_credito`
--

DROP TABLE IF EXISTS `custodio_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custodio_credito` (
  `idcustodioCredito` int NOT NULL AUTO_INCREMENT,
  `billetera_id` int NOT NULL,
  `montoCustodio` decimal(14,2) NOT NULL,
  `estado` enum('retenido','liberado','cancelado') NOT NULL DEFAULT 'retenido',
  `fechaRetenido` datetime DEFAULT NULL,
  `fechaLiberado` datetime DEFAULT NULL,
  PRIMARY KEY (`idcustodioCredito`),
  KEY `fk_custodio_billetera` (`billetera_id`),
  KEY `ix_custodio_estado_billetera` (`estado`,`billetera_id`),
  CONSTRAINT `fk_custodio_billetera` FOREIGN KEY (`billetera_id`) REFERENCES `billetera` (`idbilletera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custodio_credito`
--

LOCK TABLES `custodio_credito` WRITE;
/*!40000 ALTER TABLE `custodio_credito` DISABLE KEYS */;
INSERT INTO `custodio_credito` VALUES (2,8,20.00,'liberado','2025-12-27 18:26:23','2025-12-27 22:39:38'),(3,8,20.00,'liberado','2025-12-27 18:29:14','2025-12-27 22:39:38'),(4,8,20.00,'liberado','2025-12-27 18:31:49','2025-12-27 22:39:38'),(5,8,20.00,'liberado','2025-12-27 18:36:19','2025-12-27 22:39:38'),(6,11,20.00,'liberado','2025-12-27 20:01:22','2025-12-27 20:24:04'),(7,11,50.00,'liberado','2025-12-27 20:03:56','2025-12-27 23:05:25'),(8,11,50.00,'liberado','2025-12-27 20:05:06','2025-12-27 23:05:25'),(9,11,20.00,'liberado','2025-12-27 20:14:25','2025-12-27 20:24:04'),(10,11,20.00,'liberado','2025-12-27 20:24:04','2025-12-27 20:24:04'),(11,8,5.00,'liberado','2025-12-27 22:35:47','2025-12-28 00:45:02'),(12,8,5.00,'liberado','2025-12-27 22:37:57','2025-12-28 00:45:02'),(13,8,5.00,'liberado','2025-12-27 22:38:23','2025-12-28 00:45:02'),(14,8,5.00,'liberado','2025-12-27 22:38:59','2025-12-28 00:45:02'),(15,8,45.00,'retenido','2025-12-27 22:39:25',NULL),(16,8,20.00,'liberado','2025-12-27 22:39:38','2025-12-27 22:39:38'),(17,11,5.00,'retenido','2025-12-27 23:05:06',NULL),(18,11,50.00,'liberado','2025-12-27 23:05:25','2025-12-27 23:05:25'),(19,11,45.00,'retenido','2025-12-27 23:05:32',NULL),(20,11,5.00,'retenido','2025-12-27 23:06:29',NULL),(21,11,45.00,'retenido','2025-12-27 23:07:57',NULL),(22,11,5.00,'retenido','2025-12-27 23:08:06',NULL),(23,11,5.00,'retenido','2025-12-27 23:10:42',NULL),(24,11,5.00,'retenido','2025-12-27 23:11:55',NULL),(25,8,5.00,'liberado','2025-12-27 23:32:39','2025-12-28 00:45:02'),(26,8,5.00,'liberado','2025-12-27 23:41:21','2025-12-28 00:45:02'),(27,8,5.00,'liberado','2025-12-27 23:43:21','2025-12-28 00:45:02'),(28,8,5.00,'liberado','2025-12-27 23:44:18','2025-12-28 00:45:02'),(29,8,5.00,'liberado','2025-12-27 23:56:49','2025-12-28 00:45:02'),(30,8,5.00,'liberado','2025-12-27 23:58:46','2025-12-28 00:45:02'),(31,8,5.00,'liberado','2025-12-28 00:00:24','2025-12-28 00:45:02'),(32,8,20.00,'retenido','2025-12-28 00:19:22',NULL),(33,8,5.00,'liberado','2025-12-28 00:19:29','2025-12-28 00:45:02'),(34,8,45.00,'retenido','2025-12-28 00:19:50',NULL),(35,8,5.00,'liberado','2025-12-28 00:21:31','2025-12-28 00:45:02'),(36,8,5.00,'liberado','2025-12-28 00:23:00','2025-12-28 00:45:02'),(37,8,5.00,'liberado','2025-12-28 00:28:02','2025-12-28 00:45:02'),(38,8,5.00,'liberado','2025-12-28 00:28:05','2025-12-28 00:45:02'),(39,8,5.00,'liberado','2025-12-28 00:30:46','2025-12-28 00:45:02'),(40,8,5.00,'liberado','2025-12-28 00:42:53','2025-12-28 00:45:02'),(41,8,5.00,'liberado','2025-12-28 00:43:05','2025-12-28 00:45:02'),(42,8,5.00,'liberado','2025-12-28 00:43:38','2025-12-28 00:45:02'),(43,8,5.00,'liberado','2025-12-28 00:45:02','2025-12-28 00:45:02'),(44,8,300.00,'retenido','2025-12-28 01:07:25',NULL),(45,8,10.00,'retenido','2025-12-28 01:10:27',NULL);
/*!40000 ALTER TABLE `custodio_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intercambio`
--

DROP TABLE IF EXISTS `intercambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intercambio` (
  `idintercambio` int NOT NULL AUTO_INCREMENT,
  `usuario_origen_id` int NOT NULL,
  `usuario_destino_id` int NOT NULL,
  `custodioCredito_id` int NOT NULL,
  `creditoVerde` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `estadoIntercam` varchar(45) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaFinal` datetime DEFAULT NULL,
  `publicacion_id` int DEFAULT NULL,
  PRIMARY KEY (`idintercambio`),
  KEY `fk_intercambio_custodio` (`custodioCredito_id`),
  KEY `ix_intercambio_origen` (`usuario_origen_id`),
  KEY `ix_intercambio_destino` (`usuario_destino_id`),
  KEY `ix_intercambio_publicacion` (`publicacion_id`),
  CONSTRAINT `fk_intercambio_custodio` FOREIGN KEY (`custodioCredito_id`) REFERENCES `custodio_credito` (`idcustodioCredito`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_intercambio_publicacion` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`idpublicacion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_intercambio_usuario_destino` FOREIGN KEY (`usuario_destino_id`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_intercambio_usuario_origen` FOREIGN KEY (`usuario_origen_id`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intercambio`
--

LOCK TABLES `intercambio` WRITE;
/*!40000 ALTER TABLE `intercambio` DISABLE KEYS */;
INSERT INTO `intercambio` VALUES (2,9,9,2,2,1,'pendiente','2025-12-27 18:26:23',NULL,NULL),(3,9,9,3,2,1,'pendiente','2025-12-27 18:29:14',NULL,NULL),(4,9,9,4,2,1,'pendiente','2025-12-27 18:31:49',NULL,NULL),(5,9,9,5,2,1,'pendiente','2025-12-27 18:36:19',NULL,NULL),(6,12,9,6,2,1,'pendiente','2025-12-27 20:01:22',NULL,NULL),(7,12,11,7,8,1,'pendiente','2025-12-27 20:03:56',NULL,NULL),(8,12,11,8,8,1,'pendiente','2025-12-27 20:05:06',NULL,NULL),(9,12,9,9,2,1,'finalizado','2025-12-27 20:14:25','2025-12-27 20:14:25',NULL),(10,12,9,10,2,1,'finalizado','2025-12-27 20:24:04','2025-12-27 20:24:04',NULL),(11,9,12,11,9,1,'pendiente','2025-12-27 22:35:47',NULL,NULL),(12,9,12,12,9,1,'pendiente','2025-12-27 22:37:57',NULL,NULL),(13,9,12,13,9,1,'pendiente','2025-12-27 22:38:23',NULL,NULL),(14,9,12,14,9,1,'pendiente','2025-12-27 22:38:59',NULL,NULL),(15,9,12,15,14,1,'pendiente','2025-12-27 22:39:25',NULL,NULL),(16,9,9,16,2,1,'finalizado','2025-12-27 22:39:38','2025-12-27 22:39:38',NULL),(17,12,12,17,9,1,'pendiente','2025-12-27 23:05:06',NULL,NULL),(18,12,11,18,8,1,'finalizado','2025-12-27 23:05:25','2025-12-27 23:05:25',NULL),(19,12,12,19,14,1,'pendiente','2025-12-27 23:05:32',NULL,NULL),(20,12,12,20,9,1,'pendiente','2025-12-27 23:06:29',NULL,NULL),(21,12,12,21,14,1,'pendiente','2025-12-27 23:07:57',NULL,NULL),(22,12,12,22,9,1,'pendiente','2025-12-27 23:08:06',NULL,NULL),(23,12,12,23,9,1,'pendiente','2025-12-27 23:10:42',NULL,NULL),(24,12,12,24,9,1,'pendiente','2025-12-27 23:11:55',NULL,NULL),(25,9,12,25,9,1,'pendiente','2025-12-27 23:32:39',NULL,NULL),(26,9,12,26,9,1,'pendiente','2025-12-27 23:41:21',NULL,NULL),(27,9,12,27,9,1,'pendiente','2025-12-27 23:43:21',NULL,NULL),(28,9,12,28,9,1,'pendiente','2025-12-27 23:44:18',NULL,NULL),(29,9,12,29,9,1,'pendiente','2025-12-27 23:56:49',NULL,NULL),(30,9,12,30,9,1,'pendiente','2025-12-27 23:58:46',NULL,NULL),(31,9,12,31,9,1,'pendiente','2025-12-28 00:00:24',NULL,NULL),(32,9,9,32,2,1,'pendiente','2025-12-28 00:19:22',NULL,NULL),(33,9,12,33,9,1,'pendiente','2025-12-28 00:19:29',NULL,NULL),(34,9,12,34,14,1,'pendiente','2025-12-28 00:19:50',NULL,NULL),(35,9,12,35,9,1,'pendiente','2025-12-28 00:21:31',NULL,NULL),(36,9,12,36,9,1,'finalizado','2025-12-28 00:23:00','2025-12-28 00:23:00',NULL),(37,9,12,37,9,1,'finalizado','2025-12-28 00:28:02','2025-12-28 00:28:02',NULL),(38,9,12,38,9,1,'pendiente','2025-12-28 00:28:05',NULL,NULL),(39,9,12,39,9,1,'pendiente','2025-12-28 00:30:46',NULL,NULL),(40,9,12,40,9,1,'pendiente','2025-12-28 00:42:53',NULL,NULL),(41,9,12,41,9,1,'pendiente','2025-12-28 00:43:05',NULL,NULL),(42,9,12,42,9,1,'pendiente','2025-12-28 00:43:38',NULL,NULL),(43,9,12,43,9,1,'finalizado','2025-12-28 00:45:02','2025-12-28 00:45:02',NULL),(44,9,11,44,14,1,'pendiente','2025-12-28 01:07:25',NULL,NULL),(45,9,9,45,12,1,'pendiente','2025-12-28 01:10:27',NULL,NULL);
/*!40000 ALTER TABLE `intercambio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bitacora_intercambio_estado` AFTER UPDATE ON `intercambio` FOR EACH ROW BEGIN
  IF (NEW.estadoIntercam <> OLD.estadoIntercam) OR (NEW.estadoIntercam IS NULL XOR OLD.estadoIntercam IS NULL) THEN
    INSERT INTO bitacora_intercambio (idintercambio, estado_old, estado_new, fecha)
    VALUES (NEW.idintercambio, OLD.estadoIntercam, NEW.estadoIntercam, NOW());
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimiento_credito`
--

DROP TABLE IF EXISTS `movimiento_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_credito` (
  `idmovimiento_credito` int NOT NULL AUTO_INCREMENT,
  `tipoMovimiento` varchar(45) NOT NULL,
  `monto` decimal(14,2) NOT NULL,
  `fechaMovimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcionMovi` varchar(255) DEFAULT NULL,
  `billetera_id` int NOT NULL,
  `intercambio_id` int DEFAULT NULL,
  PRIMARY KEY (`idmovimiento_credito`),
  KEY `fk_mov_credito_intercambio` (`intercambio_id`),
  KEY `ix_mov_credito_billetera_fecha` (`billetera_id`,`fechaMovimiento`),
  KEY `ix_mov_billetera_tipo_fecha` (`billetera_id`,`tipoMovimiento`,`fechaMovimiento`),
  CONSTRAINT `fk_mov_credito_billetera` FOREIGN KEY (`billetera_id`) REFERENCES `billetera` (`idbilletera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_credito_intercambio` FOREIGN KEY (`intercambio_id`) REFERENCES `intercambio` (`idintercambio`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_credito`
--

LOCK TABLES `movimiento_credito` WRITE;
/*!40000 ALTER TABLE `movimiento_credito` DISABLE KEYS */;
INSERT INTO `movimiento_credito` VALUES (10,'bono',5.00,'2025-12-27 15:31:32','Bono de bienvenida por suscripción',8,NULL),(11,'bono',5.00,'2025-12-27 17:35:33','Bono de bienvenida por suscripción',9,NULL),(12,'recarga_compra_creditos',25.00,'2025-12-27 17:58:22','Compra de 25.00 cred. (compra id=1)',8,NULL),(13,'recarga_compra_creditos',25.00,'2025-12-27 17:58:24','Confirmación compra id=1',8,NULL),(14,'recarga_compra_creditos',40.00,'2025-12-27 17:58:43','Compra de 40.00 cred. (compra id=2)',8,NULL),(15,'recarga_compra_creditos',40.00,'2025-12-27 17:58:45','Confirmación compra id=2',8,NULL),(16,'suscripcion',49.99,'2025-12-27 17:58:52','Compra suscripción 1 mes(es) - cobro automatico',8,NULL),(17,'recarga_compra_creditos',25.00,'2025-12-27 18:00:27','Compra de 25.00 cred. (compra id=3)',9,NULL),(18,'recarga_compra_creditos',25.00,'2025-12-27 18:00:28','Confirmación compra id=3',9,NULL),(19,'recarga_compra_creditos',30.00,'2025-12-27 18:00:34','Compra de 30.00 cred. (compra id=4)',9,NULL),(20,'recarga_compra_creditos',30.00,'2025-12-27 18:00:35','Confirmación compra id=4',9,NULL),(21,'retencion',20.00,'2025-12-27 18:26:23','Retención para intercambio #2',8,2),(22,'retencion',20.00,'2025-12-27 18:29:14','Retencion para intercambio #3',8,3),(23,'retencion',20.00,'2025-12-27 18:31:49','Retencion para intercambio #4',8,4),(24,'retencion',20.00,'2025-12-27 18:36:19','Retencion para intercambio #5',8,5),(25,'bono',5.00,'2025-12-27 18:50:37','Bono de bienvenida por suscripción',10,NULL),(26,'bono',5.00,'2025-12-27 19:09:26','Bono de bienvenida por suscripción',11,NULL),(27,'recarga_compra_creditos',25.00,'2025-12-27 20:00:31','Compra de 25.00 cred. (compra id=5)',11,NULL),(28,'recarga_compra_creditos',25.00,'2025-12-27 20:00:33','Confirmación compra id=5',11,NULL),(29,'recarga_compra_creditos',40.00,'2025-12-27 20:00:39','Compra de 40.00 cred. (compra id=6)',11,NULL),(30,'recarga_compra_creditos',40.00,'2025-12-27 20:00:40','Confirmación compra id=6',11,NULL),(31,'recarga_compra_creditos',40.00,'2025-12-27 20:00:45','Compra de 40.00 cred. (compra id=7)',11,NULL),(32,'recarga_compra_creditos',40.00,'2025-12-27 20:00:47','Confirmación compra id=7',11,NULL),(33,'recarga_compra_creditos',40.00,'2025-12-27 20:00:50','Compra de 40.00 cred. (compra id=8)',11,NULL),(34,'recarga_compra_creditos',40.00,'2025-12-27 20:00:51','Confirmación compra id=8',11,NULL),(35,'recarga_compra_creditos',40.00,'2025-12-27 20:01:06','Compra de 40.00 cred. (compra id=9)',11,NULL),(36,'recarga_compra_creditos',40.00,'2025-12-27 20:01:07','Confirmación compra id=9',11,NULL),(37,'retencion',20.00,'2025-12-27 20:01:22','Retencion para intercambio #6',11,6),(38,'retencion',50.00,'2025-12-27 20:03:56','Retencion para intercambio #7',11,7),(39,'retencion',50.00,'2025-12-27 20:05:06','Retencion para intercambio #8',11,8),(40,'retencion',20.00,'2025-12-27 20:14:25','Retencion para intercambio #9',11,9),(41,'pago',20.00,'2025-12-27 20:14:25','Pago de intercambio #9',9,NULL),(42,'liberacion',20.00,'2025-12-27 20:14:25','Liberación de retención intercambio #9',11,NULL),(43,'retencion',20.00,'2025-12-27 20:24:04','Retencion para intercambio #10',11,10),(44,'pago',20.00,'2025-12-27 20:24:04','Pago de intercambio #10',9,NULL),(45,'liberacion',20.00,'2025-12-27 20:24:04','Liberación de retención intercambio #10',11,NULL),(46,'recarga_compra_creditos',40.00,'2025-12-27 20:25:34','Compra de 40.00 cred. (compra id=10)',11,NULL),(47,'recarga_compra_creditos',40.00,'2025-12-27 20:25:35','Confirmación compra id=10',11,NULL),(48,'recarga_compra_creditos',30.00,'2025-12-27 22:32:58','Compra de 30.00 cred. (compra id=11)',11,NULL),(49,'recarga_compra_creditos',30.00,'2025-12-27 22:33:00','Confirmación compra id=11',11,NULL),(50,'retencion',5.00,'2025-12-27 22:35:47','Retencion para intercambio #11',8,11),(52,'recarga_compra_creditos',25.00,'2025-12-27 22:36:50','Compra de 25.00 cred. (compra id=12)',8,NULL),(53,'recarga_compra_creditos',25.00,'2025-12-27 22:36:52','Confirmación compra id=12',8,NULL),(54,'recarga_compra_creditos',30.00,'2025-12-27 22:37:46','Compra de 30.00 cred. (compra id=13)',8,NULL),(55,'recarga_compra_creditos',30.00,'2025-12-27 22:37:47','Confirmación compra id=13',8,NULL),(56,'retencion',5.00,'2025-12-27 22:37:57','Retencion para intercambio #12',8,12),(58,'retencion',5.00,'2025-12-27 22:38:23','Retencion para intercambio #13',8,13),(60,'retencion',5.00,'2025-12-27 22:38:59','Retencion para intercambio #14',8,14),(62,'retencion',45.00,'2025-12-27 22:39:25','Retencion para intercambio #15',8,15),(64,'retencion',20.00,'2025-12-27 22:39:38','Retencion para intercambio #16',8,16),(65,'pago',20.00,'2025-12-27 22:39:38','Pago de intercambio #16',9,NULL),(66,'liberacion',20.00,'2025-12-27 22:39:38','Liberación de retención intercambio #16',8,NULL),(67,'retencion',5.00,'2025-12-27 23:05:06','Retencion para intercambio #17',11,17),(69,'retencion',50.00,'2025-12-27 23:05:25','Retencion para intercambio #18',11,18),(70,'pago',50.00,'2025-12-27 23:05:25','Pago de intercambio #18',11,NULL),(71,'liberacion',50.00,'2025-12-27 23:05:25','Liberación de retención intercambio #18',11,NULL),(72,'retencion',45.00,'2025-12-27 23:05:32','Retencion para intercambio #19',11,19),(74,'retencion',5.00,'2025-12-27 23:06:29','Retencion para intercambio #20',11,20),(76,'retencion',45.00,'2025-12-27 23:07:57','Retencion para intercambio #21',11,21),(78,'retencion',5.00,'2025-12-27 23:08:06','Retencion para intercambio #22',11,22),(80,'retencion',5.00,'2025-12-27 23:10:42','Retencion para intercambio #23',11,23),(82,'retencion',5.00,'2025-12-27 23:11:55','Retencion para intercambio #24',11,24),(84,'retencion',5.00,'2025-12-27 23:32:39','Retencion para intercambio #25',8,25),(86,'retencion',5.00,'2025-12-27 23:41:21','Retencion para intercambio #26',8,26),(88,'retencion',5.00,'2025-12-27 23:43:21','Retencion para intercambio #27',8,27),(90,'retencion',5.00,'2025-12-27 23:44:18','Retencion para intercambio #28',8,28),(92,'retencion',5.00,'2025-12-27 23:56:49','Retencion para intercambio #29',8,29),(94,'retencion',5.00,'2025-12-27 23:58:46','Retencion para intercambio #30',8,30),(96,'retencion',5.00,'2025-12-28 00:00:24','Retencion para intercambio #31',8,31),(98,'recarga_compra_creditos',40.00,'2025-12-28 00:18:58','Compra de 40.00 cred. (compra id=14)',8,NULL),(99,'recarga_compra_creditos',40.00,'2025-12-28 00:18:59','Confirmación compra id=14',8,NULL),(100,'recarga_compra_creditos',40.00,'2025-12-28 00:19:04','Compra de 40.00 cred. (compra id=15)',8,NULL),(101,'recarga_compra_creditos',40.00,'2025-12-28 00:19:05','Confirmación compra id=15',8,NULL),(102,'recarga_compra_creditos',40.00,'2025-12-28 00:19:08','Compra de 40.00 cred. (compra id=16)',8,NULL),(103,'recarga_compra_creditos',40.00,'2025-12-28 00:19:10','Confirmación compra id=16',8,NULL),(104,'retencion',20.00,'2025-12-28 00:19:22','Retencion para intercambio #32',8,32),(105,'retencion',5.00,'2025-12-28 00:19:29','Retencion para intercambio #33',8,33),(106,'retencion',45.00,'2025-12-28 00:19:50','Retencion para intercambio #34',8,34),(107,'recarga_compra_creditos',40.00,'2025-12-28 00:20:01','Compra de 40.00 cred. (compra id=17)',8,NULL),(108,'recarga_compra_creditos',40.00,'2025-12-28 00:20:03','Confirmación compra id=17',8,NULL),(109,'recarga_compra_creditos',40.00,'2025-12-28 00:20:06','Compra de 40.00 cred. (compra id=18)',8,NULL),(110,'recarga_compra_creditos',40.00,'2025-12-28 00:20:08','Confirmación compra id=18',8,NULL),(111,'recarga_compra_creditos',40.00,'2025-12-28 00:20:11','Compra de 40.00 cred. (compra id=19)',8,NULL),(112,'recarga_compra_creditos',40.00,'2025-12-28 00:20:12','Confirmación compra id=19',8,NULL),(113,'retencion',5.00,'2025-12-28 00:21:31','Retencion para intercambio #35',8,35),(115,'retencion',5.00,'2025-12-28 00:23:00','Retencion para intercambio #36',8,36),(117,'retencion',5.00,'2025-12-28 00:28:02','Retencion para intercambio #37',8,37),(119,'retencion',5.00,'2025-12-28 00:28:05','Retencion para intercambio #38',8,38),(121,'retencion',5.00,'2025-12-28 00:30:46','Retencion para intercambio #39',8,39),(123,'retencion',5.00,'2025-12-28 00:42:53','Retencion para intercambio #40',8,40),(124,'retencion',5.00,'2025-12-28 00:43:05','Retencion para intercambio #41',8,41),(125,'retencion',5.00,'2025-12-28 00:43:38','Retencion para intercambio #42',8,42),(126,'retencion',5.00,'2025-12-28 00:45:02','Retencion para intercambio #43',8,43),(128,'recarga_compra_creditos',25.00,'2025-12-28 00:48:33','Compra de 25.00 cred. (compra id=20)',8,NULL),(129,'recarga_compra_creditos',25.00,'2025-12-28 00:48:35','Confirmación compra id=20',8,NULL),(130,'retencion',300.00,'2025-12-28 01:07:25','Retencion para intercambio #44',8,44),(131,'retencion',10.00,'2025-12-28 01:10:27','Retencion para intercambio #45',8,45),(132,'recarga_compra_creditos',25.00,'2025-12-28 01:33:43','Compra de 25.00 cred. (compra id=21)',8,NULL),(133,'recarga_compra_creditos',25.00,'2025-12-28 01:33:45','Confirmación compra id=21',8,NULL);
/*!40000 ALTER TABLE `movimiento_credito` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bitacora_billetera_from_mov` AFTER INSERT ON `movimiento_credito` FOR EACH ROW BEGIN
  INSERT INTO bitacora_billetera (billetera_id, accion, detalle, fecha)
  VALUES (
    NEW.billetera_id,
    NEW.tipoMovimiento,
    CONCAT('monto=', FORMAT(NEW.monto,2), ', desc="', IFNULL(NEW.descripcionMovi,''), '"',
           IFNULL(CONCAT(', intercambio_id=', NEW.intercambio_id), '')
    ),
    NOW()
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idpermiso` int NOT NULL AUTO_INCREMENT,
  `nombrePermiso` varchar(45) NOT NULL,
  `descripcionPer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpermiso`),
  UNIQUE KEY `uk_permiso_nombre` (`nombrePermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma_ingresos`
--

DROP TABLE IF EXISTS `plataforma_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma_ingresos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `referencia_id` int DEFAULT NULL,
  `compra_id` int DEFAULT NULL,
  `detalle` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_tipo` (`tipo`),
  KEY `idx_compra_id` (`compra_id`),
  KEY `idx_fecha` (`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma_ingresos`
--

LOCK TABLES `plataforma_ingresos` WRITE;
/*!40000 ALTER TABLE `plataforma_ingresos` DISABLE KEYS */;
INSERT INTO `plataforma_ingresos` VALUES (1,'venta_creditos',25.00,1,NULL,'Compra de creditos id=1','2025-12-27 17:58:22'),(2,'venta_creditos_confirmada',25.00,NULL,1,'Confirmada compra id=1','2025-12-27 17:58:24'),(3,'venta_creditos',40.00,2,NULL,'Compra de creditos id=2','2025-12-27 17:58:43'),(4,'venta_creditos_confirmada',40.00,NULL,2,'Confirmada compra id=2','2025-12-27 17:58:45'),(5,'suscripcion',49.99,9,NULL,'Suscripcion usuario_id=9 meses=1','2025-12-27 17:58:52'),(6,'venta_creditos',25.00,3,NULL,'Compra de creditos id=3','2025-12-27 18:00:27'),(7,'venta_creditos_confirmada',25.00,NULL,3,'Confirmada compra id=3','2025-12-27 18:00:28'),(8,'venta_creditos',30.00,4,NULL,'Compra de creditos id=4','2025-12-27 18:00:34'),(9,'venta_creditos_confirmada',30.00,NULL,4,'Confirmada compra id=4','2025-12-27 18:00:35'),(10,'venta_creditos',25.00,5,NULL,'Compra de creditos id=5','2025-12-27 20:00:31'),(11,'venta_creditos_confirmada',25.00,NULL,5,'Confirmada compra id=5','2025-12-27 20:00:33'),(12,'venta_creditos',40.00,6,NULL,'Compra de creditos id=6','2025-12-27 20:00:39'),(13,'venta_creditos_confirmada',40.00,NULL,6,'Confirmada compra id=6','2025-12-27 20:00:40'),(14,'venta_creditos',40.00,7,NULL,'Compra de creditos id=7','2025-12-27 20:00:45'),(15,'venta_creditos_confirmada',40.00,NULL,7,'Confirmada compra id=7','2025-12-27 20:00:47'),(16,'venta_creditos',40.00,8,NULL,'Compra de creditos id=8','2025-12-27 20:00:50'),(17,'venta_creditos_confirmada',40.00,NULL,8,'Confirmada compra id=8','2025-12-27 20:00:51'),(18,'venta_creditos',40.00,9,NULL,'Compra de creditos id=9','2025-12-27 20:01:06'),(19,'venta_creditos_confirmada',40.00,NULL,9,'Confirmada compra id=9','2025-12-27 20:01:07'),(20,'venta_creditos',40.00,10,NULL,'Compra de creditos id=10','2025-12-27 20:25:34'),(21,'venta_creditos_confirmada',40.00,NULL,10,'Confirmada compra id=10','2025-12-27 20:25:35'),(22,'venta_creditos',30.00,11,NULL,'Compra de creditos id=11','2025-12-27 22:32:58'),(23,'venta_creditos_confirmada',30.00,NULL,11,'Confirmada compra id=11','2025-12-27 22:33:00'),(24,'venta_creditos',25.00,12,NULL,'Compra de creditos id=12','2025-12-27 22:36:50'),(25,'venta_creditos_confirmada',25.00,NULL,12,'Confirmada compra id=12','2025-12-27 22:36:52'),(26,'venta_creditos',30.00,13,NULL,'Compra de creditos id=13','2025-12-27 22:37:46'),(27,'venta_creditos_confirmada',30.00,NULL,13,'Confirmada compra id=13','2025-12-27 22:37:47'),(28,'venta_creditos',40.00,14,NULL,'Compra de creditos id=14','2025-12-28 00:18:58'),(29,'venta_creditos_confirmada',40.00,NULL,14,'Confirmada compra id=14','2025-12-28 00:18:59'),(30,'venta_creditos',40.00,15,NULL,'Compra de creditos id=15','2025-12-28 00:19:04'),(31,'venta_creditos_confirmada',40.00,NULL,15,'Confirmada compra id=15','2025-12-28 00:19:05'),(32,'venta_creditos',40.00,16,NULL,'Compra de creditos id=16','2025-12-28 00:19:08'),(33,'venta_creditos_confirmada',40.00,NULL,16,'Confirmada compra id=16','2025-12-28 00:19:10'),(34,'venta_creditos',40.00,17,NULL,'Compra de creditos id=17','2025-12-28 00:20:01'),(35,'venta_creditos_confirmada',40.00,NULL,17,'Confirmada compra id=17','2025-12-28 00:20:03'),(36,'venta_creditos',40.00,18,NULL,'Compra de creditos id=18','2025-12-28 00:20:06'),(37,'venta_creditos_confirmada',40.00,NULL,18,'Confirmada compra id=18','2025-12-28 00:20:08'),(38,'venta_creditos',40.00,19,NULL,'Compra de creditos id=19','2025-12-28 00:20:11'),(39,'venta_creditos_confirmada',40.00,NULL,19,'Confirmada compra id=19','2025-12-28 00:20:12'),(40,'venta_creditos',25.00,20,NULL,'Compra de creditos id=20','2025-12-28 00:48:33'),(41,'venta_creditos_confirmada',25.00,NULL,20,'Confirmada compra id=20','2025-12-28 00:48:35'),(42,'venta_creditos',25.00,21,NULL,'Compra de creditos id=21','2025-12-28 01:33:43'),(43,'venta_creditos_confirmada',25.00,NULL,21,'Confirmada compra id=21','2025-12-28 01:33:45');
/*!40000 ALTER TABLE `plataforma_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `idpromocion` int NOT NULL AUTO_INCREMENT,
  `tipoPromo` varchar(45) DEFAULT NULL,
  `fechaIniPromo` date DEFAULT NULL,
  `fechaFinPromo` date DEFAULT NULL,
  PRIMARY KEY (`idpromocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `idpublicacion` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `promocion_id` int DEFAULT NULL,
  `reporte_id` int DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `valorCredito` decimal(14,2) DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `estadoPublica` varchar(45) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_publicacion_promocion` (`promocion_id`),
  KEY `fk_publicacion_reporte` (`reporte_id`),
  KEY `ix_publicacion_usuario` (`usuario_id`),
  KEY `ix_publicacion_usuario_fecha` (`usuario_id`,`fechaPublicacion`),
  KEY `ix_publicacion_estado_fecha` (`estadoPublica`,`fechaPublicacion`),
  FULLTEXT KEY `ft_pub_titulo_desc` (`titulo`,`descripcion`),
  CONSTRAINT `fk_publicacion_promocion` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`idpromocion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_publicacion_reporte` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`idreporte`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_publicacion_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (7,9,NULL,NULL,'bicicleta','bici de color negro',784.00,'2025-12-27','activa',NULL),(8,9,NULL,NULL,'tomatodo','plastico de tamano de 200mls, color negro',20.00,'2025-12-27','inactiva',NULL),(9,11,NULL,NULL,'teclado electronico','teclado con luces RGB de 4x4',50.00,'2025-12-27','inactiva',NULL),(10,11,NULL,NULL,'celular Tecno ProMax Start','celular 64 gb de alamacenamiento 4 ram',300.00,'2025-12-27','inactiva',NULL),(16,12,NULL,NULL,'papel higienico','perlita de 20 rollos',5.00,'2025-12-27','inactiva',NULL),(17,12,NULL,NULL,'hjkkcasn','sadasd',1999.00,'2025-12-27','activa','https://res.cloudinary.com/ddjrzszrw/image/upload/v1766879781/nfclrn2muqe6mti4073w.png'),(18,12,NULL,NULL,'videos de Naruto','naruto todas las peliculas',45.00,'2025-12-27','inactiva','https://res.cloudinary.com/ddjrzszrw/image/upload/v1766882397/etsr3hmdffsdusqxaclt.png'),(19,9,NULL,NULL,'hojas tamano oficio','color amarillo',10.00,'2025-12-28','inactiva','https://res.cloudinary.com/ddjrzszrw/image/upload/v1766898612/qjv5f9gnhbrocmdq3xbq.png');
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_publicacion_bono_activo` AFTER INSERT ON `publicacion` FOR EACH ROW BEGIN
  DECLARE id_billetera INT;

  -- Obtener la billetera del usuario que publicó
  SELECT billetera_id INTO id_billetera
  FROM usuario
  WHERE idusuario = NEW.usuario_id;

  -- Si tiene billetera válida, otorgar 3 puntos
  IF id_billetera IS NOT NULL THEN
    UPDATE billetera
      SET saldoActual = saldoActual + 3.00,
          fechaUltima = NOW()
      WHERE idbilletera = id_billetera;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bitacora_publicacion_update` AFTER UPDATE ON `publicacion` FOR EACH ROW BEGIN
  DECLARE v_detalle TEXT DEFAULT '';
  IF (NEW.titulo <> OLD.titulo) OR (NEW.titulo IS NULL XOR OLD.titulo IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'titulo: "', IFNULL(OLD.titulo,''), '" -> "', IFNULL(NEW.titulo,''), '"; ');
  END IF;
  IF (NEW.descripcion <> OLD.descripcion) OR (NEW.descripcion IS NULL XOR OLD.descripcion IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'descripcion: (editada); ');
  END IF;
  IF (NEW.valorCredito <> OLD.valorCredito) OR (NEW.valorCredito IS NULL XOR OLD.valorCredito IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'valorCredito: ', IFNULL(OLD.valorCredito,0), ' -> ', IFNULL(NEW.valorCredito,0), '; ');
  END IF;
  IF (NEW.estadoPublica <> OLD.estadoPublica) OR (NEW.estadoPublica IS NULL XOR OLD.estadoPublica IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'estado: ', IFNULL(OLD.estadoPublica,'NULL'), ' -> ', IFNULL(NEW.estadoPublica,'NULL'), '; ');
  END IF;

  IF v_detalle <> '' THEN
    INSERT INTO bitacora_publicacion (idpublicacion, usuario_id, accion, detalle, fecha)
    VALUES (NEW.idpublicacion, NEW.usuario_id, 'UPDATE', v_detalle, NOW());
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bitacora_publicacion_delete` BEFORE DELETE ON `publicacion` FOR EACH ROW BEGIN
  INSERT INTO bitacora_publicacion (idpublicacion, usuario_id, accion, detalle, fecha)
  VALUES (OLD.idpublicacion, OLD.usuario_id, 'DELETE',
          CONCAT('Se eliminó publicación con título="', IFNULL(OLD.titulo,''), '"'),
          NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `idreporte` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `CO2` decimal(14,4) DEFAULT NULL,
  `Energia` decimal(14,4) DEFAULT NULL,
  `Agua` decimal(14,4) DEFAULT NULL,
  PRIMARY KEY (`idreporte`),
  UNIQUE KEY `uq_reporte_usuario` (`usuario_id`),
  KEY `fk_reporte_usuario` (`usuario_id`),
  CONSTRAINT `fk_reporte_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (5,9,1.7000,3.0000,10.0000),(6,11,11.5500,0.0000,11.0000),(7,12,8.6250,10.0000,14.5000);
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(45) NOT NULL,
  `descripcionRol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idrol`),
  UNIQUE KEY `uk_rol_nombre` (`nombreRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `idrol` int NOT NULL,
  `idpermiso` int NOT NULL,
  PRIMARY KEY (`idrol`,`idpermiso`),
  KEY `fk_rol_permiso_permiso` (`idpermiso`),
  CONSTRAINT `fk_rol_permiso_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_permiso_rol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `idsuscripcion` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `fechaIniSus` date NOT NULL,
  `fechaFinSus` date NOT NULL,
  `monto` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`idsuscripcion`),
  KEY `fk_suscripcion_usuario` (`usuario_id`),
  CONSTRAINT `fk_suscripcion_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
INSERT INTO `suscripcion` VALUES (1,9,'2025-12-27','2026-01-27',49.99);
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_equivalencia`
--

DROP TABLE IF EXISTS `tabla_equivalencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_equivalencia` (
  `idtablaEquivalencia` int NOT NULL AUTO_INCREMENT,
  `factorCO2` decimal(14,6) DEFAULT NULL,
  `factorEnergiaKwh` decimal(14,6) DEFAULT NULL,
  `factorAguaLitro` decimal(14,6) DEFAULT NULL,
  `unidadMedida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtablaEquivalencia`),
  UNIQUE KEY `uq_tabla_equivalencia_unidad` (`unidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_equivalencia`
--

LOCK TABLES `tabla_equivalencia` WRITE;
/*!40000 ALTER TABLE `tabla_equivalencia` DISABLE KEYS */;
INSERT INTO `tabla_equivalencia` VALUES (6,0.850000,0.000000,5.000000,'kg_papel'),(7,2.100000,0.000000,2.000000,'kg_plastico'),(8,0.000000,1.000000,0.000000,'kWh_solar');
/*!40000 ALTER TABLE `tabla_equivalencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top10_ranking`
--

DROP TABLE IF EXISTS `top10_ranking`;
/*!50001 DROP VIEW IF EXISTS `top10_ranking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top10_ranking` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `impactoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombreUser` varchar(80) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `billetera_id` int DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uq_usuario_nombreUser` (`nombreUser`),
  UNIQUE KEY `uq_usuario_billetera` (`billetera_id`),
  CONSTRAINT `fk_usuario_billetera` FOREIGN KEY (`billetera_id`) REFERENCES `billetera` (`idbilletera`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (9,'alejandro','','alejandro','8b1ad73605e1a10782cf2e9f67bd69e6431fc91c8cbe11ee15f15769e4ea4fb0',8),(10,'edson','chambi','edson.chambi','8b1ad73605e1a10782cf2e9f67bd69e6431fc91c8cbe11ee15f15769e4ea4fb0',9),(11,'jose','quiroz','jose','8b1ad73605e1a10782cf2e9f67bd69e6431fc91c8cbe11ee15f15769e4ea4fb0',10),(12,'alejandro','','miktejere','d07d6a31f7cdc2008c5fbd91918679740e96186269f8fa3ecfb32bfa4ff5c474',11);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bitacora_usuario_update` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
  DECLARE v_detalle TEXT DEFAULT '';
  IF (NEW.nombre <> OLD.nombre) OR (NEW.nombre IS NULL XOR OLD.nombre IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'nombre: "', IFNULL(OLD.nombre,'NULL'), '" -> "', IFNULL(NEW.nombre,'NULL'), '"; ');
  END IF;
  IF (NEW.apellido <> OLD.apellido) OR (NEW.apellido IS NULL XOR OLD.apellido IS NULL) THEN
    SET v_detalle = CONCAT(v_detalle, 'apellido: "', IFNULL(OLD.apellido,'NULL'), '" -> "', IFNULL(NEW.apellido,'NULL'), '"; ');
  END IF;
  IF (NEW.nombreUser <> OLD.nombreUser) THEN
    SET v_detalle = CONCAT(v_detalle, 'nombreUser: "', OLD.nombreUser, '" -> "', NEW.nombreUser, '"; ');
  END IF;
  IF (NEW.contrasenia <> OLD.contrasenia) THEN
    SET v_detalle = CONCAT(v_detalle, 'contrasenia: **cambiada**; ');
  END IF;

  IF v_detalle <> '' THEN
    INSERT INTO bitacora_usuario (usuario_id, accion, detalle, fecha)
    VALUES (NEW.idusuario, 'UPDATE', v_detalle, NOW());
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `idusuario` int NOT NULL,
  `idrol` int NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `fk_usuario_rol_rol` (`idrol`),
  CONSTRAINT `fk_usuario_rol_rol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_rol_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_extracto_billetera`
--

DROP TABLE IF EXISTS `v_extracto_billetera`;
/*!50001 DROP VIEW IF EXISTS `v_extracto_billetera`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_extracto_billetera` AS SELECT 
 1 AS `idmovimiento_credito`,
 1 AS `nombreUser`,
 1 AS `fechaMovimiento`,
 1 AS `tipoMovimiento`,
 1 AS `monto`,
 1 AS `descripcionMovi`,
 1 AS `intercambio_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_impacto_semana`
--

DROP TABLE IF EXISTS `v_impacto_semana`;
/*!50001 DROP VIEW IF EXISTS `v_impacto_semana`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_impacto_semana` AS SELECT 
 1 AS `semana_inicio`,
 1 AS `co2`,
 1 AS `energia`,
 1 AS `agua`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pub_semana`
--

DROP TABLE IF EXISTS `v_pub_semana`;
/*!50001 DROP VIEW IF EXISTS `v_pub_semana`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pub_semana` AS SELECT 
 1 AS `semana_inicio`,
 1 AS `publicaciones`,
 1 AS `total_valor_credito`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_publicaciones_impacto`
--

DROP TABLE IF EXISTS `v_publicaciones_impacto`;
/*!50001 DROP VIEW IF EXISTS `v_publicaciones_impacto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_publicaciones_impacto` AS SELECT 
 1 AS `idpublicacion`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `valorCredito`,
 1 AS `cantidadUnidad`,
 1 AS `unidadMedida`,
 1 AS `factorCO2`,
 1 AS `factorEnergiaKwh`,
 1 AS `factorAguaLitro`,
 1 AS `impactoCO2`,
 1 AS `impactoEnergia`,
 1 AS `impactoAgua`,
 1 AS `impactoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ranking_usuarios`
--

DROP TABLE IF EXISTS `v_ranking_usuarios`;
/*!50001 DROP VIEW IF EXISTS `v_ranking_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ranking_usuarios` AS SELECT 
 1 AS `idusuario`,
 1 AS `nombreUser`,
 1 AS `pubs`,
 1 AS `ventas`,
 1 AS `bs_liberados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_top_categorias`
--

DROP TABLE IF EXISTS `v_top_categorias`;
/*!50001 DROP VIEW IF EXISTS `v_top_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_top_categorias` AS SELECT 
 1 AS `nombreCategoria`,
 1 AS `publicaciones`,
 1 AS `total_valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ventas_semana`
--

DROP TABLE IF EXISTS `v_ventas_semana`;
/*!50001 DROP VIEW IF EXISTS `v_ventas_semana`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ventas_semana` AS SELECT 
 1 AS `semana_inicio`,
 1 AS `ventas`,
 1 AS `monto_liberado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_bitacora_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_bitacora_por_usuario`(
    IN p_nombreUser VARCHAR(80)
)
BEGIN
    SELECT 
        b.id,
        u.nombreUser AS usuario,
        b.accion,
        b.detalle,
        b.fecha
    FROM bitacora_usuario b
    JOIN usuario u ON b.usuario_id = u.idusuario
    WHERE u.nombreUser = p_nombreUser
    ORDER BY b.id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_compra_creditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_compra_creditos`(
  IN  p_usuario_id INT,
  IN  p_montoBs DECIMAL(14,2),
  IN  p_creditos DECIMAL(14,2),
  IN  p_metodo VARCHAR(50)
)
BEGIN
  DECLARE v_bill INT;
  DECLARE v_idcomp INT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Error al procesar compra de créditos';
  END;

  -- validaciones simples
  IF p_montoBs IS NULL OR p_montoBs <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Monto inválido';
  END IF;
  IF p_creditos IS NULL OR p_creditos <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Cantidad de créditos inválida';
  END IF;

  START TRANSACTION;

    -- 1) Guardar compra
    INSERT INTO compra_credito (usuario_id, montoBs, creditosComprados, metodoPago)
    VALUES (p_usuario_id, p_montoBs, p_creditos, p_metodo);
    SET v_idcomp = LAST_INSERT_ID();

    -- 2) Obtener billetera del usuario y lockearla
    SELECT billetera_id
      INTO v_bill
    FROM usuario
    WHERE idusuario = p_usuario_id
    FOR UPDATE;

    IF v_bill IS NULL THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Usuario sin billetera';
    END IF;

    -- 3) Acreditar monto en la billetera del usuario
    UPDATE billetera
      SET saldoActual = saldoActual + p_montoBs,
          fechaUltima = NOW()
    WHERE idbilletera = v_bill;

    INSERT INTO movimiento_credito (tipoMovimiento, monto, fechaMovimiento, descripcionMovi, billetera_id)
    VALUES ('recarga_compra_creditos', p_montoBs, NOW(),
            CONCAT('Compra de ', p_creditos, ' cred. (compra id=', v_idcomp,')'),
            v_bill);

    -- 4) Registrar ingreso para la plataforma (si existe la tabla)
    IF EXISTS (
      SELECT 1 FROM information_schema.tables
      WHERE table_schema = DATABASE() AND table_name = 'plataforma_ingresos'
    ) THEN
      INSERT INTO plataforma_ingresos (tipo, monto, referencia_id, detalle)
      VALUES ('venta_creditos', p_montoBs, v_idcomp, CONCAT('Compra de creditos id=', v_idcomp));
    END IF;

  COMMIT;

  -- devolver id de compra para el caller (opcional)
  SELECT v_idcomp AS idcompra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_compra_suscripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_compra_suscripcion`(
  IN  p_usuario_id INT,
  IN  p_meses INT,
  IN  p_monto DECIMAL(14,2)
)
BEGIN
  DECLARE v_meses INT DEFAULT 1;
  DECLARE v_monto_mensual DECIMAL(14,2) DEFAULT NULL;
  DECLARE v_monto_total DECIMAL(14,2);
  DECLARE v_billetera_id INT;
  DECLARE v_saldo_actual DECIMAL(14,2);
  DECLARE v_idsus INT;
  DECLARE v_fecha_ini DATE;
  DECLARE v_fecha_fin DATE;
  DECLARE v_tmp_val VARCHAR(255);

  -- error handler: rollback and signal
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al procesar compra de suscripcion';
  END;

  IF p_usuario_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Parametro p_usuario_id requerido';
  END IF;

  IF p_meses IS NULL OR p_meses <= 0 THEN
    SET v_meses = 1;
  ELSE
    SET v_meses = p_meses;
  END IF;

  -- resolver monto mensual: prioridad p_monto > plataforma_config.suscripcion_monto_mensual > default 10.00
  IF p_monto IS NOT NULL AND p_monto > 0 THEN
    SET v_monto_mensual = p_monto;
  ELSE
    SELECT valor INTO v_tmp_val
    FROM plataforma_config
    WHERE clave = 'suscripcion_monto_mensual'
    LIMIT 1;

    IF v_tmp_val IS NOT NULL THEN
      SET v_monto_mensual = CAST(v_tmp_val AS DECIMAL(14,2));
    ELSE
      SET v_monto_mensual = 10.00;
    END IF;
  END IF;

  IF v_monto_mensual IS NULL OR v_monto_mensual <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Monto de suscripción inválido';
  END IF;

  SET v_monto_total = ROUND(v_monto_mensual * v_meses, 2);

  START TRANSACTION;

    -- obtener billetera del usuario y lock
    SELECT billetera_id INTO v_billetera_id
    FROM usuario
    WHERE idusuario = p_usuario_id
    FOR UPDATE;

    IF v_billetera_id IS NULL THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario sin billetera asociada';
    END IF;

    -- obtener saldo actual y lock (ya for update por la fila de usuario no asegura la billetera, así que lockear billetera)
    SELECT saldoActual INTO v_saldo_actual
    FROM billetera
    WHERE idbilletera = v_billetera_id
    FOR UPDATE;

    IF v_saldo_actual < v_monto_total THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo insuficiente para comprar suscripción';
    END IF;

    -- debitar billetera
    UPDATE billetera
      SET saldoActual = saldoActual - v_monto_total,
          fechaUltima = NOW()
    WHERE idbilletera = v_billetera_id;

    -- registrar movimiento en movimiento_credito
    INSERT INTO movimiento_credito (tipoMovimiento, monto, fechaMovimiento, descripcionMovi, billetera_id)
    VALUES ('suscripcion', v_monto_total, NOW(), CONCAT('Compra suscripción ', v_meses, ' mes(es) - cobro automatico'), v_billetera_id);

    -- registrar ingreso en plataforma_ingresos (si la tabla existe)
    IF EXISTS (
      SELECT 1 FROM information_schema.tables
      WHERE table_schema = DATABASE() AND table_name = 'plataforma_ingresos'
    ) THEN
      INSERT INTO plataforma_ingresos (tipo, monto, referencia_id, detalle)
      VALUES ('suscripcion', v_monto_total, p_usuario_id, CONCAT('Suscripcion usuario_id=', p_usuario_id, ' meses=', v_meses));
    END IF;

    -- crear o extender suscripción
    SELECT idsuscripcion, fechaIniSus, fechaFinSus INTO v_idsus, v_fecha_ini, v_fecha_fin
    FROM suscripcion
    WHERE usuario_id = p_usuario_id
      AND fechaFinSus >= CURDATE()
    LIMIT 1
    FOR UPDATE;

    IF v_idsus IS NULL THEN
      -- no existe suscripcion activa: crear nueva con fechaIni=CURDATE()
      SET v_fecha_ini = CURDATE();
      SET v_fecha_fin = DATE_ADD(v_fecha_ini, INTERVAL v_meses MONTH);

      INSERT INTO suscripcion (usuario_id, fechaIniSus, fechaFinSus, monto)
      VALUES (p_usuario_id, v_fecha_ini, v_fecha_fin, v_monto_total);
      SET v_idsus = LAST_INSERT_ID();
    ELSE
      -- existe suscripcion activa: extender fechaFinSus
      -- nueva fechaFin = DATE_ADD(fechaFinSus, INTERVAL v_meses MONTH)
      UPDATE suscripcion
        SET fechaFinSus = DATE_ADD(v_fecha_fin, INTERVAL v_meses MONTH),
            monto = IFNULL(monto,0) + v_monto_total
      WHERE idsuscripcion = v_idsus;
    END IF;

  COMMIT;

  -- devolver resultado sencillo
  SELECT v_idsus AS idsuscripcion, v_monto_total AS monto_cobrado, v_meses AS meses_contratados;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_confirmar_compra_creditos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_confirmar_compra_creditos`(
  IN p_idcomp INT,
  IN p_montoBs DECIMAL(14,2),
  IN p_metodo VARCHAR(50)
)
BEGIN
  DECLARE v_usuario INT;
  DECLARE v_bill INT;

  START TRANSACTION;
    SELECT usuario_id INTO v_usuario FROM compra_credito WHERE idcompra = p_idcomp FOR UPDATE;
    IF v_usuario IS NULL THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Compra no encontrada';
    END IF;

    SELECT billetera_id INTO v_bill FROM usuario WHERE idusuario = v_usuario FOR UPDATE;
    IF v_bill IS NULL THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Usuario sin billetera';
    END IF;

    -- actualizar compra (fecha/estado)
    UPDATE compra_credito SET fechaCompra = NOW(), metodoPago = p_metodo WHERE idcompra = p_idcomp;

    -- acreditar billetera
    UPDATE billetera SET saldoActual = saldoActual + p_montoBs, fechaUltima = NOW() WHERE idbilletera = v_bill;
    INSERT INTO movimiento_credito (tipoMovimiento, monto, fechaMovimiento, descripcionMovi, billetera_id)
      VALUES ('recarga_compra_creditos', p_montoBs, NOW(), CONCAT('Confirmación compra id=', p_idcomp), v_bill);

    -- registrar plataforma_ingresos
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'plataforma_ingresos') THEN
      INSERT INTO plataforma_ingresos (tipo, monto, referencia_id, compra_id, detalle)
        VALUES ('venta_creditos_confirmada', p_montoBs, NULL, p_idcomp, CONCAT('Confirmada compra id=', p_idcomp));
    END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_iniciar_compra_con_credito_verde` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_iniciar_compra_con_credito_verde`(
  IN  p_comprador_id   INT,
  IN  p_idpublicacion  INT,
  IN  p_cantidad       INT,
  OUT p_idintercambio  INT
)
BEGIN
  DECLARE v_vendedor_id INT;
  DECLARE v_monto       DECIMAL(14,2);
  DECLARE v_creditoVerde DECIMAL(14,2);
  DECLARE v_billetera_comp INT;
  DECLARE v_billetera_vend INT;
  DECLARE v_saldo_actual   DECIMAL(14,2);
  DECLARE v_cantidadUnidad DECIMAL(14,4);
  DECLARE v_factorCO2 DECIMAL(14,6);
  DECLARE v_factorEnergia DECIMAL(14,6);
  DECLARE v_factorAgua DECIMAL(14,6);

  -- DECLARE exit handler for sqlexception 
  -- BEGIN
    -- ROLLBACK;
    -- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Error al iniciar compra';
  -- END;

  SELECT usuario_id, valorCredito
    INTO v_vendedor_id, v_monto
  FROM publicacion
  WHERE idpublicacion = p_idpublicacion;

  IF v_monto IS NULL OR v_monto <= 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='Monto invalido o publicacion no encontrada';
  END IF;

  SELECT c.cantidadUnidad,
         t.factorCO2,
         t.factorEnergiaKwh,
         t.factorAguaLitro
  INTO v_cantidadUnidad,
       v_factorCO2,
       v_factorEnergia,
       v_factorAgua
  FROM categoria c
  JOIN tabla_equivalencia t
       ON t.idtablaEquivalencia = c.tablaEquivalencia_id
  WHERE c.publicacion_id = p_idpublicacion
  LIMIT 1;

  IF v_cantidadUnidad IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='No se encontro equivalencia ambiental';
  END IF;

  SET v_creditoVerde = v_cantidadUnidad * (
      IFNULL(v_factorCO2,0) +
      IFNULL(v_factorEnergia,0) +
      IFNULL(v_factorAgua,0)
  );

  START TRANSACTION;

  SELECT billetera_id INTO v_billetera_comp
    FROM usuario WHERE idusuario = p_comprador_id FOR UPDATE;

  SELECT billetera_id INTO v_billetera_vend
    FROM usuario WHERE idusuario = v_vendedor_id FOR UPDATE;

  IF v_billetera_comp IS NULL OR v_billetera_vend IS NULL THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='Comprador o vendedor sin billetera';
  END IF;

  SELECT saldoActual INTO v_saldo_actual
  FROM billetera
  WHERE idbilletera = v_billetera_comp
  FOR UPDATE;

  IF v_saldo_actual < v_monto THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='Saldo insuficiente';
  END IF;

  UPDATE billetera
     SET saldoActual   = saldoActual - v_monto,
         saldoRetenido = saldoRetenido + v_monto,
         fechaUltima   = NOW()
   WHERE idbilletera   = v_billetera_comp;

  INSERT INTO custodio_credito(billetera_id, montoCustodio, estado, fechaRetenido)
  VALUES(v_billetera_comp, v_monto, 'retenido', NOW());

  INSERT INTO intercambio(
    usuario_origen_id, usuario_destino_id, custodioCredito_id,
    creditoVerde, cantidad, estadoIntercam, fechaCreacion
  ) VALUES (
    p_comprador_id, v_vendedor_id, LAST_INSERT_ID(),
    v_creditoVerde, p_cantidad, 'pendiente', NOW()
  );
  SET p_idintercambio = LAST_INSERT_ID();

	update publicacion
    set estadoPublica='inactiva'
    where idpublicacion = p_idpublicacion;
    
  INSERT INTO movimiento_credito(
    tipoMovimiento, monto, fechaMovimiento,
    descripcionMovi, billetera_id, intercambio_id
  ) VALUES (
    'retencion', v_monto, NOW(),
    CONCAT('Retencion para intercambio #', p_idintercambio),
    v_billetera_comp, p_idintercambio
  );
  COMMIT;
  SELECT p_idintercambio AS idintercambio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liberar_pago_con_credito_verde` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liberar_pago_con_credito_verde`(
  IN p_idintercambio INT
)
BEGIN
  DECLARE v_monto DECIMAL(14,2);
  DECLARE v_billetera_comp INT;
  DECLARE v_billetera_vend INT;
  DECLARE v_custodio INT;

  START TRANSACTION;

  -- obtener el monto retenido y billeteras
  SELECT c.montoCustodio, c.billetera_id, i.usuario_destino_id
    INTO v_monto, v_billetera_comp, v_billetera_vend
  FROM intercambio i
  JOIN custodio_credito c ON c.idcustodioCredito = i.custodioCredito_id
  WHERE i.idintercambio = p_idintercambio
    AND i.estadoIntercam = 'pendiente'
  FOR UPDATE;

  IF v_monto IS NULL THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Intercambio no válido o ya procesado';
  END IF;

  -- 1) quitar el retenido de la billetera del comprador
  UPDATE billetera
     SET saldoRetenido = saldoRetenido - v_monto
   WHERE idbilletera = v_billetera_comp;

  -- 2) agregar el monto al vendedor (saldoActual)
  UPDATE billetera
     SET saldoActual = saldoActual + v_monto
   WHERE idbilletera = v_billetera_vend;

  -- 3) actualizar custodio (ya liberado)
  UPDATE custodio_credito
     SET estado='liberado', fechaLiberado=NOW()
   WHERE billetera_id = v_billetera_comp
     AND montoCustodio = v_monto;

  -- 4) actualizar intercambio
  UPDATE intercambio
     SET estadoIntercam = 'finalizado',
         fechaFinal = NOW()
   WHERE idintercambio = p_idintercambio;

  -- 5) registrar movimientos
 INSERT INTO movimiento_credito(
  tipoMovimiento, monto, fechaMovimiento,
  descripcionMovi, billetera_id, intercambio_id
) VALUES (
  'pago', v_monto, NOW(),
  CONCAT('Pago de intercambio #', p_idintercambio),
  v_billetera_vend, p_idintercambio
);

INSERT INTO movimiento_credito(
  tipoMovimiento, monto, fechaMovimiento,
  descripcionMovi, billetera_id, intercambio_id
) VALUES (
  'liberacion', v_monto, NOW(),
  CONCAT('Liberación de retención intercambio #', p_idintercambio),
  v_billetera_comp, p_idintercambio
);

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_usuario`(
  IN p_idusuario INT
)
BEGIN
  DECLARE v_exists INT;

  -- Verificar existencia
  SELECT COUNT(*) INTO v_exists
  FROM usuario
  WHERE idusuario = p_idusuario;

  IF v_exists = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario no encontrado';
  END IF;

  -- Devolver la información solicitada
  SELECT
    u.apellido,
    u.billetera_id,
    u.idusuario,
    u.nombre,
    -- 'billetera' como saldo actual (si no hay billetera devuelve 0.00)
    IFNULL(b.saldoActual, 0.00) AS billetera,
    -- Suscripción activa: 1 = activa, 0 = no activa
    (EXISTS (
       SELECT 1
       FROM suscripcion s
       WHERE s.usuario_id = u.idusuario
         AND CURDATE() BETWEEN s.fechaIniSus AND s.fechaFinSus
    )) AS suscripcionActiva
  FROM usuario u
  LEFT JOIN billetera b ON b.idbilletera = u.billetera_id
  WHERE u.idusuario = p_idusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_publicar_con_impacto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_publicar_con_impacto`(
  IN  p_usuario_id INT,
  IN  p_nombreCategoria VARCHAR(50),   -- ej: 'Servicios' o 'Tecnología'
  IN  p_unidadMedida   VARCHAR(45),    -- ej: 'kg_plastico' | 'kWh_solar' | 'kg_papel'
  IN  p_titulo         VARCHAR(100),
  IN  p_descripcion    VARCHAR(500),
  IN  p_valorCredito   DECIMAL(14,2),
  IN  p_cantidadUnidad DECIMAL(14,4),
  IN  p_foto			VARCHAR(255),-- cuánto impacto declaras (ej: 15 kg_plastico)
  OUT p_idpublicacion  INT)
BEGIN
  DECLARE v_catalogo_id INT;
  DECLARE v_eq_id INT;
  DECLARE v_CO2 DECIMAL(14,6);
  DECLARE v_Energia DECIMAL(14,6);
  DECLARE v_Agua DECIMAL(14,6);
  -- 1) Resolver IDs
  SELECT idcatalogo INTO v_catalogo_id
  FROM catalogo_categoria
  WHERE nombreCategoria = p_nombreCategoria
  LIMIT 1;
  IF v_catalogo_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Categoría no encontrada en catalogo_categoria';
  END IF;
  SELECT idtablaEquivalencia, factorCO2, factorEnergiaKwh, factorAguaLitro
  INTO v_eq_id, v_CO2, v_Energia, v_Agua
  FROM tabla_equivalencia
  WHERE unidadMedida = p_unidadMedida
  LIMIT 1;
  IF v_eq_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unidad/Equivalencia no encontrada en tabla_equivalencia';
  END IF;
  -- 2) Crear publicación
  INSERT INTO publicacion (
    usuario_id, promocion_id, reporte_id,
    titulo, descripcion, valorCredito, fechaPublicacion, estadoPublica, foto
  ) VALUES (
    p_usuario_id, NULL, NULL,
    p_titulo, p_descripcion, p_valorCredito, CURDATE(), 'activa', p_foto);
  SET p_idpublicacion = LAST_INSERT_ID();
  -- 3) Relacionar con categoría + equivalencia + cantidad
  INSERT INTO categoria (publicacion_id, tablaEquivalencia_id, catalogo_id, cantidadUnidad)
  VALUES (p_idpublicacion, v_eq_id, v_catalogo_id, p_cantidadUnidad);
  -- 4) Calcular impacto y acumular en reporte del usuario
  CALL sp_upsert_reporte(
    p_usuario_id,
    p_cantidadUnidad * IFNULL(v_CO2,0),
    p_cantidadUnidad * IFNULL(v_Energia,0),
    p_cantidadUnidad * IFNULL(v_Agua,0)
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recargar_billetera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recargar_billetera`(
  IN  p_usuario_id INT,
  IN  p_monto DECIMAL(14,2),
  IN  p_descripcion VARCHAR(255)
)
BEGIN
  DECLARE v_bill INT;
  DECLARE exit handler for sqlexception
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Error al recargar billetera';
  END;

  IF p_monto IS NULL OR p_monto <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Monto inválido';
  END IF;

  START TRANSACTION;
    SELECT billetera_id INTO v_bill
    FROM usuario WHERE idusuario = p_usuario_id
    FOR UPDATE;

    IF v_bill IS NULL THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Usuario sin billetera';
    END IF;

    UPDATE billetera
      SET saldoActual = saldoActual + p_monto,
          fechaUltima = NOW()
    WHERE idbilletera = v_bill;

    INSERT INTO movimiento_credito (tipoMovimiento, monto, fechaMovimiento, descripcionMovi, billetera_id)
    VALUES ('recarga', p_monto, NOW(), COALESCE(p_descripcion,'Recarga manual'), v_bill);
  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_acceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_acceso`(
  IN p_usuario   VARCHAR(80),
  IN p_ip        VARCHAR(45),
  IN p_userAgent VARCHAR(255),
  IN p_exito     BOOLEAN,
  IN p_motivo    VARCHAR(255)
)
BEGIN
  INSERT INTO bitacora_acceso (usuario, ip, user_agent, exito, motivo, fecha)
  VALUES (p_usuario, p_ip, p_userAgent, p_exito, p_motivo, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_usuario_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_usuario_completo`(
  IN p_nombre       VARCHAR(45),
  IN p_apellido     VARCHAR(45),
  IN p_nombreUser   VARCHAR(80),
  IN p_contrasenia  VARCHAR(255),
  IN p_roles_json   JSON)
BEGIN
  DECLARE v_usuario_id INT;
  DECLARE v_billetera_id INT;
  START TRANSACTION;
  -- 1) Crear billetera con bono
  INSERT INTO billetera (saldoActual, saldoRetenido, fechaUltima)
  VALUES (5.00, 0.00, NOW());
  SET v_billetera_id = LAST_INSERT_ID();

  -- 2) Crear usuario
  INSERT INTO usuario (nombre, apellido, nombreUser, contrasenia, billetera_id)
  VALUES (p_nombre, p_apellido, p_nombreUser, SHA2(p_contrasenia, 256), v_billetera_id);
  SET v_usuario_id = LAST_INSERT_ID();
  -- 3) Registrar bono en movimientos
  INSERT INTO movimiento_credito (tipoMovimiento, monto, fechaMovimiento, descripcionMovi, billetera_id)
  VALUES ('bono', 5.00, NOW(), 'Bono de bienvenida por suscripción', v_billetera_id);
  -- 4) Asignar roles desde JSON
  INSERT INTO usuario_rol (idusuario, idrol)
  SELECT v_usuario_id, r.idrol
  FROM JSON_TABLE(p_roles_json, '$[*]' COLUMNS (rol VARCHAR(45) PATH '$')) jt
  JOIN rol r ON r.nombreRol = jt.rol
  WHERE NOT EXISTS (
    SELECT 1 FROM usuario_rol ur
    WHERE ur.idusuario = v_usuario_id AND ur.idrol = r.idrol);
  COMMIT;
  -- 5) Devolver resultado
  SELECT v_usuario_id AS usuario_id, v_billetera_id AS billetera_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_resumen_vistas_compacta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_resumen_vistas_compacta`()
BEGIN
  SELECT 
    COUNT(*) AS total_vistas,
    GROUP_CONCAT(table_name ORDER BY table_name SEPARATOR ', ') AS vistas_list
  FROM information_schema.views
  WHERE table_schema = DATABASE();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsert_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upsert_reporte`(
  IN p_usuario_id INT,
  IN p_CO2 DECIMAL(14,4),
  IN p_Energia DECIMAL(14,4),
  IN p_Agua DECIMAL(14,4))
BEGIN
  DECLARE v_id INT;
  SELECT idreporte INTO v_id
  FROM reporte
  WHERE usuario_id = p_usuario_id
  LIMIT 1;
  IF v_id IS NULL THEN
    INSERT INTO reporte (usuario_id, CO2, Energia, Agua)
    VALUES (p_usuario_id, IFNULL(p_CO2,0), IFNULL(p_Energia,0), IFNULL(p_Agua,0));
  ELSE
    UPDATE reporte
    SET CO2 = IFNULL(CO2,0) + IFNULL(p_CO2,0),
        Energia = IFNULL(Energia,0) + IFNULL(p_Energia,0),
        Agua = IFNULL(Agua,0) + IFNULL(p_Agua,0)
    WHERE idreporte = v_id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `top10_ranking`
--

/*!50001 DROP VIEW IF EXISTS `top10_ranking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top10_ranking` AS select `u`.`nombreUser` AS `nombre_usuario`,((ifnull(`r`.`CO2`,0) + ifnull(`r`.`Energia`,0)) + ifnull(`r`.`Agua`,0)) AS `impactoTotal` from (`reporte` `r` join `usuario` `u` on((`r`.`usuario_id` = `u`.`idusuario`))) order by `impactoTotal` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_extracto_billetera`
--

/*!50001 DROP VIEW IF EXISTS `v_extracto_billetera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_extracto_billetera` AS select `m`.`idmovimiento_credito` AS `idmovimiento_credito`,`u`.`nombreUser` AS `nombreUser`,`m`.`fechaMovimiento` AS `fechaMovimiento`,`m`.`tipoMovimiento` AS `tipoMovimiento`,`m`.`monto` AS `monto`,`m`.`descripcionMovi` AS `descripcionMovi`,`m`.`intercambio_id` AS `intercambio_id` from ((`movimiento_credito` `m` join `billetera` `b` on((`b`.`idbilletera` = `m`.`billetera_id`))) join `usuario` `u` on((`u`.`billetera_id` = `b`.`idbilletera`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_impacto_semana`
--

/*!50001 DROP VIEW IF EXISTS `v_impacto_semana`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_impacto_semana` AS select cast((`i`.`fechaFinal` - interval weekday(`i`.`fechaFinal`) day) as date) AS `semana_inicio`,round(sum(((`i`.`cantidad` * `c`.`cantidadUnidad`) * ifnull(`t`.`factorCO2`,0))),4) AS `co2`,round(sum(((`i`.`cantidad` * `c`.`cantidadUnidad`) * ifnull(`t`.`factorEnergiaKwh`,0))),4) AS `energia`,round(sum(((`i`.`cantidad` * `c`.`cantidadUnidad`) * ifnull(`t`.`factorAguaLitro`,0))),4) AS `agua` from (((`intercambio` `i` join `publicacion` `p` on((`p`.`idpublicacion` = `i`.`publicacion_id`))) join `categoria` `c` on((`c`.`publicacion_id` = `p`.`idpublicacion`))) join `tabla_equivalencia` `t` on((`t`.`idtablaEquivalencia` = `c`.`tablaEquivalencia_id`))) where (`i`.`fechaFinal` is not null) group by `semana_inicio` order by `semana_inicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pub_semana`
--

/*!50001 DROP VIEW IF EXISTS `v_pub_semana`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pub_semana` AS select cast((`p`.`fechaPublicacion` - interval weekday(`p`.`fechaPublicacion`) day) as date) AS `semana_inicio`,count(0) AS `publicaciones`,sum(`p`.`valorCredito`) AS `total_valor_credito` from `publicacion` `p` group by `semana_inicio` order by `semana_inicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_publicaciones_impacto`
--

/*!50001 DROP VIEW IF EXISTS `v_publicaciones_impacto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_publicaciones_impacto` AS select `p`.`idpublicacion` AS `idpublicacion`,`p`.`titulo` AS `titulo`,`p`.`descripcion` AS `descripcion`,`p`.`valorCredito` AS `valorCredito`,`c`.`cantidadUnidad` AS `cantidadUnidad`,`t`.`unidadMedida` AS `unidadMedida`,`t`.`factorCO2` AS `factorCO2`,`t`.`factorEnergiaKwh` AS `factorEnergiaKwh`,`t`.`factorAguaLitro` AS `factorAguaLitro`,round((`c`.`cantidadUnidad` * ifnull(`t`.`factorCO2`,0)),4) AS `impactoCO2`,round((`c`.`cantidadUnidad` * ifnull(`t`.`factorEnergiaKwh`,0)),4) AS `impactoEnergia`,round((`c`.`cantidadUnidad` * ifnull(`t`.`factorAguaLitro`,0)),4) AS `impactoAgua`,round((`c`.`cantidadUnidad` * ((ifnull(`t`.`factorCO2`,0) + ifnull(`t`.`factorEnergiaKwh`,0)) + ifnull(`t`.`factorAguaLitro`,0))),4) AS `impactoTotal` from ((`publicacion` `p` join `categoria` `c` on((`c`.`publicacion_id` = `p`.`idpublicacion`))) join `tabla_equivalencia` `t` on((`t`.`idtablaEquivalencia` = `c`.`tablaEquivalencia_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ranking_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `v_ranking_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ranking_usuarios` AS select `u`.`idusuario` AS `idusuario`,`u`.`nombreUser` AS `nombreUser`,count(distinct `p`.`idpublicacion`) AS `pubs`,sum((case when (`i`.`estadoIntercam` = 'completado') then 1 else 0 end)) AS `ventas`,round(sum((case when (`i`.`estadoIntercam` = 'completado') then `c`.`montoCustodio` else 0 end)),2) AS `bs_liberados` from (((`usuario` `u` left join `publicacion` `p` on((`p`.`usuario_id` = `u`.`idusuario`))) left join `intercambio` `i` on((`i`.`usuario_destino_id` = `u`.`idusuario`))) left join `custodio_credito` `c` on((`c`.`idcustodioCredito` = `i`.`custodioCredito_id`))) group by `u`.`idusuario`,`u`.`nombreUser` order by `bs_liberados` desc,`ventas` desc,`pubs` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_top_categorias`
--

/*!50001 DROP VIEW IF EXISTS `v_top_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_top_categorias` AS select `cat`.`nombreCategoria` AS `nombreCategoria`,count(distinct `p`.`idpublicacion`) AS `publicaciones`,sum(`p`.`valorCredito`) AS `total_valor` from ((`publicacion` `p` join `categoria` `c` on((`c`.`publicacion_id` = `p`.`idpublicacion`))) join `catalogo_categoria` `cat` on((`cat`.`idcatalogo` = `c`.`catalogo_id`))) group by `cat`.`nombreCategoria` order by `publicaciones` desc,`total_valor` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ventas_semana`
--

/*!50001 DROP VIEW IF EXISTS `v_ventas_semana`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ventas_semana` AS select cast((`i`.`fechaFinal` - interval weekday(`i`.`fechaFinal`) day) as date) AS `semana_inicio`,count(0) AS `ventas`,sum(`c`.`montoCustodio`) AS `monto_liberado` from (`intercambio` `i` join `custodio_credito` `c` on((`c`.`idcustodioCredito` = `i`.`custodioCredito_id`))) where ((`i`.`estadoIntercam` = 'completado') and (`i`.`fechaFinal` is not null)) group by `semana_inicio` order by `semana_inicio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-28  1:47:27
