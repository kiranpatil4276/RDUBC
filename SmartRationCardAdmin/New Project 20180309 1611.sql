-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema smartrationcard
--

CREATE DATABASE IF NOT EXISTS smartrationcard;
USE smartrationcard;

--
-- Definition of table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus` (
  `about_id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`about_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aboutus`
--

/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;


--
-- Definition of table `add_district`
--

DROP TABLE IF EXISTS `add_district`;
CREATE TABLE `add_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district` varchar(450) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_district`
--

/*!40000 ALTER TABLE `add_district` DISABLE KEYS */;
INSERT INTO `add_district` (`id`,`district`,`status`) VALUES 
 (1,'Pune','Active'),
 (2,'Ahmednagar','0');
/*!40000 ALTER TABLE `add_district` ENABLE KEYS */;


--
-- Definition of table `add_item`
--

DROP TABLE IF EXISTS `add_item`;
CREATE TABLE `add_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) DEFAULT NULL,
  `rate_apl` double DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `rate_bpl` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_item`
--

/*!40000 ALTER TABLE `add_item` DISABLE KEYS */;
INSERT INTO `add_item` (`id`,`item_name`,`rate_apl`,`unit`,`date`,`rate_bpl`,`status`) VALUES 
 (1,'rice',5,'Kg','03/19/2018','2','0');
/*!40000 ALTER TABLE `add_item` ENABLE KEYS */;


--
-- Definition of table `add_taluka`
--

DROP TABLE IF EXISTS `add_taluka`;
CREATE TABLE `add_taluka` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taluka` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_taluka`
--

/*!40000 ALTER TABLE `add_taluka` DISABLE KEYS */;
INSERT INTO `add_taluka` (`id`,`taluka`,`district`,`status`) VALUES 
 (1,'Haveli','Pune','0'),
 (2,'Hadapsar','Pune','0');
/*!40000 ALTER TABLE `add_taluka` ENABLE KEYS */;


--
-- Definition of table `admin_distribute`
--

DROP TABLE IF EXISTS `admin_distribute`;
CREATE TABLE `admin_distribute` (
  `admin_distribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `officer` varchar(255) NOT NULL,
  `disrict` varchar(255) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) unsigned DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_distribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_distribute`
--

/*!40000 ALTER TABLE `admin_distribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_distribute` ENABLE KEYS */;


--
-- Definition of table `admin_stock`
--

DROP TABLE IF EXISTS `admin_stock`;
CREATE TABLE `admin_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_stock`
--

/*!40000 ALTER TABLE `admin_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_stock` ENABLE KEYS */;


--
-- Definition of table `demo`
--

DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
INSERT INTO `demo` (`id`,`name`) VALUES 
 (1,'pramod');
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;


--
-- Definition of table `dis_detail`
--

DROP TABLE IF EXISTS `dis_detail`;
CREATE TABLE `dis_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officer` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dis_detail`
--

/*!40000 ALTER TABLE `dis_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dis_detail` ENABLE KEYS */;


--
-- Definition of table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE `enquiry` (
  `enq_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` blob NOT NULL,
  PRIMARY KEY (`enq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` (`enq_id`,`name`,`contact`,`email`,`subject`,`message`) VALUES 
 (2,'akshay','8308989005','asandge@gmail.com','dfghj',0x646667686A6B6C6B6A6867666465207234353637753B6C6B6A686778203B6C6B6A68206F6967),
 (3,'akshay','8308989005','asandge@gmail.com','enquiry',0x6869696969207468697320697320616B73686179206D792063617264206E6F206973206472666735353638383534353520706C6561736520616464206D79206163636F756E74207468616E6B20796F75),
 (4,'mukesh','7387929583','mkshirsagar62@gmail.com','enquiry',0x686969),
 (5,'pramof','dd','dd@gmail.com','punt',0x6B6B6B6B6B);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;


--
-- Definition of table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `gallary_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(450) DEFAULT NULL,
  `image5` varchar(450) DEFAULT NULL,
  `status` varchar(450) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gallary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` (`gallary_id`,`category`,`image1`,`image2`,`image3`,`image4`,`image5`,`status`) VALUES 
 (1,NULL,'Chrysanthemum.jpg','Desert.jpg','Hydrangeas.jpg','Lighthouse.jpg','Koala.jpg','0');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;


--
-- Definition of table `imagecheck`
--

DROP TABLE IF EXISTS `imagecheck`;
CREATE TABLE `imagecheck` (
  `Sr.No.` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `image3` varchar(45) DEFAULT NULL,
  `info_heading` varchar(45) DEFAULT NULL,
  `info_content` varchar(45) DEFAULT NULL,
  `notice_heading` varchar(45) DEFAULT NULL,
  `notice_content` varchar(45) DEFAULT NULL,
  `news_heading` varchar(45) DEFAULT NULL,
  `news_content` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Sr.No.`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagecheck`
--

/*!40000 ALTER TABLE `imagecheck` DISABLE KEYS */;
INSERT INTO `imagecheck` (`Sr.No.`,`image1`,`image2`,`image3`,`info_heading`,`info_content`,`notice_heading`,`notice_content`,`news_heading`,`news_content`,`status`) VALUES 
 (1,'Tulips.jpg','null','null','null','null','null','null','null','null','0');
/*!40000 ALTER TABLE `imagecheck` ENABLE KEYS */;


--
-- Definition of table `item_detail`
--

DROP TABLE IF EXISTS `item_detail`;
CREATE TABLE `item_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `item_rate` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `distribution_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_detail`
--

/*!40000 ALTER TABLE `item_detail` DISABLE KEYS */;
INSERT INTO `item_detail` (`id`,`item_name`,`quantity`,`item_rate`,`unit`,`date`,`distribution_id`) VALUES 
 (3,'rice','2999200','3','kg','19/15/1555','3');
/*!40000 ALTER TABLE `item_detail` ENABLE KEYS */;


--
-- Definition of table `item_detail1`
--

DROP TABLE IF EXISTS `item_detail1`;
CREATE TABLE `item_detail1` (
  `sr. no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `item rate` varchar(45) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `distribution_id` varchar(45) NOT NULL,
  PRIMARY KEY (`sr. no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_detail1`
--

/*!40000 ALTER TABLE `item_detail1` DISABLE KEYS */;
INSERT INTO `item_detail1` (`sr. no`,`item_name`,`quantity`,`item rate`,`unit`,`date`,`distribution_id`) VALUES 
 (1,'rice','000','2','kg','1/1/1010','3'),
 (2,'rice','200.0','3','kg','28-01-2018','1');
/*!40000 ALTER TABLE `item_detail1` ENABLE KEYS */;


--
-- Definition of table `item_detail2`
--

DROP TABLE IF EXISTS `item_detail2`;
CREATE TABLE `item_detail2` (
  `Sr. No.` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `distribution_id` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`Sr. No.`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_detail2`
--

/*!40000 ALTER TABLE `item_detail2` DISABLE KEYS */;
INSERT INTO `item_detail2` (`Sr. No.`,`name`,`quantity`,`unit`,`distribution_id`,`date`) VALUES 
 (1,'rice','2000','kg','1','19/06/1991');
/*!40000 ALTER TABLE `item_detail2` ENABLE KEYS */;


--
-- Definition of table `item_detail3`
--

DROP TABLE IF EXISTS `item_detail3`;
CREATE TABLE `item_detail3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Item_name` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `rate` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_detail3`
--

/*!40000 ALTER TABLE `item_detail3` DISABLE KEYS */;
INSERT INTO `item_detail3` (`id`,`Item_name`,`quantity`,`rate`,`unit`,`date`,`customer_name`) VALUES 
 (1,'rice','10','2','kg','19/06/1991','super');
/*!40000 ALTER TABLE `item_detail3` ENABLE KEYS */;


--
-- Definition of table `mem_reg`
--

DROP TABLE IF EXISTS `mem_reg`;
CREATE TABLE `mem_reg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `relation` varchar(45) DEFAULT NULL,
  `finger_image` longblob NOT NULL,
  `aadhar_image` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mem_reg`
--

/*!40000 ALTER TABLE `mem_reg` DISABLE KEYS */;
INSERT INTO `mem_reg` (`id`,`name`,`age`,`dob`,`gender`,`relation`,`finger_image`,`aadhar_image`) VALUES 
 (5,'Pramod 1','21','19/06/1991','female','son',0x5265636F76657265645F4A504547204469676974616C2043616D6572615F353430322E6A7067,0x5265636F76657265645F4A504547204469676974616C2043616D6572615F353430322E6A7067);
/*!40000 ALTER TABLE `mem_reg` ENABLE KEYS */;


--
-- Definition of table `name`
--

DROP TABLE IF EXISTS `name`;
CREATE TABLE `name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `card_type` varchar(45) NOT NULL,
  `member` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `name`
--

/*!40000 ALTER TABLE `name` DISABLE KEYS */;
/*!40000 ALTER TABLE `name` ENABLE KEYS */;


--
-- Definition of table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `mobile` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `adhar` varchar(45) NOT NULL,
  `income` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `age` varchar(45) DEFAULT NULL,
  `addr` varchar(45) NOT NULL,
  `tal` varchar(45) NOT NULL,
  `dist` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `cast` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `member1` varchar(45) NOT NULL,
  `name1` varchar(45) NOT NULL,
  `dob1` varchar(45) NOT NULL,
  `age1` varchar(45) NOT NULL,
  `gender1` varchar(45) NOT NULL,
  `relation` varchar(45) NOT NULL,
  `adhar_image` varchar(45) NOT NULL,
  `addr_image` varchar(45) DEFAULT NULL,
  `finger_image` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`id`,`name`,`mobile`,`password`,`adhar`,`income`,`dob`,`age`,`addr`,`tal`,`dist`,`state`,`gender`,`cast`,`zip`,`member1`,`name1`,`dob1`,`age1`,`gender1`,`relation`,`adhar_image`,`addr_image`,`finger_image`,`email`) VALUES 
 (5,'jjj','11.jpg','1234','super','r@gmail.com','12345678','female','9657264522','open','412207','-1','Pune','Haveli','12/02/1997','50000','123456789754','2','21','pune									','-1','Hadapsar','1','APL','dinesh');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


--
-- Definition of table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `criteria` varchar(255) NOT NULL,
  `add_date` varchar(255) NOT NULL,
  `valid_date` varchar(255) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`service_id`,`heading`,`desc`,`criteria`,`add_date`,`valid_date`) VALUES 
 (1,'as','xzc','lgyyu','12/1/2017','15/1/2017'),
 (2,'Jaihind College','Project Exbhtion','34','02/13/2018','02/19/2018');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `village` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userid`,`category`,`name`,`email`,`contact`,`dob`,`gender`,`district`,`taluka`,`status`,`password`,`village`) VALUES 
 (1,'Taluka','pramod','p@gmail.com','989898989898','19/06/1991','Male','Pune','Haveli',1,'12345','Hadapasar'),
 (2,'FPS','dinesh','d@gmail.com','9898989898','1/10/1009','male','Pune','Haveli',1,'12345','Hadapsar'),
 (3,'dist','super','s@gmail.com','6565656565','1/2/2018','female','pune','Haveli',1,'12345','Hadapsar'),
 (4,'customer','jivan','j@gmail.com','5454545454','1/2/2018','male','pune','Haveli',1,'12345','Hadapsar');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
