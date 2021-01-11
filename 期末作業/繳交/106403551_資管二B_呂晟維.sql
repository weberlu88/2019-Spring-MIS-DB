-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_106403551
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ItemStock`
--

DROP TABLE IF EXISTS `ItemStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ItemStock` (
  `idItemStock` int(11) NOT NULL,
  `StockQuanity` int(4) unsigned NOT NULL,
  `SupplierName` varchar(200) DEFAULT NULL,
  `SupplierPhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idItemStock`),
  CONSTRAINT `fkStock_form_Item` FOREIGN KEY (`idItemStock`) REFERENCES `tblItem` (`idtlbItem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemStock`
--

LOCK TABLES `ItemStock` WRITE;
/*!40000 ALTER TABLE `ItemStock` DISABLE KEYS */;
INSERT INTO `ItemStock` VALUES (1,20,'Akeem Byrne','0951417690'),(2,32,'Akeem Byrne','0951417690'),(3,100,'Akeem Byrne','0951417690'),(4,23,'Trey Yoder','0983652786'),(5,50,'Trey Yoder','0983652786'),(6,23,'Trey Yoder','0983652786'),(7,10,'August Wallis','0905343644'),(8,87,'August Wallis','0905343644'),(9,87,'Dante Weaver','034227151'),(10,99,'Dante Weaver','034227151'),(11,878,NULL,NULL);
/*!40000 ALTER TABLE `ItemStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCity`
--

DROP TABLE IF EXISTS `tblCity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblCity` (
  `idtblCity` int(10) unsigned NOT NULL,
  `CityName` varchar(45) NOT NULL,
  PRIMARY KEY (`idtblCity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCity`
--

LOCK TABLES `tblCity` WRITE;
/*!40000 ALTER TABLE `tblCity` DISABLE KEYS */;
INSERT INTO `tblCity` VALUES (1,'Taipei'),(2,'New_Taipei'),(3,'Taoyuan'),(4,'Taichung'),(5,'Changhua'),(6,'Chiayi'),(7,'Tainan'),(8,'Kaohsiung'),(9,'Pingtung'),(10,'Hualien ');
/*!40000 ALTER TABLE `tblCity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDistrict`
--

DROP TABLE IF EXISTS `tblDistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblDistrict` (
  `idtblDistrict` int(10) unsigned NOT NULL,
  `CityID` int(10) unsigned NOT NULL,
  `DistrictName` varchar(45) NOT NULL,
  PRIMARY KEY (`idtblDistrict`,`CityID`),
  KEY `fkCityID_idx` (`CityID`),
  CONSTRAINT `fkCityID` FOREIGN KEY (`CityID`) REFERENCES `tblCity` (`idtblCity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDistrict`
--

LOCK TABLES `tblDistrict` WRITE;
/*!40000 ALTER TABLE `tblDistrict` DISABLE KEYS */;
INSERT INTO `tblDistrict` VALUES (100,1,'Songshan'),(101,1,'Sinyi'),(200,2,'Tamsui'),(201,2,'Banqiao'),(300,3,'Jhongli'),(301,3,'Dasi'),(400,4,'Fongyoan'),(401,4,'Dajia'),(500,5,'Pusin'),(501,5,'Lugang'),(600,6,'Taibao'),(601,6,'Dongshih'),(700,7,'Yanshuei'),(701,7,'Sinying'),(800,8,'Fongshan'),(801,8,'Meinong'),(900,9,'Hengchun'),(901,9,'Donggang'),(1000,10,'Fonglin'),(1001,10,'Yuli');
/*!40000 ALTER TABLE `tblDistrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblItem`
--

DROP TABLE IF EXISTS `tblItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblItem` (
  `idtlbItem` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(512) NOT NULL,
  `Price` mediumint(6) unsigned NOT NULL,
  `ItemDescription` varchar(300) DEFAULT NULL,
  `ProductNumber` varchar(10) DEFAULT NULL,
  `isOffShelf` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtlbItem`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblItem`
--

LOCK TABLES `tblItem` WRITE;
/*!40000 ALTER TABLE `tblItem` DISABLE KEYS */;
INSERT INTO `tblItem` VALUES (1,'marker pen',50,'this is a marker pen','10720002',0),(2,'ruler',20,'this is a ruler','10720003',0),(3,'eraser',10,'this is an eraser','10720004',0),(4,'book',30,'this is a book ','10720005',0),(5,'apple',20,'this is an apple','10720006',0),(6,'pen',15,'this is a pen','10720007',0),(7,'pineapple',40,'this is a pineapple','10720008',0),(8,'Apple display',1000,'this is a pro display XDR','10720009',0),(9,'Apple stand',999,'this is a pro stand','10720010',0),(10,'iphone',700,'this is an iphone','10720011',0),(11,'Asus VivoBook s140ua',19999,'so good','1072012',0);
/*!40000 ALTER TABLE `tblItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOrder`
--

DROP TABLE IF EXISTS `tblOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblOrder` (
  `idtlbOrder` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CreateDateTime` datetime NOT NULL,
  `OrderTotal` mediumint(6) unsigned NOT NULL,
  `Delivery_city` int(10) unsigned NOT NULL,
  `Delivery_district` int(10) unsigned NOT NULL,
  `Delivery_address_line` char(200) NOT NULL,
  PRIMARY KEY (`idtlbOrder`),
  KEY `fkUserID_OrderID_idx` (`UserID`),
  KEY `fkDiliveryCity_idx` (`Delivery_city`),
  KEY `fkDeliveryDistrict_idx` (`Delivery_district`),
  CONSTRAINT `fkDeliveryCity` FOREIGN KEY (`Delivery_city`) REFERENCES `tblCity` (`idtblCity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkDeliveryDistrict` FOREIGN KEY (`Delivery_district`) REFERENCES `tblDistrict` (`idtblDistrict`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkUserID_OrderID` FOREIGN KEY (`UserID`) REFERENCES `tblUser` (`idtblUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOrder`
--

LOCK TABLES `tblOrder` WRITE;
/*!40000 ALTER TABLE `tblOrder` DISABLE KEYS */;
INSERT INTO `tblOrder` VALUES (1,1,'2019-06-06 00:00:00',100,4,401,'Hydra'),(2,2,'2019-06-06 00:00:00',75,10,1000,'Stark headquarter'),(3,3,'2019-06-06 00:00:00',240,1,100,'Asgard'),(4,4,'2019-06-06 00:00:00',13990,5,501,'Queen'),(5,5,'2019-06-06 00:00:00',14000,7,701,'nowhere'),(6,6,'2019-06-06 00:00:00',5600,6,600,'heaven'),(7,7,'2019-06-06 00:00:00',1650,2,201,'russia'),(8,8,'2019-06-06 00:00:00',2100,3,301,'space'),(9,9,'2019-06-06 00:00:00',400,8,801,'london'),(10,10,'2019-06-06 00:00:00',550,9,900,'country'),(18,1,'2019-06-18 23:10:54',0,1,100,'全家'),(19,1,'2019-06-19 10:09:44',1739973,1,100,'全家'),(20,1,'2019-05-15 00:00:00',1000,1,100,'qqqqq');
/*!40000 ALTER TABLE `tblOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOrderItems`
--

DROP TABLE IF EXISTS `tblOrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblOrderItems` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `Order_id` int(11) NOT NULL,
  `Item_id` int(11) NOT NULL,
  `ItemQuanity` int(4) unsigned NOT NULL,
  `ItemPrice` mediumint(6) unsigned NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `fk_tlbOrder_has_tlbItem_tlbItem1_idx` (`Item_id`),
  KEY `fk_tlbOrder_has_tlbItem_tlbOrder1_idx` (`Order_id`),
  CONSTRAINT `fk_tlbOrder_has_tlbItem_tlbItem1` FOREIGN KEY (`Item_id`) REFERENCES `tblItem` (`idtlbItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tlbOrder_has_tlbItem_tlbOrder1` FOREIGN KEY (`Order_id`) REFERENCES `tblOrder` (`idtlbOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOrderItems`
--

LOCK TABLES `tblOrderItems` WRITE;
/*!40000 ALTER TABLE `tblOrderItems` DISABLE KEYS */;
INSERT INTO `tblOrderItems` VALUES (1,1,2,2,20),(2,2,6,5,15),(3,3,7,6,40),(4,4,8,4,1000),(5,5,10,20,700),(6,6,10,8,700),(7,7,1,6,50),(8,8,4,70,30),(9,9,5,20,20),(10,10,6,10,15),(11,1,2,2,20),(12,1,5,3,20),(13,2,6,5,15),(14,3,7,6,40),(15,4,8,4,1000),(16,4,9,10,999),(17,5,10,20,700),(18,6,10,8,700),(19,7,1,6,50),(20,7,2,40,20),(21,7,3,55,10),(22,8,4,70,30),(23,9,5,20,20),(24,10,6,10,15),(25,10,7,10,40),(26,19,4,2,30),(27,19,11,87,19999),(28,20,3,90,10),(29,20,5,5,20);
/*!40000 ALTER TABLE `tblOrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblShoppingCart`
--

DROP TABLE IF EXISTS `tblShoppingCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblShoppingCart` (
  `Cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID_Cart` int(11) NOT NULL,
  `ItemID_Cart` int(11) NOT NULL,
  `Quanity_Cart` int(4) unsigned NOT NULL,
  `isDeleted` int(1) DEFAULT '0',
  PRIMARY KEY (`Cart_id`),
  KEY `fkItemID_idx` (`ItemID_Cart`),
  KEY `fkUserID_Cart` (`UserID_Cart`),
  CONSTRAINT `fkItemID_Cart` FOREIGN KEY (`ItemID_Cart`) REFERENCES `tblItem` (`idtlbItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkUserID_Cart` FOREIGN KEY (`UserID_Cart`) REFERENCES `tblUser` (`idtblUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblShoppingCart`
--

LOCK TABLES `tblShoppingCart` WRITE;
/*!40000 ALTER TABLE `tblShoppingCart` DISABLE KEYS */;
INSERT INTO `tblShoppingCart` VALUES (1,1,4,2,0),(2,2,3,1,0),(3,3,2,1,0),(4,3,1,1,0),(5,4,5,3,0),(6,5,6,1,0),(7,6,7,1,0),(8,7,8,2,0),(9,9,9,1,0),(10,9,10,1,0),(11,10,10,1,0),(17,1,11,33,0);
/*!40000 ALTER TABLE `tblShoppingCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUser`
--

DROP TABLE IF EXISTS `tblUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblUser` (
  `idtblUser` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `FullName` varchar(201) GENERATED ALWAYS AS (concat(`FirstName`,' ',`LastName`)) STORED,
  `Dob` date NOT NULL,
  `Salt` char(64) NOT NULL,
  `UUID` varchar(40) NOT NULL,
  `RegisterDateTime` datetime NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblUser`),
  UNIQUE KEY `email_UNIQUE` (`Email`),
  UNIQUE KEY `Salt_UNIQUE` (`Salt`),
  UNIQUE KEY `UUID_UNIQUE` (`UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUser`
--

LOCK TABLES `tblUser` WRITE;
/*!40000 ALTER TABLE `tblUser` DISABLE KEYS */;
INSERT INTO `tblUser` (`idtblUser`, `Email`, `FirstName`, `LastName`, `Dob`, `Salt`, `UUID`, `RegisterDateTime`, `isDeleted`) VALUES (1,'Marvel_Steve@gmail.com','Steve','Rogers','1918-07-04','63652315D22919A8EC76F58F982EC08A6244474F8082B8E75A1271B3C63948E9','371ff7ba-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',1),(2,'Marvel_Tony@gmail.com','Tony','Stark','1970-05-29','AA52032EAB8CC92F7B77CCE828940F95C2369F18DDF1C6B3A80A8A6195D137FB','371ffa30-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(3,'Marvel_Thor@gmail.com','Thor','God','1911-01-01','3C567E0EA40F26755BB221C96AB02CC726DE673E85016EC1D949D14E5B16B223','371ffb70-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(4,'Marvel_Peter@gmail.com','Peter','Parker','2000-08-10','95B79B147E492681F98C749E3AC329C1A975D3F4000FF25D0643D8D55A4E4E2B','371ffc9c-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(5,'Marvel_David @gmail.com','David ','Banner','1980-11-22','EB7F11AE33003238D3FF14094E3BC569F077B8F39DF472423FD339CE22B5F050','371ffdbe-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(6,'Marvel_Natasha@gmail.com','Natasha','Romanoff','1984-11-22','5F79D14FB8A43CA9350E781EA1067B14B197D36671182C4C15E9EDBD921791DD','372001ba-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(7,'Marvel_Wanda@gmail.com','Wanda','Maximoff','1980-08-02','9C681B6D73E80D3C1F10E06BDEB48914ABE207ADA83405DC14485B6AD060C021','372002f0-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(8,'Marvel_Carol@gmail.com','Carol','Danvers','1980-08-01','6C40F0CC5D46DCE7D1A0E1D118E0750A7874087FC7199DDA34D171131002DCA9','37200412-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(9,'Marvel_Stephen@gmail.com','Stephen','Strange','1930-07-01','039FB5567A6B559BE9999BF854BEF1699A14CB912AF431CCF90D9941900D8788','37200534-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(10,'Marvel_Clint@gmail.com','Clint','Barton','1971-01-07','ABC1523C0333408EFF2B8CCF4248A0B2175723EBC65C8D05940B9D434B7A39A2','37200656-8cd9-11e9-bc42-526af7764f64','2019-06-06 00:00:00',0),(11,'test1@ncu.edu.tw','Posey','Jackson','1890-12-01','640BCE948BA0EDCD29B353D0344FBC7E43594222D448BE55616770F20A542D75','4a2729c9-90c6-11e9-9cb8-080027be510b','2019-06-17 14:08:13',0);
/*!40000 ALTER TABLE `tblUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUserCredential`
--

DROP TABLE IF EXISTS `tblUserCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblUserCredential` (
  `idtblUserCredential` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `HashedPwd` varchar(512) NOT NULL,
  `CreateDateTime` datetime NOT NULL,
  PRIMARY KEY (`idtblUserCredential`,`UserID`),
  UNIQUE KEY `HashedPwd_UNIQUE` (`HashedPwd`),
  KEY `fkUserID_idx` (`UserID`),
  CONSTRAINT `fkUserID` FOREIGN KEY (`UserID`) REFERENCES `tblUser` (`idtblUser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserCredential`
--

LOCK TABLES `tblUserCredential` WRITE;
/*!40000 ALTER TABLE `tblUserCredential` DISABLE KEYS */;
INSERT INTO `tblUserCredential` VALUES (11,1,'pfNFnTx50OjhU','2019-06-06 00:00:00'),(12,2,'brpgOmotwsnkA','2019-06-07 00:00:00'),(13,3,'brCHXrfmx/hRs','2019-06-08 00:00:00'),(14,4,'broklWTNGanYM','2019-06-09 00:00:00'),(15,5,'brrQ/CUvMgDMI','2019-06-10 00:00:00'),(16,6,'brCAXrfmx/hRs','2019-06-11 00:00:00'),(17,7,'bretXExZ676DI','2019-06-12 00:00:00'),(18,8,'brhAsn.S9pHfM','2019-06-13 00:00:00'),(19,9,'brv2uIUQT8QN2','2019-06-14 00:00:00'),(20,10,'brtnGNHRCIzXY','2019-06-15 00:00:00'),(21,11,'BmrCS8YCeAPjk','2019-06-17 14:08:13');
/*!40000 ALTER TABLE `tblUserCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWishList`
--

DROP TABLE IF EXISTS `tblWishList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblWishList` (
  `WishList_id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID_Wish` int(11) NOT NULL,
  `ItemID_Wish` int(11) NOT NULL,
  `isDeleted` int(1) DEFAULT '0',
  PRIMARY KEY (`WishList_id`),
  KEY `fkWishList_UserID_idx` (`UserID_Wish`),
  KEY `fkWishList_ItemID` (`ItemID_Wish`),
  CONSTRAINT `fkWishList_ItemID` FOREIGN KEY (`ItemID_Wish`) REFERENCES `tblItem` (`idtlbItem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkWishList_UserID` FOREIGN KEY (`UserID_Wish`) REFERENCES `tblUser` (`idtblUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWishList`
--

LOCK TABLES `tblWishList` WRITE;
/*!40000 ALTER TABLE `tblWishList` DISABLE KEYS */;
INSERT INTO `tblWishList` VALUES (1,1,2,0),(2,2,3,0),(3,3,4,0),(4,4,5,0),(5,5,1,0),(6,6,2,0),(7,7,6,0),(8,8,3,0),(9,9,5,0),(10,10,10,0);
/*!40000 ALTER TABLE `tblWishList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_Monthly_report`
--

DROP TABLE IF EXISTS `view_Monthly_report`;
/*!50001 DROP VIEW IF EXISTS `view_Monthly_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_Monthly_report` AS SELECT 
 1 AS `Revenue Last Month`,
 1 AS `Average spending per order`,
 1 AS `Top 3 popular items bought`,
 1 AS `Number of new registration Last Month`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_106403551'
--
/*!50003 DROP FUNCTION IF EXISTS `FK_GETLASTMONTH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `FK_GETLASTMONTH`() RETURNS int(11)
BEGIN

	DECLARE result INT DEFAULT 0;
    SET result = month( now() );
    IF result = 1 THEN
		SET result = 12;
	ELSE 
		SET result = result - 1;
	END IF;

RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FK_NUMBEROFNEWREGISTRATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `FK_NUMBEROFNEWREGISTRATION`( 
	in_month INT 
) RETURNS int(11)
BEGIN

	DECLARE n int default 0;
    
    SELECT COUNT(distinct idtblUser) AS `new in` 
    INTO n
    FROM tblUser 
    WHERE ( month(RegisterDateTime) = in_month );

RETURN n;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FK_TOPTHREEPOPULARITEMSBOUGHT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` FUNCTION `FK_TOPTHREEPOPULARITEMSBOUGHT`(
	in_month INT
) RETURNS varchar(50) CHARSET utf8
BEGIN
	-- 沒辦法篩月分了

	DECLARE outputString varchar(50);
	SELECT group_concat(Item_id) 
    INTO outputString 
    FROM (
		SELECT COUNT(Order_id) AS `count`, Item_id 
		FROM tblOrderItems INNER JOIN tblOrder 
        ON tblOrderItems.Order_id = tblOrder.idtlbOrder
        WHERE month(tblOrder.CreateDateTime) = in_month AND year(tblOrder.CreateDateTime) = year(now())
		GROUP BY Item_id
		ORDER BY COUNT(Order_id) desc 
		LIMIT 3
	) tblItemCount;

RETURN outputString;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_AddItem`(
	IN itemName varchar(512),
    IN itemPrice int,
    IN itemDescription tinytext,
    IN product_number char(8),
    IN stock int(4),
    OUT affected_row INT
)
BEGIN
-- input : itemName(varchar(512)), price(int), description(tinytext), product_number(char(8)), stock(int(4))
-- output parameter : Number of affected row(int)
-- 透過 sp_ AddItem，輸入商品名字,價格,商品描述,商品序號(非商品 ID)以及庫存數量，進行增加此商品。
-- 此題目描述只能新增項目，不能update數量

	INSERT INTO tblItem (ItemName, Price, ItemDescription, ProductNumber, isOffShelf)
	VALUES (itemName, itemPrice, itemDescription, product_number, 0);
    SET affected_row = row_count();
    
    INSERT INTO ItemStock (idItemStock, StockQuanity)
    VALUES (LAST_INSERT_ID(), stock);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddItemToShoppingCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_AddItemToShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    IN in_itemQty int(4),
    OUT out_affected_row INT
)
BEGIN
-- input: user_id(int(11)), item_id (int(11)) , itemQty(int(4))
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ AddItemToShoppingCart，輸入會員 ID,商品 ID 以及會員要買此商品的數量，將此商品加入到會員的購物車。
	
    DECLARE init_qty INT(4);
    DECLARE stock_qty INT(4);
    DECLARE item_isOffShelf tinyint(1);
    SET out_affected_row = 0;
    
    -- get stock_qty of item
    SELECT StockQuanity INTO stock_qty FROM ItemStock WHERE (idItemStock = in_item_id);
	SELECT isOffShelf INTO item_isOffShelf FROM tblItem WHERE (idtlbItem = in_item_id);
    
	-- 數量不為0 且存貨要夠 且沒有被下架 
    IF (in_itemQty != 0 AND stock_qty >= in_itemQty AND item_isOffShelf != 1) THEN
        
		-- SELECT init_qty := Quanity_Cart FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
		SELECT Quanity_Cart INTO init_qty FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
		IF (init_qty is NULL OR init_qty = 0) THEN
			-- 此項目沒加入過購物車 => INSERT
			INSERT INTO tblShoppingCart (UserID_Cart, ItemID_Cart, Quanity_Cart)
			VALUES (in_user_id, in_item_id, in_itemQty);
            SET out_affected_row = row_count();
            SELECT in_user_id;
		END IF;

    END IF;
        
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
	in in_user_id INT,
    out out_affected_row INT
)
BEGIN
-- 透過 sp_ DeleteUserByUserID，輸入會員 ID，進行刪除此會員。
-- output parameter: Number of affected row(int)

	-- DECLARE id_delete INT; -- 多此一舉
	-- SET id_delete = (SELECT isDeleted FROM tblUser WHERE idtblUser = in_user_id);
    
    -- 刪除User >> 修改 isDeleted = 1
	UPDATE tblUser
    SET isDeleted = 1
    WHERE (idtblUser = in_user_id) AND (isDeleted = 0);
    
    SET out_affected_row = row_count();
    
    -- 刪除id在tblShoppingCart和tblWishList的東西 >> 修改 isDeleted = 1
    UPDATE tblShoppingCart
	SET isDeleted = 1
	WHERE (UserID_Cart = in_user_id);
    UPDATE tblWishList
	SET isDeleted = 1
	WHERE (UserID_Wish = in_user_id);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAllUser_option` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetAllUser_option`()
BEGIN

-- 不管有沒有delete都印出來
	SELECT * 
    FROM tblUser
    JOIN tblUserCredential
    WHERE(tblUser.idtblUser = tblUserCredential.UserID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetCityList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetCityList`()
BEGIN
	-- 透過 sp_GetCityList，可以獲得全部城市的 ID 以及名字。
	select idtblCity, CityName
    from tblCity;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetDistrictByCityID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetDistrictByCityID`(
	in in_city_id INT
)
BEGIN

	-- 透過 sp_GetDistrictByCityID，輸入城市 ID，可以獲得此城市的 ID，還有其街區 ID 與街區名字。
    SELECT idtblCity, CityName, idtblDistrict, DistrictName
	FROM  tblCity
	JOIN tblDistrict ON (tblCity.idtblCity = tblDistrict.CityID)
	WHERE (idtblCity = in_city_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUserShoppingCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_GetUserShoppingCart`(
	IN in_user_id int(11)
)
BEGIN
-- input: user_id (int)
-- result set: 自行選擇
-- output parameter :無
-- 透過 sp_ GetUserShoppingCart，輸入會員 ID，可以獲得會員 ID 以及會員購物車中的商品ID 與商品數量。

	SELECT * FROM tblShoppingCart
    WHERE (UserID_Cart = in_user_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PlaceOrderFromShoppingCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_PlaceOrderFromShoppingCart`(
	IN in_user_id int(11),
    IN in_city_id int(11),
    IN in_district_id int(11),
    IN in_addrLine varchar(100),
    OUT out_num_itemAdded int
)
BEGIN
-- input: user_id(int), city_id(int), district_id(int), AddrLine (varchar(100))
-- result set:無
-- output parameter:NumOfItemsAdded(int)
-- 透過 sp_ PlaceOrderFromShoppingCart，將購物車的商品做結帳。
-- 這裡我沒把此帳號的購物車清空! 庫存也沒有減少! 要在call SP自己刪除。

	DECLARE orderprice INT DEFAULT 0;
    DECLARE thisOrder_id INT;
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE i_id INT DEFAULT 0;
    DECLARE i_qty INT DEFAULT 0;
    DECLARE i_price INT DEFAULT 0;
    DECLARE i_totalprice INT DEFAULT 0;
    
    DROP temporary table if exists tbl_toPay;
    CREATE TEMPORARY TABLE tbl_toPay
	(
        Col_id int(11) auto_increment primary key,
        Item_id int(11),
        Qty int(4),
        Price mediumint(6)
	)ENGINE = MEMORY;
    
    -- 抓出該user的ShoppingCart有哪些items
    INSERT INTO tbl_toPay (Item_id, Qty, Price)
	SELECT ItemID_Cart, Quanity_Cart, tblItem.Price
    FROM tblShoppingCart 
    JOIN tblItem
    ON (tblShoppingCart.ItemID_Cart = tblItem.idtlbItem)
	WHERE (UserID_Cart = in_user_id);
    
    -- 求得共幾項物品
    SELECT COUNT(*) FROM tbl_toPay INTO n;
    SET out_num_itemAdded = n;
    SELECT * from tbl_toPay;
	-- SELECT n;
    
    -- 計算單一物品的總價/訂單總價 >> loop
    SET i = 1;
    WHILE i <= n DO -- i = 1 ~ n 且會跟隨tbl_toPay的Col_id
		SELECT Qty, Price INTO i_qty, i_price from tbl_toPay WHERE (Col_id = i);
        SET i_totalprice = i_qty * i_price;
        SET orderprice = orderprice + i_totalprice;
		SET i = i + 1;
    END WHILE;
    
    -- 最後INSERT到tblOrder中 >> 單筆訂單
    INSERT INTO tblOrder (UserID, CreateDateTime, OrderTotal, Delivery_city, Delivery_district, Delivery_address_line)
    VALUES (in_user_id, now(), orderprice, in_city_id, in_district_id, in_addrLine);
    
    SET thisOrder_id = LAST_INSERT_ID();
    
    -- INSERT購買的商品(id qty 購買當時的price)到tblOrderItems >> 多筆用loop
	SET i = 1;
    WHILE i <= n DO -- i = 1 ~ n 且會跟隨tbl_toPay的Col_id
		SELECT Item_id, Qty, Price INTO i_id, i_qty, i_price from tbl_toPay WHERE (Col_id = i);
		INSERT INTO tblOrderItems (Order_id, Item_id, ItemQuanity, ItemPrice)
		VALUES (thisOrder_id, i_id, i_qty, i_price);
		SET i = i + 1;
    END WHILE;

	DROP temporary table if exists tbl_toPay;
    -- done
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PutItemOffShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_PutItemOffShelf`(
	IN in_item_id int(11),
    OUT out_affected_row int
)
BEGIN
-- input: item_id (int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ PutItemOffShelf，輸入商品 ID，將商品下架。

	-- 把商品isOffShelf的值設為1
    UPDATE tblItem SET isOffShelf = 1   
    WHERE (idtlbItem = in_item_id AND isOffShelf = 0);
	-- 從所有含有此商品的購物車，刪除此商品(直接刪喔)
    DELETE FROM tblShoppingCart 
    WHERE (ItemID_Cart = in_item_id);
    
    SET out_affected_row = row_count();



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
	in in_Email varchar(200),
    in in_FirstName varchar(100),
    in in_LastName varchar(100),
    in in_DOB DATE,
    in in_Salt char(64),
    in in_HashedPwd varchar(512)
)
BEGIN

	INSERT INTO tblUser(Email, FirstName, LastName, DOB, Salt, UUID, RegisterDateTime)
	VALUES(in_Email, in_FirstName, in_LastName, in_DOB, in_Salt, uuid(), now());

	SET @last_insert_id = LAST_INSERT_ID();

	INSERT INTO tblUserCredential(HashedPwd, CreateDateTime, UserID)
	VALUES(in_HashedPwd, now(), @last_insert_id);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RemoveItemFromShoppingCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_RemoveItemFromShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    OUT out_affected_row int
)
BEGIN
-- input: user_id(int), item_id(int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ RemoveItemFromShoppingCart，輸入會員 ID 以及商品 ID，可以刪除會員購物車中的商品。

    DELETE FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
    SET out_affected_row = row_count();
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateItemQty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UpdateItemQty`(
	IN in_ProductNumber int(11),
    IN in_Qty int(4),
    OUT affected_row INT
)
BEGIN
-- 要加多少數量

	DECLARE item_id INT;
	SELECT idtlbItem INTO item_id 
    FROM tblItem 
    WHERE (ProductNumber = in_ProductNumber);

	UPDATE ItemStock
    SET StockQuanity = StockQuanity + in_Qty
    WHERE (item_id = idItemStock);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateItemQtyInShoppingCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UpdateItemQtyInShoppingCart`(
	IN in_user_id int(11),
    IN in_item_id int(11),
    IN in_itemQty int(4),
    OUT out_affected_row int
)
BEGIN
-- input: user_id(int), item_id(int), itemQty(int)
-- result set:無
-- output parameter : Number of affected row(int)
-- 透過 sp_ UpdateItemQtyInShoppingCart，輸入會員 ID,商品 ID 以及此商品的購買數量，進行修改會員購物車中的商品數量。

	DECLARE init_qty INT(4);
    DECLARE stock_qty INT(4);
    SET out_affected_row = 0;
    
    -- get stock_qty of Item / init_qty in Cart
    SELECT StockQuanity INTO stock_qty FROM ItemStock WHERE (idItemStock = in_item_id);
    SELECT Quanity_Cart INTO init_qty FROM tblShoppingCart WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
    
    -- 數量不為0且存貨要夠
    IF (in_itemQty != 0 AND stock_qty >= in_itemQty) THEN
    
        IF init_qty is NOT NULL THEN
		-- 已經在購物車裡 => UPDATE加上去
		UPDATE tblShoppingCart
		SET Quanity_Cart = in_itemQty + init_qty
		WHERE (UserID_Cart = in_user_id AND ItemID_Cart = in_item_id);
        SET out_affected_row = row_count();
        
		END IF;
    
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`catcat`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
	IN in_Email VARCHAR(200)
    -- OUT out_HashedPwd VARCHAR(512)
    )
BEGIN
-- 透過 sp_UserLogin，輸入會員的電子信箱，可以獲得其使用者的電子信箱,姓氏,名字,生日,salt,UUID 以及註冊日期，進行會員登入。
-- https://pastebin.com/BtYg3GXN?fbclid=IwAR1o4XzVz5BIfrpMRKNMWBkCuhHISu7OVjEjxXNkv0RS9yJD-tOwQelNxI8
-- 已做驗證
    
    SELECT idtblUser, Email, FullName, Dob, Salt, UUID, RegisterDateTime
    FROM tblUser
    JOIN tblUserCredential ON (tblUser.idtblUser = tblUserCredential.UserID) -- id相同就join
    WHERE (Email = in_Email) AND (tblUser.isDeleted != 1); -- 比對in_email和未被刪除
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_Monthly_report`
--

/*!50001 DROP VIEW IF EXISTS `view_Monthly_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`catcat`@`192.168.56.1` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Monthly_report` AS select sum(`tblOrder`.`OrderTotal`) AS `Revenue Last Month`,(sum(`tblOrder`.`OrderTotal`) / count(`tblOrder`.`idtlbOrder`)) AS `Average spending per order`,`FK_TOPTHREEPOPULARITEMSBOUGHT`(`FK_GETLASTMONTH`()) AS `Top 3 popular items bought`,`FK_NUMBEROFNEWREGISTRATION`(`FK_GETLASTMONTH`()) AS `Number of new registration Last Month` from `tblOrder` where ((month(`tblOrder`.`CreateDateTime`) = `FK_GETLASTMONTH`()) and (year(`tblOrder`.`CreateDateTime`) = year(now()))) */;
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

-- Dump completed on 2019-06-21 16:41:13
