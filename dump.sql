-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: tpoportal
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'tpo repre');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,1),(3,1,7),(1,1,16);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add auth group',8,'add_authgroup'),(20,'Can change auth group',8,'change_authgroup'),(21,'Can delete auth group',8,'delete_authgroup'),(22,'Can add auth group permissions',9,'add_authgrouppermissions'),(23,'Can change auth group permissions',9,'change_authgrouppermissions'),(24,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(25,'Can add auth permission',10,'add_authpermission'),(26,'Can change auth permission',10,'change_authpermission'),(27,'Can delete auth permission',10,'delete_authpermission'),(28,'Can add auth user',11,'add_authuser'),(29,'Can change auth user',11,'change_authuser'),(30,'Can delete auth user',11,'delete_authuser'),(31,'Can add auth user groups',12,'add_authusergroups'),(32,'Can change auth user groups',12,'change_authusergroups'),(33,'Can delete auth user groups',12,'delete_authusergroups'),(34,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(35,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(36,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(37,'Can add django admin log',14,'add_djangoadminlog'),(38,'Can change django admin log',14,'change_djangoadminlog'),(39,'Can delete django admin log',14,'delete_djangoadminlog'),(40,'Can add django content type',15,'add_djangocontenttype'),(41,'Can change django content type',15,'change_djangocontenttype'),(42,'Can delete django content type',15,'delete_djangocontenttype'),(43,'Can add django migrations',16,'add_djangomigrations'),(44,'Can change django migrations',16,'change_djangomigrations'),(45,'Can delete django migrations',16,'delete_djangomigrations'),(46,'Can add django session',17,'add_djangosession'),(47,'Can change django session',17,'change_djangosession'),(48,'Can delete django session',17,'delete_djangosession'),(49,'Can add login tb',7,'add_logintb'),(50,'Can change login tb',7,'change_logintb'),(51,'Can delete login tb',7,'delete_logintb'),(52,'Can add discuss',19,'add_discuss'),(53,'Can change discuss',19,'change_discuss'),(54,'Can delete discuss',19,'delete_discuss'),(55,'Can add contactus',18,'add_contactus'),(56,'Can change contactus',18,'change_contactus'),(57,'Can delete contactus',18,'delete_contactus');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$1oLg19kvGg9p$PUvfgL1K0C1+89Q/VEVgWyBko9OMH9l/j3o5nhsdQL4=','2016-09-22 19:44:46',1,'ketankr9','','','ketankr9@gmail.com',1,1,'2016-09-16 18:24:09'),(2,'pbkdf2_sha256$30000$tVWpHiuUtf2l$g5LkNke24KLzoWQmF5tt88mqDLbMAff3SP5dp2EnO0g=','2016-09-22 19:44:21',0,'root','','','',1,1,'2016-09-21 10:38:41');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `query` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
INSERT INTO `contactus` VALUES (1,'shubham','sj38066@gmail.com','9782240033','regarding incorrect gpa','the gpa displayed on my profile is wrong'),(2,'rahul','sj380666@gmail.com','9721914430','regarding incorrect gmail id','the gpa displayed on my profile is gmail id'),(3,'mayank','sj66@gmail.com','9782241033','need information','give some information related shubham '),(4,'utsav','sj6@gmail.com','978141033','need a','give somea ');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `msg` varchar(1000) DEFAULT NULL,
  `grp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (6,15075048,'shubham','hello','cse15'),(7,15075012,'pritesh','hello user name pritesh','btech.cse15'),(9,15075014,'sjj','hello user name shubham jain how are u','idd.cse15'),(11,15075016,'mayank','hello user name utsav jain how are u','idd.mec15'),(13,15075043,'samant','hello user name pritesh  how are u','general'),(40,15074002,'mayank','hullo ?','idd.cse12'),(41,15074002,'mayank','anyone online?','idd.cse12'),(42,15075048,'shubham','I am.','idd.cse12');
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-09-21 10:37:33','1','tpo repre',1,'[{\"added\": {}}]',4,1),(2,'2016-09-21 10:38:41','2','root',1,'[{\"added\": {}}]',3,1),(3,'2016-09-21 10:39:44','2','root',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',3,1),(4,'2016-09-21 16:50:17','utsav','utsav',3,'',7,1),(5,'2016-09-23 07:24:16','hello','hello',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(8,'myapp','authgroup'),(9,'myapp','authgrouppermissions'),(10,'myapp','authpermission'),(11,'myapp','authuser'),(12,'myapp','authusergroups'),(13,'myapp','authuseruserpermissions'),(18,'myapp','contactus'),(19,'myapp','discuss'),(14,'myapp','djangoadminlog'),(15,'myapp','djangocontenttype'),(16,'myapp','djangomigrations'),(17,'myapp','djangosession'),(7,'myapp','logintb'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-16 18:19:22'),(2,'auth','0001_initial','2016-09-16 18:19:25'),(3,'admin','0001_initial','2016-09-16 18:19:25'),(4,'admin','0002_logentry_remove_auto_add','2016-09-16 18:19:25'),(5,'contenttypes','0002_remove_content_type_name','2016-09-16 18:19:26'),(6,'auth','0002_alter_permission_name_max_length','2016-09-16 18:19:26'),(7,'auth','0003_alter_user_email_max_length','2016-09-16 18:19:26'),(8,'auth','0004_alter_user_username_opts','2016-09-16 18:19:26'),(9,'auth','0005_alter_user_last_login_null','2016-09-16 18:19:27'),(10,'auth','0006_require_contenttypes_0002','2016-09-16 18:19:27'),(11,'auth','0007_alter_validators_add_error_messages','2016-09-16 18:19:27'),(12,'auth','0008_alter_user_username_max_length','2016-09-16 18:19:27'),(13,'sessions','0001_initial','2016-09-16 18:19:27'),(14,'myapp','0001_initial','2016-09-23 10:24:57');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('maoha5ljl2kqcftipzo41te1f6hrg0v4','YjhlNWEwYmRiNjZmZGE4YWJmNzc2ZWNkMmE1ZTZkZmRjZGJkOTgyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjMGJkNTNkMDY3YzRkNmZmZjAzY2VkNzY4ZmRkNmM3OGQ1NjcxZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-30 18:25:15'),('u93npp82jocb5it4ixe1f22jziqi4m33','YjhlNWEwYmRiNjZmZGE4YWJmNzc2ZWNkMmE1ZTZkZmRjZGJkOTgyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjMGJkNTNkMDY3YzRkNmZmZjAzY2VkNzY4ZmRkNmM3OGQ1NjcxZGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-10-06 19:44:46');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummy1`
--

DROP TABLE IF EXISTS `dummy1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dummy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col1` varchar(10) DEFAULT NULL,
  `col2` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummy1`
--

LOCK TABLES `dummy1` WRITE;
/*!40000 ALTER TABLE `dummy1` DISABLE KEYS */;
INSERT INTO `dummy1` VALUES (1,'utsav','B'),(2,'shubham','B'),(3,'rahul','A');
/*!40000 ALTER TABLE `dummy1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummy2`
--

DROP TABLE IF EXISTS `dummy2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dummy2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col1` varchar(10) DEFAULT NULL,
  `col2` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummy2`
--

LOCK TABLES `dummy2` WRITE;
/*!40000 ALTER TABLE `dummy2` DISABLE KEYS */;
INSERT INTO `dummy2` VALUES (1,'qwerty','A'),(2,'kkkkk','5'),(3,'AAAAAAA','A');
/*!40000 ALTER TABLE `dummy2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_tb`
--

DROP TABLE IF EXISTS `login_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Roll_no` varchar(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `passwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_tb`
--

LOCK TABLES `login_tb` WRITE;
/*!40000 ALTER TABLE `login_tb` DISABLE KEYS */;
INSERT INTO `login_tb` VALUES (1,'15075048','shubham jain','9782240033'),(2,'15074012','rahul kr','9782240321'),(3,'15074002','mayank','9382240321'),(4,'15074014','utsav','9384440321');
/*!40000 ALTER TABLE `login_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `Name` varchar(25) DEFAULT NULL,
  `Roll No` varchar(10) NOT NULL,
  `Branch` tinytext,
  `sec` varchar(10) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Interests` tinytext,
  `Email` tinytext,
  `Phone` int(11) DEFAULT NULL,
  `Address` tinytext,
  `Phone (Resedential)` int(11) DEFAULT NULL,
  `Address (Permanent)` tinytext,
  `City (Permanent)` tinytext,
  `Gender` enum('M','F') DEFAULT NULL,
  `Date of Birth` date DEFAULT NULL,
  `Category` tinytext,
  `CGPA` int(11) DEFAULT NULL,
  `GPA Details` tinytext NOT NULL,
  `Xth %` float DEFAULT NULL,
  `XIIth %` float DEFAULT NULL,
  `JEE AIR` int(11) DEFAULT NULL,
  `Father's Name` tinytext,
  `Occupation` tinytext,
  `Mother's Name` tinytext,
  PRIMARY KEY (`Roll No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES ('mayank','15074002','cse','idd',2012,'mayank@gmail.com','7271007328',0,NULL,0,'VaRANASIi','Male','','0000-00-00','9.0',NULL,'68',99,213,312,'R2J','DD3','3AJ'),('rahul','15074012','cse','idd',2012,'rahul@gmail.com','7271007338',0,NULL,0,'VARANASIi','Male','','0000-00-00','10.0',NULL,'98',99,1213,312,'RJ','DD','AJ'),('utsav','15074014','cse','idd',2012,'utsav@gmail.com','9782240033',0,NULL,0,'VARANASI','M','','0000-00-00','10.0',NULL,'98',99,1213,312,'RJ','DD','AJ'),('harsh','15075018','cse','btech',2012,'rangwani@gmail.com','7014165922',0,NULL,0,'Varanasi','MaLe','','0000-00-00','9.9',1996,'68',99,213,312,'R2J','DD3','3AJ'),('shubham','15075048','cse','idd',2012,'sj38066@gmail.com','9782240033',0,NULL,0,'VARANASI','M','','0000-00-00','10.0',NULL,'98',99,1213,312,'RJ','DD','AJ'),('shubham2','1507508','cse','idd',2012,'sj38066@gmail.com','9782240033',0,NULL,0,'VARANASI','M','','0000-00-00','10.0',NULL,'98',99,1213,312,'RJ','DD','AJ');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-14 23:35:57
