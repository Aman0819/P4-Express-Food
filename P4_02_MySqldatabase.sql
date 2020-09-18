-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: express
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `delivery_address`
--

DROP TABLE IF EXISTS `delivery_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `pincode` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_address_1_idx` (`client_id`),
  CONSTRAINT `fk_delivery_address_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_address`
--

LOCK TABLES `delivery_address` WRITE;
/*!40000 ALTER TABLE `delivery_address` DISABLE KEYS */;
INSERT INTO `delivery_address` VALUES (1,1,'45, Oak Street',100001),(2,4,'23, Waker Street',100002),(3,4,'121/B New West',100001),(4,7,'57, Oak Street',100001),(5,1,'23/A MIT Road',100003);
/*!40000 ALTER TABLE `delivery_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_item_name` varchar(100) NOT NULL,
  `menu_category` varchar(45) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'Chorizo and sausage spaghetti','main',23.99),(2,'Raspberry and almond Chickpea and falafel ciabattaake\n','dessert',29.99),(3,'Chickpea and falafel ciabatta','main',19.99),(4,'Salami salad with garlic dressing','main',12.99),(5,'Bacon and leek pie','dessert',16.99),(6,'Potato and coconut cake','dessert',9.80),(7,'Tongue and jasmine salad','main',18.00),(8,'Coriander and polenta cookies','dessert',23.00);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_schedule`
--

DROP TABLE IF EXISTS `menu_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_schedule` (
  `id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `item_day` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_schedule_1_idx` (`menu_item_id`),
  CONSTRAINT `fk_menu_schedule_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_schedule`
--

LOCK TABLES `menu_schedule` WRITE;
/*!40000 ALTER TABLE `menu_schedule` DISABLE KEYS */;
INSERT INTO `menu_schedule` VALUES (1,1,'2020-08-24'),(2,2,'2020-08-24'),(3,3,'2020-08-24'),(4,4,'2020-08-24'),(5,5,'2020-08-25'),(6,6,'2020-08-25'),(7,7,'2020-08-25'),(8,8,'2020-08-25');
/*!40000 ALTER TABLE `menu_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_1_idx` (`menu_item_id`),
  KEY `fk_order_item_2_idx` (`orders_id`),
  CONSTRAINT `fk_order_item_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`id`),
  CONSTRAINT `fk_order_item_2` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,1),(2,1,6,2),(3,2,2,1),(4,3,3,1),(5,3,5,2),(6,4,2,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `amount` decimal(5,3) NOT NULL,
  `delivery_person_id` int NOT NULL,
  `order_time` datetime NOT NULL,
  `time_delivered` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_history_1_idx` (`client_id`),
  KEY `fk_orders_1_idx` (`delivery_person_id`),
  CONSTRAINT `fk_order_history_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orders_1` FOREIGN KEY (`delivery_person_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Delivered',23.990,2,'2020-01-01 10:10:10','2020-01-01 10:23:08'),(2,4,'In Route',19.600,6,'2020-04-12 12:08:35',NULL),(3,4,'Delivered',11.000,6,'2020-08-20 01:08:12','2020-08-20 01:23:01'),(4,7,'Delivered',34.000,2,'2020-08-20 07:18:12','2020-08-20 07:28:12'),(5,1,'In Route',25.000,2,'2020-08-21 08:23:12',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Elvis','Small','9087654321','elvis@gmail.com','user'),(2,'Polly','Dominguez','9087654344','polly@gmail.com','delivery'),(3,'Arya','Mccabe','9087612321','arya@gmail.com','chef'),(4,'Hazel','Delacruz','9012345112','hazel@gmail.com','user'),(5,'Arandeep','Hilton','9087650000','arandeep@gmail.com','chef'),(6,'Liberty','Roth','9087654367','liberty@gmail.com','delivery'),(7,'Aron','Hogg','9834563429','aron@gmail.com','user');
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

-- Dump completed on 2020-09-14 21:48:58
