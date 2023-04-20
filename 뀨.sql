-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbp
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accomodation_option`
--

DROP TABLE IF EXISTS `accomodation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accomodation_option` (
  `ao_num` int NOT NULL AUTO_INCREMENT,
  `ao_name` varchar(20) NOT NULL,
  `ao_capacity` int NOT NULL,
  `ao_price` int NOT NULL,
  `ao_room_number` varchar(20) NOT NULL,
  `ao_room_detail` longtext NOT NULL,
  `ao_pd_num` int NOT NULL,
  PRIMARY KEY (`ao_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accomodation_option`
--

LOCK TABLES `accomodation_option` WRITE;
/*!40000 ALTER TABLE `accomodation_option` DISABLE KEYS */;
INSERT INTO `accomodation_option` VALUES (7,'1',1,1,'1','1',2);
/*!40000 ALTER TABLE `accomodation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_list`
--

DROP TABLE IF EXISTS `buy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_list` (
  `bl_num` int NOT NULL AUTO_INCREMENT,
  `bl_state` varchar(10) NOT NULL,
  `bl_total_price` int NOT NULL,
  `bl_price` int NOT NULL,
  `bl_stack_mile` int NOT NULL,
  `bl_use_mile` int DEFAULT NULL,
  `bl_me_id` varchar(12) NOT NULL,
  `bl_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bl_num`),
  KEY `FK_member_TO_buy_list_1` (`bl_me_id`),
  CONSTRAINT `FK_member_TO_buy_list_1` FOREIGN KEY (`bl_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_list`
--

LOCK TABLES `buy_list` WRITE;
/*!40000 ALTER TABLE `buy_list` DISABLE KEYS */;
INSERT INTO `buy_list` VALUES (1,'이용완료',10000,10000,0,0,'abcd','2023-04-16 23:42:44');
/*!40000 ALTER TABLE `buy_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_me_id` varchar(12) NOT NULL,
  `co_title` varchar(50) NOT NULL,
  `co_content` longtext NOT NULL,
  `co_cc_category_num` int NOT NULL,
  `co_cs_schedule_num` int NOT NULL,
  `co_total_distance` varchar(15) NOT NULL,
  `co_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_update_date` datetime DEFAULT NULL,
  `co_up` int NOT NULL DEFAULT '0',
  `co_views` int NOT NULL DEFAULT '0',
  `co_down` int NOT NULL DEFAULT '0',
  `co_report` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`co_num`),
  KEY `FK_course_schedule_TO_course_1_idx` (`co_cs_schedule_num`),
  KEY `FK_course_category_TO_course_1_idx` (`co_cc_category_num`),
  CONSTRAINT `co_cc_category_num` FOREIGN KEY (`co_cc_category_num`) REFERENCES `course_category` (`cc_category_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `co_cs_schedule_num` FOREIGN KEY (`co_cs_schedule_num`) REFERENCES `course_schedule` (`cs_schedule_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'abcd','코스1','코스1',2,3,'0','2023-04-17 17:43:14',NULL,0,2,0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_category` (
  `cc_category_num` int NOT NULL AUTO_INCREMENT,
  `cc_category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cc_category_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'가족코스'),(2,'혼자여행'),(3,'도보코스'),(4,'힐링코스'),(5,'맛 코스'),(6,'캠핑코스'),(7,'반려동물과 함께');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_item`
--

DROP TABLE IF EXISTS `course_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_item` (
  `ci_num` int NOT NULL AUTO_INCREMENT,
  `ci_index` varchar(255) NOT NULL,
  `ci_co_num` int NOT NULL,
  `ci_pd_num` int NOT NULL,
  PRIMARY KEY (`ci_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_item`
--

LOCK TABLES `course_item` WRITE;
/*!40000 ALTER TABLE `course_item` DISABLE KEYS */;
INSERT INTO `course_item` VALUES (1,'1',1,2),(2,'2',1,1);
/*!40000 ALTER TABLE `course_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `cs_schedule_num` int NOT NULL AUTO_INCREMENT,
  `cs_schedule_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cs_schedule_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
INSERT INTO `course_schedule` VALUES (1,'당일여행'),(2,'1박 2일'),(3,'2박 3일 이상');
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_off`
--

DROP TABLE IF EXISTS `day_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_off` (
  `do_num` int NOT NULL AUTO_INCREMENT,
  `do_pd_num` int NOT NULL,
  `do_state` char(2) NOT NULL,
  `do_date` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`do_num`),
  KEY `FK_product_TO_day_off_1` (`do_pd_num`),
  CONSTRAINT `FK_product_TO_day_off_1` FOREIGN KEY (`do_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off`
--

LOCK TABLES `day_off` WRITE;
/*!40000 ALTER TABLE `day_off` DISABLE KEYS */;
INSERT INTO `day_off` VALUES (1,4,'정','월'),(2,4,'정','화'),(3,6,'정','월'),(4,6,'정','화'),(5,6,'정','수'),(6,6,'정','목'),(7,6,'정','금'),(8,6,'정','토'),(9,6,'정','일');
/*!40000 ALTER TABLE `day_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival_option`
--

DROP TABLE IF EXISTS `festival_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival_option` (
  `fo_num` int NOT NULL AUTO_INCREMENT,
  `fo_price` int NOT NULL,
  `fo_age` varchar(6) NOT NULL,
  `fo_pd_num` int NOT NULL,
  PRIMARY KEY (`fo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival_option`
--

LOCK TABLES `festival_option` WRITE;
/*!40000 ALTER TABLE `festival_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `festival_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `fi_num` int NOT NULL AUTO_INCREMENT,
  `fi_category` varchar(20) DEFAULT NULL,
  `fi_ori_name` varchar(255) NOT NULL,
  `fi_name` varchar(255) NOT NULL,
  `fi_table` varchar(255) NOT NULL,
  `fi_table_key` int NOT NULL,
  PRIMARY KEY (`fi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'게시글 썸네일','더미1.jpg','/2023/04/12/b224159c-49a2-4b02-8c12-90c5937fafd9_더미1.jpg','product',1),(2,'게시글 대표이미지','더미2.jpg','/2023/04/12/8a067d0d-1a20-4637-97b5-27c510b0dc9f_더미2.jpg','product',1),(3,'게시글 썸네일','썸네일.jpg','/2023/04/12/60c09af7-e734-4d68-9bfe-eb75cdea20d6_썸네일.jpg','product',2),(4,'게시글 대표이미지','더미2.jpg','/2023/04/12/79820789-381e-4609-8297-fff696743cf3_더미2.jpg','product',2),(6,NULL,'썸네일.jpg','/2023/04/12/cb531d88-188b-42f6-be04-b28e5dff6ac3_썸네일.jpg','accomodation_option',6),(7,NULL,'더미2.jpg','/2023/04/12/4da6df9b-2293-4685-b11a-f7f680e9d9dd_더미2.jpg','accomodation_option',7),(8,NULL,'더미2.jpg','/2023/04/16/5c52c0a8-60fe-4936-acc5-d48e336f0df8_더미2.jpg','qna',13),(9,NULL,'더미1.jpg','/2023/04/16/d9711141-f8b3-4cea-9e4d-d984d8e3c30f_더미1.jpg','qna',13),(10,NULL,'','/2023/04/16/ddd99d8e-586a-4209-9594-07a43efd66e1_','qna',13),(11,NULL,'','/2023/04/16/8334020c-062f-494c-a1bb-90e3347ba00d_','qna',13),(12,NULL,'','/2023/04/16/c699301c-0944-4e2d-9e1a-cc0d019e3cf3_','qna',13),(13,NULL,'더미1.jpg','/2023/04/16/ae3edd32-a7ea-4401-98f5-2c5b0acd9725_더미1.jpg','qna',15),(14,'게시글 썸네일','썸네일.jpg','/2023/04/17/74bb58d6-a7d1-4f9f-b44d-e85c73ab75df_썸네일.jpg','product',3),(15,'게시글 썸네일','더미2.jpg','/2023/04/18/618379f6-51f2-4bf8-94a0-248ad38c1f40_더미2.jpg','product',4),(16,'게시글 썸네일','썸네일.jpg','/2023/04/18/9d8ba728-b431-4993-991b-bf1508d715fb_썸네일.jpg','product',5),(17,'게시글 썸네일','썸네일.jpg','/2023/04/19/89be9ad4-8e9b-4e24-8b2a-e0f38e87d598_썸네일.jpg','product',6),(18,'게시글 썸네일','더미2.jpg','/2023/04/19/80fbf14d-006d-4136-8d0a-9eb31d383198_더미2.jpg','product',7),(19,'게시글 썸네일','더미2.jpg','/2023/04/19/085fffc3-7225-4b39-9821-99560af533a2_더미2.jpg','product',8),(20,'게시글 썸네일','더미2.jpg','/2023/04/19/5277a147-a650-48c2-8762-3e399393be5d_더미2.jpg','product',9);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash_tag`
--

DROP TABLE IF EXISTS `hash_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hash_tag` (
  `hg_num` int NOT NULL AUTO_INCREMENT,
  `hg_name` varchar(50) NOT NULL,
  `hg_pd_num` int NOT NULL,
  PRIMARY KEY (`hg_num`),
  KEY `FK_product_TO_hash_tag_1` (`hg_pd_num`),
  CONSTRAINT `FK_product_TO_hash_tag_1` FOREIGN KEY (`hg_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash_tag`
--

LOCK TABLES `hash_tag` WRITE;
/*!40000 ALTER TABLE `hash_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `hash_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmark_option`
--

DROP TABLE IF EXISTS `landmark_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmark_option` (
  `lo_num` int NOT NULL AUTO_INCREMENT,
  `lo_price` int NOT NULL,
  `lo_age` varchar(6) NOT NULL,
  `lo_pd_num` int NOT NULL,
  PRIMARY KEY (`lo_num`),
  KEY `FK_product_TO_landmark_option_1` (`lo_pd_num`),
  CONSTRAINT `FK_product_TO_landmark_option_1` FOREIGN KEY (`lo_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmark_option`
--

LOCK TABLES `landmark_option` WRITE;
/*!40000 ALTER TABLE `landmark_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `landmark_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `li_num` int NOT NULL AUTO_INCREMENT,
  `li_me_id` varchar(12) NOT NULL,
  `li_table_key` int NOT NULL,
  `li_updown` int NOT NULL,
  `li_table` varchar(45) NOT NULL,
  PRIMARY KEY (`li_num`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_position`
--

DROP TABLE IF EXISTS `map_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_position` (
  `mp_index` int NOT NULL AUTO_INCREMENT,
  `mp_x` double NOT NULL,
  `mp_y` double NOT NULL,
  `mp_pd_num` int NOT NULL,
  PRIMARY KEY (`mp_index`),
  KEY `FK_product_TO_map_position_1` (`mp_pd_num`),
  CONSTRAINT `FK_product_TO_map_position_1` FOREIGN KEY (`mp_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_position`
--

LOCK TABLES `map_position` WRITE;
/*!40000 ALTER TABLE `map_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_id` varchar(12) NOT NULL,
  `me_pw` varchar(16) NOT NULL,
  `me_name` varchar(13) NOT NULL,
  `me_birthday` date NOT NULL,
  `me_phone` varchar(13) NOT NULL COMMENT 'unique_key',
  `me_gender` char(1) NOT NULL,
  `me_authority` int NOT NULL DEFAULT '1',
  `me_nickname` varchar(16) NOT NULL,
  `me_street_address` varchar(50) NOT NULL,
  `me_registered_address` varchar(50) NOT NULL,
  `me_detail_address` varchar(100) NOT NULL,
  `me_mileage` int NOT NULL DEFAULT '0',
  `me_session_id` varchar(45) DEFAULT NULL,
  `me_session_limit` datetime DEFAULT NULL,
  `me_ma_email` varchar(50) NOT NULL,
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('abcd','1234','안건우','1993-01-13','010-3151-7063','남',10,'건우','서울시 은평구 가좌로 165','서울시 은평구 갈현동 662','오벨리스크 401호',100,NULL,NULL,'adasda');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_approve`
--

DROP TABLE IF EXISTS `member_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_approve` (
  `ma_email` varchar(50) NOT NULL,
  `ma_code` varchar(6) NOT NULL,
  `ma_validate_time` datetime NOT NULL,
  PRIMARY KEY (`ma_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_approve`
--

LOCK TABLES `member_approve` WRITE;
/*!40000 ALTER TABLE `member_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_profile`
--

DROP TABLE IF EXISTS `member_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_profile` (
  `mf_num` int NOT NULL AUTO_INCREMENT,
  `mf_name` varchar(255) NOT NULL,
  `mf_ori_name` varchar(255) NOT NULL,
  `mf_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`mf_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_profile`
--

LOCK TABLES `member_profile` WRITE;
/*!40000 ALTER TABLE `member_profile` DISABLE KEYS */;
INSERT INTO `member_profile` VALUES (2,'/2023/04/17/bde34016-5ce3-4e88-bc6b-f2fe247a5aaf_더미1.jpg','더미1.jpg','abcd');
/*!40000 ALTER TABLE `member_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mileage`
--

DROP TABLE IF EXISTS `mileage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mileage` (
  `mi_num` int NOT NULL AUTO_INCREMENT,
  `mi_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mi_update` int NOT NULL,
  `mi_me_id` varchar(12) NOT NULL,
  `mi_bl_num` int NOT NULL,
  PRIMARY KEY (`mi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileage`
--

LOCK TABLES `mileage` WRITE;
/*!40000 ALTER TABLE `mileage` DISABLE KEYS */;
INSERT INTO `mileage` VALUES (1,'2018-04-17 00:00:00',100,'abcd',0),(2,'2011-11-11 00:00:00',-100,'abcd',0);
/*!40000 ALTER TABLE `mileage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `ol_num` int NOT NULL AUTO_INCREMENT,
  `ol_amount` int NOT NULL,
  `ol_total_price` int NOT NULL,
  `ol_bl_num` int NOT NULL,
  `ol_option` varchar(10) NOT NULL,
  `ol_pc_num` int NOT NULL,
  PRIMARY KEY (`ol_num`),
  KEY `FK_buy_list_TO_order_list_1` (`ol_bl_num`),
  KEY `FK_product_category_TO_order_list_1` (`ol_pc_num`),
  CONSTRAINT `FK_buy_list_TO_order_list_1` FOREIGN KEY (`ol_bl_num`) REFERENCES `buy_list` (`bl_num`),
  CONSTRAINT `FK_product_category_TO_order_list_1` FOREIGN KEY (`ol_pc_num`) REFERENCES `product_category` (`pc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_num` int NOT NULL AUTO_INCREMENT,
  `pd_title` varchar(50) NOT NULL,
  `pd_content` longtext NOT NULL,
  `pd_subtitle` varchar(50) NOT NULL,
  `pd_street_address` varchar(50) NOT NULL,
  `pd_registerd_address` varchar(50) NOT NULL,
  `pd_detail_address` varchar(100) NOT NULL,
  `pd_parking` varchar(10) NOT NULL,
  `pd_capacity` int NOT NULL,
  `pd_viewcount` int NOT NULL DEFAULT '0',
  `pd_open_time` time NOT NULL,
  `pd_close_time` time NOT NULL,
  `pd_pc_num` int NOT NULL,
  `pd_fe_start` datetime DEFAULT CURRENT_TIMESTAMP,
  `pd_fe_end` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'여행지','<p>여행지<br></p>','여행지','여행지','여행지','여행지','여행지',111,8,'01:30:00','01:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(2,'숙박','<p>숙박<br></p>','숙박','숙박','숙박','숙박','숙박',1,3,'00:30:00','00:00:00',3,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(3,'여행지','<p>여행지<br></p>','여행지','여행지','여행지','여행지','여행지',11,13,'00:00:00','02:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(4,'여행지3','<p>여행지3<span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><br></p>','여행지3','여행지3','여행지3','여행지3','11',11,4,'01:00:00','00:30:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(5,'여행지4','<p>여행지4<br></p>','여행지4','여행지4','여행지4','여행지4','여행지4',11,1,'03:00:00','02:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(6,'축제1','<p>축제1<br></p>','축제1','축제1','축제1','축제1','축제1',123,2,'00:30:00','01:30:00',4,'2023-04-19 17:34:13','2023-04-19 17:34:13'),(7,'1','<p>ㅇㅁㄴ</p>','1','1','1','1','1',1,2,'00:00:00','00:00:00',4,'2023-04-23 00:00:00','2023-04-24 00:00:00'),(8,'1','<p>ㅇㅁㄴ</p>','1','1','1','1','1',1,2,'00:00:00','00:00:00',4,'2023-04-23 00:00:00','2023-04-24 00:00:00'),(9,'ㅇㅁㄴ','<p>ㅁㄴㅇㅁㄴㅇ</p>','ㅇㅁㄴㅇ','ㅇㅁㄴㅇ','ㅇㅁㄴㅇ','ㅇㄴㅁㅇ','ㅇㅁㄴㅇ',1,1,'00:00:00','00:30:00',1,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `pc_num` int NOT NULL AUTO_INCREMENT,
  `pc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`pc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'여행지'),(2,'음식점'),(3,'숙박'),(4,'축제');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_checked`
--

DROP TABLE IF EXISTS `product_checked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_checked` (
  `pdc_num` int NOT NULL AUTO_INCREMENT,
  `pdc_checked` char(1) NOT NULL DEFAULT '0',
  `pdc_pd_num` int NOT NULL,
  PRIMARY KEY (`pdc_num`),
  KEY `pdc_pd_num_idx` (`pdc_pd_num`),
  CONSTRAINT `pdc_pd_num` FOREIGN KEY (`pdc_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_checked`
--

LOCK TABLES `product_checked` WRITE;
/*!40000 ALTER TABLE `product_checked` DISABLE KEYS */;
INSERT INTO `product_checked` VALUES (1,'0',1),(2,'0',2);
/*!40000 ALTER TABLE `product_checked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qa_num` int NOT NULL AUTO_INCREMENT,
  `qa_title` varchar(100) NOT NULL,
  `qa_content` longtext NOT NULL,
  `qa_registerd_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qa_state` varchar(10) NOT NULL,
  `qa_me_id` varchar(12) NOT NULL,
  `qa_pd_num` int NOT NULL,
  `qa_qs_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qa_num`),
  KEY `FK_member_TO_Q&A_1` (`qa_me_id`),
  KEY `FK_Q&A_Sub_Category_TO_Q&A_1` (`qa_qs_category`),
  CONSTRAINT `FK_member_TO_Q&A_1` FOREIGN KEY (`qa_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_Q&A_Sub_Category_TO_Q&A_1` FOREIGN KEY (`qa_qs_category`) REFERENCES `qna_sub_category` (`qs_category`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (4,'412','412','2023-04-16 01:42:18','0','abcd',1,'결제'),(5,'413','41','2023-04-16 01:43:43','0','abcd',1,'상품 기타'),(6,'412','412','2023-04-16 01:45:06','0','abcd',1,'건의 요청'),(7,'41241','412','2023-04-16 01:46:15','0','abcd',1,'건의 요청'),(8,'12412412','412414','2023-04-16 01:46:52','0','abcd',1,'건의 요청'),(9,'12412412','412414','2023-04-16 01:46:52','0','abcd',1,'건의 요청'),(10,'41212124','412412','2023-04-16 01:50:01','0','abcd',1,'건의 요청'),(11,'4121212121212121212','124124124124124124','2023-04-16 01:50:10','0','abcd',1,'건의 요청'),(15,'완성?','완성?','2023-04-16 02:56:40','0','abcd',2,'건의 요청');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_answer`
--

DROP TABLE IF EXISTS `qna_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_answer` (
  `qaa_num` int NOT NULL AUTO_INCREMENT,
  `qaa_qa_num` int NOT NULL,
  `qaa_content` longtext NOT NULL,
  `qaa_registerd_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qaa_num`),
  KEY `FK_Q&A_TO_Q&A_Answer_1` (`qaa_qa_num`),
  CONSTRAINT `FK_Q&A_TO_Q&A_Answer_1` FOREIGN KEY (`qaa_qa_num`) REFERENCES `qna` (`qa_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_answer`
--

LOCK TABLES `qna_answer` WRITE;
/*!40000 ALTER TABLE `qna_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_category`
--

DROP TABLE IF EXISTS `qna_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_category` (
  `qc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qc_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_category`
--

LOCK TABLES `qna_category` WRITE;
/*!40000 ALTER TABLE `qna_category` DISABLE KEYS */;
INSERT INTO `qna_category` VALUES ('사이트 이용 문의'),('상품 관련 문의');
/*!40000 ALTER TABLE `qna_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_sub_category`
--

DROP TABLE IF EXISTS `qna_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_sub_category` (
  `qs_category` varchar(10) NOT NULL,
  `qs_qc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qs_category`),
  KEY `FK_Q&A_Category_TO_Q&A_Sub_Category_1` (`qs_qc_category`),
  CONSTRAINT `FK_Q&A_Category_TO_Q&A_Sub_Category_1` FOREIGN KEY (`qs_qc_category`) REFERENCES `qna_category` (`qc_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_sub_category`
--

LOCK TABLES `qna_sub_category` WRITE;
/*!40000 ALTER TABLE `qna_sub_category` DISABLE KEYS */;
INSERT INTO `qna_sub_category` VALUES ('건의 요청','사이트 이용 문의'),('사이트 기타','사이트 이용 문의'),('이용오류','사이트 이용 문의'),('결제','상품 관련 문의'),('상품 기타','상품 관련 문의'),('예약','상품 관련 문의');
/*!40000 ALTER TABLE `qna_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `rep_num` int NOT NULL AUTO_INCREMENT,
  `rep_table_key` int NOT NULL,
  `rep_content` longtext NOT NULL,
  `rep_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rep_category` varchar(25) NOT NULL,
  `rep_table` varchar(45) DEFAULT NULL,
  `rep_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`rep_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservated_option`
--

DROP TABLE IF EXISTS `reservated_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservated_option` (
  `ro_num` int NOT NULL AUTO_INCREMENT,
  `ro_option_name` varchar(30) NOT NULL,
  `ro_date` date NOT NULL,
  `ro_rp_num` int NOT NULL,
  `ro_pd_num` int NOT NULL,
  `ro_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`ro_num`),
  KEY `FK_reservation_possible_TO_reservated_option_1` (`ro_rp_num`),
  KEY `FK_member_TO_reservated_option_1` (`ro_me_id`),
  KEY `FK_product_TO_reservated_option_1` (`ro_pd_num`),
  CONSTRAINT `FK_member_TO_reservated_option_1` FOREIGN KEY (`ro_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_reservated_option_1` FOREIGN KEY (`ro_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reservation_possible_TO_reservated_option_1` FOREIGN KEY (`ro_rp_num`) REFERENCES `reservation_possible` (`rp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservated_option`
--

LOCK TABLES `reservated_option` WRITE;
/*!40000 ALTER TABLE `reservated_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservated_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_possible`
--

DROP TABLE IF EXISTS `reservation_possible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_possible` (
  `rp_num` int NOT NULL AUTO_INCREMENT,
  `rp_start_time` time NOT NULL,
  `rp_end_time` time NOT NULL,
  PRIMARY KEY (`rp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_possible`
--

LOCK TABLES `reservation_possible` WRITE;
/*!40000 ALTER TABLE `reservation_possible` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_possible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_room`
--

DROP TABLE IF EXISTS `reservation_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_room` (
  `rr_num` int NOT NULL AUTO_INCREMENT,
  `rr_check_in` date NOT NULL,
  `rr_check_out` date NOT NULL,
  `rr_ao_num` int NOT NULL,
  `rr_pd_num` int NOT NULL,
  `rr_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`rr_num`),
  KEY `FK_member_TO_reservation_room_1` (`rr_me_id`),
  KEY `FK_product_TO_reservation_room_1` (`rr_pd_num`),
  CONSTRAINT `FK_member_TO_reservation_room_1` FOREIGN KEY (`rr_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_reservation_room_1` FOREIGN KEY (`rr_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_room`
--

LOCK TABLES `reservation_room` WRITE;
/*!40000 ALTER TABLE `reservation_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restraunt_option`
--

DROP TABLE IF EXISTS `restraunt_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restraunt_option` (
  `reo_num` int NOT NULL AUTO_INCREMENT,
  `reo_name` varchar(30) NOT NULL,
  `reo_price` int NOT NULL,
  `reo_content` varchar(100) NOT NULL,
  `reo_pd_num` int NOT NULL,
  PRIMARY KEY (`reo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restraunt_option`
--

LOCK TABLES `restraunt_option` WRITE;
/*!40000 ALTER TABLE `restraunt_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `restraunt_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `re_me_id` varchar(12) NOT NULL,
  `re_content` longtext NOT NULL,
  `re_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `re_update_date` datetime DEFAULT NULL,
  `re_rating` float NOT NULL,
  `re_pd_num` int NOT NULL,
  PRIMARY KEY (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'abcd','1234','2011-11-11 00:00:00','2011-11-11 00:00:00',4,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_comment`
--

DROP TABLE IF EXISTS `review_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_comment` (
  `rc_num` int NOT NULL AUTO_INCREMENT,
  `rc_re_num` int NOT NULL,
  `rc_me_id` varchar(12) NOT NULL,
  `rc_content` longtext NOT NULL,
  `rc_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_comment`
--

LOCK TABLES `review_comment` WRITE;
/*!40000 ALTER TABLE `review_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_basket`
--

DROP TABLE IF EXISTS `shopping_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_basket` (
  `sb_num` int NOT NULL AUTO_INCREMENT,
  `sb_me_id` varchar(12) NOT NULL,
  `sb_amount` int NOT NULL,
  `sb_option` varchar(10) NOT NULL,
  `sb_pc_num` int NOT NULL,
  PRIMARY KEY (`sb_num`),
  KEY `FK_member_TO_shopping_basket_1` (`sb_me_id`),
  KEY `FK_product_category_TO_shopping_basket_1` (`sb_pc_num`),
  CONSTRAINT `FK_member_TO_shopping_basket_1` FOREIGN KEY (`sb_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_category_TO_shopping_basket_1` FOREIGN KEY (`sb_pc_num`) REFERENCES `product_category` (`pc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_basket`
--

LOCK TABLES `shopping_basket` WRITE;
/*!40000 ALTER TABLE `shopping_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_off`
--

DROP TABLE IF EXISTS `temp_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_off` (
  `to_num` int NOT NULL AUTO_INCREMENT,
  `to_do_num` int NOT NULL,
  `to_start` date NOT NULL,
  `to_end` date NOT NULL,
  PRIMARY KEY (`to_num`),
  KEY `FK_day_off_TO_temp_off_1` (`to_do_num`),
  CONSTRAINT `FK_day_off_TO_temp_off_1` FOREIGN KEY (`to_do_num`) REFERENCES `day_off` (`do_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_off`
--

LOCK TABLES `temp_off` WRITE;
/*!40000 ALTER TABLE `temp_off` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `use_member`
--

DROP TABLE IF EXISTS `use_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `use_member` (
  `um_bl_num` int NOT NULL AUTO_INCREMENT,
  `um_name` varchar(10) NOT NULL,
  `um_email` varchar(30) NOT NULL,
  `um_phone` varchar(13) NOT NULL,
  PRIMARY KEY (`um_bl_num`),
  CONSTRAINT `FK_buy_list_TO_use_member_1` FOREIGN KEY (`um_bl_num`) REFERENCES `buy_list` (`bl_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_member`
--

LOCK TABLES `use_member` WRITE;
/*!40000 ALTER TABLE `use_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `use_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishitem`
--

DROP TABLE IF EXISTS `wishitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishitem` (
  `wi_num` int NOT NULL AUTO_INCREMENT,
  `wi_pd_num` int NOT NULL,
  `wi_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`wi_num`),
  KEY `FK_member_TO_wishitem_1` (`wi_me_id`),
  KEY `FK_product_TO_wishitem_1` (`wi_pd_num`),
  CONSTRAINT `FK_member_TO_wishitem_1` FOREIGN KEY (`wi_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_wishitem_1` FOREIGN KEY (`wi_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishitem`
--

LOCK TABLES `wishitem` WRITE;
/*!40000 ALTER TABLE `wishitem` DISABLE KEYS */;
INSERT INTO `wishitem` VALUES (33,1,'abcd'),(40,2,'abcd');
/*!40000 ALTER TABLE `wishitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 21:48:39
