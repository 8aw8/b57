-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema b57
--

CREATE DATABASE IF NOT EXISTS b57;
USE b57;

--
-- Definition of table `creator`
--

DROP TABLE IF EXISTS `creator`;
CREATE TABLE `creator` (
  `creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_adress` char(120) DEFAULT NULL,
  `creator_name` char(50) DEFAULT NULL,
  `creator_www` char(50) DEFAULT NULL,
  `creator_phone` int(12) DEFAULT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creator`
--

/*!40000 ALTER TABLE `creator` DISABLE KEYS */;
INSERT INTO `creator` (`creator_id`,`creator_adress`,`creator_name`,`creator_www`,`creator_phone`) VALUES 
 (1,'302042, г. Орел, Кромское шоссе, д. 21','Стройиндустрия','www.osi-orel.ru',NULL),
 (2,'302025, Орловская обл., Орловский р-н, Платоновский с/с, ул. Раздольная д. 101','Промстройдеталь','',NULL),
 (3,'г. Орел , Маслозаводской, пер., д. 19','КСК','',NULL),
 (4,'г. Орел, Новосильское шоссе, 17','ЖБИ №3','',NULL),
 (5,NULL,'Авдеев','',NULL),
 (6,'303852 , Орловская Обл., Г Ливны, Ул Железнодорожная, Д 10а','Ливны','',NULL),
 (8,'307200, Курская обл., Октябрьский р-он, п. Прямицыно, ул. Центральная, д.1','Курск. ОДСК','http://www.odsk.ru',NULL),
 (9,'307170, Железногорск, д. 2, Промплощадка','Железногорск. ЖБИ №3','',NULL),
 (10,'г. Белгород, ул. Коммунальная, 5','Завод ЖБК-1','http://belbeton.ru',NULL),
 (11,'Московская обл., г. Коломна, ул. Голутвинская, д. 1а','Колдиз','www.koldiz.ru',NULL),
 (12,'119361, г. Москва, ул. Марии Поливановой, д.9','КомплектСтройИндустрия','http://ksi-beton.ru',NULL),
 (13,'300016, Россия, Тула, улица Новотульская, д. 1','СтройИмпекс','www.pk-stroyimpex.ru',NULL);
/*!40000 ALTER TABLE `creator` ENABLE KEYS */;


--
-- Definition of table `creator_otdel`
--

DROP TABLE IF EXISTS `creator_otdel`;
CREATE TABLE `creator_otdel` (
  `creator_otdel_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_otdel_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`creator_otdel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creator_otdel`
--

/*!40000 ALTER TABLE `creator_otdel` DISABLE KEYS */;
INSERT INTO `creator_otdel` (`creator_otdel_id`,`creator_otdel_name`) VALUES 
 (10,'Приемная'),
 (11,'ПТО'),
 (12,'Склад'),
 (13,'Другой'),
 (14,'Отдел Реализации');
/*!40000 ALTER TABLE `creator_otdel` ENABLE KEYS */;


--
-- Definition of table `creator_phone`
--

DROP TABLE IF EXISTS `creator_phone`;
CREATE TABLE `creator_phone` (
  `creator_id` int(11) DEFAULT NULL,
  `creator_otdel_id` int(11) DEFAULT NULL,
  `creator_phone` int(12) DEFAULT NULL,
  `creator_phone_id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`creator_phone_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creator_phone`
--

/*!40000 ALTER TABLE `creator_phone` DISABLE KEYS */;
INSERT INTO `creator_phone` (`creator_id`,`creator_otdel_id`,`creator_phone`,`creator_phone_id`) VALUES 
 (1,11,723635,1),
 (4,14,554647,3);
/*!40000 ALTER TABLE `creator_phone` ENABLE KEYS */;


--
-- Definition of table `dostavka`
--

DROP TABLE IF EXISTS `dostavka`;
CREATE TABLE `dostavka` (
  `dostavka_id` int(11) NOT NULL AUTO_INCREMENT,
  `dostavka_adress` char(70) DEFAULT NULL,
  `dostavka_person` char(30) DEFAULT NULL,
  `dostavka_telefon` char(20) DEFAULT NULL,
  `chema` char(100) DEFAULT NULL,
  PRIMARY KEY (`dostavka_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dostavka`
--

/*!40000 ALTER TABLE `dostavka` DISABLE KEYS */;
INSERT INTO `dostavka` (`dostavka_id`,`dostavka_adress`,`dostavka_person`,`dostavka_telefon`,`chema`) VALUES 
 (6,'М. Колосков','М. Колосков','',NULL),
 (9,'Лобня','Агарон','8-926-283-7550',NULL),
 (11,'Тула','Вадим','89109442580',NULL),
 (12,'Простой расчёт','Простой расчёт',NULL,NULL),
 (13,'Ст.Оскол','Woman','84725488127',NULL),
 (14,'Серпухов','Виктор','',NULL),
 (15,'Калуга','Калуга/60km','89105940538',NULL),
 (17,'Троитск','Колосков','',NULL),
 (18,'Ожерелье (Каширский р-н)','Татьяна','',NULL),
 (19,'Липецкая обл. Боринское','Липецк//Стройпрестиж','89525940334',NULL),
 (20,'Видное','Вадим','89055223871',NULL),
 (21,'11','11','',NULL),
 (22,'22','22','',NULL),
 (23,'Алексин//Тульская обл.','Андрей','89262955070',NULL);
/*!40000 ALTER TABLE `dostavka` ENABLE KEYS */;


--
-- Definition of table `log_zakaz`
--

DROP TABLE IF EXISTS `log_zakaz`;
CREATE TABLE `log_zakaz` (
  `log_zakaz_id` int(11) NOT NULL AUTO_INCREMENT,
  `zakaz_id` int(11) NOT NULL,
  `Open_date` datetime NOT NULL,
  `Close_date` datetime DEFAULT NULL,
  PRIMARY KEY (`log_zakaz_id`,`zakaz_id`),
  KEY `R_17` (`zakaz_id`),
  CONSTRAINT `log_zakaz_ibfk_1` FOREIGN KEY (`zakaz_id`) REFERENCES `zakaz` (`zakaz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_zakaz`
--

/*!40000 ALTER TABLE `log_zakaz` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_zakaz` ENABLE KEYS */;


--
-- Definition of table `nomenklatura`
--

DROP TABLE IF EXISTS `nomenklatura`;
CREATE TABLE `nomenklatura` (
  `creator_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`creator_id`,`product_id`),
  KEY `R_8` (`product_id`),
  CONSTRAINT `nomenklatura_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `creator` (`creator_id`),
  CONSTRAINT `nomenklatura_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nomenklatura`
--

/*!40000 ALTER TABLE `nomenklatura` DISABLE KEYS */;
INSERT INTO `nomenklatura` (`creator_id`,`price`,`product_id`) VALUES 
 (1,139,6),
 (1,169,7),
 (1,181,8),
 (1,215,9),
 (1,249,10),
 (1,295,11),
 (1,330,12),
 (1,379,14),
 (1,394,15),
 (1,257,17),
 (1,339,18),
 (1,413,21),
 (1,353,22),
 (1,433,23),
 (1,511,24),
 (1,561,25),
 (1,591,27),
 (1,680,28),
 (1,687,30),
 (1,828,32),
 (1,1152,35),
 (1,1619,37),
 (1,1934,39),
 (1,1840,41),
 (1,2159,42),
 (1,1280,71),
 (1,1695,72),
 (1,2114,73),
 (1,2546,74),
 (1,668,75),
 (1,855,76),
 (1,1078,77),
 (1,1256,78),
 (1,469,83),
 (1,617,85),
 (1,784,87),
 (1,931,89),
 (1,1872,160),
 (1,2168,163),
 (1,2195,164),
 (1,2512,166),
 (1,2741,168),
 (1,2720,169),
 (1,2978,172),
 (1,3142,173),
 (1,3315,175),
 (1,3527,178),
 (1,3572,181),
 (1,3820,184),
 (1,4151,187),
 (1,4438,190),
 (1,5125,192),
 (1,5332,193),
 (1,5425,194),
 (1,5559,196),
 (1,5895,199),
 (1,7224,208),
 (1,2374,209),
 (1,2774,212),
 (1,2751,213),
 (1,3061,215),
 (1,3426,217),
 (1,3443,218),
 (1,4095,221),
 (1,3846,222),
 (1,4147,224),
 (1,4605,227),
 (1,5053,230),
 (1,5104,233),
 (1,5476,236),
 (1,6294,239),
 (1,6362,241),
 (1,6478,242),
 (1,7136,243),
 (1,6672,245),
 (1,7636,248),
 (1,9190,257),
 (1,1939,264),
 (1,8663,282),
 (1,0,517),
 (2,150.65,6),
 (2,184,7),
 (2,172.88,9),
 (2,271.4,10),
 (2,237.29,11),
 (2,280.6,17),
 (2,370.3,18),
 (2,450.8,21),
 (2,565,24),
 (2,620,25),
 (2,906.2,32),
 (2,1207.5,34),
 (2,2117.15,39),
 (3,2590,120),
 (3,5986,200),
 (3,7631,248),
 (3,7836,249),
 (4,3140,123),
 (4,5895,150),
 (4,3140,172),
 (4,3572,179),
 (4,3572,180),
 (4,3827,181),
 (4,4663,190),
 (4,5125,192),
 (4,0,199),
 (4,5411,230),
 (5,165,6),
 (5,190,7),
 (5,210,8),
 (5,240,9),
 (5,500,23),
 (5,880,32),
 (5,891,45),
 (5,1870,46),
 (6,4250,227),
 (6,5511,233),
 (10,921,511),
 (10,663,512),
 (10,175,513),
 (11,800,500),
 (11,2200,504),
 (11,660,505),
 (11,1100,506),
 (11,1000,507),
 (12,750,514),
 (12,1100,515),
 (13,1200,516);
/*!40000 ALTER TABLE `nomenklatura` ENABLE KEYS */;


--
-- Definition of table `nomenklatura_history`
--

DROP TABLE IF EXISTS `nomenklatura_history`;
CREATE TABLE `nomenklatura_history` (
  `nomenklatura_history_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`nomenklatura_history_id`,`creator_id`,`product_id`),
  KEY `R_14` (`creator_id`,`product_id`),
  CONSTRAINT `nomenklatura_history_ibfk_1` FOREIGN KEY (`creator_id`, `product_id`) REFERENCES `nomenklatura` (`creator_id`, `product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nomenklatura_history`
--

/*!40000 ALTER TABLE `nomenklatura_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomenklatura_history` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` float DEFAULT NULL,
  `product_name` char(75) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `Unikal_product_name` (`product_name`) USING BTREE,
  KEY `R_13` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`,`weight`,`product_name`,`volume`,`category_id`) VALUES 
 (2,0.02,'1ПБ-10-1п',NULL,1),
 (3,0.03,'1ПБ-13-1п',NULL,1),
 (4,0.03,'1ПБ-16-1п',NULL,1),
 (5,0.04,'2ПБ-10-1п',NULL,1),
 (6,0.055,'2ПБ-13-1п',0.022,1),
 (7,0.07,'2ПБ-16-2п',0.026,1),
 (8,0.07,'2ПБ-17-2п',0,1),
 (9,0.08,'2ПБ-19-3п',0,1),
 (10,0.09,'2ПБ-22-3п',0.037,1),
 (11,0.1,'2ПБ-25-3п',0,1),
 (12,0.11,'2ПБ-26-4п',0.044,1),
 (13,0.11,'2ПБ-27-4п',NULL,1),
 (14,0.12,'2ПБ-29-4п',0.048,1),
 (15,0.13,'2ПБ-30-4п',0.05,1),
 (16,0.07,'3ПБ-10-37п',NULL,1),
 (17,0.085,'3ПБ-13-37п',0.034,1),
 (18,0.103,'3ПБ-16-37п',0.041,1),
 (19,0.11,'3ПБ-17-37п',NULL,1),
 (20,0.12,'3ПБ-18-8п',NULL,1),
 (21,0.12,'3ПБ-18-37п',0.048,1),
 (22,0.14,'3ПБ-21-8п',0.055,1),
 (23,0.16,'3ПБ-25-8п',0,1),
 (24,0.18,'3ПБ-27-8п',0.072,1),
 (25,0.198,'3ПБ-30-8п',0.079,1),
 (26,0.21,'3ПБ-31-8п',NULL,1),
 (27,0.23,'3ПБ-34-4п',0.089,1),
 (28,0.24,'3ПБ-36-4п',0.096,1),
 (29,0.27,'3ПБ-39-8п',NULL,1),
 (30,0.25,'5ПБ-18-27п',NULL,1),
 (31,0.25,'5ПБ-18-37п',NULL,1),
 (32,0.285,'5ПБ-21-27п',0.114,1),
 (33,0.29,'5ПБ-21-37п',NULL,1),
 (34,0.34,'5ПБ-25-27п',0.135,1),
 (35,0.34,'5ПБ-25-37п',0.135,1),
 (36,0.37,'5ПБ-27-27п',NULL,1),
 (37,0.37,'5ПБ-27-37п',NULL,1),
 (38,0.41,'5ПБ-30-27п',NULL,1),
 (39,0.41,'5ПБ-30-37п',0.164,1),
 (40,0.44,'5ПБ-32-37п',NULL,1),
 (41,0.47,'5ПБ-34-20п',NULL,1),
 (42,0.5,'5ПБ-36-20п',0.2,1),
 (43,0.52,'ФЛ-6-12-4',NULL,10),
 (44,1.04,'ФЛ-6-24-4',NULL,10),
 (45,0.69,'ФЛ-8-12-3',0.55,10),
 (46,1.4,'ФЛ-8-24-3',0,10),
 (47,0.5,'ФЛ-10-8-3',NULL,10),
 (48,0.75,'ФЛ-10-12-2',NULL,10),
 (49,1.52,'ФЛ-10-24-2',NULL,10),
 (50,1.66,'ФЛ-10-30-3',NULL,10),
 (51,0.57,'ФЛ-12-8-2',NULL,10),
 (52,0.87,'ФЛ-12-12-2',NULL,10),
 (53,1.76,'ФЛ-12-24-2',NULL,10),
 (54,1.97,'ФЛ-12-30-4',NULL,10),
 (55,0.69,'ФЛ-14-8-3',NULL,10),
 (56,1.04,'ФЛ-14-12-3',NULL,10),
 (57,2.11,'ФЛ-14-24-2',NULL,10),
 (58,2.3,'ФЛ-14-30-4',NULL,10),
 (59,0.8,'ФЛ-16-8-2',NULL,10),
 (60,1.22,'ФЛ-16-12-3',NULL,10),
 (61,2.47,'ФЛ-16-24-3',NULL,10),
 (62,1.25,'ФЛ-20-8-2',NULL,10),
 (63,1.95,'ФЛ-20-12-2',NULL,10),
 (64,4.05,'ФЛ-20-24-2',NULL,10),
 (65,1.45,'ФЛ-24-8-2',NULL,10),
 (66,2.3,'ФЛ-24-12-2',NULL,10),
 (67,1.8,'ФЛ-28-8-2',NULL,10),
 (68,2.82,'ФЛ-28-12-2',NULL,10),
 (69,2.05,'ФЛ-32-8-2',NULL,10),
 (70,3.23,'ФЛ-32-12-2',NULL,10),
 (71,0.97,'ФБС-24-3-6т',0.406,9),
 (72,1.3,'ФБС-24-4-6т',0.543,9),
 (73,1.63,'ФБС-24-5-6т',0.679,9),
 (74,1.96,'ФБС-24-6-6т',0.815,9),
 (75,0.49,'ФБС-12-3-6т',0.203,9),
 (76,0.65,'ФБС-12-4-6т',NULL,9),
 (77,0.82,'ФБС-12-5-6т',0.331,9),
 (78,0.98,'ФБС-12-6-6т',0.398,9),
 (79,0.26,'ФБС-12-3-3т',NULL,9),
 (80,0.33,'ФБС-12-4-3т',NULL,9),
 (81,0.41,'ФБС-12-5-3т',NULL,9),
 (82,0.49,'ФБС-12-6-3т',NULL,9),
 (83,0.35,'ФБС-9-3-6т',0.146,9),
 (84,0.22,'ФБС-9-4-3т',NULL,9),
 (85,0.47,'ФБС-9-4-6т',0.195,9),
 (86,0.28,'ФБС-9-5-3т',NULL,9),
 (87,0.54,'ФБС-9-5-6т',0.244,9),
 (88,0.35,'ФБС-9-6-3т',NULL,9),
 (89,0.65,'ФБС-9-6-6т',NULL,9),
 (90,0.04,'СКЦ-1т',NULL,9),
 (91,0.1,'ЛС-9',NULL,8),
 (92,0.1,'ЛС-9-1 (с закл.)',NULL,8),
 (93,0.12,'ЛС-11',NULL,8),
 (94,0.12,'ЛС-11-1 (с закл.)',NULL,8),
 (95,0.13,'ЛС-12',NULL,8),
 (96,0.13,'ЛС-12-1 (с закл.)',NULL,8),
 (97,0.15,'ЛС-14',NULL,8),
 (98,0.15,'ЛС-14-1 (с закл.)',NULL,8),
 (99,0.17,'ЛС-15',NULL,8),
 (100,0.17,'ЛС-15-1 (с закл.)',NULL,8),
 (101,0.19,'ЛС-17',NULL,8),
 (102,0.19,'ЛС-17-1',NULL,8),
 (103,0.19,'ЛС-18',NULL,8),
 (104,0.19,'ЛС-18-1 (с закл.)',NULL,8),
 (105,0.22,'ЛС-20',NULL,8),
 (106,0.22,'ЛС-20-1 (с закл.)',NULL,8),
 (107,0.25,'ЛС-22',NULL,8),
 (108,0.25,'ЛС-22-1 (с закл.)',NULL,8),
 (109,0.25,'ЛС-23',NULL,8),
 (110,0.25,'ЛС-23-1 (с закл.)',NULL,8),
 (111,0.75,'ПК-24-10-8',NULL,2),
 (112,0.78,'ПК-25-10-8',NULL,2),
 (113,0.8,'ПК-26-10-8',NULL,2),
 (114,0.73,'ПК-27-10-8',NULL,2),
 (115,0.88,'ПК-28-10-8',NULL,2),
 (116,0.9,'ПК-29-10-8',NULL,2),
 (117,0.92,'ПК-30-10-8',NULL,2),
 (118,0.95,'ПК-31-10-8',NULL,2),
 (119,0.98,'ПК-32-10-8',NULL,2),
 (120,1,'ПК-33-10-8',NULL,2),
 (121,1.03,'ПК-34-10-8',NULL,2),
 (122,1.05,'ПК-35-10-8',NULL,2),
 (123,1.09,'ПК-36-10-8',0,2),
 (124,1.11,'ПК-37-10-8',NULL,2),
 (125,1.13,'ПК-38-10-8',NULL,2),
 (126,1.15,'ПК-39-10-8',NULL,2),
 (127,1.17,'ПК-40-10-8',NULL,2),
 (128,1.18,'ПК-41-10-8',NULL,2),
 (129,1.26,'ПК-42-10-8',NULL,2),
 (130,1.28,'ПК-43-10-8',NULL,2),
 (131,1.3,'ПК-44-10-8',NULL,2),
 (132,1.35,'ПК-45-10-8',NULL,2),
 (133,1.38,'ПК-46-10-8',NULL,2),
 (134,1.4,'ПК-47-10-8',NULL,2),
 (135,1.43,'ПК-48-10-8',NULL,2),
 (136,1.45,'ПК-49-10-8',NULL,2),
 (137,1.48,'ПК-50-10-8',NULL,2),
 (138,1.53,'ПК-51-10-8',NULL,2),
 (139,1.55,'ПК-52-10-8',NULL,2),
 (140,1.58,'ПК-53-10-8',NULL,2),
 (141,1.6,'ПК-54-10-8',NULL,2),
 (142,1.63,'ПК-55-10-8',NULL,2),
 (143,1.35,'ПК-56-10-8',NULL,2),
 (144,1.68,'ПК-57-10-8',NULL,2),
 (145,1.73,'ПК-58-10-8',NULL,2),
 (146,1.75,'ПК-59-10-8',NULL,2),
 (147,1.78,'ПК-60-10-8',NULL,2),
 (148,1.8,'ПК-61-10-8',NULL,2),
 (149,1.83,'ПК-62-10-8',NULL,2),
 (150,1.85,'ПК-63-10-8',0,2),
 (151,1.9,'ПК-64-10-8',NULL,2),
 (152,1.93,'ПК-65-10-8',NULL,2),
 (153,1.96,'ПК-66-10-8',NULL,2),
 (154,1.99,'ПК-67-10-8',NULL,2),
 (155,2,'ПК-68-10-8',NULL,2),
 (156,2.03,'ПК-69-10-8',NULL,2),
 (157,2.05,'ПК-70-10-8',NULL,2),
 (158,2.1,'ПК-71-10-8',NULL,2),
 (159,2.15,'ПК-72-10-8',NULL,2),
 (160,0.91,'ПК-24-12-8',NULL,2),
 (161,0.93,'ПК-25-12-8',NULL,2),
 (162,0.98,'ПК-26-12-8',NULL,2),
 (163,1.01,'ПК-27-12-8',NULL,2),
 (164,1.05,'ПК-28-12-8',NULL,2),
 (165,1.1,'ПК-29-12-8',NULL,2),
 (166,1.11,'ПК-30-12-8',0,2),
 (167,1.15,'ПК-31-12-8',NULL,2),
 (168,1.21,'ПК-32-12-8',0.485,2),
 (169,1.2,'ПК-33-12-8',0,2),
 (170,1.23,'ПК-34-12-8',NULL,2),
 (171,1.28,'ПК-35-12-8',NULL,2),
 (172,1.32,'ПК-36-12-8',0,2),
 (173,1.35,'ПК-37-12-8',NULL,2),
 (174,1.4,'ПК-38-12-8',NULL,2),
 (175,1.43,'ПК-39-12-8',NULL,2),
 (176,1.45,'ПК-40-12-8',NULL,2),
 (177,1.49,'ПК-41-12-8',NULL,2),
 (178,1.53,'ПК-42-12-8',NULL,2),
 (179,1.55,'ПК-43-12-8',0,2),
 (180,1.56,'ПК-44-12-8',0,2),
 (181,1.63,'ПК-45-12-8',NULL,2),
 (182,1.65,'ПК-46-12-8',NULL,2),
 (183,1.7,'ПК-47-12-8',NULL,2),
 (184,1.73,'ПК-48-12-8',NULL,2),
 (185,1.75,'ПК-49-12-8',NULL,2),
 (186,1.78,'ПК-50-12-8',NULL,2),
 (187,1.83,'ПК-51-12-8',NULL,2),
 (188,1.88,'ПК-52-12-8',NULL,2),
 (189,1.9,'ПК-53-12-8',NULL,2),
 (190,1.95,'ПК-54-12-8',0,2),
 (191,1.98,'ПК-55-12-8',NULL,2),
 (192,2,'ПК-56-12-8',0,2),
 (193,2.05,'ПК-57-12-8',NULL,2),
 (194,2.08,'ПК-58-12-8',NULL,2),
 (195,2.1,'ПК-59-12-8',NULL,2),
 (196,2.15,'ПК-60-12-8',NULL,2),
 (197,2.18,'ПК-61-12-8',NULL,2),
 (198,2.23,'ПК-62-12-8',NULL,2),
 (199,2.25,'ПК-63-12-8',0,2),
 (200,2.3,'ПК-64-12-8',0,2),
 (201,2.35,'ПК-65-12-8',NULL,2),
 (202,2.38,'ПК-66-12-8',NULL,2),
 (203,2.43,'ПК-67-12-8',NULL,2),
 (204,2.45,'ПК-68-12-8',NULL,2),
 (205,2.48,'ПК-69-12-8',NULL,2),
 (206,2.53,'ПК-70-12-8',NULL,2),
 (207,2.58,'ПК-71-12-8',NULL,2),
 (208,2.6,'ПК-72-12-8',NULL,2),
 (209,1.18,'ПК-24-15-8',NULL,2),
 (210,1.23,'ПК-25-15-8',NULL,2),
 (211,1.28,'ПК-26-15-8',NULL,2),
 (212,1.34,'ПК-27-15-8',0,2),
 (213,1.39,'ПК-28-15-8',NULL,2),
 (214,1.43,'ПК-29-15-8',NULL,2),
 (215,1.47,'ПК-30-15-8',0,2),
 (216,1.5,'ПК-31-15-8',NULL,2),
 (217,1.55,'ПК-32-15-8',NULL,2),
 (218,1.6,'ПК-33-15-8',0,2),
 (219,1.65,'ПК-34-15-8',NULL,2),
 (220,1.7,'ПК-35-15-8',NULL,2),
 (221,1.75,'ПК-36-15-8',NULL,2),
 (222,1.78,'ПК-37-15-8',NULL,2),
 (223,1.83,'ПК-38-15-8',NULL,2),
 (224,1.88,'ПК-39-15-8',0,2),
 (225,1.93,'ПК-40-15-8',NULL,2),
 (226,1.98,'ПК-41-15-8',NULL,2),
 (227,2.02,'ПК-42-15-8',0,2),
 (228,2.05,'ПК-43-15-8',NULL,2),
 (229,2.1,'ПК-44-15-8',NULL,2),
 (230,2.15,'ПК-45-15-8',NULL,2),
 (231,2.2,'ПК-46-15-8',NULL,2),
 (232,2.25,'ПК-47-15-8',NULL,2),
 (233,2.3,'ПК-48-15-8',0,2),
 (234,2.33,'ПК-49-15-8',NULL,2),
 (235,2.38,'ПК-50-15-8',NULL,2),
 (236,2.43,'ПК-51-15-8',NULL,2),
 (237,2.48,'ПК-52-15-8',NULL,2),
 (238,2.53,'ПК-53-15-8',NULL,2),
 (239,2.58,'ПК-54-15-8',0,2),
 (240,2.6,'ПК-55-15-8',NULL,2),
 (241,2.65,'ПК-56-15-8',NULL,2),
 (242,2.7,'ПК-57-15-8',NULL,2),
 (243,2.75,'ПК-58-15-8',NULL,2),
 (244,2.8,'ПК-59-15-8',NULL,2),
 (245,2.85,'ПК-60-15-8',NULL,2),
 (246,2.9,'ПК-61-15-8',NULL,2),
 (247,2.95,'ПК-62-15-8',NULL,2),
 (248,2.98,'ПК-63-15-8',0,2),
 (249,3.03,'ПК-64-15-8',0,2),
 (250,3.08,'ПК-65-15-8',NULL,2),
 (251,3.13,'ПК-66-15-8',NULL,2),
 (252,3.18,'ПК-67-15-8',NULL,2),
 (253,3.23,'ПК-68-15-8',NULL,2),
 (254,3.29,'ПК-69-15-8',NULL,2),
 (255,3.33,'ПК-70-15-8',NULL,2),
 (256,3.37,'ПК-71-15-8',NULL,2),
 (257,3.4,'ПК-72-15-8',NULL,2),
 (258,0.15,'ПРГ-17-1.3-4т',NULL,11),
 (259,0.19,'ПРГ-21-1,3-4т',NULL,11),
 (260,0.24,'ПРГ-27-1,3-4т',NULL,11),
 (261,0.25,'ПРГ-28-1.3-4т',NULL,11),
 (262,0.33,'ПРГ-28-1.4-4т',NULL,11),
 (263,0.38,'ПРГ-32-1.4-4т',NULL,11),
 (264,0.43,'ПРГ-36-1.4-4т',NULL,11),
 (265,0.46,'ПРГ-40-1.4-4т',NULL,11),
 (266,1.05,'ПРГ-42-1,4-4т',NULL,11),
 (267,0.95,'ПРГ-38-2.5-4т',NULL,11),
 (268,0.98,'ПРГ-39-2.5-4т',NULL,11),
 (269,1,'ПРГ-40-2,5-4т',NULL,11),
 (270,1.05,'ПРГ-42-2,5-4т',NULL,11),
 (271,1.1,'ПРГ-44-2,5-4т',NULL,11),
 (272,1.13,'ПРГ-45-2,5-4т',NULL,11),
 (273,1.2,'ПРГ-48-2.5-4т',NULL,11),
 (274,1.22,'ПРГ-49-2,5-4т',NULL,11),
 (275,1.25,'ПРГ-50-2,5-4т',NULL,11),
 (276,1.28,'ПРГ-51-2,5-4т',NULL,11),
 (277,1.3,'ПРГ-52-2,5-4т',NULL,11),
 (278,1.32,'ПРГ-53-2,5-4т',NULL,11),
 (279,1.35,'ПРГ-54-2,5-4т',NULL,11),
 (280,1.4,'ПРГ-56-2.5-4т',NULL,11),
 (281,1.43,'ПРГ-57-2.5-4т',NULL,11),
 (282,1.5,'ПРГ-60-2.5-4т',0.6,11),
 (283,2.52,'ПРГ-64-4,4-4т',NULL,11),
 (500,0,'Лоток быстротока Б-6',0,12),
 (504,0,'Лоток быстротока Б-7',0,12),
 (505,0,'Лоток быстротока Б1-20-50',0,12),
 (506,0,'Лоток быстротока Б1-20-72',0,12),
 (507,0,'Блок упора Б-9',0,12),
 (511,0,'2ПЛ 100.72.23',0,12),
 (512,0,'2ПЛ 100.50.23',0,12),
 (513,0,'1ПЛ 50.25.10',0,12),
 (514,0.22,'Водоотводный лоток Б1-25(20)-50 (1000х500х250/200)',0,12),
 (515,0.35,'Водоотводный лоток  Б2-25(20)-75 1000х750х250/200)',0,12),
 (516,0.28,'Лоток прикромочный Б1-23-50 (100х50х23)',0,12),
 (517,0,'тест',0,12),
 (518,0,'Панели забора П6 В',0.64,13),
 (519,0,'Фундамент забора Ф 6',0.3,13),
 (520,0,'Панели забора ПО-2',NULL,13),
 (521,0,'Фундамент забора ФО-2',NULL,13);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name_category` char(50) CHARACTER SET cp866 DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`category_id`,`Name_category`) VALUES 
 (1,'ПЕРЕМЫЧКИ ПЛОСКИЕ'),
 (2,'ПЛИТЫ ПЕРЕКРЫТИЙ ПУСТОТНЫЕ'),
 (8,'СТУПЕНИ'),
 (9,'ФУНДАМЕНТНЫЕ БЛОКИ'),
 (10,'ФУНДАМЕНТНЫЕ ПОДУШКИ'),
 (11,'ПРОГОНЫ'),
 (12,'ЭЛЕМЕНТЫ ВОДООТВОДНЫХ СООРУЖЕНИЙ'),
 (13,'ЗАБОР');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;


--
-- Definition of table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `transport_price` float DEFAULT NULL,
  `transport_number` char(18) DEFAULT NULL,
  `transport_model` char(18) DEFAULT NULL,
  `driver_telefon` char(30) DEFAULT NULL,
  `sum_avance` float DEFAULT NULL,
  `document_date` datetime DEFAULT NULL,
  `tonag` float DEFAULT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport`
--

/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;


--
-- Definition of table `zakaz`
--

DROP TABLE IF EXISTS `zakaz`;
CREATE TABLE `zakaz` (
  `zakaz_id` int(11) NOT NULL AUTO_INCREMENT,
  `zakaz_info` char(100) DEFAULT NULL,
  `adress` char(50) DEFAULT NULL,
  `zakaz_date` date DEFAULT NULL,
  `dostavka_id` int(11) DEFAULT NULL,
  `mashine_price` int(11) DEFAULT '0',
  `zakaz_Number` int(11) NOT NULL DEFAULT '0',
  `Enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zakaz_id`),
  KEY `R_9` (`dostavka_id`),
  CONSTRAINT `zakaz_ibfk_1` FOREIGN KEY (`dostavka_id`) REFERENCES `dostavka` (`dostavka_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zakaz`
--

/*!40000 ALTER TABLE `zakaz` DISABLE KEYS */;
INSERT INTO `zakaz` (`zakaz_id`,`zakaz_info`,`adress`,`zakaz_date`,`dostavka_id`,`mashine_price`,`zakaz_Number`,`Enabled`) VALUES 
 (1,NULL,NULL,'2011-05-04',9,15000,0,0),
 (2,NULL,NULL,'2011-05-11',12,13000,0,0),
 (3,NULL,NULL,'2011-05-11',12,13000,0,0),
 (4,NULL,NULL,'2011-05-16',11,9000,0,0),
 (5,NULL,NULL,'2011-05-18',13,14000,0,0),
 (6,NULL,NULL,'2011-05-20',14,9000,0,1),
 (7,NULL,NULL,'2011-05-23',15,13000,0,1),
 (8,NULL,NULL,'2011-05-25',12,10000,0,1),
 (9,NULL,NULL,'2011-05-25',12,8000,0,1),
 (10,NULL,NULL,'2011-05-26',6,14000,0,1),
 (11,NULL,NULL,'2011-05-28',12,5000,0,0),
 (12,NULL,NULL,'2011-05-30',12,12000,0,0),
 (13,NULL,NULL,'2011-05-31',11,8500,0,1),
 (14,NULL,NULL,'2011-05-31',14,12000,0,1),
 (15,NULL,NULL,'2011-05-31',17,12000,0,0),
 (16,NULL,NULL,'2011-06-01',6,14000,0,1),
 (17,NULL,NULL,'2011-06-09',18,12500,0,0),
 (18,NULL,NULL,'2011-06-14',12,1000,0,1),
 (19,NULL,NULL,'2011-06-16',19,12000,0,1),
 (20,NULL,NULL,'2011-06-16',19,12000,0,1),
 (21,NULL,NULL,'2011-06-17',20,13000,0,1),
 (22,NULL,NULL,'2011-06-20',23,13000,0,1),
 (23,NULL,NULL,'2011-06-24',12,1,0,1),
 (24,NULL,NULL,'2011-06-24',12,16000,0,1);
/*!40000 ALTER TABLE `zakaz` ENABLE KEYS */;


--
-- Definition of table `zakaz_details`
--

DROP TABLE IF EXISTS `zakaz_details`;
CREATE TABLE `zakaz_details` (
  `creator_id` int(11) NOT NULL,
  `zakaz_id` int(11) NOT NULL,
  `count` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `transport_id` int(11) DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`creator_id`,`zakaz_id`,`product_id`) USING BTREE,
  KEY `R_9` (`creator_id`,`product_id`),
  KEY `R_10` (`zakaz_id`),
  KEY `R_11` (`transport_id`),
  CONSTRAINT `zakaz_details_ibfk_1` FOREIGN KEY (`creator_id`, `product_id`) REFERENCES `nomenklatura` (`creator_id`, `product_id`),
  CONSTRAINT `zakaz_details_ibfk_2` FOREIGN KEY (`zakaz_id`) REFERENCES `zakaz` (`zakaz_id`) ON DELETE CASCADE,
  CONSTRAINT `zakaz_details_ibfk_3` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zakaz_details`
--

/*!40000 ALTER TABLE `zakaz_details` DISABLE KEYS */;
INSERT INTO `zakaz_details` (`creator_id`,`zakaz_id`,`count`,`price`,`transport_id`,`product_id`,`position`) VALUES 
 (1,1,80,1692.6,NULL,72,3),
 (1,1,6,870.98,NULL,76,4),
 (1,1,46,3034.52,NULL,172,1),
 (1,1,24,6006.98,NULL,199,2),
 (1,2,4,3997.4,NULL,184,1),
 (1,2,10,5347.1,NULL,233,2),
 (1,3,16,3997.4,NULL,184,1),
 (1,4,38,1692.6,NULL,72,1),
 (1,4,103,2546.25,NULL,74,4),
 (1,4,40,854.7,NULL,76,2),
 (1,4,22,1255.8,NULL,78,5),
 (1,4,39,617.4,NULL,85,3),
 (1,4,50,931.35,NULL,89,6),
 (1,5,26,2214.3,NULL,73,1),
 (1,6,1,3763.2,NULL,178,2),
 (1,6,4,4912.32,NULL,227,1),
 (1,7,1,3997.4,NULL,184,2),
 (1,7,12,6989.4,NULL,245,1),
 (1,8,12,4912.32,NULL,227,2),
 (1,8,4,5444.32,NULL,233,1),
 (1,10,5,2900.8,NULL,169,2),
 (1,10,6,3763.2,NULL,178,1),
 (1,11,7,3402,NULL,181,2),
 (1,11,5,5294,NULL,196,1),
 (1,12,16,1692.6,NULL,72,1),
 (1,13,9,2750.8,NULL,166,1),
 (1,13,6,3912.3,NULL,181,3),
 (1,13,3,6456.1,NULL,199,5),
 (1,13,6,7912,NULL,208,7),
 (1,13,15,3352.25,NULL,215,2),
 (1,13,6,5533.8,NULL,230,4),
 (1,13,41,8361.65,NULL,248,6),
 (1,13,3,10062.5,NULL,257,8),
 (1,14,3,3132,NULL,168,4),
 (1,14,4,5857.2,NULL,192,1),
 (1,14,1,6092.4,NULL,193,3),
 (1,14,2,7402.8,NULL,242,2),
 (1,14,1,10500,NULL,257,5),
 (1,15,80,3403.2,NULL,172,2),
 (1,15,22,4360.8,NULL,184,3),
 (1,15,40,4675.2,NULL,221,1),
 (1,17,1,3335.36,NULL,172,2),
 (1,17,8,3950.24,NULL,178,1),
 (1,17,7,6076,NULL,194,3),
 (1,18,48,1318.4,NULL,71,1),
 (1,19,2,2171.68,NULL,264,2),
 (1,19,6,9702.56,NULL,282,1),
 (1,20,24,8552.32,NULL,248,1),
 (1,21,2,2096.64,NULL,160,3),
 (1,21,4,6226.08,NULL,196,2),
 (1,21,3,6602.4,NULL,199,1),
 (1,21,2,7472.64,NULL,245,4),
 (1,23,12,5893.75,NULL,192,1),
 (1,23,3,5895,NULL,199,8),
 (1,23,3,7316.3,NULL,241,2),
 (2,13,104,180.78,NULL,6,13),
 (2,13,12,220.8,NULL,7,19),
 (2,13,2,325.68,NULL,10,16),
 (2,13,3,336.72,NULL,17,11),
 (2,13,80,444.36,NULL,18,9),
 (2,13,59,540.96,NULL,21,10),
 (2,13,3,678,NULL,24,18),
 (2,13,21,744,NULL,25,14),
 (2,13,32,1087.44,NULL,32,12),
 (2,13,2,1449,NULL,34,17),
 (2,13,21,2540.58,NULL,39,15),
 (2,16,132,180.78,NULL,6,2),
 (2,16,6,325.68,NULL,10,3),
 (2,16,384,336.72,NULL,17,1),
 (2,16,12,444.36,NULL,18,6),
 (2,16,60,540.96,NULL,21,5),
 (2,16,30,744,NULL,25,4),
 (4,22,8,4209.7,NULL,181,1),
 (4,22,1,5129.3,NULL,190,3),
 (4,22,2,5952.1,NULL,230,2),
 (4,23,6,3611,NULL,123,4),
 (4,23,12,6779.25,NULL,150,5),
 (4,23,6,3611,NULL,172,3),
 (4,23,2,4107.8,NULL,179,6),
 (4,23,5,4107.8,NULL,180,7),
 (5,24,68,206.25,NULL,6,4),
 (5,24,4,237.5,NULL,7,6),
 (5,24,8,262.5,NULL,8,5),
 (5,24,8,300,NULL,9,2),
 (5,24,12,625,NULL,23,3),
 (5,24,16,1100,NULL,32,1),
 (6,9,12,4462.5,NULL,227,2),
 (6,9,4,5786.55,NULL,233,1);
/*!40000 ALTER TABLE `zakaz_details` ENABLE KEYS */;


--
-- Definition of procedure `InsertNomenklatura`
--

DROP PROCEDURE IF EXISTS `InsertNomenklatura`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
(nil) $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `InsertNomenklatura2`
--

DROP PROCEDURE IF EXISTS `InsertNomenklatura2`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
(nil) $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
