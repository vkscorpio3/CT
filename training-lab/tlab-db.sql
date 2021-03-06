CREATE DATABASE  IF NOT EXISTS `tlab_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tlab_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tlab_db
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Spring'),(2,'DOTNET');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `area_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`area_id`),
  KEY `fk_subject_idx` (`subject_id`),
  CONSTRAINT `fk_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,1,'Spring Core'),(2,1,'Spring MVC'),(3,1,'Spring Boot'),(4,2,'ASP'),(5,2,'C Sharp');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `question_type` enum('SINGLE_CHOICE','MULTI_CHOICE','FILL_IN') NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_area_idx` (`area_id`),
  CONSTRAINT `fk_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Which are the modules of core container?','ACTIVE','SINGLE_CHOICE'),(2,1,'What types of Dependency injection does spring supports?','ACTIVE','MULTI_CHOICE'),(3,1,'What is prototype scope?','ACTIVE','MULTI_CHOICE'),(4,1,'What is AOP?','ACTIVE','FILL_IN');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_choice`
--

DROP TABLE IF EXISTS `question_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_choice` (
  `choice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `corrected` enum('Y','N') NOT NULL,
  `fill_in` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `fk_question_idx` (`question_id`),
  CONSTRAINT `fk_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choice`
--

LOCK TABLES `question_choice` WRITE;
/*!40000 ALTER TABLE `question_choice` DISABLE KEYS */;
INSERT INTO `question_choice` VALUES (1,1,'Beans, Core, Context, SpEL','Y',NULL),(2,1,'Core, Context, ORM, Web','N',NULL),(3,1,'Core, Context, Aspects, Test','N',NULL),(4,1,'Bean, Core, Context, Test','N',NULL),(5,2,'Constructor based, Setter based','Y',NULL),(6,2,'Constructor based, Setter based, Getter Based','N',NULL),(7,2,'Setter based, Getter based, Properties based','Y',NULL),(8,2,'Constructor based, Setter based, Properties based','N',NULL),(9,3,'This scopes a single bean definition to have any number of object instances.','N',NULL),(10,3,'This scopes the bean definition to a single instance per HTTP Request.','Y',NULL),(11,3,'This scopes the bean definition to a single instance per HTTP Session.','Y',NULL),(12,3,'This scopes the bean definition to a single instance per HTTP Application/ Global session.','N',NULL),(13,4,NULL,'Y','Aspect Oriented Programming');
/*!40000 ALTER TABLE `question_choice` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_user_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
    (1,'admin','$2a$10$J5XpBSu92vN2T6Ra6obMO.95RMHb6CCbwKjxQDq.o.pgkzlPpnGqm','Admin'),
    (2,'btthuan','$2a$10$J5XpBSu92vN2T6Ra6obMO.95RMHb6CCbwKjxQDq.o.pgkzlPpnGqm','Bui Thanh Thuan'),
    (3,'nvluong','$2a$10$J5XpBSu92vN2T6Ra6obMO.95RMHb6CCbwKjxQDq.o.pgkzlPpnGqm','Nguyen Van Luong'),
    (4,'nvtri','$2a$10$J5XpBSu92vN2T6Ra6obMO.95RMHb6CCbwKjxQDq.o.pgkzlPpnGqm','Nguyen Van Tri'),
    (5,'hvtrung','$2a$10$J5XpBSu92vN2T6Ra6obMO.95RMHb6CCbwKjxQDq.o.pgkzlPpnGqm','Hoang Van Trung');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES
    ('ADMIN_ROLE', 'ADMIN_ROLE'),
    ('DG_ROLE', 'DG_ROLE'),
    ('DC_ROLE', 'DC_ROLE'),
    ('RAC_ROLE', 'RAC_ROLE'),
    ('MENTOR_ROLE', 'MENTOR_ROLE'),
    ('USER_ROLE', 'USER_ROLE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_role_id_idx` (`role_id`),
  CONSTRAINT `fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES
    (1,'ADMIN_ROLE'),
    (2,'DG_ROLE'),
    (3,'DC_ROLE'),
    (4,'RAC_ROLE'),
    (5,'RAC_ROLE'),
    (5,'MENTOR_ROLE'),
    (5,'USER_ROLE');
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `function_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` VALUES
    ('USER', 'USER'),
    ('USER_CHANGE_PASSWORD', 'USER_CHANGE_PASSWORD'),
    ('SUBJECT', 'SUBJECT'),
    ('AREA', 'AREA'),
    ('QUESTION_UPLOAD', 'QUESTION_UPLOAD'),
    ('TEST_DESIGN', 'TEST_DESIGN'),
    ('TEST_ASSIGNMENT', 'TEST_ASSIGNMENT'),
    ('TEST_EXECUTION', 'TEST_EXECUTION'),
    ('SCHEDULE', 'SCHEDULE'),
    ('SCHEDULE_REPORT', 'SCHEDULE_REPORT'),
    ('DELIVERY_GROUP', 'DELIVERY_GROUP'),
    ('DELIVERY_CENTER', 'DELIVERY_CENTER'),
    ('PROJECT', 'PROJECT'),
    ('SKILL', 'SKILL'),
    ('REQUEST', 'REQUEST'),
    ('CANDIDATE', 'CANDIDATE'),
    ('CANDIDATE_UPLOAD', 'CANDIDATE_UPLOAD'),
    ('TASK_CATEGORY', 'TASK_CATEGORY'),
    ('TASK_TEMPLATE', 'TASK_TEMPLATE'),
    ('TASK_ASSIGNMENT', 'TASK_ASSIGNMENT'),
    ('TASK_REPORT', 'TASK_REPORT');
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_function`
--

DROP TABLE IF EXISTS `role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_function` (
  `role_id` varchar(50) NOT NULL,
  `function_id` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`,`function_id`),
  KEY `fk_role_function_function_id_idx` (`function_id`),
  CONSTRAINT `fk_role_function_function_id` FOREIGN KEY (`function_id`) REFERENCES `function` (`function_id`),
  CONSTRAINT `fk_role_function_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_function`
--

LOCK TABLES `role_function` WRITE;
/*!40000 ALTER TABLE `role_function` DISABLE KEYS */;
INSERT INTO `role_function` VALUES
    ('USER_ROLE', 'USER_CHANGE_PASSWORD'),
    ('USER_ROLE', 'TEST_EXECUTION');
/*!40000 ALTER TABLE `role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `level` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Spring framework',1,'2018-04-06 00:00:00'),(2,'Spring boot',1,'2018-04-07 00:00:00'),(3,'Spring MVC',1,'2018-04-08 00:00:00');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plan`
--

DROP TABLE IF EXISTS `study_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plan` (
  `study_plan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  `completed` enum('Y','N') NOT NULL,
  PRIMARY KEY (`study_plan_id`),
  KEY `fk_user_idx_idx` (`user_id`),
  KEY `fk_area_idx_idx` (`area_id`),
  CONSTRAINT `fk_st_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_st_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan`
--

LOCK TABLES `study_plan` WRITE;
/*!40000 ALTER TABLE `study_plan` DISABLE KEYS */;
INSERT INTO `study_plan` VALUES (1,1,2,'N'),(2,2,1,'Y'),(3,1,3,'N');
/*!40000 ALTER TABLE `study_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_detail`
--

DROP TABLE IF EXISTS `test_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_detail` (
  `test_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`test_id`,`question_id`),
  KEY `fk_test_question_idx` (`question_id`),
  CONSTRAINT `fk_test_idx` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_detail`
--

LOCK TABLES `test_detail` WRITE;
/*!40000 ALTER TABLE `test_detail` DISABLE KEYS */;
INSERT INTO `test_detail` VALUES (1,1),(2,1),(2,2),(1,3),(2,3),(1,4),(2,4);
/*!40000 ALTER TABLE `test_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_test` (
  `user_test_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_test_id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_test_id_idx` (`test_id`),
  CONSTRAINT `fk_test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test`
--

LOCK TABLES `user_test` WRITE;
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
INSERT INTO `user_test` VALUES (1,1,2,0,NULL),(2,1,1,0,NULL),(3,2,1,0,NULL),(4,3,2,0,NULL);
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test_result`
--

DROP TABLE IF EXISTS `user_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_test_result` (
  `user_test_result_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_test_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  `choice_id` bigint(20) NOT NULL,
  `fill_in` varchar(255) DEFAULT NULL,
  `corrected` enum('Y','N') NOT NULL,
  PRIMARY KEY (`user_test_result_id`),
  KEY `fk_user_test_idx` (`user_test_id`),
  KEY `fk_user_question_idx` (`question_id`),
  KEY `fk_user_choice_idx` (`choice_id`),
  CONSTRAINT `fk_user_choice` FOREIGN KEY (`choice_id`) REFERENCES `question_choice` (`choice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_test` FOREIGN KEY (`user_test_id`) REFERENCES `user_test` (`user_test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test_result`
--

LOCK TABLES `user_test_result` WRITE;
/*!40000 ALTER TABLE `user_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mentor`
--

DROP TABLE IF EXISTS `user_mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mentor` (
  `user_mentor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `mentor_id` bigint(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_mentor_id`),
  KEY `fk_mentor_idx_idx` (`mentor_id`),
  KEY `fk_area_idx_idx` (`area_id`),
  KEY `fk_user_idx_idx` (`user_id`),
  CONSTRAINT `fk_area_idx` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mentor_idx` FOREIGN KEY (`mentor_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_idx1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mentor`
--

LOCK TABLES `user_mentor` WRITE;
/*!40000 ALTER TABLE `user_mentor` DISABLE KEYS */;
INSERT INTO `user_mentor` VALUES (1,1,4,1);
/*!40000 ALTER TABLE `user_mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feedback` (
  `user_feedback_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `feedback_date` datetime DEFAULT NULL,
  `feeder` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_feedback_id`),
  KEY `fk_uf_user_id_idx` (`user_id`),
  KEY `fk_fb_from_idx` (`feeder`),
  CONSTRAINT `fk_fb_from` FOREIGN KEY (`feeder`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_uf_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback`
--

LOCK TABLES `user_feedback` WRITE;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` VALUES (1,1,'Update later','2018-04-06 00:00:00',4);
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `week_id` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `mon_m` enum('Y','N') DEFAULT 'N',
  `mon_a` enum('Y','N') DEFAULT 'N',
  `tue_m` enum('Y','N') DEFAULT 'N',
  `tue_a` enum('Y','N') DEFAULT 'N',
  `wed_m` enum('Y','N') DEFAULT 'N',
  `wed_a` enum('Y','N') DEFAULT 'N',
  `thu_m` enum('Y','N') DEFAULT 'N',
  `thu_a` enum('Y','N') DEFAULT 'N',
  `fri_m` enum('Y','N') DEFAULT 'N',
  `fri_a` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`schedule_id`),
  KEY `fk_schedule_user_idx` (`user_id`),
  CONSTRAINT `fk_schedule_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'18-2018',2,'Y','Y','N','N','N','N','N','N','N','N'),(2,'18-2018',1,'N','N','Y','Y','N','N','N','N','N','N');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `candidate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `university` varchar(45) DEFAULT NULL,
  `faculty` varchar(45) DEFAULT NULL,
  `graduation_year` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'task1');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_group`
--

DROP TABLE IF EXISTS `delivery_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_group` (
  `delivery_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`delivery_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_group`
--

LOCK TABLES `delivery_group` WRITE;
/*!40000 ALTER TABLE `delivery_group` DISABLE KEYS */;
INSERT INTO `delivery_group` VALUES (1, 'DG1','DG1');
/*!40000 ALTER TABLE `delivery_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center`
--

DROP TABLE IF EXISTS `delivery_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_center` (
  `delivery_center_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_group_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`delivery_center_id`),
  KEY `delivery_group_id_idx` (`delivery_group_id`),
  CONSTRAINT `fk_delivery_group` FOREIGN KEY (`delivery_group_id`) REFERENCES `delivery_group` (`delivery_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center`
--

LOCK TABLES `delivery_center` WRITE;
/*!40000 ALTER TABLE `delivery_center` DISABLE KEYS */;
INSERT INTO `delivery_center` VALUES (1,1,'DC3','DC3');
/*!40000 ALTER TABLE `delivery_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_center_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `fk_delivery_center_idx` (`delivery_center_id`),
  CONSTRAINT `fk_delivery_center` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`delivery_center_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'GBST','GBST');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `skill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Java','Java 1');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `request_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `fk_project_idx` (`project_id`),
  KEY `fk_skill_idx` (`skill_id`),
  CONSTRAINT `fk_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_category`
--

DROP TABLE IF EXISTS `task_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_category` (
  `task_category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`task_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_category`
--

LOCK TABLES `task_category` WRITE;
/*!40000 ALTER TABLE `task_category` DISABLE KEYS */;
INSERT INTO `task_category` VALUES (1,'Task for Java Candidate', 'Task for Java Candidate');
/*!40000 ALTER TABLE `task_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_template`
--

DROP TABLE IF EXISTS `task_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_template` (
  `task_template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_category_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `estimate` float NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`task_template_id`),
  KEY `fk_task_category_idx` (`task_category_id`),
  CONSTRAINT `fk_task_category` FOREIGN KEY (`task_category_id`) REFERENCES `task_category` (`task_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_assignment`
--

DROP TABLE IF EXISTS `task_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignment` (
  `task_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`task_assignment_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_task_assignment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_detail`
--

DROP TABLE IF EXISTS `task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_detail` (
  `task_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_assignment_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `estimate` float NOT NULL,
  `status` enum('TODO','DOING','DONE') NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`task_detail_id`),
  KEY `fk_task_assignment_idx` (`task_assignment_id`),
  CONSTRAINT `fk_task_assignment` FOREIGN KEY (`task_assignment_id`) REFERENCES `task_assignment` (`task_assignment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `csv_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csv_candidate` (
  `csv_candidate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `csv_id` varchar(100) NOT NULL,
  `status` enum('OPEN','REVIEWED') NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `university` varchar(45) DEFAULT NULL,
  `faculty` varchar(45) DEFAULT NULL,
  `graduation_year` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`csv_candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-02 20:27:50
