/*
Navicat MySQL Data Transfer

Source Server         : 张某
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : mylibrary

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-06-14 15:52:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('11', '11', '张某');
INSERT INTO `admin` VALUES ('12', '123', '张洪某');

-- ----------------------------
-- Table structure for `book_info`
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish` varchar(30) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `introduction` text,
  `language` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `pubdate` date DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `pkclassid` (`class_id`),
  CONSTRAINT `pkclassid` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=50000028 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES ('50000013', '资本论', '余斌', ' 东方出版社 ', '7-80208-158-0', '本书包括“商品和货币”“货币转化为资本”“变了形的商品经济”“金融资本的统治”“新社会的曙光”五个章节，内容涵盖三卷《资本论》和数十卷《马克思恩格斯全集》（含被称为《资本论》第四卷的部分）和《马克思恩格斯选集》中的一些内容。作者通过将《资本论》用于对当下经济热点的解释，证明了马克思主义经济学理论的科学性和前瞻性，展现了经典的永恒魅力；通过对马克思主义经济学与西方经济学的对比和辨析，批驳了国内一些西方经济学家的错误观点，对国内学术圈盲目崇拜西方经济学的思潮带来冲击。', '英语', '65.00', '2016-02-25', '1', '3', null);
INSERT INTO `book_info` VALUES ('50000014', '毛泽东传', '(美) 罗斯·特里尔', '北京:中国人民大学出版社', '7-300-07010-8', '本书是外国作者编写的毛泽东传传记。', '中文', '55.00', '2016-04-25', '1', '4', null);
INSERT INTO `book_info` VALUES ('50000015', '斯大林:胜利与悲剧', '(俄) 德·安·沃尔科戈诺夫', '北京:国际文化出版公司', '7-80173-199-9', '本书是前苏联最高苏维埃主席团主席联共总书记斯大林的评传，作者以客观、历史的视角，记述了传主的生平、政治理论、思想与他对社会主义进程的影响。', '中文', '120.00', '2003-08-25', '1', '3', null);
INSERT INTO `book_info` VALUES ('50000016', '独领风骚', '陶柏康', '北京:新华出版社', '7-5011-6401-0', '本书以毛泽东的经历和思想为主线，把他的诗词作品串连起来。内含“风骚独领，华采别具”、“风华当年，意切真情”、“沧海横流，壮怀激越”等二十四个专题。', '中文', '25.00', '2003-05-25', '1', '3', null);
INSERT INTO `book_info` VALUES ('50000017', '谁动了我的奶酪？', '(美)斯宾塞·约翰逊(Spencer Johnson)', '北京:中信出版社', '7-80073-366-1', '本书是一个在工作或生活中处理变化的绝妙方法，内容包括“我们多面的人性”、“故事背后的故事”、“芝加哥的同学聚会”、“谁动了我的奶酪”的故事等。', '中文', '16.80', '2004-05-13', '2', '4', null);
INSERT INTO `book_info` VALUES ('50000018', '男人二十几岁要懂的心理学', '赵松编', '北京:地震出版社', '978-7-5028-3719-8', '本书从心理角度进行解释，指导你完善自我性格，促进人际和谐，改善思维方式，提高做事的能力和效率。', '英语', '36.00', '2011-05-25', '2', '6', null);
INSERT INTO `book_info` VALUES ('50000019', '墨菲定律', '华生', '北京:中国致公出版社', '978-7-5145-1053-9', '很多人看到的世界都是表面、千姿百态的，但其有内在的运行规律，掌握了这些规律，你就不会被事物的表象所左右。《墨菲定律》介绍了彼得原理、羊群效应、破窗理论、木桶定律、凡勃伦效应、蝴蝶效应等一百多个经典的定律，学习这些定律，可以更真实地认识这个世界，启迪人生法则，用这些规律来驾驭你的人生。', '中文', '39.80', '2017-05-05', '2', '5', null);
INSERT INTO `book_info` VALUES ('50000020', '你不努力 谁也给不了你想要的生活', '一颗丸子', '北京:中国致公出版社', '978-7-5145-1011-9', '本书是青年作者一颗丸子的首部励志故事集。精选40篇关于梦想、关于职场、关于情感的励志故事，直击读者内心深处。让读者在感受到温暖的同时，更迸发出向上的力量！去勇敢地追寻梦想，实现自己的人生价值！是一本正能量满满的书。', '中文', '2321.00', '2017-07-21', '2', '4', null);
INSERT INTO `book_info` VALUES ('50000021', '人性的弱点', '(美)戴尔·卡耐基', '重庆:重庆出版社', '978-7-229-01927-3', '本书内容包括：“能成事的三大处事技巧”、“让人喜欢你的六大诀窍”、“赢得他人赞同的十二大准则”等8章，帮助人们发现并利用自己身体里无限的潜能超越自我。', '中文', '28.00', '2010-04-16', '3', '4', null);
INSERT INTO `book_info` VALUES ('50000022', ' 厚黑学 ', '李宗吾原典', '呼和浩特:内蒙古人民出版社', '7-204-07220-0', '本书是一部有关人间交往谋略的著作，内容包括：厚黑学——立身行世面厚心黑，厚黑丛话上——做事为人厚心奇学等。', '中文', '28.00', '2004-05-25', '3', '4', null);
INSERT INTO `book_info` VALUES ('50000023', '公司法典型案例评析', '赵玲', '北京:对外经济贸易大学出版社', '978-7-81134-405-9', '本书由案情介绍、问题点提示、案例分析、备选法条四部分构成。使得案例分析脉络清晰、易于读者把握和理解。在案情介绍上，立足于案例的基本事实，但是又有所提炼、使得案情主干脉络突出等。', '中文', '19.00', '2009-05-09', '4', '4', null);
INSERT INTO `book_info` VALUES ('50000024', '犯罪心理学', '张保平', '北京:中共中央党校出版社', '7-5035-2264-X', '本书详细阐述了犯罪心理形成的原因，犯罪心理的相关因素，犯罪心理的形成和发展变化，犯罪人的一般心理特征，犯罪心理的年龄差异等内容。', '中文', '12.80', '2001-05-25', '4', '4', null);
INSERT INTO `book_info` VALUES ('50000025', '第二性', '(法) 西蒙·波伏娃', '北京:西苑出版社', '7-80108-845-X', '著者西蒙·波伏娃出生于巴黎一个天主教色彩很浓的资产阶级家庭，她具有作家、哲学家、散文家等多重身分', '中文', '19.50', '2004-05-12', '4', '4', null);
INSERT INTO `book_info` VALUES ('50000026', '孙子兵法', '(战国) 孙武', '延吉:延边人民出版社', '7-80698-186-1', '兵法-中国-古代', '中文', '58.00', '2006-05-11', '5', '6', null);
INSERT INTO `book_info` VALUES ('50000027', '读大学，究竟读什么:一名25岁的董事长给大学生的18条忠告', '覃彪喜', '广州:南方日报出版社a', '7-80652-473-8', '本书内容包括：“读大学，究竟读什么？”、“人生规划：三岔路口的抉择”、“不可一业不专，不可只专一业”等。', '中文', '25.00', '2005-05-24', '7', '4', null);

-- ----------------------------
-- Table structure for `class_info`
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '马列主义、毛泽东思想、邓小平理论');
INSERT INTO `class_info` VALUES ('2', '哲学、宗教');
INSERT INTO `class_info` VALUES ('3', '社会科学总论');
INSERT INTO `class_info` VALUES ('4', ' 政治、法律');
INSERT INTO `class_info` VALUES ('5', '军事');
INSERT INTO `class_info` VALUES ('6', '经济');
INSERT INTO `class_info` VALUES ('7', '文化、科学、教育、体育');
INSERT INTO `class_info` VALUES ('8', '语言');
INSERT INTO `class_info` VALUES ('9', '文学');
INSERT INTO `class_info` VALUES ('10', '艺术');
INSERT INTO `class_info` VALUES ('11', '历史地理');
INSERT INTO `class_info` VALUES ('12', '自然科学总论');
INSERT INTO `class_info` VALUES ('13', ' 数理科学和化学');
INSERT INTO `class_info` VALUES ('14', '天文学、地球科学');
INSERT INTO `class_info` VALUES ('15', '生物科学');
INSERT INTO `class_info` VALUES ('16', '医药、卫生');
INSERT INTO `class_info` VALUES ('17', '农业科学');
INSERT INTO `class_info` VALUES ('18', '工业技术');
INSERT INTO `class_info` VALUES ('19', '交通运输');
INSERT INTO `class_info` VALUES ('20', '航空、航天');
INSERT INTO `class_info` VALUES ('21', '环境科学');
INSERT INTO `class_info` VALUES ('22', '综合');

-- ----------------------------
-- Table structure for `lend_list`
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list` (
  `sernum` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `lend_date` date DEFAULT NULL,
  `back_date` date DEFAULT NULL,
  `state` int(11) unsigned zerofill DEFAULT NULL COMMENT '归还状态1已还0未还',
  `fine` double DEFAULT NULL COMMENT '产生罚金',
  PRIMARY KEY (`sernum`)
) ENGINE=InnoDB AUTO_INCREMENT=2015040198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES ('2015040185', '50000026', '160310002', '2019-06-03', '2019-05-07', '00000000002', '2.8');
INSERT INTO `lend_list` VALUES ('2015040188', '50000015', '160310002', '2019-06-04', '2019-05-28', '00000000002', '0.7');
INSERT INTO `lend_list` VALUES ('2015040194', '50000013', '160310005', '2019-06-04', '2019-07-02', '00000000002', null);
INSERT INTO `lend_list` VALUES ('2015040195', '50000016', '160310005', '2019-06-04', '2019-07-02', '00000000001', '0');
INSERT INTO `lend_list` VALUES ('2015040196', '50000015', '160310005', '2019-06-04', '2019-07-02', '00000000001', '0');
INSERT INTO `lend_list` VALUES ('2015040197', '50000014', '160310005', '2019-06-04', '2019-07-02', '00000000002', null);

-- ----------------------------
-- Table structure for `reader_info`
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info` (
  `reader_id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telcode` varchar(11) NOT NULL,
  `card_state` int(11) DEFAULT NULL COMMENT '\r\n\r\n逾期每册每天0.1元',
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`reader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES ('160310001', '李天真', '男', '1998-06-10', '天津市', '15150576706', '3', '123456');
INSERT INTO `reader_info` VALUES ('160310002', '李华采', '男', '1998-02-01', '金华', '15154679821', '4', '123456');
INSERT INTO `reader_info` VALUES ('160310003', '王莞尔', '女', '1998-04-15', '浙江省杭州市', '13769854612', '5', '123');
INSERT INTO `reader_info` VALUES ('160310004', '张明华', '男', '1998-08-29', '陕西省西安市', '11565889546', '3', '123456');
INSERT INTO `reader_info` VALUES ('160310005', '李一琛', '男', '1998-01-01', '陕西省西安市', '15123659875', '4', '11');
INSERT INTO `reader_info` VALUES ('160310007', '张海东', '男', '1998-02-20', '浙江省金华市', '13756946136', '6', '123456');

-- ----------------------------
-- Procedure structure for `update_conference_status`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_conference_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_conference_status`()
BEGIN
    IF exists (select sernum from lend_list where `state`=2 and SYSDATE()>=back_date) THEN
            update lend_list set `fine`=DATEDIFF(SYSDATE(),back_date)*0.1
 where sernum in  (select sernum from (select sernum from lend_list where state=2 and SYSDATE()>=back_date) as tmp1);
    END IF;
END
;;
DELIMITER ;
