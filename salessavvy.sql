-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: salessavvy
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_cart` (`user_id`),
  KEY `fk_product_cart` (`product_id`),
  CONSTRAINT `fk_product_cart` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_user_cart` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Accessories'),(5,'Mobile Accessories'),(4,'Mobiles'),(2,'Pants'),(1,'Shirts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `jwt_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (12,2,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc0MDcxNTE0MCwiZXhwIjoxNzQwNzE4NzQwfQ.l-tUaKYqCAcnlOaHeK-9oHBsP8Y4NzZ4wFaC4HjAJC5D1hTBAFErZxUil3-aBmMF4tmYC9KIT-YdANm38BGKBA','2025-02-28 10:29:00'),(15,3,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbjEiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3NDA3MzUwNDUsImV4cCI6MTc0MDczODY0NX0.kuegN55LhJGWqqTopTFJa8PLRnSoJggVE275PuXZXOdHx_-efC57SgyTV76bqI-T_vdqbOWJ_oC6LyEkbj2wDQ','2025-02-28 16:00:46'),(16,1,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzQyNDgwOTU3LCJleHAiOjE3NDI0ODQ1NTd9.pvaBtCQkRcAgMVHOn934WBVaDpJ_etavmXIYpxK0yk726JcxLtfhIpN_pZDpYTe3w9Rx0JVSDeTKYIooCDeW7g','2025-03-20 20:59:18');
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (14,'order_Pyc22wWAYPbVWN',10,1,1399.99,1399.99),(15,'order_Q0zRuE7R9NiWKZ',1,1,499.99,499.99),(16,'order_Q156HplvwHTRyt',31,1,18999.99,18999.99),(17,'order_Q156HplvwHTRyt',17,1,899.50,899.50),(18,'order_Q94wPp7JWxRee7',46,1,19999.99,19999.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('order_Py2iVajOJNnPPt',1,499.99,'PENDING','2025-02-20 17:12:19',NULL),('order_Pyc22wWAYPbVWN',1,1399.99,'SUCCESS','2025-02-22 03:45:08','2025-02-22 03:54:41'),('order_PyGcy2EAH2bvTv',1,2498.24,'PENDING','2025-02-21 06:48:47',NULL),('order_Q0zRuE7R9NiWKZ',1,499.99,'SUCCESS','2025-02-28 03:57:34','2025-02-28 03:58:34'),('order_Q156HplvwHTRyt',1,19899.49,'SUCCESS','2025-02-28 09:29:16','2025-02-28 09:30:06'),('order_Q94uo8bH1Rtj8E',1,19999.99,'PENDING','2025-03-20 14:30:19',NULL),('order_Q94wPp7JWxRee7',1,19999.99,'SUCCESS','2025-03-20 14:31:51','2025-03-20 14:33:35');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FK_product_id` (`product_id`),
  CONSTRAINT `FK_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,1,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt1.png'),(2,2,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt2.png'),(3,3,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt3.png'),(4,4,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt4.png'),(5,5,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt5.png'),(6,6,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt6.png'),(7,7,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt7.png'),(8,8,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt8.png'),(9,9,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png'),(10,10,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt10.png'),(11,11,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt11.png'),(12,12,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt12.png'),(13,13,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt13.png'),(14,14,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt14.png'),(15,15,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt15.png'),(16,16,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant1.png'),(17,17,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant2.png'),(18,18,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant3.png'),(19,19,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant4.png'),(20,20,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant5.png'),(21,21,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant6.png'),(22,22,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant7.png'),(23,23,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant8.png'),(24,24,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant9.png'),(25,25,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant10.png'),(26,26,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png'),(27,27,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant12.png'),(28,28,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant13.png'),(29,29,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant14.png'),(30,30,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant15.png'),(31,31,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv1.png'),(32,32,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv2.png'),(33,33,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv3.png'),(34,34,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv4.png'),(35,35,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv5.png'),(36,36,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv6.png'),(37,37,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv7.png'),(38,38,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv8.png'),(39,39,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv9.png'),(40,40,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv10.png'),(41,41,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv11.png'),(42,42,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv12.png'),(43,43,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv13.png'),(44,44,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv14.png'),(45,45,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv15.png'),(46,46,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png'),(47,47,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph2.png'),(48,48,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph3.png'),(49,49,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph4.png'),(50,50,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph5.png'),(51,51,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph6.png'),(52,52,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph7.png'),(53,53,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph8.png'),(54,54,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph9.png'),(55,55,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph10.png'),(56,56,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph11.png'),(57,57,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph12.png'),(58,58,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph13.png'),(59,59,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph14.png'),(60,60,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png'),(61,61,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma1.png'),(62,62,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma2.png'),(63,63,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma3.png'),(64,64,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma4.png'),(65,65,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma5.png'),(66,66,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png'),(67,67,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma7.png'),(68,68,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma8.png'),(69,69,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma9.png'),(70,70,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma10.png'),(72,72,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png'),(73,73,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png'),(74,74,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png');
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt21fyhfo321sw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt21fyhfo321sw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Shirt1','Stylish Shirt1',499.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(2,'Shirt2','Stylish Shirt2',599.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(3,'Shirt3','Stylish Shirt3',699.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(4,'Shirt4','Stylish Shirt4',799.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(5,'Shirt5','Stylish Shirt5',899.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(6,'Shirt6','Stylish Shirt6',999.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(7,'Shirt7','Stylish Shirt7',1099.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(8,'Shirt8','Stylish Shirt8',1199.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(9,'Shirt9','Stylish Shirt9',1299.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(10,'Shirt10','Stylish Shirt10',1399.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(11,'Shirt11','Stylish Shirt11',1499.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(12,'Shirt12','Stylish Shirt12',1599.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(13,'Shirt13','Stylish Shirt13',1699.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(14,'Shirt14','Stylish Shirt14',1799.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(15,'Shirt15','Stylish Shirt15',1899.99,100,1,'2025-01-01 12:11:26','2025-01-01 12:11:26'),(16,'Pant1','Stylish Pant1',799.99,50,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(17,'Pant2','Stylish Pant2',899.50,45,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(18,'Pant3','Stylish Pant3',759.99,40,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(19,'Pant4','Stylish Pant4',689.99,55,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(20,'Pant5','Stylish Pant5',999.99,30,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(21,'Pant6','Stylish Pant6',699.99,20,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(22,'Pant7','Stylish Pant7',849.50,35,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(23,'Pant8','Stylish Pant8',799.00,60,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(24,'Pant9','Stylish Pant9',729.99,25,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(25,'Pant10','Stylish Pant10',889.99,50,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(26,'Pant11','Stylish Pant11',819.99,40,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(27,'Pant12','Stylish Pant12',959.99,20,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(28,'Pant13','Stylish Pant13',999.00,70,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(29,'Pant14','Stylish Pant14',689.50,80,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(30,'Pant15','Stylish Pant15',899.99,90,2,'2025-01-04 19:08:11','2025-01-04 19:08:11'),(31,'TV1','Smart TV1 with HD display',18999.99,20,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(32,'TV2','Smart TV2 with Full HD display',21999.50,15,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(33,'TV3','Smart TV3 with 4K display',29999.00,10,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(34,'TV4','Smart TV4 with HDR and Dolby Vision',25999.99,12,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(35,'TV5','Smart TV5 with Ultra HD screen',34999.99,8,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(36,'TV6','Smart TV6 with Alexa Built-in',27999.50,18,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(37,'TV7','Smart TV7 with Android OS',22999.00,22,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(38,'TV8','Smart TV8 with High Refresh Rate',31999.99,14,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(39,'TV9','Smart TV9 with Thin Bezels',24999.99,20,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(40,'TV10','Smart TV10 with AI Upscaling',39999.00,5,3,'2025-01-04 19:28:04','2025-01-04 19:58:22'),(41,'Speaker','Worlds BEst',12999.99,50,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(42,'Nikon DSLR','Indias best',8999.50,75,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(43,'NIK DSLR2','Sales Choice',15999.00,40,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(44,'NIC DSLR3','Capture Nik',19999.99,30,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(45,'LAPTOP','Smart TV15 with AI Upscaling',24999.99,25,3,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(46,'Mobile1','Mobile6 with gaming chipset and high refresh rate',19999.99,50,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(47,'Mobile2','Mobile7 with gaming chipset and high refresh rate',8999.50,55,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(48,'Mobile3','Mobile8 with gaming chipset and high refresh rate',22999.00,50,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(49,'Mobile4','Mobile9 with gaming chipset and high refresh rate',8999.50,55,4,'2025-01-04 19:31:27','2025-01-04 20:12:48'),(50,'Mobile5','Mobile10 with gaming chipset and high refresh rate',39999.00,50,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(51,'Mobile6','Mobile10 with gaming chipset and high refresh rate',48765.00,30,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(52,'Mobile7','Mobile11 with gaming chipset and high refresh rate',23456.00,200,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(53,'Mobile8','Mobile12with gaming chipset and high refresh rate',34598.00,345,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(54,'Mobile9','Mobile13 with gaming chipset and high refresh rate',45673.00,45,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(55,'Mobile10','Mobile14 with gaming chipset and high refresh rate',34567.00,56,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(56,'Mobile11','Mobile15 with gaming chipset and high refresh rate',23412.00,65,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(57,'Mobile12','Mobile12 with gaming chipset and high refresh rate',89765.00,456,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(58,'Mobile13','Mobile14 with gaming chipset and high refresh rate',23456.00,567,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(59,'Mobile14','Mobile11 with gaming chipset and high refresh rate',99990.00,234,4,'2025-01-04 19:31:27','2025-01-04 20:14:51'),(60,'Mobile15','Mobile15 with gaming chipset and high refresh rate',45389.00,225,4,'2025-01-04 19:31:27','2025-01-06 15:11:42'),(61,'Mobile Accessory 1','A high-quality mobile accessory.',499.99,150,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(62,'Mobile Accessory 2','Durable and practical mobile accessory for everyday use.',349.50,200,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(63,'Mobile Accessory 3','A versatile mobile accessory with modern features.',899.00,80,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(64,'Mobile Accessory 4','Reliable mobile accessory designed for convenience.',749.75,120,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(65,'Mobile Accessory 5','Mobile accessory offering comfort and durability.',199.99,250,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(66,'Mobile Accessory 6','A stylish and protective mobile accessory.',249.99,500,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(67,'Mobile Accessory 7','Practical and efficient mobile accessory for everyday use.',599.00,180,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(68,'Mobile Accessory 8','An essential mobile accessory designed for convenience.',399.50,350,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(69,'Mobile Accessory 9','A reliable and well-built mobile accessory.',149.00,600,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(70,'Mobile Accessory 10','Compact and efficient mobile accessory for all your needs.',1099.99,100,5,'2025-01-06 15:23:10','2025-01-06 15:23:10'),(72,'new product','new product for test',1234.00,32,4,'2025-01-29 04:46:08','2025-01-29 04:46:08'),(73,'new product','new product for test',1234.00,32,4,'2025-01-29 04:46:12','2025-01-29 04:46:12'),(74,'new product','new product for test',1234.00,32,4,'2025-01-29 04:46:37','2025-01-29 04:46:37');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CUSTOMER') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','user@gmail.com','$2a$10$ngxPUZLsjF2qVAA8FeHkcOwjkpgbuu4FQYOYT3Nbj5usXKxUoc3YO','CUSTOMER','2025-02-19 16:22:00','2025-02-19 16:22:00'),(2,'admin','admin415@gmail.com','$2a$10$uv9oicPDahVsb1iOZa4nxuOehgb3AXgxYM4WNeL4dpiw7/4PT9tfG','ADMIN','2025-02-20 17:18:27','2025-02-20 17:18:27'),(3,'admin1','admin414@gmail.com','$2a$10$By8yHOB0.mnRJPMp3p8vruJwx75bLNaisITeEqbqh0lOMTrVuJESG','ADMIN','2025-02-20 17:26:49','2025-02-20 17:26:49');
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

-- Dump completed on 2025-03-22 17:24:39
