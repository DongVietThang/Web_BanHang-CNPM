-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: eMarket
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mac','mac.jpg'),(2,'iPhone','iphone.jpg'),(3,'iPad','ipad.jpeg'),(4,'Accessories','1.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `city_region` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cc_number` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) NOT NULL,
  `date_created` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_number` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_customer_order_customer_idx` (`customer_id`),
  CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,504.00,'03/12/15 05:42:23',760995850,3),(2,504.00,'03/12/15 05:46:35',312205968,4),(3,504.00,'03/12/15 05:51:28',898886796,5),(4,504.00,'03/12/15 05:55:49',22072900,6),(5,504.00,'03/12/15 06:02:06',191171242,7);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_product`
--

DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_product` (
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_ordered_product_product_idx` (`product_id`),
  CONSTRAINT `fk_ordered_product_customer_order` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_product`
--

LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
INSERT INTO `ordered_product` VALUES (1,5,1),(2,5,1),(3,5,1),(4,5,1),(5,5,1);
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int(10) unsigned NOT NULL,
  `image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb_image` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_detail` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  KEY `product_category_idx` (`category_id`),
  CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'Mac Mini MGEM2',499.00,'Garanty 2 years. Full Box and accessories','2015-11-26 02:16:44',1,'2.jpg','thumb2.jpg','Mac mini is an affordable powerhouse that packs the entire Mac experience into a 7.7-inch-square frame. Just connect your own display, keyboard and mouse and you\'re ready to make big things happen.'),(6,'iPhone 6S',399.00,'Garanty 1 year. Full Box. Made in USA','2015-11-25 08:04:07',2,'3.jpg','thumb3.jpg','The moment you use iPhone 6s, you know you\'re never felt anything like it. With a single press, 3D Touch lets you do more than ever before. Live Photos bring your memories to life in a powerful vivid way.'),(7,'Macbook Air 11 inch',899.00,'Garanty 1 year. Up to 2 year with 10$. Full box.','2015-11-25 08:05:00',1,'4.jpg','thumb4.jpg','The 11-inch MacBook Air lasts up to 9 hours between charges and the 13-inch model lasts up to an incredible 12 hours. So from your morning coffee till your evening commute, you can work unplugged. When it’s time to kick back and relax, you can get up to 10 hours of iTunes movie playback on the 11-inch model and up to 12 hours on the 13-inch model.'),(8,'iPod',199.00,'Using iPod for listening music. Garanty 1 year.','2015-11-25 08:07:09',4,'5.jpg','thumb5.jpg','iPod touch is the perfect way to carry your music collection in your pocket. With the iTunes Store — the world’s largest music catalog — you can load up your iPod touch with your favorite songs. And thanks to iCloud, everything you purchase through the iTunes Store is automatically available on all your devices for free.'),(9,'USB SuperDrive',79.00,'USB Disk. Garanty 1 year. Full Box. Made in China Apple.','2015-11-25 08:07:36',4,'1.jpg','thumb1.jpg','Whether you’re at the office or on the road, you can play and burn both CDs and DVDs with the Apple USB SuperDrive. It’s perfect when you want to watch a DVD movie, install software, create backup discs, and more.'),(10,'iMac 21.5 inch',1099.00,'Brand new. Full box. Garanty 2 years.','2015-11-27 04:29:43',1,'imac-2012-1.jpg',NULL,'21.5‑inch (diagonal) LED‑backlit display. 1.6GHz dual-core or 2.8GHz quad-core Intel Core i5 processor Turbo Boost up to 3.3GHz. 1TB 5400‑rpm hard drive; 1TB or 2TB Fusion Drive; or 256GB flash storage (SSD). Magic Keyboard and Magic Mouse 2 or Magic Trackpad 2'),(11,'Ipad Mini 2013',499.00,'Every iPad mini comes with complimentary telephone technical support for 90 days from your iPad mini purchase date and a one-year limited warranty','2015-11-26 09:12:39',3,'ipad-mn-2.jpg',NULL,'The powerful and power-efficient A7 chip with 64-bit architecture makes everything remarkably responsive — while still delivering up to 10 hours of battery life'),(12,'ipad mini 4',499.00,'The new ipad version 2014, with three colors: white, silver and black. Full box and warranty 1 year.','2015-11-29 18:43:44',3,'ipad-mn-1.png',NULL,NULL),(13,'Iphone 6',600.00,'The iphone 6','2015-12-03 03:25:46',1,'iphone-6s-rose-gold-1.jpg',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_detail` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `information` longtext COLLATE utf8_unicode_ci,
  `image1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image3` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image4` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image5` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessories` longtext COLLATE utf8_unicode_ci,
  `guaranty` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (5,'CPU: 2.6GHz dual-core Intel Core i5 (Turbo Boost up to 3.1GHz) with 3MB on-chip shared L3 cache. HDD: 1TB (5400-rpm) hard drive. RAM: 8GB of 1600MHz LPDDR3 memory. ','mac_mini_1.jpg','mac_mini_2.jpg','mac_mini_3.jpg','mac_mini_4.png','mac_mini_5.jpg','Full box','2 years all over the world.'),(6,'Available in gold, silver, space gray, and rose gold, iPhone 6s features an A9 chip, 3D Touch, ultrafast LTE Advanced wireless, Touch ID, a 12MP iSight camera, and iOS 9. 4.7-inch (diagonal) LED-backlit widescreen next-generation Multi‑Touch display with IPS technology and Taptic Engine.1334-by-750-pixel resolution at 326 ppi. ','iphone-6s-rose-gold-1.jpg','iphone-6s-rose-gold-2.jpeg','iphone-6s-rose-gold-3.jpg','iphone-6s-rose-gold-4.jpg','iphone-6s-rose-gold-5.jpg','Full box','1 year.'),(7,'12‑inch (diagonal) LED‑backlit Retina display. 1.1GHz, 1.2GHz, or 1.3GHz dual‑core Intel Core M processor\nTurbo Boost up to 2.9GHz.Up to 9 hours battery life. Up to 512GB flash storage. 2.03 pounds.','mac-air-1.jpg','mac-air-2.jpg','mac-air-3.jpg','mac-air-4.jpg','mac-air-5.jpg','Full box.',NULL),(8,'iPod touch is the perfect way to carry your music collection in your pocket. With the iTunes Store — the world’s largest music catalog — you can load up your iPod touch with your favorite songs. And thanks to iCloud, everything you purchase through the iTunes Store is automatically available on all your devices for free.','ipod-classic-1.jpeg','ipod-classic-2.jpg','ipod-classic-3.jpg','ipod-classic-4.jpg','ipod-classic-5.jpg','Full box',NULL),(9,'The sleek, compact USB SuperDrive. Only slightly bigger than a CD case, the Apple USB SuperDrive slips easily into your travel bag when you hit the road and takes up little space on your desk or tray table when you’re working. You’ll never have to worry about lost cables with the Apple USB SuperDrive. It connects to your MacBook Pro with Retina display, MacBook Air, iMac, or Mac mini with a single USB cable that’s built into the SuperDrive. There’s no separate power adapter, and it works whether your Mac is plugged in or running on battery power. ','usb-1.jpg','usb-2.jpg','usb-3.jpg','usb-4.jpg','usb-5.jpeg','Full box','1 year'),(10,'21.5‑inch (diagonal) LED‑backlit display. 1.6GHz dual-core or 2.8GHz quad-core Intel Core i5 processor Turbo Boost up to 3.3GHz. 1TB 5400‑rpm hard drive; 1TB or 2TB Fusion Drive; or 256GB flash storage (SSD). Magic Keyboard and Magic Mouse 2 or Magic Trackpad 2.','imac-2012-1.jpg','imac-2012-2.jpg','imac-2012-3.jpg','imac-2012-4.jpg','imac-2012-5.jpg','Full box','2 years'),(11,'Everything runs better on iPad mini 4. And thanks to the A8 chip, graphics‑intensive apps are, well, intense. Video editing, modeling and design apps, and games — especially games — come to life, with incredible responsiveness, fluid motion, and fleet performance quality.','ipad-mn-1.png','ipad-mn-2.jpg','ipad-mn-3.jpg','ipad-mn-4.jpg','ipad-mn-5.jpg','Full box.','1 year.'),(12,'<p><em>Everything runs better on iPad mini 4. And thanks to the A8 chip, graphics, intensive apps are, well, intense.&nbsp;</em></p>\r\n\r\n<p><em>Video editing, modeling and design apps, and games &mdash; especially games &mdash; come to life, with incredible responsiveness, fluid motion, and fleet performance quality.</em></p>\r\n\r\n<p><em>The powerful and power-efficient A8&nbsp;chip with 64-bit architecture makes everything remarkably responsive &mdash; while still delivering up to 10 hours of battery life</em></p>\r\n','ipad-mn-1.png','ipad-mn-2.jpg','ipad-mn-3.jpg','ipad-mn-4.jpg','ipad-mn-5.jpg','<ul style=\"list-style-type:none\">\r\n	<li>1 year at Apple Store</li>\r\n	<li>Brand new and Full Box</li>\r\n</ul>\r\n','<ul style=\"list-style-type:none\">\r\n	<li>ipad mini 4</li>\r\n	<li>Charging cable</li>\r\n	<li>Adapter</li>\r\n</ul>\r\n'),(13,'<p>fdfdffd</p>\r\n','iphone-6s-rose-gold-1.jpg','iphone-6s-rose-gold-2.jpg','iphone-6s-rose-gold-3.jpg','iphone-6s-rose-gold-4.jpg','iphone-6s-rose-gold-5.jpg','','');
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eMarket'
--

--
-- Dumping routines for database 'eMarket'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 12:27:58
