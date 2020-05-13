/*
Navicat MySQL Data Transfer

Source Server         : smallpang
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : flower

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-05-13 11:30:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `evaluateID` int(11) NOT NULL AUTO_INCREMENT,
  `goodsID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `orderID` bigint(11) NOT NULL,
  `evaluateContent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `evaluateImageList` varchar(400) DEFAULT NULL,
  `evaluateUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluateID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('3', '70', '10124', '6060066949626', '系统默认好评', 'http://localhost:8889/10194_evaluate0.jpg,http://localhost:8889/10194_evaluate1.jpg', '2020-03-09 23:50:57');
INSERT INTO `evaluate` VALUES ('4', '18', '10124', '6060066949634', '系统默认好评', 'http://localhost:8889/10142_evaluate0.jpg,http://localhost:8889/10142_evaluate1.jpg', '2020-03-10 02:43:32');
INSERT INTO `evaluate` VALUES ('5', '18', '10124', '6060066949635', '因为本仙女很懒，不想每一件商品都一样一样地去写好评，所以特意写了这样一个评论。\n但是这件商品无论是质量、材质还是款式，肯定都是本仙女所中意的，如果本仙女不喜欢的话，本仙女收到货肯定是会很生气的，很气很气的那种哦。\n不然这个评论肯定会变成那种喋喋不休，怨气横生，怨天怨地的那种。\n最后当然不可能忘了给这件商品一个好评，给各位爱淘宝的宝宝们一个购物参考，这个产品还是非常值得购买的！ 祝看', 'http://localhost:8889/10142_evaluate0.jpg,http://localhost:8889/10142_evaluate1.jpg,http://localhost:8889/10142_evaluate2.jpg', '2020-03-31 00:03:02');
INSERT INTO `evaluate` VALUES ('6', '113', '10126', '6060066949637', '这个礼物是真的一级棒', 'http://localhost:8889/10239_evaluate0.jpg', '2020-04-09 18:35:50');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsID` int(11) NOT NULL AUTO_INCREMENT,
  `goodsClassName` varchar(255) NOT NULL,
  `goodsName` varchar(255) NOT NULL,
  `goodsSubTitle` varchar(255) NOT NULL,
  `goodsNumber` varchar(255) NOT NULL,
  `goodsHot` tinyint(11) DEFAULT NULL,
  `goodsShelves` tinyint(11) DEFAULT NULL,
  `goodsMarketPrice` decimal(10,2) DEFAULT NULL,
  `goodsPrice` decimal(10,2) DEFAULT NULL,
  `goodsSales` int(11) DEFAULT NULL,
  `goodsInventory` int(11) DEFAULT NULL,
  `goodsSort` int(11) DEFAULT NULL,
  `goodsPresentExp` int(11) DEFAULT NULL,
  `goodsImageList` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `goodsDetailedImageList` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `goodsUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodsID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('17', '红色', '韩式系列/初心不负-- 韩式花束系列花艺师全新打造，卡罗拉玫瑰11枝、白底粉边洋桔梗5枝', '花艺师打造 韩式花束系列', '202002051552', '1', '1', '289.00', '228.00', '65000', '4996', '50', '5', 'http://localhost:8889/202002051552_image0.jpg,http://localhost:8889/202002051552_image1.jpg,http://localhost:8889/202002051552_image2.jpg,http://localhost:8889/202002051552_image3.jpg', 'http://localhost:8889/202002051552_detailedImage0.jpg,http://localhost:8889/202002051552_detailedImage1.jpg,http://localhost:8889/202002051552_detailedImage2.jpg,http://localhost:8889/202002051552_detailedImage3.jpg,http://localhost:8889/202002051552_detailedImage4.jpg,http://localhost:8889/202002051552_detailedImage5.jpg', '2020-03-09 17:26:38');
INSERT INTO `goods` VALUES ('18', '红色', '忘情巴黎--33枝红玫瑰', '浪漫唯美 女神挚爱', '202002061508', '1', '1', '382.00', '339.00', '66000', '4993', '50', '5', 'http://localhost:8889/202002061508_image0.jpg,http://localhost:8889/202002061508_image1.jpg,http://localhost:8889/202002061508_image2.jpg,http://localhost:8889/202002061508_image3.jpg', 'http://localhost:8889/202002061508_detailedImage0.jpg,http://localhost:8889/202002061508_detailedImage1.jpg,http://localhost:8889/202002061508_detailedImage2.jpg,http://localhost:8889/202002061508_detailedImage3.jpg,http://localhost:8889/202002061508_detailedImage4.jpg,http://localhost:8889/202002061508_detailedImage5.jpg', '2020-03-10 16:20:30');
INSERT INTO `goods` VALUES ('19', '红色', ' 99枝玫瑰赠德芙心语巧克力--33枝戴安娜、66枝红玫瑰、1扎满天星', '张杰演唱会定制款', '202002061527', '1', '1', '869.00', '699.00', '2731', '500', '50', '5', 'http://localhost:8889/202002061527_image0.jpg,http://localhost:8889/202002061527_image1.jpg,http://localhost:8889/202002061527_image2.jpg,http://localhost:8889/202002061527_image3.jpg', 'http://localhost:8889/202002061527_detailedImage0.jpg,http://localhost:8889/202002061527_detailedImage1.jpg,http://localhost:8889/202002061527_detailedImage2.jpg,http://localhost:8889/202002061527_detailedImage3.jpg,http://localhost:8889/202002061527_detailedImage4.jpg,http://localhost:8889/202002061527_detailedImage5.jpg', '2020-04-09 18:36:19');
INSERT INTO `goods` VALUES ('20', '红色', '缘份--11枝红玫瑰,2枝多头白香水百合', '寓意成双成对 百年好合', '202002061548', '1', '1', '255.00', '196.00', '16000', '4996', '50', '5', 'http://localhost:8889/202002061548_image0.jpg,http://localhost:8889/202002061548_image1.jpg,http://localhost:8889/202002061548_image2.jpg,http://localhost:8889/202002061548_image3.jpg', 'http://localhost:8889/202002061548_detailedImage0.jpg,http://localhost:8889/202002061548_detailedImage1.jpg,http://localhost:8889/202002061548_detailedImage2.jpg,http://localhost:8889/202002061548_detailedImage3.jpg', '2020-03-07 22:57:18');
INSERT INTO `goods` VALUES ('21', '红色', ' 缪斯女神--红玫瑰16枝，红豆5枝，粉色桔梗1枝，银叶菊2枝', '女神专属 美艳缪斯', '202002061550', '1', '1', '242.00', '198.00', '32000', '3000', '48', '5', 'http://localhost:8889/202002061550_image0.jpg,http://localhost:8889/202002061550_image1.jpg,http://localhost:8889/202002061550_image2.jpg,http://localhost:8889/202002061550_image3.jpg', 'http://localhost:8889/202002061550_detailedImage0.jpg,http://localhost:8889/202002061550_detailedImage1.jpg,http://localhost:8889/202002061550_detailedImage2.jpg,http://localhost:8889/202002061550_detailedImage3.jpg', '2020-02-06 16:17:54');
INSERT INTO `goods` VALUES ('22', '红色', ' 韩式系列/加倍爱你--卡罗拉玫瑰15枝、戴安娜玫瑰5枝、深粉色绣球1枝、白桔梗5枝、尤加利叶15枝', '花艺师打造 韩式花束系列', '202002061606', '1', '1', '489.00', '389.00', '16', '30', '40', '5', 'http://localhost:8889/202002061606_image0.jpg,http://localhost:8889/202002061606_image1.jpg,http://localhost:8889/202002061606_image2.jpg,http://localhost:8889/202002061606_image3.jpg', 'http://localhost:8889/202002061606_detailedImage0.jpg,http://localhost:8889/202002061606_detailedImage1.jpg,http://localhost:8889/202002061606_detailedImage2.jpg,http://localhost:8889/202002061606_detailedImage3.jpg,http://localhost:8889/202002061606_detailedImage4.jpg,http://localhost:8889/202002061606_detailedImage5.jpg', '2020-04-22 13:39:30');
INSERT INTO `goods` VALUES ('23', '红色', '感激--29枝红康乃馨,2枝多头粉百合', '多花材搭配', '202002061609', '1', '1', '278.00', '218.00', '19000', '3993', '40', '5', 'http://localhost:8889/202002061609_image0.jpg,http://localhost:8889/202002061609_image1.jpg,http://localhost:8889/202002061609_image2.jpg,http://localhost:8889/202002061609_image3.jpg', 'http://localhost:8889/202002061609_detailedImage0.jpg,http://localhost:8889/202002061609_detailedImage1.jpg,http://localhost:8889/202002061609_detailedImage2.jpg,http://localhost:8889/202002061609_detailedImage3.jpg,http://localhost:8889/202002061609_detailedImage4.jpg', '2020-03-07 23:21:32');
INSERT INTO `goods` VALUES ('24', '红色', '母爱--紫红色康乃馨9枝，粉色多头康乃馨10枝', '红粉搭配 花色明艳', '202002061612', '1', '1', '228.00', '172.00', '15000', '2000', '35', '5', 'http://localhost:8889/202002061612_image0.jpg,http://localhost:8889/202002061612_image1.jpg,http://localhost:8889/202002061612_image2.jpg,http://localhost:8889/202002061612_image3.jpg', 'http://localhost:8889/202002061612_detailedImage0.jpg,http://localhost:8889/202002061612_detailedImage1.jpg,http://localhost:8889/202002061612_detailedImage2.jpg,http://localhost:8889/202002061612_detailedImage3.jpg,http://localhost:8889/202002061612_detailedImage4.jpg', '2020-02-06 16:14:16');
INSERT INTO `goods` VALUES ('25', '红色', '嫁给我吧-- 戴安娜粉玫瑰108枝', '表白求婚神器！', '202002061621', '1', '1', '858.00', '688.00', '2556', '500', '25', '5', 'http://localhost:8889/202002061621_image0.jpg,http://localhost:8889/202002061621_image1.jpg,http://localhost:8889/202002061621_image2.jpg,http://localhost:8889/202002061621_image3.jpg', 'http://localhost:8889/202002061621_detailedImage0.jpg,http://localhost:8889/202002061621_detailedImage1.jpg,http://localhost:8889/202002061621_detailedImage2.jpg,http://localhost:8889/202002061621_detailedImage3.jpg,http://localhost:8889/202002061621_detailedImage4.jpg,http://localhost:8889/202002061621_detailedImage5.jpg', '2020-02-06 16:22:25');
INSERT INTO `goods` VALUES ('26', '红色', ' 永恒的爱情--红玫瑰99枝', '表白求婚利器！', '202002061625', '1', '1', '859.00', '699.00', '3906', '500', '20', '5', 'http://localhost:8889/202002061625_image0.jpg,http://localhost:8889/202002061625_image1.jpg,http://localhost:8889/202002061625_image2.jpg,http://localhost:8889/202002061625_image3.jpg', 'http://localhost:8889/202002061625_detailedImage0.jpg,http://localhost:8889/202002061625_detailedImage1.jpg,http://localhost:8889/202002061625_detailedImage2.jpg', '2020-02-06 16:26:22');
INSERT INTO `goods` VALUES ('27', '红色', '牵手一生--红玫瑰19枝', '精选材料 简约搭配', '202002061641', '1', '1', '281.00', '226.00', '62000', '3200', '20', '5', 'http://localhost:8889/202002061641_image0.jpg,http://localhost:8889/202002061641_image1.jpg,http://localhost:8889/202002061641_image2.jpg,http://localhost:8889/202002061641_image3.jpg', 'http://localhost:8889/202002061641_detailedImage0.jpg,http://localhost:8889/202002061641_detailedImage1.jpg,http://localhost:8889/202002061641_detailedImage2.jpg', '2020-02-06 16:42:30');
INSERT INTO `goods` VALUES ('28', '红色', '想你365天--红玫瑰365枝', '表白求婚，不二之选！', '202002061644', '1', '1', '2999.00', '2899.00', '813', '50', '10', '10', 'http://localhost:8889/202002061644_image0.jpg,http://localhost:8889/202002061644_image1.jpg,http://localhost:8889/202002061644_image2.jpg,http://localhost:8889/202002061644_image3.jpg', 'http://localhost:8889/202002061644_detailedImage0.jpg,http://localhost:8889/202002061644_detailedImage1.jpg,http://localhost:8889/202002061644_detailedImage2.jpg,http://localhost:8889/202002061644_detailedImage3.jpg,http://localhost:8889/202002061644_detailedImage4.jpg,http://localhost:8889/202002061644_detailedImage5.jpg', '2020-02-06 16:45:28');
INSERT INTO `goods` VALUES ('29', '红色', '我爱你--520朵玫瑰', '表白求婚，不二之选！', '202002061647', '1', '1', '4299.00', '3899.00', '165', '20', '10', '12', 'http://localhost:8889/202002061647_image0.jpg,http://localhost:8889/202002061647_image1.jpg,http://localhost:8889/202002061647_image2.jpg,http://localhost:8889/202002061647_image3.jpg', 'http://localhost:8889/202002061647_detailedImage0.jpg,http://localhost:8889/202002061647_detailedImage1.jpg,http://localhost:8889/202002061647_detailedImage2.jpg,http://localhost:8889/202002061647_detailedImage3.jpg,http://localhost:8889/202002061647_detailedImage4.jpg,http://localhost:8889/202002061647_detailedImage5.jpg', '2020-02-06 16:48:19');
INSERT INTO `goods` VALUES ('30', '红色', '用心爱你--99枝：33枝戴安娜＋66枝红玫瑰', '与你相守，直到天荒地老', '202002061649', '1', '1', '869.00', '658.00', '33000', '60', '20', '12', 'http://localhost:8889/202002061649_image0.jpg,http://localhost:8889/202002061649_image1.jpg,http://localhost:8889/202002061649_image2.jpg,http://localhost:8889/202002061649_image3.jpg', 'http://localhost:8889/202002061649_detailedImage0.jpg,http://localhost:8889/202002061649_detailedImage1.jpg,http://localhost:8889/202002061649_detailedImage2.jpg,http://localhost:8889/202002061649_detailedImage3.jpg,http://localhost:8889/202002061649_detailedImage4.jpg,http://localhost:8889/202002061649_detailedImage5.jpg', '2020-02-06 16:50:34');
INSERT INTO `goods` VALUES ('31', '红色', '幸福花园--红色康乃馨11枝', '阳光明媚，温情永在', '202002061708', '1', '1', '165.00', '119.00', '10000', '60', '30', '5', 'http://localhost:8889/202002061708_image0.jpg,http://localhost:8889/202002061708_image1.jpg,http://localhost:8889/202002061708_image2.jpg,http://localhost:8889/202002061708_image3.jpg', 'http://localhost:8889/202002061708_detailedImage0.jpg,http://localhost:8889/202002061708_detailedImage1.jpg,http://localhost:8889/202002061708_detailedImage2.jpg,http://localhost:8889/202002061708_detailedImage3.jpg', '2020-02-06 17:09:44');
INSERT INTO `goods` VALUES ('32', '红色', '真爱--红玫瑰9枝，石竹梅4枝，栀子叶0.5扎', '纯真的爱 温情相伴', '202002061713', '1', '1', '165.00', '136.00', '30000', '40', '5', '5', 'http://localhost:8889/202002061713_image0.jpg,http://localhost:8889/202002061713_image1.jpg,http://localhost:8889/202002061713_image2.jpg,http://localhost:8889/202002061713_image3.jpg', 'http://localhost:8889/202002061713_detailedImage0.jpg,http://localhost:8889/202002061713_detailedImage1.jpg,http://localhost:8889/202002061713_detailedImage2.jpg,http://localhost:8889/202002061713_detailedImage3.jpg,http://localhost:8889/202002061713_detailedImage4.jpg', '2020-02-06 17:30:39');
INSERT INTO `goods` VALUES ('33', '红色', '浪漫心情--红玫瑰19枝', '火热玫瑰 幸福告白', '202002061733', '1', '1', '279.00', '218.00', '3920', '39', '12', '5', 'http://localhost:8889/202002061733_image0.jpg,http://localhost:8889/202002061733_image1.jpg,http://localhost:8889/202002061733_image2.jpg,http://localhost:8889/202002061733_image3.jpg', 'http://localhost:8889/202002061733_detailedImage0.jpg,http://localhost:8889/202002061733_detailedImage1.jpg,http://localhost:8889/202002061733_detailedImage2.jpg,http://localhost:8889/202002061733_detailedImage3.jpg,http://localhost:8889/202002061733_detailedImage4.jpg,http://localhost:8889/202002061733_detailedImage5.jpg', '2020-02-06 17:35:28');
INSERT INTO `goods` VALUES ('34', '红色', '黑夜之光--红色玫瑰11枝，满天星0.2扎', '浪漫花语 经典款式', '202002061745', '1', '1', '199.00', '139.00', '6763', '67', '0', '5', 'http://localhost:8889/202002061745_image0.jpg,http://localhost:8889/202002061745_image1.jpg,http://localhost:8889/202002061745_image2.jpg,http://localhost:8889/202002061745_image3.jpg', 'http://localhost:8889/202002061745_detailedImage0.jpg,http://localhost:8889/202002061745_detailedImage1.jpg,http://localhost:8889/202002061745_detailedImage2.jpg,http://localhost:8889/202002061745_detailedImage3.jpg', '2020-02-06 17:46:23');
INSERT INTO `goods` VALUES ('35', '红色', '心上人--红玫瑰66枝，满天星0.5扎', '高端鲜花', '202002112133', '1', '1', '998.00', '783.00', '3375', '33', '0', '3', 'http://localhost:8889/202002112133_image0.jpg,http://localhost:8889/202002112133_image1.jpg,http://localhost:8889/202002112133_image2.jpg,http://localhost:8889/202002112133_image3.jpg', 'http://localhost:8889/202002112133_detailedImage0.jpg,http://localhost:8889/202002112133_detailedImage1.jpg,http://localhost:8889/202002112133_detailedImage2.jpg,http://localhost:8889/202002112133_detailedImage3.jpg', '2020-02-11 21:35:04');
INSERT INTO `goods` VALUES ('36', '红色', '邂逅浪漫--红玫瑰29枝+红色蔷薇10枝，灯台9枝，尤加利叶', '精品鲜花', '202002112136', '1', '1', '938.00', '736.00', '536', '53', '0', '5', 'http://localhost:8889/202002112136_image0.jpg,http://localhost:8889/202002112136_image1.jpg,http://localhost:8889/202002112136_image2.jpg,http://localhost:8889/202002112136_image3.jpg', 'http://localhost:8889/202002112136_detailedImage0.jpg,http://localhost:8889/202002112136_detailedImage1.jpg,http://localhost:8889/202002112136_detailedImage2.jpg,http://localhost:8889/202002112136_detailedImage3.jpg,http://localhost:8889/202002112136_detailedImage4.jpg,http://localhost:8889/202002112136_detailedImage5.jpg', '2020-02-11 21:47:33');
INSERT INTO `goods` VALUES ('37', '红色', '致美丽的你--红玫瑰11枝，满天星0.3扎，栀子叶0.5扎', '精选花材 彰显高端', '202002112148', '1', '1', '316.00', '248.00', '54000', '540', '5', '8', 'http://localhost:8889/202002112148_image0.jpg,http://localhost:8889/202002112148_image1.jpg,http://localhost:8889/202002112148_image2.jpg,http://localhost:8889/202002112148_image3.jpg', 'http://localhost:8889/202002112148_detailedImage0.jpg,http://localhost:8889/202002112148_detailedImage1.jpg,http://localhost:8889/202002112148_detailedImage2.jpg,http://localhost:8889/202002112148_detailedImage3.jpg,http://localhost:8889/202002112148_detailedImage4.jpg,http://localhost:8889/202002112148_detailedImage5.jpg', '2020-02-11 21:49:04');
INSERT INTO `goods` VALUES ('38', '红色', '不变的心--戴安娜玫瑰66枝', '时光匆匆，我心永恒', '202002112150', '1', '1', '998.00', '783.00', '11000', '110', '50', '5', 'http://localhost:8889/202002112150_image0.jpg,http://localhost:8889/202002112150_image1.jpg,http://localhost:8889/202002112150_image2.jpg,http://localhost:8889/202002112150_image3.jpg', 'http://localhost:8889/202002112150_detailedImage0.jpg,http://localhost:8889/202002112150_detailedImage1.jpg,http://localhost:8889/202002112150_detailedImage2.jpg', '2020-02-11 21:51:30');
INSERT INTO `goods` VALUES ('39', '红色', '嫁给我吧-- 戴安娜粉玫瑰108枝', '表白求婚神器！', '202002112152', '1', '1', '1376.00', '1080.00', '2558', '25', '0', '5', 'http://localhost:8889/202002112152_image0.jpg,http://localhost:8889/202002112152_image1.jpg,http://localhost:8889/202002112152_image2.jpg,http://localhost:8889/202002112152_image3.jpg', 'http://localhost:8889/202002112152_detailedImage0.jpg,http://localhost:8889/202002112152_detailedImage1.jpg,http://localhost:8889/202002112152_detailedImage2.jpg,http://localhost:8889/202002112152_detailedImage3.jpg,http://localhost:8889/202002112152_detailedImage4.jpg,http://localhost:8889/202002112152_detailedImage5.jpg', '2020-02-11 21:52:50');
INSERT INTO `goods` VALUES ('40', '红色', '爱到永久--999枝红玫瑰', '高端大气上档次', '202002112153', '1', '1', '11998.00', '9418.00', '295', '10', '100', '20', 'http://localhost:8889/202002112153_image0.jpg,http://localhost:8889/202002112153_image1.jpg,http://localhost:8889/202002112153_image2.jpg,http://localhost:8889/202002112153_image3.jpg', 'http://localhost:8889/202002112153_detailedImage0.jpg,http://localhost:8889/202002112153_detailedImage1.jpg,http://localhost:8889/202002112153_detailedImage2.jpg,http://localhost:8889/202002112153_detailedImage3.jpg,http://localhost:8889/202002112153_detailedImage4.jpg,http://localhost:8889/202002112153_detailedImage5.jpg', '2020-02-11 21:54:37');
INSERT INTO `goods` VALUES ('41', '红色', '想你365天--红玫瑰365枝', '高端大气上档次', '202002112155', '1', '1', '5798.00', '4551.00', '814', '14', '80', '15', 'http://localhost:8889/202002112155_image0.jpg,http://localhost:8889/202002112155_image1.jpg,http://localhost:8889/202002112155_image2.jpg,http://localhost:8889/202002112155_image3.jpg', 'http://localhost:8889/202002112155_detailedImage0.jpg,http://localhost:8889/202002112155_detailedImage1.jpg,http://localhost:8889/202002112155_detailedImage2.jpg,http://localhost:8889/202002112155_detailedImage3.jpg,http://localhost:8889/202002112155_detailedImage4.jpg,http://localhost:8889/202002112155_detailedImage5.jpg', '2020-02-11 21:55:48');
INSERT INTO `goods` VALUES ('42', '红色', '我爱你--520朵玫瑰', '表白求婚，不二之选！', '202002112158', '1', '1', '7798.00', '6121.00', '165', '16', '80', '15', 'http://localhost:8889/202002112158_image0.jpg,http://localhost:8889/202002112158_image1.jpg,http://localhost:8889/202002112158_image2.jpg,http://localhost:8889/202002112158_image3.jpg', 'http://localhost:8889/202002112158_detailedImage0.jpg,http://localhost:8889/202002112158_detailedImage1.jpg,http://localhost:8889/202002112158_detailedImage2.jpg,http://localhost:8889/202002112158_detailedImage3.jpg,http://localhost:8889/202002112158_detailedImage4.jpg,http://localhost:8889/202002112158_detailedImage5.jpg', '2020-02-11 21:58:59');
INSERT INTO `goods` VALUES ('43', '黄色', '韩式系列/一路向阳--向日葵3枝、香槟玫瑰9枝、橙色多头玫5枝、黄色腊梅5枝、大叶尤加利5枝', '花艺师打造 韩式花束系列', '202002112201', '1', '1', '596.00', '468.00', '61000', '610', '100', '5', 'http://localhost:8889/202002112201_image0.jpg,http://localhost:8889/202002112201_image1.jpg,http://localhost:8889/202002112201_image2.jpg,http://localhost:8889/202002112201_image3.jpg', 'http://localhost:8889/202002112201_detailedImage0.jpg,http://localhost:8889/202002112201_detailedImage1.jpg,http://localhost:8889/202002112201_detailedImage2.jpg,http://localhost:8889/202002112201_detailedImage3.jpg,http://localhost:8889/202002112201_detailedImage4.jpg,http://localhost:8889/202002112201_detailedImage5.jpg', '2020-02-11 22:01:54');
INSERT INTO `goods` VALUES ('44', '黄色', '晴朗--香槟玫瑰11枝，向日葵2枝，绿色桔梗5枝，绿色小菊3枝，叶上花3枝', '耀眼光芒 魅力难挡', '202002112203', '1', '1', '484.00', '380.00', '3732', '37', '80', '8', 'http://localhost:8889/202002112203_image0.jpg,http://localhost:8889/202002112203_image1.jpg,http://localhost:8889/202002112203_image2.jpg,http://localhost:8889/202002112203_image3.jpg', 'http://localhost:8889/202002112203_detailedImage0.jpg,http://localhost:8889/202002112203_detailedImage1.jpg,http://localhost:8889/202002112203_detailedImage2.jpg,http://localhost:8889/202002112203_detailedImage3.jpg', '2020-02-11 22:03:54');
INSERT INTO `goods` VALUES ('45', '黄色', '懂你--黄色扶郞9枝，橙色扶郞3枝', '耀眼光芒 魅力四射', '202002112204', '1', '1', '278.00', '218.00', '2054', '20', '0', '5', 'http://localhost:8889/202002112204_image0.jpg,http://localhost:8889/202002112204_image1.jpg,http://localhost:8889/202002112204_image2.jpg,http://localhost:8889/202002112204_image3.jpg', 'http://localhost:8889/202002112204_detailedImage0.jpg,http://localhost:8889/202002112204_detailedImage1.jpg,http://localhost:8889/202002112204_detailedImage2.jpg,http://localhost:8889/202002112204_detailedImage3.jpg', '2020-02-11 22:05:23');
INSERT INTO `goods` VALUES ('46', '黄色', '向日葵之歌--向日葵6枝', '心向暖阳，快乐相伴', '202002112221', '1', '1', '378.00', '297.00', '7735', '35', '0', '0', 'http://localhost:8889/202002112221_image0.jpg,http://localhost:8889/202002112221_image1.jpg,http://localhost:8889/202002112221_image2.jpg,http://localhost:8889/202002112221_image3.jpg', 'http://localhost:8889/202002112221_detailedImage0.jpg,http://localhost:8889/202002112221_detailedImage1.jpg,http://localhost:8889/202002112221_detailedImage2.jpg,http://localhost:8889/202002112221_detailedImage3.jpg,http://localhost:8889/202002112221_detailedImage4.jpg', '2020-02-11 22:22:39');
INSERT INTO `goods` VALUES ('47', '黄色', '一缕清香--向日葵3枝，白色洋桔梗0.5扎', '清新向日葵 夏日专属', '202002120159', '1', '1', '396.00', '311.00', '3745', '37', '0', '5', 'http://localhost:8889/202002120159_image0.jpg,http://localhost:8889/202002120159_image1.jpg,http://localhost:8889/202002120159_image2.jpg,http://localhost:8889/202002120159_image3.jpg', 'http://localhost:8889/202002120159_detailedImage0.jpg,http://localhost:8889/202002120159_detailedImage1.jpg,http://localhost:8889/202002120159_detailedImage2.jpg,http://localhost:8889/202002120159_detailedImage3.jpg,http://localhost:8889/202002120159_detailedImage4.jpg,http://localhost:8889/202002120159_detailedImage5.jpg', '2020-02-12 02:01:00');
INSERT INTO `goods` VALUES ('48', '黄色', '父爱如山--向日葵6枝，绿色洋桔梗6枝', '父爱如山', '202002122026', '1', '1', '580.00', '455.00', '2419', '24', '1', '1', 'http://localhost:8889/202002122026_image0.jpg,http://localhost:8889/202002122026_image1.jpg,http://localhost:8889/202002122026_image2.jpg,http://localhost:8889/202002122026_image3.jpg', 'http://localhost:8889/202002122026_detailedImage0.jpg,http://localhost:8889/202002122026_detailedImage1.jpg,http://localhost:8889/202002122026_detailedImage2.jpg', '2020-02-12 20:27:05');
INSERT INTO `goods` VALUES ('49', '黄色', '父爱如山--向日葵6枝，绿色洋桔梗6枝', '父爱如山', '202002122100', '1', '1', '580.00', '455.00', '2419', '24', '0', '0', 'http://localhost:8889/202002122100_image0.jpg,http://localhost:8889/202002122100_image1.jpg,http://localhost:8889/202002122100_image2.jpg,http://localhost:8889/202002122100_image3.jpg', 'http://localhost:8889/202002122100_detailedImage0.jpg,http://localhost:8889/202002122100_detailedImage1.jpg,http://localhost:8889/202002122100_detailedImage2.jpg', '2020-02-12 21:06:29');
INSERT INTO `goods` VALUES ('50', '黄色', '阳光灿烂--向日葵3枝、金枝玉叶黄玫瑰19枝', '心向暖阳 容光焕发', '202002122124', '1', '1', '616.00', '484.00', '1253', '12', '0', '0', 'http://localhost:8889/202002122124_image0.jpg,http://localhost:8889/202002122124_image1.jpg,http://localhost:8889/202002122124_image2.jpg,http://localhost:8889/202002122124_image3.jpg', 'http://localhost:8889/202002122124_detailedImage0.jpg,http://localhost:8889/202002122124_detailedImage1.jpg,http://localhost:8889/202002122124_detailedImage2.jpg,http://localhost:8889/202002122124_detailedImage3.jpg', '2020-02-12 21:24:44');
INSERT INTO `goods` VALUES ('51', '黄色', '阳光满溢--香槟玫瑰15枝，向日葵3枝', '心向暖阳 容光焕发', '202002122126', '1', '1', '556.00', '436.00', '2972', '29', '0', '0', 'http://localhost:8889/202002122126_image0.jpg,http://localhost:8889/202002122126_image1.jpg,http://localhost:8889/202002122126_image2.jpg,http://localhost:8889/202002122126_image3.jpg', 'http://localhost:8889/202002122126_detailedImage0.jpg,http://localhost:8889/202002122126_detailedImage1.jpg,http://localhost:8889/202002122126_detailedImage2.jpg,http://localhost:8889/202002122126_detailedImage3.jpg,http://localhost:8889/202002122126_detailedImage4.jpg', '2020-02-12 21:26:56');
INSERT INTO `goods` VALUES ('52', '紫色', '温情祝福--紫红色康乃馨9枝，粉色多头香水百合2枝，紫色桔梗4枝', '浪漫配色 美好寓意', '202002122128', '1', '1', '390.00', '306.00', '2078', '20', '80', '5', 'http://localhost:8889/202002122128_image0.jpg,http://localhost:8889/202002122128_image1.jpg,http://localhost:8889/202002122128_image2.jpg,http://localhost:8889/202002122128_image3.jpg', 'http://localhost:8889/202002122128_detailedImage0.jpg,http://localhost:8889/202002122128_detailedImage1.jpg,http://localhost:8889/202002122128_detailedImage2.jpg,http://localhost:8889/202002122128_detailedImage3.jpg', '2020-02-12 21:29:04');
INSERT INTO `goods` VALUES ('53', '紫色', '紫为你动馨--16枝紫康乃馨', '花艺师打造 韩式花束系列', '202002122130', '1', '1', '318.00', '250.00', '5493', '54', '80', '5', 'http://localhost:8889/202002122130_image0.jpg,http://localhost:8889/202002122130_image1.jpg,http://localhost:8889/202002122130_image2.jpg,http://localhost:8889/202002122130_image3.jpg', 'http://localhost:8889/202002122130_detailedImage0.jpg,http://localhost:8889/202002122130_detailedImage1.jpg,http://localhost:8889/202002122130_detailedImage2.jpg', '2020-02-12 21:30:55');
INSERT INTO `goods` VALUES ('54', '紫色', '等你来--深紫色勿忘我1扎，情人草0.2扎', '花艺师打造 韩式花束系列', '202002122131', '1', '1', '356.00', '279.00', '539', '15', '60', '5', 'http://localhost:8889/202002122131_image0.jpg,http://localhost:8889/202002122131_image1.jpg,http://localhost:8889/202002122131_image2.jpg,http://localhost:8889/202002122131_image3.jpg', 'http://localhost:8889/202002122131_detailedImage0.jpg,http://localhost:8889/202002122131_detailedImage1.jpg,http://localhost:8889/202002122131_detailedImage2.jpg,http://localhost:8889/202002122131_detailedImage3.jpg', '2020-02-12 21:32:05');
INSERT INTO `goods` VALUES ('55', '紫色', '紫色的梦--冷美人紫玫瑰19枝，白色桔梗7枝', '高贵典雅，浪漫神秘', '202002122132', '1', '1', '538.00', '422.00', '3656', '36', '15', '0', 'http://localhost:8889/202002122132_image0.jpg,http://localhost:8889/202002122132_image1.jpg,http://localhost:8889/202002122132_image2.jpg,http://localhost:8889/202002122132_image3.jpg', 'http://localhost:8889/202002122132_detailedImage0.jpg,http://localhost:8889/202002122132_detailedImage1.jpg,http://localhost:8889/202002122132_detailedImage2.jpg,http://localhost:8889/202002122132_detailedImage3.jpg,http://localhost:8889/202002122132_detailedImage4.jpg,http://localhost:8889/202002122132_detailedImage5.jpg', '2020-02-12 21:33:38');
INSERT INTO `goods` VALUES ('56', '紫色', '优雅馨情--紫色康乃馨66枝，粉色多头康乃馨15枝', '高贵典雅 冷艳浪漫', '202002122134', '1', '1', '676.00', '531.00', '397', '13', '0', '0', 'http://localhost:8889/202002122134_image0.jpg,http://localhost:8889/202002122134_image1.jpg,http://localhost:8889/202002122134_image2.jpg,http://localhost:8889/202002122134_image3.jpg', 'http://localhost:8889/202002122134_detailedImage0.jpg,http://localhost:8889/202002122134_detailedImage1.jpg,http://localhost:8889/202002122134_detailedImage2.jpg,http://localhost:8889/202002122134_detailedImage3.jpg,http://localhost:8889/202002122134_detailedImage4.jpg,http://localhost:8889/202002122134_detailedImage5.jpg', '2020-02-12 21:35:03');
INSERT INTO `goods` VALUES ('57', '紫色', '勿忘我--紫色+粉色勿忘我各一扎', '高端鲜花', '202002122136', '1', '1', '316.00', '248.00', '3406', '34', '0', '0', 'http://localhost:8889/202002122136_image0.jpg,http://localhost:8889/202002122136_image1.jpg,http://localhost:8889/202002122136_image2.jpg,http://localhost:8889/202002122136_image3.jpg', 'http://localhost:8889/202002122136_detailedImage0.jpg,http://localhost:8889/202002122136_detailedImage1.jpg,http://localhost:8889/202002122136_detailedImage2.jpg,http://localhost:8889/202002122136_detailedImage3.jpg', '2020-02-12 21:37:13');
INSERT INTO `goods` VALUES ('58', '紫色', '梦里花开--紫色桔梗1扎', '高端鲜花', '202002122137', '1', '1', '316.00', '248.00', '2217', '22', '0', '0', 'http://localhost:8889/202002122137_image0.jpg,http://localhost:8889/202002122137_image1.jpg,http://localhost:8889/202002122137_image2.jpg,http://localhost:8889/202002122137_image3.jpg', 'http://localhost:8889/202002122137_detailedImage0.jpg,http://localhost:8889/202002122137_detailedImage1.jpg,http://localhost:8889/202002122137_detailedImage2.jpg', '2020-02-12 21:38:04');
INSERT INTO `goods` VALUES ('59', '白色', '月光女神--白玫瑰11枝，绿色桔梗5枝，小菊3枝，白色石竹梅4枝', '小清新设计 清新无比', '202002122138', '1', '1', '464.00', '364.00', '48000', '2400', '1000', '10', 'http://localhost:8889/202002122138_image0.jpg,http://localhost:8889/202002122138_image1.jpg,http://localhost:8889/202002122138_image2.jpg,http://localhost:8889/202002122138_image3.jpg', 'http://localhost:8889/202002122138_detailedImage0.jpg,http://localhost:8889/202002122138_detailedImage1.jpg,http://localhost:8889/202002122138_detailedImage2.jpg,http://localhost:8889/202002122138_detailedImage3.jpg,http://localhost:8889/202002122138_detailedImage4.jpg,http://localhost:8889/202002122138_detailedImage5.jpg', '2020-02-12 21:39:23');
INSERT INTO `goods` VALUES ('60', '白色', '青青子衿--白色多头香水百合6枝', '香味清新 风格独特', '202002122140', '1', '1', '560.00', '440.00', '8715', '87', '20', '5', 'http://localhost:8889/202002122140_image0.jpg,http://localhost:8889/202002122140_image1.jpg,http://localhost:8889/202002122140_image2.jpg,http://localhost:8889/202002122140_image3.jpg', 'http://localhost:8889/202002122140_detailedImage0.jpg,http://localhost:8889/202002122140_detailedImage1.jpg,http://localhost:8889/202002122140_detailedImage2.jpg,http://localhost:8889/202002122140_detailedImage3.jpg', '2020-02-12 21:41:03');
INSERT INTO `goods` VALUES ('61', '白色', '如初--19枝白玫瑰，紫色勿忘我5枝', '特惠款', '202002122141', '1', '1', '410.00', '322.00', '17000', '1700', '95', '10', 'http://localhost:8889/202002122141_image0.jpg,http://localhost:8889/202002122141_image1.jpg,http://localhost:8889/202002122141_image2.jpg,http://localhost:8889/202002122141_image3.jpg', 'http://localhost:8889/202002122141_detailedImage0.jpg,http://localhost:8889/202002122141_detailedImage1.jpg,http://localhost:8889/202002122141_detailedImage2.jpg,http://localhost:8889/202002122141_detailedImage3.jpg', '2020-02-12 21:42:09');
INSERT INTO `goods` VALUES ('62', '白色', '初心永不变--白玫瑰99枝', '幸福相守 爱在永久', '202002122142', '1', '1', '1338.00', '1050.00', '1273', '12', '60', '20', 'http://localhost:8889/202002122142_image0.jpg,http://localhost:8889/202002122142_image1.jpg,http://localhost:8889/202002122142_image2.jpg,http://localhost:8889/202002122142_image3.jpg', 'http://localhost:8889/202002122142_detailedImage0.jpg,http://localhost:8889/202002122142_detailedImage1.jpg,http://localhost:8889/202002122142_detailedImage2.jpg,http://localhost:8889/202002122142_detailedImage3.jpg,http://localhost:8889/202002122142_detailedImage4.jpg', '2020-02-12 21:43:14');
INSERT INTO `goods` VALUES ('63', '白色', '爱你如初--雪山白玫瑰66枝', '淡雅玫瑰', '202002122143', '1', '1', '998.00', '783.00', '804', '80', '30', '8', 'http://localhost:8889/202002122143_image0.jpg,http://localhost:8889/202002122143_image1.jpg,http://localhost:8889/202002122143_image2.jpg,http://localhost:8889/202002122143_image3.jpg', 'http://localhost:8889/202002122143_detailedImage0.jpg,http://localhost:8889/202002122143_detailedImage1.jpg,http://localhost:8889/202002122143_detailedImage2.jpg,http://localhost:8889/202002122143_detailedImage3.jpg,http://localhost:8889/202002122143_detailedImage4.jpg,http://localhost:8889/202002122143_detailedImage5.jpg', '2020-02-12 21:44:18');
INSERT INTO `goods` VALUES ('64', '白色', '爱是唯一 鲜花礼盒--雪山白玫瑰11枝、多头白百合3枝', '娇艳欲滴 情真意切', '202002122145', '1', '1', '592.00', '465.00', '2422', '24', '30', '5', 'http://localhost:8889/202002122145_image0.jpg,http://localhost:8889/202002122145_image1.jpg,http://localhost:8889/202002122145_image2.jpg,http://localhost:8889/202002122145_image3.jpg', 'http://localhost:8889/202002122145_detailedImage0.jpg,http://localhost:8889/202002122145_detailedImage1.jpg,http://localhost:8889/202002122145_detailedImage2.jpg,http://localhost:8889/202002122145_detailedImage3.jpg', '2020-02-12 21:46:04');
INSERT INTO `goods` VALUES ('65', '白色', '倾城月色--雪山白玫瑰11枝', '独家创意心形设计', '202002122146', '1', '1', '312.00', '245.00', '5090', '50', '20', '5', 'http://localhost:8889/202002122146_image0.jpg,http://localhost:8889/202002122146_image1.jpg,http://localhost:8889/202002122146_image2.jpg,http://localhost:8889/202002122146_image3.jpg', 'http://localhost:8889/202002122146_detailedImage0.jpg,http://localhost:8889/202002122146_detailedImage1.jpg,http://localhost:8889/202002122146_detailedImage2.jpg', '2020-02-12 21:47:13');
INSERT INTO `goods` VALUES ('66', '白色', '海洋之心--白玫瑰29枝', '高端鲜花', '202002122147', '1', '1', '592.00', '465.00', '3277', '32', '20', '5', 'http://localhost:8889/202002122147_image0.jpg,http://localhost:8889/202002122147_image1.jpg,http://localhost:8889/202002122147_image2.jpg,http://localhost:8889/202002122147_image3.jpg', 'http://localhost:8889/202002122147_detailedImage0.jpg,http://localhost:8889/202002122147_detailedImage1.jpg,http://localhost:8889/202002122147_detailedImage2.jpg,http://localhost:8889/202002122147_detailedImage3.jpg', '2020-02-12 21:48:00');
INSERT INTO `goods` VALUES ('67', '白色', '纯美恋人--白玫瑰33枝，粉色勿忘我0.5扎', '淡雅玫瑰', '202002122149', '1', '1', '658.00', '517.00', '1168', '16', '5', '5', 'http://localhost:8889/202002122149_image0.jpg,http://localhost:8889/202002122149_image1.jpg,http://localhost:8889/202002122149_image2.jpg,http://localhost:8889/202002122149_image3.jpg', 'http://localhost:8889/202002122149_detailedImage0.jpg,http://localhost:8889/202002122149_detailedImage1.jpg,http://localhost:8889/202002122149_detailedImage2.jpg', '2020-02-12 21:49:32');
INSERT INTO `goods` VALUES ('68', '白色', '梦的光点--雪山白玫瑰33支、尤加利叶8支、绿小菊10支', '精品鲜花', '202002122150', '1', '1', '692.00', '543.00', '549', '25', '0', '5', 'http://localhost:8889/202002122150_image0.jpg,http://localhost:8889/202002122150_image1.jpg,http://localhost:8889/202002122150_image2.jpg,http://localhost:8889/202002122150_image3.jpg', 'http://localhost:8889/202002122150_detailedImage0.jpg,http://localhost:8889/202002122150_detailedImage1.jpg,http://localhost:8889/202002122150_detailedImage2.jpg', '2020-02-12 21:51:22');
INSERT INTO `goods` VALUES ('69', '白色', '致青春/无声的爱--满天星一大扎', '满天星辰 只因有你', '202002122152', '1', '1', '458.00', '360.00', '5079', '50', '5', '10', 'http://localhost:8889/202002122152_image0.jpg,http://localhost:8889/202002122152_image1.jpg,http://localhost:8889/202002122152_image2.jpg,http://localhost:8889/202002122152_image3.jpg', 'http://localhost:8889/202002122152_detailedImage0.jpg,http://localhost:8889/202002122152_detailedImage1.jpg,http://localhost:8889/202002122152_detailedImage2.jpg,http://localhost:8889/202002122152_detailedImage3.jpg,http://localhost:8889/202002122152_detailedImage4.jpg,http://localhost:8889/202002122152_detailedImage5.jpg', '2020-02-12 21:52:59');
INSERT INTO `goods` VALUES ('70', '经典花盒', '我如此爱你-口红款520--Dior#520口红(专柜正品)＋进口永生玫瑰礼盒', '全新升级款带化妆镜', '202002122155', '1', '1', '788.00', '588.00', '1530', '13', '80', '5', 'http://localhost:8889/202002122155_image0.jpg,http://localhost:8889/202002122155_image1.jpg,http://localhost:8889/202002122155_image2.jpg,http://localhost:8889/202002122155_image3.jpg', 'http://localhost:8889/202002122155_detailedImage0.jpg,http://localhost:8889/202002122155_detailedImage1.jpg,http://localhost:8889/202002122155_detailedImage2.jpg,http://localhost:8889/202002122155_detailedImage3.jpg,http://localhost:8889/202002122155_detailedImage4.jpg,http://localhost:8889/202002122155_detailedImage5.jpg', '2020-03-08 00:49:32');
INSERT INTO `goods` VALUES ('71', '经典花盒', '花漾年华-迪奥香水款50ml--Miss Dior花漾淡香氛50ml', '新款上市！迪奥香水礼盒', '202002122156', '1', '1', '1099.00', '999.00', '80', '8', '80', '20', 'http://localhost:8889/202002122156_image0.jpg,http://localhost:8889/202002122156_image1.jpg,http://localhost:8889/202002122156_image2.jpg,http://localhost:8889/202002122156_image3.jpg', 'http://localhost:8889/202002122156_detailedImage0.jpg,http://localhost:8889/202002122156_detailedImage1.jpg,http://localhost:8889/202002122156_detailedImage2.jpg,http://localhost:8889/202002122156_detailedImage3.jpg,http://localhost:8889/202002122156_detailedImage4.jpg,http://localhost:8889/202002122156_detailedImage5.jpg', '2020-02-12 21:57:00');
INSERT INTO `goods` VALUES ('72', '经典花盒', '花漾年华-施华洛世奇项链--施华洛世奇项链', '新款上市！施华洛世奇项链', '202002122157', '1', '1', '1399.00', '1299.00', '42', '4', '50', '5', 'http://localhost:8889/202002122157_image0.jpg,http://localhost:8889/202002122157_image1.jpg,http://localhost:8889/202002122157_image2.jpg,http://localhost:8889/202002122157_image3.jpg', 'http://localhost:8889/202002122157_detailedImage0.jpg,http://localhost:8889/202002122157_detailedImage1.jpg,http://localhost:8889/202002122157_detailedImage2.jpg,http://localhost:8889/202002122157_detailedImage3.jpg,http://localhost:8889/202002122157_detailedImage4.jpg,http://localhost:8889/202002122157_detailedImage5.jpg', '2020-02-12 21:58:12');
INSERT INTO `goods` VALUES ('73', '经典花盒', '守护初心口红款礼盒/少女粉--迪奥口红两支：Dior#520、Dior#999口红(专柜正品)＋进口永生玫瑰礼盒', '独创设计，双口红心形礼盒', '202002122158', '1', '1', '1099.00', '999.00', '97', '9', '50', '10', 'http://localhost:8889/202002122158_image0.jpg,http://localhost:8889/202002122158_image1.jpg,http://localhost:8889/202002122158_image2.jpg,http://localhost:8889/202002122158_image3.jpg', 'http://localhost:8889/202002122158_detailedImage0.jpg,http://localhost:8889/202002122158_detailedImage1.jpg,http://localhost:8889/202002122158_detailedImage2.jpg,http://localhost:8889/202002122158_detailedImage3.jpg,http://localhost:8889/202002122158_detailedImage4.jpg,http://localhost:8889/202002122158_detailedImage5.jpg', '2020-02-12 21:59:04');
INSERT INTO `goods` VALUES ('74', '经典花盒', '小仙女/永生花首饰盒--日本进口粉紫色大地永生玫瑰，奥斯丁永生玫瑰，搭配绣球等花材', '独家设计 双口红心形礼盒', '202002122159', '1', '1', '468.00', '257.00', '684', '68', '60', '5', 'http://localhost:8889/202002122159_image0.jpg,http://localhost:8889/202002122159_image1.jpg,http://localhost:8889/202002122159_image2.jpg,http://localhost:8889/202002122159_image3.jpg', 'http://localhost:8889/202002122159_detailedImage0.jpg,http://localhost:8889/202002122159_detailedImage1.jpg,http://localhost:8889/202002122159_detailedImage2.jpg,http://localhost:8889/202002122159_detailedImage3.jpg,http://localhost:8889/202002122159_detailedImage4.jpg,http://localhost:8889/202002122159_detailedImage5.jpg', '2020-02-12 22:00:09');
INSERT INTO `goods` VALUES ('75', '经典花盒', '迷你兔·红--苔藓小兔1只、进口红色永生玫瑰1朵、樱花粉小玫瑰1朵', '香味四溢 享浪漫时光', '202002122201', '1', '1', '268.00', '188.00', '2128', '21', '10', '5', 'http://localhost:8889/202002122201_image0.jpg,http://localhost:8889/202002122201_image1.jpg,http://localhost:8889/202002122201_image2.jpg,http://localhost:8889/202002122201_image3.jpg', 'http://localhost:8889/202002122201_detailedImage0.jpg,http://localhost:8889/202002122201_detailedImage1.jpg,http://localhost:8889/202002122201_detailedImage2.jpg,http://localhost:8889/202002122201_detailedImage3.jpg,http://localhost:8889/202002122201_detailedImage4.jpg,http://localhost:8889/202002122201_detailedImage5.jpg', '2020-02-12 22:01:32');
INSERT INTO `goods` VALUES ('76', '经典花盒', '守护初心口红款礼盒/炽热红--迪奥口红两支：Dior#520、Dior#999口红(专柜正品)＋进口永生玫瑰礼盒', '独创设计，双口红心形礼盒', '202002122202', '1', '1', '1099.00', '999.00', '167', '16', '50', '15', 'http://localhost:8889/202002122202_image0.jpg,http://localhost:8889/202002122202_image1.jpg,http://localhost:8889/202002122202_image2.jpg,http://localhost:8889/202002122202_image3.jpg', 'http://localhost:8889/202002122202_detailedImage0.jpg,http://localhost:8889/202002122202_detailedImage1.jpg,http://localhost:8889/202002122202_detailedImage2.jpg,http://localhost:8889/202002122202_detailedImage3.jpg,http://localhost:8889/202002122202_detailedImage4.jpg,http://localhost:8889/202002122202_detailedImage5.jpg', '2020-02-12 22:02:37');
INSERT INTO `goods` VALUES ('77', '经典花盒', '花漾年华-迪奥香水款30ml--Miss Dior花漾淡香氛', '新上市！配首饰或迪奥香水', '202002122207', '1', '1', '899.00', '799.00', '94', '9', '20', '5', 'http://localhost:8889/202002122207_image0.jpg,http://localhost:8889/202002122207_image1.jpg,http://localhost:8889/202002122207_image2.jpg,http://localhost:8889/202002122207_image3.jpg', 'http://localhost:8889/202002122207_detailedImage0.jpg,http://localhost:8889/202002122207_detailedImage1.jpg,http://localhost:8889/202002122207_detailedImage2.jpg,http://localhost:8889/202002122207_detailedImage3.jpg,http://localhost:8889/202002122207_detailedImage4.jpg,http://localhost:8889/202002122207_detailedImage5.jpg', '2020-02-12 22:07:52');
INSERT INTO `goods` VALUES ('78', '经典花盒', '给你我的心-美宝莲星钻小灯管水红色--正品美宝莲口红＋进口永生玫瑰礼盒', '大热斩男水红色', '202002122208', '1', '1', '499.00', '368.00', '54', '5', '0', '5', 'http://localhost:8889/202002122208_image0.jpg,http://localhost:8889/202002122208_image1.jpg,http://localhost:8889/202002122208_image2.jpg,http://localhost:8889/202002122208_image3.jpg', 'http://localhost:8889/202002122208_detailedImage0.jpg,http://localhost:8889/202002122208_detailedImage1.jpg,http://localhost:8889/202002122208_detailedImage2.jpg,http://localhost:8889/202002122208_detailedImage3.jpg,http://localhost:8889/202002122208_detailedImage4.jpg,http://localhost:8889/202002122208_detailedImage5.jpg', '2020-02-12 22:08:39');
INSERT INTO `goods` VALUES ('79', '经典花盒', '只对你动心-M.A.C小辣椒口红--正品M.A.C子弹头口红＋进口永生玫瑰礼盒', 'Chili/小辣椒明星色', '202002122209', '1', '1', '599.00', '496.00', '9', '3', '0', '0', 'http://localhost:8889/202002122209_image0.jpg,http://localhost:8889/202002122209_image1.jpg,http://localhost:8889/202002122209_image2.jpg,http://localhost:8889/202002122209_image3.jpg', 'http://localhost:8889/202002122209_detailedImage0.jpg,http://localhost:8889/202002122209_detailedImage1.jpg,http://localhost:8889/202002122209_detailedImage2.jpg,http://localhost:8889/202002122209_detailedImage3.jpg,http://localhost:8889/202002122209_detailedImage4.jpg,http://localhost:8889/202002122209_detailedImage5.jpg', '2020-02-12 22:09:33');
INSERT INTO `goods` VALUES ('80', '经典花盒', '特别的想念-口红款520--正品Dior#520口红＋进口永生玫瑰礼盒', '5.20专属定制款', '202002122211', '1', '1', '788.00', '588.00', '110', '11', '5', '5', 'http://localhost:8889/202002122211_image0.jpg,http://localhost:8889/202002122211_image1.jpg,http://localhost:8889/202002122211_image2.jpg,http://localhost:8889/202002122211_image3.jpg', 'http://localhost:8889/202002122211_detailedImage0.jpg,http://localhost:8889/202002122211_detailedImage1.jpg,http://localhost:8889/202002122211_detailedImage2.jpg,http://localhost:8889/202002122211_detailedImage3.jpg,http://localhost:8889/202002122211_detailedImage4.jpg,http://localhost:8889/202002122211_detailedImage5.jpg', '2020-02-12 22:11:53');
INSERT INTO `goods` VALUES ('81', '经典花盒', '给你我的心-美宝莲星钻小灯管空姐色--正品美宝莲口红＋进口永生玫瑰礼盒', '口红#SRD04-空姐色', '202002122212', '1', '1', '499.00', '368.00', '62', '6', '5', '5', 'http://localhost:8889/202002122212_image0.jpg,http://localhost:8889/202002122212_image1.jpg,http://localhost:8889/202002122212_image2.jpg,http://localhost:8889/202002122212_image3.jpg', 'http://localhost:8889/202002122212_detailedImage0.jpg,http://localhost:8889/202002122212_detailedImage1.jpg,http://localhost:8889/202002122212_detailedImage2.jpg,http://localhost:8889/202002122212_detailedImage3.jpg,http://localhost:8889/202002122212_detailedImage4.jpg,http://localhost:8889/202002122212_detailedImage5.jpg', '2020-02-12 22:12:58');
INSERT INTO `goods` VALUES ('82', '经典花盒', '我如此爱你-口红款999--专柜正品Dior#999口红＋进口永生玫瑰礼盒', 'Dior、YSL口红可选', '202002122213', '1', '1', '788.00', '588.00', '6620', '66', '60', '12', 'http://localhost:8889/202002122213_image0.jpg,http://localhost:8889/202002122213_image1.jpg,http://localhost:8889/202002122213_image2.jpg,http://localhost:8889/202002122213_image3.jpg', 'http://localhost:8889/202002122213_detailedImage0.jpg,http://localhost:8889/202002122213_detailedImage1.jpg,http://localhost:8889/202002122213_detailedImage2.jpg,http://localhost:8889/202002122213_detailedImage3.jpg,http://localhost:8889/202002122213_detailedImage4.jpg,http://localhost:8889/202002122213_detailedImage5.jpg', '2020-02-12 22:13:50');
INSERT INTO `goods` VALUES ('83', '经典花盒', '我如此爱你-迪奥香水款30ml--Miss Dior花漾淡香氛30ml', '迪奥香水礼盒', '202002122214', '1', '1', '899.00', '799.00', '69', '6', '5', '5', 'http://localhost:8889/202002122214_image0.jpg,http://localhost:8889/202002122214_image1.jpg,http://localhost:8889/202002122214_image2.jpg,http://localhost:8889/202002122214_image3.jpg', 'http://localhost:8889/202002122214_detailedImage0.jpg,http://localhost:8889/202002122214_detailedImage1.jpg,http://localhost:8889/202002122214_detailedImage2.jpg,http://localhost:8889/202002122214_detailedImage3.jpg,http://localhost:8889/202002122214_detailedImage4.jpg,http://localhost:8889/202002122214_detailedImage5.jpg', '2020-02-12 22:14:44');
INSERT INTO `goods` VALUES ('84', '经典花盒', '我如此爱你-施华洛世奇项链--施华洛世奇项链', '新款上市！施华洛世奇项链', '202002122215', '1', '1', '1399.00', '1299.00', '6', '4', '5', '25', 'http://localhost:8889/202002122215_image0.jpg,http://localhost:8889/202002122215_image1.jpg,http://localhost:8889/202002122215_image2.jpg,http://localhost:8889/202002122215_image3.jpg', 'http://localhost:8889/202002122215_detailedImage0.jpg,http://localhost:8889/202002122215_detailedImage1.jpg,http://localhost:8889/202002122215_detailedImage2.jpg,http://localhost:8889/202002122215_detailedImage3.jpg,http://localhost:8889/202002122215_detailedImage4.jpg,http://localhost:8889/202002122215_detailedImage5.jpg', '2020-02-12 22:15:44');
INSERT INTO `goods` VALUES ('85', '经典花盒', '星辰--进口永生蓝玫瑰9枝，搭配香芋紫绣球', '升级版', '202002122216', '1', '1', '898.00', '689.00', '1518', '15', '5', '5', 'http://localhost:8889/202002122216_image0.jpg,http://localhost:8889/202002122216_image1.jpg,http://localhost:8889/202002122216_image2.jpg,http://localhost:8889/202002122216_image3.jpg', 'http://localhost:8889/202002122216_detailedImage0.jpg,http://localhost:8889/202002122216_detailedImage1.jpg,http://localhost:8889/202002122216_detailedImage2.jpg,http://localhost:8889/202002122216_detailedImage3.jpg,http://localhost:8889/202002122216_detailedImage4.jpg,http://localhost:8889/202002122216_detailedImage5.jpg', '2020-02-12 22:16:50');
INSERT INTO `goods` VALUES ('86', '经典花盒', '花开半夏--粉色进口永生玫瑰，搭配永生香芋紫绣球', '升级版', '202002122217', '1', '1', '898.00', '689.00', '1512', '15', '5', '5', 'http://localhost:8889/202002122217_image0.jpg,http://localhost:8889/202002122217_image1.jpg,http://localhost:8889/202002122217_image2.jpg,http://localhost:8889/202002122217_image3.jpg', 'http://localhost:8889/202002122217_detailedImage0.jpg,http://localhost:8889/202002122217_detailedImage1.jpg,http://localhost:8889/202002122217_detailedImage2.jpg,http://localhost:8889/202002122217_detailedImage3.jpg,http://localhost:8889/202002122217_detailedImage4.jpg,http://localhost:8889/202002122217_detailedImage5.jpg', '2020-02-12 22:17:31');
INSERT INTO `goods` VALUES ('87', '经典花盒', '怦然心动--永生花盒：厄瓜多尔进口红色永生玫瑰', '升级版', '202002122218', '1', '1', '899.00', '689.00', '1550', '15', '5', '5', 'http://localhost:8889/202002122218_image0.jpg,http://localhost:8889/202002122218_image1.jpg,http://localhost:8889/202002122218_image2.jpg,http://localhost:8889/202002122218_image3.jpg', 'http://localhost:8889/202002122218_detailedImage0.jpg,http://localhost:8889/202002122218_detailedImage1.jpg,http://localhost:8889/202002122218_detailedImage2.jpg,http://localhost:8889/202002122218_detailedImage3.jpg,http://localhost:8889/202002122218_detailedImage4.jpg,http://localhost:8889/202002122218_detailedImage5.jpg', '2020-02-12 22:18:20');
INSERT INTO `goods` VALUES ('88', '经典花盒', '爱的礼物--进口深紫色玫瑰1枝，进口豆沙粉色康乃馨3枝，进口香槟色奥斯丁玫瑰2枝', '清新花盒', '202002122219', '1', '1', '498.00', '398.00', '51', '5', '5', '5', 'http://localhost:8889/202002122219_image0.jpg,http://localhost:8889/202002122219_image1.jpg,http://localhost:8889/202002122219_image2.jpg,http://localhost:8889/202002122219_image3.jpg', 'http://localhost:8889/202002122219_detailedImage0.jpg,http://localhost:8889/202002122219_detailedImage1.jpg,http://localhost:8889/202002122219_detailedImage2.jpg,http://localhost:8889/202002122219_detailedImage3.jpg,http://localhost:8889/202002122219_detailedImage4.jpg', '2020-02-12 22:20:14');
INSERT INTO `goods` VALUES ('89', '经典花盒', '小清新--永生花盒：厄瓜多尔进口白玫瑰2朵，绿色奥斯丁2朵', '新品永生花盒', '202002122220', '1', '1', '458.00', '358.00', '69', '6', '5', '5', 'http://localhost:8889/202002122220_image0.jpg,http://localhost:8889/202002122220_image1.jpg,http://localhost:8889/202002122220_image2.jpg,http://localhost:8889/202002122220_image3.jpg', 'http://localhost:8889/202002122220_detailedImage0.jpg,http://localhost:8889/202002122220_detailedImage1.jpg,http://localhost:8889/202002122220_detailedImage2.jpg,http://localhost:8889/202002122220_detailedImage3.jpg', '2020-02-12 22:21:30');
INSERT INTO `goods` VALUES ('90', '经典花盒', '佳期如梦--永生花盒：进口永生玫瑰3枝,永生康乃馨3枝', '圆形钻石绒高档礼盒', '202002122222', '1', '1', '566.00', '436.00', '1589', '15', '5', '5', 'http://localhost:8889/202002122222_image0.jpg,http://localhost:8889/202002122222_image1.jpg,http://localhost:8889/202002122222_image2.jpg,http://localhost:8889/202002122222_image3.jpg', 'http://localhost:8889/202002122222_detailedImage0.jpg,http://localhost:8889/202002122222_detailedImage1.jpg,http://localhost:8889/202002122222_detailedImage2.jpg,http://localhost:8889/202002122222_detailedImage3.jpg', '2020-02-12 22:22:29');
INSERT INTO `goods` VALUES ('91', '经典花盒', '兔子小姐--永生花盒：厄瓜多尔进口白玫瑰1朵，黄边绿心奥斯丁玫瑰2朵', '特惠', '202002122223', '1', '1', '398.00', '298.00', '65', '6', '5', '5', 'http://localhost:8889/202002122223_image0.jpg,http://localhost:8889/202002122223_image1.jpg,http://localhost:8889/202002122223_image2.jpg,http://localhost:8889/202002122223_image3.jpg', 'http://localhost:8889/202002122223_detailedImage0.jpg,http://localhost:8889/202002122223_detailedImage1.jpg,http://localhost:8889/202002122223_detailedImage2.jpg,http://localhost:8889/202002122223_detailedImage3.jpg', '2020-02-12 22:23:21');
INSERT INTO `goods` VALUES ('92', '巨型玫瑰', '公主的音乐水晶球·红玫瑰--大型水晶音乐球永生花', '韵升专业定制音乐盒底座', '202002122224', '1', '1', '498.00', '368.00', '604', '20', '5', '5', 'http://localhost:8889/202002122224_image0.jpg,http://localhost:8889/202002122224_image1.jpg,http://localhost:8889/202002122224_image2.jpg,http://localhost:8889/202002122224_image3.jpg', 'http://localhost:8889/202002122224_detailedImage0.jpg,http://localhost:8889/202002122224_detailedImage1.jpg,http://localhost:8889/202002122224_detailedImage2.jpg,http://localhost:8889/202002122224_detailedImage3.jpg,http://localhost:8889/202002122224_detailedImage4.jpg,http://localhost:8889/202002122224_detailedImage5.jpg', '2020-02-12 22:25:50');
INSERT INTO `goods` VALUES ('93', '巨型玫瑰', '彩虹下的约定/花的嫁纱银项链--厄瓜多尔进口巨型彩色玫瑰+T400花的嫁纱S925银项链', '畅销款特惠', '202002122225', '1', '1', '427.00', '368.00', '4813', '48', '5', '5', 'http://localhost:8889/202002122225_image0.jpg,http://localhost:8889/202002122225_image1.jpg,http://localhost:8889/202002122225_image2.jpg,http://localhost:8889/202002122225_image3.jpg', 'http://localhost:8889/202002122225_detailedImage0.jpg,http://localhost:8889/202002122225_detailedImage1.jpg,http://localhost:8889/202002122225_detailedImage2.jpg,http://localhost:8889/202002122225_detailedImage3.jpg,http://localhost:8889/202002122225_detailedImage4.jpg,http://localhost:8889/202002122225_detailedImage5.jpg', '2020-02-12 22:25:33');
INSERT INTO `goods` VALUES ('94', '巨型玫瑰', '彩虹下的约定/玻璃鞋手链--厄瓜多尔进口巨型七彩玫瑰+施华洛世奇元素水晶手链', '七彩玫瑰+施华洛世奇元素', '202002122226', '1', '1', '437.00', '379.00', '150', '15', '5', '5', 'http://localhost:8889/202002122226_image0.jpg,http://localhost:8889/202002122226_image1.jpg,http://localhost:8889/202002122226_image2.jpg,http://localhost:8889/202002122226_image3.jpg', 'http://localhost:8889/202002122226_detailedImage0.jpg,http://localhost:8889/202002122226_detailedImage1.jpg,http://localhost:8889/202002122226_detailedImage2.jpg,http://localhost:8889/202002122226_detailedImage3.jpg,http://localhost:8889/202002122226_detailedImage4.jpg,http://localhost:8889/202002122226_detailedImage5.jpg', '2020-02-12 22:26:56');
INSERT INTO `goods` VALUES ('95', '巨型玫瑰', '公主的音乐水晶球·七彩--大型水晶音乐球永生花', '蓝色定制花盒', '202002122227', '1', '1', '669.00', '469.00', '1675', '16', '5', '5', 'http://localhost:8889/202002122227_image0.jpg,http://localhost:8889/202002122227_image1.jpg,http://localhost:8889/202002122227_image2.jpg,http://localhost:8889/202002122227_image3.jpg', 'http://localhost:8889/202002122227_detailedImage0.jpg,http://localhost:8889/202002122227_detailedImage1.jpg,http://localhost:8889/202002122227_detailedImage2.jpg,http://localhost:8889/202002122227_detailedImage3.jpg,http://localhost:8889/202002122227_detailedImage4.jpg,http://localhost:8889/202002122227_detailedImage5.jpg', '2020-02-12 22:27:48');
INSERT INTO `goods` VALUES ('96', '巨型玫瑰', '公主的音乐水晶球·粉玫瑰--大型水晶音乐球永生花', '蓝色定制花盒', '202002122228', '1', '1', '498.00', '298.00', '231', '23', '5', '5', 'http://localhost:8889/202002122228_image0.jpg,http://localhost:8889/202002122228_image1.jpg,http://localhost:8889/202002122228_image2.jpg,http://localhost:8889/202002122228_image3.jpg', 'http://localhost:8889/202002122228_detailedImage0.jpg,http://localhost:8889/202002122228_detailedImage1.jpg,http://localhost:8889/202002122228_detailedImage2.jpg,http://localhost:8889/202002122228_detailedImage3.jpg,http://localhost:8889/202002122228_detailedImage4.jpg,http://localhost:8889/202002122228_detailedImage5.jpg', '2020-02-12 22:28:36');
INSERT INTO `goods` VALUES ('97', '巨型玫瑰', '公主的音乐水晶球·蓝玫瑰--大型水晶音乐球永生花', '蓝色定制花盒', '202002122229', '1', '1', '498.00', '298.00', '79', '7', '5', '5', 'http://localhost:8889/202002122229_image0.jpg,http://localhost:8889/202002122229_image1.jpg,http://localhost:8889/202002122229_image2.jpg,http://localhost:8889/202002122229_image3.jpg', 'http://localhost:8889/202002122229_detailedImage0.jpg,http://localhost:8889/202002122229_detailedImage1.jpg,http://localhost:8889/202002122229_detailedImage2.jpg,http://localhost:8889/202002122229_detailedImage3.jpg,http://localhost:8889/202002122229_detailedImage4.jpg,http://localhost:8889/202002122229_detailedImage5.jpg', '2020-02-12 22:29:23');
INSERT INTO `goods` VALUES ('98', '永生瓶花', '美丽无限/三色玫瑰--泰国进口保鲜花 三色玫瑰精妙搭配 保质期5年以上', '感恩特惠', '202002122230', '1', '1', '388.00', '288.00', '976', '56', '100', '10', 'http://localhost:8889/202002122230_image0.jpg,http://localhost:8889/202002122230_image1.jpg,http://localhost:8889/202002122230_image2.jpg,http://localhost:8889/202002122230_image3.jpg', 'http://localhost:8889/202002122230_detailedImage0.jpg,http://localhost:8889/202002122230_detailedImage1.jpg,http://localhost:8889/202002122230_detailedImage2.jpg,http://localhost:8889/202002122230_detailedImage3.jpg,http://localhost:8889/202002122230_detailedImage4.jpg,http://localhost:8889/202002122230_detailedImage5.jpg', '2020-02-12 22:39:20');
INSERT INTO `goods` VALUES ('99', '永生瓶花', '【正常发货】斜口瓶花--真空保鲜花，彩玫系列，5年不凋谢', '泰国保鲜花', '202002122243', '1', '1', '688.00', '489.00', '4811', '48', '60', '5', 'http://localhost:8889/202002122243_image0.jpg,http://localhost:8889/202002122243_image1.jpg,http://localhost:8889/202002122243_image2.jpg,http://localhost:8889/202002122243_image3.jpg', 'http://localhost:8889/202002122243_detailedImage0.jpg,http://localhost:8889/202002122243_detailedImage1.jpg,http://localhost:8889/202002122243_detailedImage2.jpg,http://localhost:8889/202002122243_detailedImage3.jpg,http://localhost:8889/202002122243_detailedImage4.jpg,http://localhost:8889/202002122243_detailedImage5.jpg', '2020-02-12 22:45:08');
INSERT INTO `goods` VALUES ('100', '永生瓶花', '优雅--真空玫瑰，彩玫七枝，5年不凋谢', '精选绽放优美的玫瑰七枝(彩玫)', '202002122245', '1', '1', '879.00', '548.00', '1733', '17', '60', '5', 'http://localhost:8889/202002122245_image0.jpg,http://localhost:8889/202002122245_image1.jpg,http://localhost:8889/202002122245_image2.jpg,http://localhost:8889/202002122245_image3.jpg', 'http://localhost:8889/202002122245_detailedImage0.jpg,http://localhost:8889/202002122245_detailedImage1.jpg,http://localhost:8889/202002122245_detailedImage2.jpg,http://localhost:8889/202002122245_detailedImage3.jpg,http://localhost:8889/202002122245_detailedImage4.jpg,http://localhost:8889/202002122245_detailedImage5.jpg', '2020-02-12 22:47:02');
INSERT INTO `goods` VALUES ('101', '永生瓶花', '美丽人生--进口高档保鲜花,白玫瑰系列,生日礼物首选', '精选绽放优美的玫瑰五枝(白玫瑰)', '202002122247', '1', '1', '688.00', '469.00', '347', '34', '80', '12', 'http://localhost:8889/202002122247_image0.jpg,http://localhost:8889/202002122247_image1.jpg,http://localhost:8889/202002122247_image2.jpg,http://localhost:8889/202002122247_image3.jpg', 'http://localhost:8889/202002122247_detailedImage0.jpg,http://localhost:8889/202002122247_detailedImage1.jpg,http://localhost:8889/202002122247_detailedImage2.jpg,http://localhost:8889/202002122247_detailedImage3.jpg,http://localhost:8889/202002122247_detailedImage4.jpg,http://localhost:8889/202002122247_detailedImage5.jpg', '2020-02-12 22:48:48');
INSERT INTO `goods` VALUES ('102', '永生瓶花', '心心相恋--真空玫瑰，红玫瑰系列，5年不凋', '精选绽放优美的红玫瑰三枝', '202002122249', '1', '1', '598.00', '429.00', '1693', '162', '60', '12', 'http://localhost:8889/202002122249_image0.jpg,http://localhost:8889/202002122249_image1.jpg,http://localhost:8889/202002122249_image2.jpg,http://localhost:8889/202002122249_image3.jpg', 'http://localhost:8889/202002122249_detailedImage0.jpg,http://localhost:8889/202002122249_detailedImage1.jpg,http://localhost:8889/202002122249_detailedImage2.jpg,http://localhost:8889/202002122249_detailedImage3.jpg,http://localhost:8889/202002122249_detailedImage4.jpg,http://localhost:8889/202002122249_detailedImage5.jpg', '2020-02-12 22:51:14');
INSERT INTO `goods` VALUES ('103', '永生瓶花', '玫瑰花园/淡雅--进口保鲜花，彩玫系列，清新优雅,生日礼品,家居礼物', '泰国进口，特大号', '202002122252', '1', '1', '1200.00', '786.00', '2751', '270', '45', '12', 'http://localhost:8889/202002122252_image0.jpg,http://localhost:8889/202002122252_image1.jpg,http://localhost:8889/202002122252_image2.jpg,http://localhost:8889/202002122252_image3.jpg', 'http://localhost:8889/202002122252_detailedImage0.jpg,http://localhost:8889/202002122252_detailedImage1.jpg,http://localhost:8889/202002122252_detailedImage2.jpg,http://localhost:8889/202002122252_detailedImage3.jpg,http://localhost:8889/202002122252_detailedImage4.jpg,http://localhost:8889/202002122252_detailedImage5.jpg', '2020-02-12 22:53:08');
INSERT INTO `goods` VALUES ('104', '永生瓶花', '玫瑰花园/红--进口保鲜花，红玫瑰9枝，不凋谢真空玫瑰花', '精选绽放优美的红玫瑰9枝', '202002122253', '1', '1', '1200.00', '788.00', '341', '34', '50', '8', 'http://localhost:8889/202002122253_image0.jpg,http://localhost:8889/202002122253_image1.jpg,http://localhost:8889/202002122253_image2.jpg,http://localhost:8889/202002122253_image3.jpg', 'http://localhost:8889/202002122253_detailedImage0.jpg,http://localhost:8889/202002122253_detailedImage1.jpg,http://localhost:8889/202002122253_detailedImage2.jpg,http://localhost:8889/202002122253_detailedImage3.jpg,http://localhost:8889/202002122253_detailedImage4.jpg,http://localhost:8889/202002122253_detailedImage5.jpg', '2020-02-12 22:55:33');
INSERT INTO `goods` VALUES ('105', '永生瓶花', '约定--高身方口花瓶进口保鲜花，彩玫系列,不凋谢玫瑰', '精选绽放优美的玫瑰5枝', '202002122255', '1', '1', '699.00', '489.00', '341', '34', '20', '7', 'http://localhost:8889/202002122255_image0.jpg,http://localhost:8889/202002122255_image1.jpg,http://localhost:8889/202002122255_image2.jpg,http://localhost:8889/202002122255_image3.jpg', 'http://localhost:8889/202002122255_detailedImage0.jpg,http://localhost:8889/202002122255_detailedImage1.jpg,http://localhost:8889/202002122255_detailedImage2.jpg,http://localhost:8889/202002122255_detailedImage3.jpg,http://localhost:8889/202002122255_detailedImage4.jpg,http://localhost:8889/202002122255_detailedImage5.jpg', '2020-02-12 22:58:28');
INSERT INTO `goods` VALUES ('106', '金箔花', '999纯金箔玫瑰+陶瓷花瓶--千足金箔玫瑰 最佳送女友送爱人礼物 结婚纪念礼物', '不凋谢的玫瑰', '202002122259', '1', '1', '256.00', '138.00', '34000', '338', '100', '8', 'http://localhost:8889/202002122259_image0.jpg,http://localhost:8889/202002122259_image1.jpg,http://localhost:8889/202002122259_image2.jpg,http://localhost:8889/202002122259_image3.jpg', 'http://localhost:8889/202002122259_detailedImage0.jpg,http://localhost:8889/202002122259_detailedImage1.jpg,http://localhost:8889/202002122259_detailedImage2.jpg,http://localhost:8889/202002122259_detailedImage3.jpg,http://localhost:8889/202002122259_detailedImage4.jpg,http://localhost:8889/202002122259_detailedImage5.jpg', '2020-03-07 14:15:34');
INSERT INTO `goods` VALUES ('107', '金箔花', '999纯金箔康乃馨+水晶花瓶--送母亲最佳礼物，千足金箔康乃馨，水晶花瓶', '花型秀丽的康乃馨 ', '202002122303', '1', '1', '256.00', '148.00', '8717', '87', '90', '7', 'http://localhost:8889/202002122303_image0.jpg,http://localhost:8889/202002122303_image1.jpg,http://localhost:8889/202002122303_image2.jpg,http://localhost:8889/202002122303_image3.jpg', 'http://localhost:8889/202002122303_detailedImage0.jpg,http://localhost:8889/202002122303_detailedImage1.jpg,http://localhost:8889/202002122303_detailedImage2.jpg,http://localhost:8889/202002122303_detailedImage3.jpg,http://localhost:8889/202002122303_detailedImage4.jpg,http://localhost:8889/202002122303_detailedImage5.jpg', '2020-02-12 23:05:56');
INSERT INTO `goods` VALUES ('108', '金箔花', '桃李满门-古典橱窗摆件--桃李满门', '书房办公桌实用摆件', '202002122306', '1', '1', '1299.00', '998.00', '7', '5', '5', '5', 'http://localhost:8889/202002122306_image0.jpg,http://localhost:8889/202002122306_image1.jpg,http://localhost:8889/202002122306_image2.jpg,http://localhost:8889/202002122306_image3.jpg', 'http://localhost:8889/202002122306_detailedImage0.jpg,http://localhost:8889/202002122306_detailedImage1.jpg,http://localhost:8889/202002122306_detailedImage2.jpg,http://localhost:8889/202002122306_detailedImage3.jpg,http://localhost:8889/202002122306_detailedImage4.jpg,http://localhost:8889/202002122306_detailedImage5.jpg', '2020-02-12 23:07:46');
INSERT INTO `goods` VALUES ('109', '巧克力', '奢悦之美巧克力礼盒--夹心巧克力', '始于颜值 忠于口感', '202002122308', '1', '1', '358.00', '158.00', '4915', '16', '5', '5', 'http://localhost:8889/202002122308_image0.jpg,http://localhost:8889/202002122308_image1.jpg,http://localhost:8889/202002122308_image2.jpg,http://localhost:8889/202002122308_image3.jpg', 'http://localhost:8889/202002122308_detailedImage0.jpg,http://localhost:8889/202002122308_detailedImage1.jpg,http://localhost:8889/202002122308_detailedImage2.jpg,http://localhost:8889/202002122308_detailedImage3.jpg,http://localhost:8889/202002122308_detailedImage4.jpg,http://localhost:8889/202002122308_detailedImage5.jpg', '2020-02-12 23:09:58');
INSERT INTO `goods` VALUES ('110', '巧克力', '光板金樽礼遇多口味夹心巧克力礼盒装25颗--夹心巧克力25颗', '满足你的味蕾', '202002122310', '1', '1', '199.00', '99.00', '181', '18', '5', '5', 'http://localhost:8889/202002122310_image0.jpg,http://localhost:8889/202002122310_image1.jpg,http://localhost:8889/202002122310_image2.jpg,http://localhost:8889/202002122310_image3.jpg', 'http://localhost:8889/202002122310_detailedImage0.jpg,http://localhost:8889/202002122310_detailedImage1.jpg,http://localhost:8889/202002122310_detailedImage2.jpg,http://localhost:8889/202002122310_detailedImage3.jpg,http://localhost:8889/202002122310_detailedImage4.jpg,http://localhost:8889/202002122310_detailedImage5.jpg', '2020-02-12 23:11:31');
INSERT INTO `goods` VALUES ('111', '巧克力', '棒棒糖形手工纯脂巧克力礼盒--混合口味巧克力礼盒六一儿童节礼物', '满足你的童年乐趣', '202002122311', '1', '1', '199.00', '99.00', '462', '46', '5', '5', 'http://localhost:8889/202002122311_image0.jpg,http://localhost:8889/202002122311_image1.jpg,http://localhost:8889/202002122311_image2.jpg,http://localhost:8889/202002122311_image3.jpg', 'http://localhost:8889/202002122311_detailedImage0.jpg,http://localhost:8889/202002122311_detailedImage1.jpg,http://localhost:8889/202002122311_detailedImage2.jpg,http://localhost:8889/202002122311_detailedImage3.jpg,http://localhost:8889/202002122311_detailedImage4.jpg,http://localhost:8889/202002122311_detailedImage5.jpg', '2020-02-12 23:13:15');
INSERT INTO `goods` VALUES ('112', '公仔', 'Hello Kitty美式毛绒公仔（30cm）--Hello Kitty授权正版', '授权正版，俘获少女心', '202002122317', '1', '1', '299.00', '196.00', '1', '3', '5', '5', 'http://localhost:8889/202002122317_image0.jpg,http://localhost:8889/202002122317_image1.jpg,http://localhost:8889/202002122317_image2.jpg', 'http://localhost:8889/202002122317_detailedImage0.jpg,http://localhost:8889/202002122317_detailedImage1.jpg,http://localhost:8889/202002122317_detailedImage2.jpg,http://localhost:8889/202002122317_detailedImage3.jpg,http://localhost:8889/202002122317_detailedImage4.jpg,http://localhost:8889/202002122317_detailedImage5.jpg', '2020-02-12 23:19:13');
INSERT INTO `goods` VALUES ('113', '公仔', 'Hello Kitty爱的礼物毛绒公仔（40cm）--Hello Kitty授权正版', 'HELLO KITTY/凯蒂猫', '202002122319', '1', '1', '399.00', '369.00', '48', '10', '10', '8', 'http://localhost:8889/202002122319_image0.jpg,http://localhost:8889/202002122319_image1.jpg,http://localhost:8889/202002122319_image2.jpg', 'http://localhost:8889/202002122319_detailedImage0.jpg,http://localhost:8889/202002122319_detailedImage1.jpg,http://localhost:8889/202002122319_detailedImage2.jpg,http://localhost:8889/202002122319_detailedImage3.jpg,http://localhost:8889/202002122319_detailedImage4.jpg,http://localhost:8889/202002122319_detailedImage5.jpg', '2020-04-09 18:34:12');
INSERT INTO `goods` VALUES ('114', '公仔', 'Hello Kitty水手毛绒公仔（30cm）--Hello Kitty授权正版', 'HELLO KITTY/凯蒂猫', '202002122322', '1', '1', '329.00', '289.00', '7', '3', '5', '5', 'http://localhost:8889/202002122322_image0.jpg,http://localhost:8889/202002122322_image1.jpg,http://localhost:8889/202002122322_image2.jpg', 'http://localhost:8889/202002122322_detailedImage0.jpg,http://localhost:8889/202002122322_detailedImage1.jpg,http://localhost:8889/202002122322_detailedImage2.jpg,http://localhost:8889/202002122322_detailedImage3.jpg,http://localhost:8889/202002122322_detailedImage4.jpg,http://localhost:8889/202002122322_detailedImage5.jpg', '2020-02-12 23:23:32');
INSERT INTO `goods` VALUES ('115', '公仔', 'KT夏日风公仔(20cm)--授权正版Hello Kitty公仔', 'Saniro [日本]摩花绒填充娃娃', '202002122323', '1', '1', '229.00', '209.00', '24', '6', '5', '5', 'http://localhost:8889/202002122323_image0.jpg,http://localhost:8889/202002122323_image1.jpg,http://localhost:8889/202002122323_image2.jpg,http://localhost:8889/202002122323_image3.jpg', 'http://localhost:8889/202002122323_detailedImage0.jpg,http://localhost:8889/202002122323_detailedImage1.jpg,http://localhost:8889/202002122323_detailedImage2.jpg,http://localhost:8889/202002122323_detailedImage3.jpg,http://localhost:8889/202002122323_detailedImage4.jpg,http://localhost:8889/202002122323_detailedImage5.jpg', '2020-02-12 23:25:10');

-- ----------------------------
-- Table structure for goodscentre
-- ----------------------------
DROP TABLE IF EXISTS `goodscentre`;
CREATE TABLE `goodscentre` (
  `pcID` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL,
  `childrenID` int(11) NOT NULL,
  PRIMARY KEY (`pcID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goodscentre
-- ----------------------------
INSERT INTO `goodscentre` VALUES ('1', '1', '4');
INSERT INTO `goodscentre` VALUES ('2', '1', '5');
INSERT INTO `goodscentre` VALUES ('3', '1', '6');
INSERT INTO `goodscentre` VALUES ('4', '1', '7');
INSERT INTO `goodscentre` VALUES ('5', '2', '8');
INSERT INTO `goodscentre` VALUES ('6', '2', '9');
INSERT INTO `goodscentre` VALUES ('7', '2', '10');
INSERT INTO `goodscentre` VALUES ('8', '3', '11');
INSERT INTO `goodscentre` VALUES ('9', '3', '12');
INSERT INTO `goodscentre` VALUES ('10', '3', '13');

-- ----------------------------
-- Table structure for goodsclass
-- ----------------------------
DROP TABLE IF EXISTS `goodsclass`;
CREATE TABLE `goodsclass` (
  `goodsClassID` int(11) NOT NULL AUTO_INCREMENT,
  `goodsClassName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsClassLevel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsClassParent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsClassShow` tinyint(11) NOT NULL,
  `goodsClassSort` int(11) NOT NULL,
  `goodsClassUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodsClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goodsclass
-- ----------------------------
INSERT INTO `goodsclass` VALUES ('1', '鲜花', '一级', '无', '1', '3', '2020-02-13 22:23:16');
INSERT INTO `goodsclass` VALUES ('2', '永生花', '一级', '无', '1', '2', '2020-02-13 22:23:17');
INSERT INTO `goodsclass` VALUES ('3', '礼品', '一级', '无', '1', '1', '2020-02-13 22:23:17');
INSERT INTO `goodsclass` VALUES ('4', '红色', '二级', '鲜花', '1', '3', '2020-02-13 22:23:22');
INSERT INTO `goodsclass` VALUES ('5', '白色', '二级', '鲜花', '1', '2', '2020-02-13 22:23:22');
INSERT INTO `goodsclass` VALUES ('6', '黄色', '二级', '鲜花', '1', '1', '2020-02-13 22:23:22');
INSERT INTO `goodsclass` VALUES ('7', '紫色', '二级', '鲜花', '1', '0', '2020-02-13 22:23:23');
INSERT INTO `goodsclass` VALUES ('8', '经典花盒', '二级', '永生花', '1', '3', '2020-02-13 22:23:26');
INSERT INTO `goodsclass` VALUES ('9', '巨型玫瑰', '二级', '永生花', '1', '2', '2020-02-13 22:23:26');
INSERT INTO `goodsclass` VALUES ('10', '永生瓶花', '二级', '永生花', '1', '1', '2020-02-13 22:23:27');
INSERT INTO `goodsclass` VALUES ('11', '金箔花', '二级', '礼品', '1', '3', '2020-02-13 22:23:29');
INSERT INTO `goodsclass` VALUES ('12', '巧克力', '二级', '礼品', '1', '2', '2020-02-13 22:23:30');
INSERT INTO `goodsclass` VALUES ('13', '公仔', '二级', '礼品', '1', '1', '2020-02-13 22:23:31');

-- ----------------------------
-- Table structure for notifymessage
-- ----------------------------
DROP TABLE IF EXISTS `notifymessage`;
CREATE TABLE `notifymessage` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) NOT NULL,
  `messageContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `messageTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of notifymessage
-- ----------------------------
INSERT INTO `notifymessage` VALUES ('44', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '2020-04-28 16:03:34');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operationID` int(11) NOT NULL AUTO_INCREMENT,
  `operatorID` int(11) NOT NULL,
  `operationUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `operationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `operationType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `operationIP` varchar(255) DEFAULT NULL,
  `operationUpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`operationID`)
) ENGINE=InnoDB AUTO_INCREMENT=930 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('252', '20', 'com.pang.flower.Controller.UserInfoController.addUserInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2019-12-26 18:56:51');
INSERT INTO `operation` VALUES ('253', '20', 'com.pang.flower.Controller.UserInfoController.deleteUserInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-26 19:02:23');
INSERT INTO `operation` VALUES ('254', '20', 'com.pang.flower.Controller.UserInfoController.deleteUserInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-26 19:02:25');
INSERT INTO `operation` VALUES ('255', '20', 'com.pang.flower.Controller.UserInfoController.updateUserInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2019-12-26 19:02:34');
INSERT INTO `operation` VALUES ('256', '20', 'com.pang.flower.Controller.UserInfoController.updateUserInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2019-12-26 21:46:21');
INSERT INTO `operation` VALUES ('257', '20', 'com.pang.flower.Controller.StuffInfoController.addStuffInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2019-12-27 18:16:59');
INSERT INTO `operation` VALUES ('258', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 15:39:37');
INSERT INTO `operation` VALUES ('259', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 15:39:43');
INSERT INTO `operation` VALUES ('260', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 15:39:48');
INSERT INTO `operation` VALUES ('261', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 15:40:40');
INSERT INTO `operation` VALUES ('262', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 15:41:09');
INSERT INTO `operation` VALUES ('263', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 16:01:06');
INSERT INTO `operation` VALUES ('264', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 16:58:25');
INSERT INTO `operation` VALUES ('265', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 16:58:32');
INSERT INTO `operation` VALUES ('266', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:26:52');
INSERT INTO `operation` VALUES ('267', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:26:54');
INSERT INTO `operation` VALUES ('268', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:26:55');
INSERT INTO `operation` VALUES ('269', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:26:57');
INSERT INTO `operation` VALUES ('270', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:26:58');
INSERT INTO `operation` VALUES ('271', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:00');
INSERT INTO `operation` VALUES ('272', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:01');
INSERT INTO `operation` VALUES ('273', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:03');
INSERT INTO `operation` VALUES ('274', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:04');
INSERT INTO `operation` VALUES ('275', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:06');
INSERT INTO `operation` VALUES ('276', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:07');
INSERT INTO `operation` VALUES ('277', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:08');
INSERT INTO `operation` VALUES ('278', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:10');
INSERT INTO `operation` VALUES ('279', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:12');
INSERT INTO `operation` VALUES ('280', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:13');
INSERT INTO `operation` VALUES ('281', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:27:15');
INSERT INTO `operation` VALUES ('282', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:34:55');
INSERT INTO `operation` VALUES ('283', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-28 20:34:57');
INSERT INTO `operation` VALUES ('284', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 13:46:02');
INSERT INTO `operation` VALUES ('285', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 13:46:10');
INSERT INTO `operation` VALUES ('286', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:28:52');
INSERT INTO `operation` VALUES ('287', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:29:35');
INSERT INTO `operation` VALUES ('288', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:26');
INSERT INTO `operation` VALUES ('289', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:27');
INSERT INTO `operation` VALUES ('290', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:29');
INSERT INTO `operation` VALUES ('291', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:31');
INSERT INTO `operation` VALUES ('292', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:32');
INSERT INTO `operation` VALUES ('293', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:34');
INSERT INTO `operation` VALUES ('294', '20', 'com.pang.flower.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 14:31:35');
INSERT INTO `operation` VALUES ('295', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:05:59');
INSERT INTO `operation` VALUES ('296', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:06:10');
INSERT INTO `operation` VALUES ('297', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:06:21');
INSERT INTO `operation` VALUES ('298', '20', 'com.pang.flower.Controller.NotifyController.deleteStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:06:57');
INSERT INTO `operation` VALUES ('299', '20', 'com.pang.flower.Controller.NotifyController.deleteAllStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:07:02');
INSERT INTO `operation` VALUES ('300', '20', 'com.pang.flower.Controller.NotifyController.deleteAllStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:07:27');
INSERT INTO `operation` VALUES ('301', '20', 'com.pang.flower.Controller.NotifyController.deleteAllMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:25:58');
INSERT INTO `operation` VALUES ('302', '20', 'com.pang.flower.Controller.NotifyController.deleteAllStuffMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2019-12-29 15:42:33');
INSERT INTO `operation` VALUES ('303', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2019-12-29 15:42:55');
INSERT INTO `operation` VALUES ('304', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2019-12-29 15:48:12');
INSERT INTO `operation` VALUES ('305', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2019-12-29 17:00:20');
INSERT INTO `operation` VALUES ('306', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2019-12-29 17:00:30');
INSERT INTO `operation` VALUES ('307', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-03 20:47:57');
INSERT INTO `operation` VALUES ('308', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-03 20:48:16');
INSERT INTO `operation` VALUES ('309', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-03 22:16:33');
INSERT INTO `operation` VALUES ('310', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-03 22:16:55');
INSERT INTO `operation` VALUES ('311', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-03 22:23:05');
INSERT INTO `operation` VALUES ('312', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:23:58');
INSERT INTO `operation` VALUES ('313', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:29:53');
INSERT INTO `operation` VALUES ('314', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:02');
INSERT INTO `operation` VALUES ('315', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:05');
INSERT INTO `operation` VALUES ('316', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:33');
INSERT INTO `operation` VALUES ('317', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:37');
INSERT INTO `operation` VALUES ('318', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:40');
INSERT INTO `operation` VALUES ('319', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-03 22:30:43');
INSERT INTO `operation` VALUES ('320', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-03 22:33:33');
INSERT INTO `operation` VALUES ('321', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-03 22:33:37');
INSERT INTO `operation` VALUES ('322', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 00:07:53');
INSERT INTO `operation` VALUES ('323', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 00:08:27');
INSERT INTO `operation` VALUES ('324', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 00:09:31');
INSERT INTO `operation` VALUES ('325', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 00:09:35');
INSERT INTO `operation` VALUES ('326', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 00:11:46');
INSERT INTO `operation` VALUES ('327', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 00:12:52');
INSERT INTO `operation` VALUES ('328', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 00:13:09');
INSERT INTO `operation` VALUES ('329', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 00:24:48');
INSERT INTO `operation` VALUES ('330', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 00:24:54');
INSERT INTO `operation` VALUES ('331', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:22:17');
INSERT INTO `operation` VALUES ('332', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:33:18');
INSERT INTO `operation` VALUES ('333', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:33:45');
INSERT INTO `operation` VALUES ('334', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 16:51:21');
INSERT INTO `operation` VALUES ('335', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:54:15');
INSERT INTO `operation` VALUES ('336', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:54:41');
INSERT INTO `operation` VALUES ('337', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:54:48');
INSERT INTO `operation` VALUES ('338', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:54:58');
INSERT INTO `operation` VALUES ('339', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:59:32');
INSERT INTO `operation` VALUES ('340', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:59:50');
INSERT INTO `operation` VALUES ('341', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 16:59:59');
INSERT INTO `operation` VALUES ('342', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:00:05');
INSERT INTO `operation` VALUES ('343', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:01:34');
INSERT INTO `operation` VALUES ('344', '20', 'com.pang.flower.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 17:01:40');
INSERT INTO `operation` VALUES ('345', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:01:50');
INSERT INTO `operation` VALUES ('346', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:02:00');
INSERT INTO `operation` VALUES ('347', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:02:13');
INSERT INTO `operation` VALUES ('348', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:02:34');
INSERT INTO `operation` VALUES ('349', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 17:02:44');
INSERT INTO `operation` VALUES ('350', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:04:08');
INSERT INTO `operation` VALUES ('351', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:04:26');
INSERT INTO `operation` VALUES ('352', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:06:11');
INSERT INTO `operation` VALUES ('353', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:09:42');
INSERT INTO `operation` VALUES ('354', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:09:44');
INSERT INTO `operation` VALUES ('355', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:09:45');
INSERT INTO `operation` VALUES ('356', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:09:46');
INSERT INTO `operation` VALUES ('357', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:10:31');
INSERT INTO `operation` VALUES ('358', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:10:32');
INSERT INTO `operation` VALUES ('359', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:10:32');
INSERT INTO `operation` VALUES ('360', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:10:33');
INSERT INTO `operation` VALUES ('361', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:12:46');
INSERT INTO `operation` VALUES ('362', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:12:47');
INSERT INTO `operation` VALUES ('363', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:12:47');
INSERT INTO `operation` VALUES ('364', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:12:48');
INSERT INTO `operation` VALUES ('365', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:13:28');
INSERT INTO `operation` VALUES ('366', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:13:28');
INSERT INTO `operation` VALUES ('367', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:13:29');
INSERT INTO `operation` VALUES ('368', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:13:30');
INSERT INTO `operation` VALUES ('369', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:14:08');
INSERT INTO `operation` VALUES ('370', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:14:40');
INSERT INTO `operation` VALUES ('371', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:14:40');
INSERT INTO `operation` VALUES ('372', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:14:41');
INSERT INTO `operation` VALUES ('373', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:14:41');
INSERT INTO `operation` VALUES ('374', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:15:36');
INSERT INTO `operation` VALUES ('375', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:15:44');
INSERT INTO `operation` VALUES ('376', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:19');
INSERT INTO `operation` VALUES ('377', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:24');
INSERT INTO `operation` VALUES ('378', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:35');
INSERT INTO `operation` VALUES ('379', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:36');
INSERT INTO `operation` VALUES ('380', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:38');
INSERT INTO `operation` VALUES ('381', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:39');
INSERT INTO `operation` VALUES ('382', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:16:47');
INSERT INTO `operation` VALUES ('383', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:17:03');
INSERT INTO `operation` VALUES ('384', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:17:10');
INSERT INTO `operation` VALUES ('385', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:19:32');
INSERT INTO `operation` VALUES ('386', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:27:12');
INSERT INTO `operation` VALUES ('387', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:28:02');
INSERT INTO `operation` VALUES ('388', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 18:28:27');
INSERT INTO `operation` VALUES ('389', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:29:45');
INSERT INTO `operation` VALUES ('390', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:29:56');
INSERT INTO `operation` VALUES ('391', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:29:57');
INSERT INTO `operation` VALUES ('392', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:29:58');
INSERT INTO `operation` VALUES ('393', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:29:59');
INSERT INTO `operation` VALUES ('394', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:30:01');
INSERT INTO `operation` VALUES ('395', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:30:02');
INSERT INTO `operation` VALUES ('396', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:30:08');
INSERT INTO `operation` VALUES ('397', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:30:13');
INSERT INTO `operation` VALUES ('398', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:30:19');
INSERT INTO `operation` VALUES ('399', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:31:24');
INSERT INTO `operation` VALUES ('400', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:31:26');
INSERT INTO `operation` VALUES ('401', '20', 'com.pang.flower.Controller.GoodsClassController.deleteGoodsClass', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-04 18:31:27');
INSERT INTO `operation` VALUES ('402', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:31:33');
INSERT INTO `operation` VALUES ('403', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:35:01');
INSERT INTO `operation` VALUES ('404', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 18:35:12');
INSERT INTO `operation` VALUES ('405', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:09:16');
INSERT INTO `operation` VALUES ('406', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:10:28');
INSERT INTO `operation` VALUES ('407', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:10:45');
INSERT INTO `operation` VALUES ('408', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:16:47');
INSERT INTO `operation` VALUES ('409', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:16:57');
INSERT INTO `operation` VALUES ('410', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:17:05');
INSERT INTO `operation` VALUES ('411', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:41:51');
INSERT INTO `operation` VALUES ('412', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:42:02');
INSERT INTO `operation` VALUES ('413', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '127.0.0.1', '2020-01-04 20:52:48');
INSERT INTO `operation` VALUES ('414', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '127.0.0.1', '2020-01-04 20:57:02');
INSERT INTO `operation` VALUES ('415', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '127.0.0.1', '2020-01-04 20:57:06');
INSERT INTO `operation` VALUES ('416', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '127.0.0.1', '2020-01-04 20:57:08');
INSERT INTO `operation` VALUES ('417', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '127.0.0.1', '2020-01-04 20:57:09');
INSERT INTO `operation` VALUES ('418', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '127.0.0.1', '2020-01-04 20:57:11');
INSERT INTO `operation` VALUES ('419', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 20:58:27');
INSERT INTO `operation` VALUES ('420', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:14:02');
INSERT INTO `operation` VALUES ('421', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:14:09');
INSERT INTO `operation` VALUES ('422', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:14:18');
INSERT INTO `operation` VALUES ('423', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:16:03');
INSERT INTO `operation` VALUES ('424', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:16:03');
INSERT INTO `operation` VALUES ('425', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:20:04');
INSERT INTO `operation` VALUES ('426', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:20:11');
INSERT INTO `operation` VALUES ('427', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:24:20');
INSERT INTO `operation` VALUES ('428', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:26:06');
INSERT INTO `operation` VALUES ('429', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:27:13');
INSERT INTO `operation` VALUES ('430', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:27:15');
INSERT INTO `operation` VALUES ('431', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:27:28');
INSERT INTO `operation` VALUES ('432', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:35:04');
INSERT INTO `operation` VALUES ('433', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:35:38');
INSERT INTO `operation` VALUES ('434', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:40:44');
INSERT INTO `operation` VALUES ('435', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:43:10');
INSERT INTO `operation` VALUES ('436', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:43:10');
INSERT INTO `operation` VALUES ('437', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:43:11');
INSERT INTO `operation` VALUES ('438', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 21:43:18');
INSERT INTO `operation` VALUES ('439', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 21:45:40');
INSERT INTO `operation` VALUES ('440', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 21:45:51');
INSERT INTO `operation` VALUES ('441', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 21:46:02');
INSERT INTO `operation` VALUES ('442', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:02:43');
INSERT INTO `operation` VALUES ('443', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:02:49');
INSERT INTO `operation` VALUES ('444', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:02:55');
INSERT INTO `operation` VALUES ('445', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:04');
INSERT INTO `operation` VALUES ('446', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:13');
INSERT INTO `operation` VALUES ('447', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:23');
INSERT INTO `operation` VALUES ('448', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:33');
INSERT INTO `operation` VALUES ('449', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:40');
INSERT INTO `operation` VALUES ('450', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:47');
INSERT INTO `operation` VALUES ('451', '20', 'com.pang.flower.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-04 22:03:54');
INSERT INTO `operation` VALUES ('452', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 22:05:09');
INSERT INTO `operation` VALUES ('453', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 22:05:29');
INSERT INTO `operation` VALUES ('454', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 22:05:35');
INSERT INTO `operation` VALUES ('455', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 22:07:49');
INSERT INTO `operation` VALUES ('456', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-04 22:07:51');
INSERT INTO `operation` VALUES ('457', '20', 'com.pang.flower.Controller.GoodsClassController.changeGoodsClassShow', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-05 14:46:05');
INSERT INTO `operation` VALUES ('458', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-05 20:57:51');
INSERT INTO `operation` VALUES ('459', '20', 'com.pang.flower.Controller.PublicController.changePassword', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-05 22:12:22');
INSERT INTO `operation` VALUES ('460', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 21:07:37');
INSERT INTO `operation` VALUES ('461', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 21:17:26');
INSERT INTO `operation` VALUES ('462', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 22:09:22');
INSERT INTO `operation` VALUES ('463', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 23:37:49');
INSERT INTO `operation` VALUES ('464', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 23:54:02');
INSERT INTO `operation` VALUES ('465', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-06 23:54:48');
INSERT INTO `operation` VALUES ('466', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 10:18:40');
INSERT INTO `operation` VALUES ('467', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:01:43');
INSERT INTO `operation` VALUES ('468', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:12:17');
INSERT INTO `operation` VALUES ('469', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:20:06');
INSERT INTO `operation` VALUES ('470', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:20:44');
INSERT INTO `operation` VALUES ('471', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:21:22');
INSERT INTO `operation` VALUES ('472', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 15:42:03');
INSERT INTO `operation` VALUES ('473', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 16:03:23');
INSERT INTO `operation` VALUES ('474', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 16:07:07');
INSERT INTO `operation` VALUES ('475', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 16:12:12');
INSERT INTO `operation` VALUES ('476', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 16:25:29');
INSERT INTO `operation` VALUES ('477', '20', 'com.pang.flower.Controller.StuffInfoController.updateStuffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-07 16:27:41');
INSERT INTO `operation` VALUES ('478', '20', 'com.pang.flower.Controller.StuffInfoController.updateStuffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-07 16:27:49');
INSERT INTO `operation` VALUES ('479', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 19:50:22');
INSERT INTO `operation` VALUES ('480', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-07 21:37:23');
INSERT INTO `operation` VALUES ('481', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-08 10:29:01');
INSERT INTO `operation` VALUES ('482', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 00:41:04');
INSERT INTO `operation` VALUES ('483', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 00:45:59');
INSERT INTO `operation` VALUES ('484', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 00:55:59');
INSERT INTO `operation` VALUES ('485', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 00:56:09');
INSERT INTO `operation` VALUES ('486', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:46:30');
INSERT INTO `operation` VALUES ('487', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:51:26');
INSERT INTO `operation` VALUES ('488', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:51:37');
INSERT INTO `operation` VALUES ('489', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:51:45');
INSERT INTO `operation` VALUES ('490', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:58:45');
INSERT INTO `operation` VALUES ('491', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-09 22:59:07');
INSERT INTO `operation` VALUES ('492', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-10 20:12:44');
INSERT INTO `operation` VALUES ('493', '20', 'com.pang.flower.Controller.StuffInfoController.addStuffInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:13:28');
INSERT INTO `operation` VALUES ('494', '20', 'com.pang.flower.Controller.StuffInfoController.deleteStuffInfo', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-10 20:13:52');
INSERT INTO `operation` VALUES ('495', '20', 'com.pang.flower.Controller.StuffInfoController.addStuffInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:14:01');
INSERT INTO `operation` VALUES ('496', '20', 'com.pang.flower.Controller.StuffController.addStuff', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:15:41');
INSERT INTO `operation` VALUES ('497', '20', 'com.pang.flower.Controller.StuffInfoController.addStuffInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:16:40');
INSERT INTO `operation` VALUES ('498', '20', 'com.pang.flower.Controller.StuffController.addStuff', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:17:25');
INSERT INTO `operation` VALUES ('499', '20', 'com.pang.flower.Controller.StuffInfoController.addStuffInfo', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 20:17:39');
INSERT INTO `operation` VALUES ('500', '20', 'com.pang.flower.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-01-10 22:19:08');
INSERT INTO `operation` VALUES ('501', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:06:46');
INSERT INTO `operation` VALUES ('502', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:30:54');
INSERT INTO `operation` VALUES ('503', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:31:26');
INSERT INTO `operation` VALUES ('504', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:33:00');
INSERT INTO `operation` VALUES ('505', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:41:06');
INSERT INTO `operation` VALUES ('506', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:45:18');
INSERT INTO `operation` VALUES ('507', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:13');
INSERT INTO `operation` VALUES ('508', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:26');
INSERT INTO `operation` VALUES ('509', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:38');
INSERT INTO `operation` VALUES ('510', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:40');
INSERT INTO `operation` VALUES ('511', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:40');
INSERT INTO `operation` VALUES ('512', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:41');
INSERT INTO `operation` VALUES ('513', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:41');
INSERT INTO `operation` VALUES ('514', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:41');
INSERT INTO `operation` VALUES ('515', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:41');
INSERT INTO `operation` VALUES ('516', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:41');
INSERT INTO `operation` VALUES ('517', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:42');
INSERT INTO `operation` VALUES ('518', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:42');
INSERT INTO `operation` VALUES ('519', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:42');
INSERT INTO `operation` VALUES ('520', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:48');
INSERT INTO `operation` VALUES ('521', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:46:51');
INSERT INTO `operation` VALUES ('522', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:49:12');
INSERT INTO `operation` VALUES ('523', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:49:20');
INSERT INTO `operation` VALUES ('524', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:49:59');
INSERT INTO `operation` VALUES ('525', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-10 23:51:11');
INSERT INTO `operation` VALUES ('526', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:00:05');
INSERT INTO `operation` VALUES ('527', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:00:14');
INSERT INTO `operation` VALUES ('528', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:00:19');
INSERT INTO `operation` VALUES ('529', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:01:26');
INSERT INTO `operation` VALUES ('530', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:01:40');
INSERT INTO `operation` VALUES ('531', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:03:59');
INSERT INTO `operation` VALUES ('532', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:04:08');
INSERT INTO `operation` VALUES ('533', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:04:11');
INSERT INTO `operation` VALUES ('534', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:04:20');
INSERT INTO `operation` VALUES ('535', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:04:24');
INSERT INTO `operation` VALUES ('536', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:04:25');
INSERT INTO `operation` VALUES ('537', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:32');
INSERT INTO `operation` VALUES ('538', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:35');
INSERT INTO `operation` VALUES ('539', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:35');
INSERT INTO `operation` VALUES ('540', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:36');
INSERT INTO `operation` VALUES ('541', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:37');
INSERT INTO `operation` VALUES ('542', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:39');
INSERT INTO `operation` VALUES ('543', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:39');
INSERT INTO `operation` VALUES ('544', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:40');
INSERT INTO `operation` VALUES ('545', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:40');
INSERT INTO `operation` VALUES ('546', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:41');
INSERT INTO `operation` VALUES ('547', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:43');
INSERT INTO `operation` VALUES ('548', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:05:44');
INSERT INTO `operation` VALUES ('549', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:06:17');
INSERT INTO `operation` VALUES ('550', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:06:18');
INSERT INTO `operation` VALUES ('551', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:06:19');
INSERT INTO `operation` VALUES ('552', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:06:20');
INSERT INTO `operation` VALUES ('553', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:06:22');
INSERT INTO `operation` VALUES ('554', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:05');
INSERT INTO `operation` VALUES ('555', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:06');
INSERT INTO `operation` VALUES ('556', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:06');
INSERT INTO `operation` VALUES ('557', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:06');
INSERT INTO `operation` VALUES ('558', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:07');
INSERT INTO `operation` VALUES ('559', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:07');
INSERT INTO `operation` VALUES ('560', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:08');
INSERT INTO `operation` VALUES ('561', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:08');
INSERT INTO `operation` VALUES ('562', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:10:11');
INSERT INTO `operation` VALUES ('563', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:11:56');
INSERT INTO `operation` VALUES ('564', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:12:28');
INSERT INTO `operation` VALUES ('565', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:12:31');
INSERT INTO `operation` VALUES ('566', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:14:32');
INSERT INTO `operation` VALUES ('567', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:15:38');
INSERT INTO `operation` VALUES ('568', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:15:40');
INSERT INTO `operation` VALUES ('569', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:16:34');
INSERT INTO `operation` VALUES ('570', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:16:40');
INSERT INTO `operation` VALUES ('571', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:16:42');
INSERT INTO `operation` VALUES ('572', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:23');
INSERT INTO `operation` VALUES ('573', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsShelves', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:50');
INSERT INTO `operation` VALUES ('574', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:51');
INSERT INTO `operation` VALUES ('575', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsShelves', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:51');
INSERT INTO `operation` VALUES ('576', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:52');
INSERT INTO `operation` VALUES ('577', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:52');
INSERT INTO `operation` VALUES ('578', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsShelves', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:53');
INSERT INTO `operation` VALUES ('579', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:53');
INSERT INTO `operation` VALUES ('580', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsShelves', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:54');
INSERT INTO `operation` VALUES ('581', '20', 'com.pang.flower.Controller.GoodsController.changeGoodsHot', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 00:17:54');
INSERT INTO `operation` VALUES ('582', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 13:21:03');
INSERT INTO `operation` VALUES ('583', '20', 'com.pang.flower.Controller.GoodsController.deleteImage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-11 15:53:35');
INSERT INTO `operation` VALUES ('584', '20', 'com.pang.flower.Controller.GoodsController.deleteImage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-01-11 16:30:14');
INSERT INTO `operation` VALUES ('585', '20', 'com.pang.flower.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-11 16:30:14');
INSERT INTO `operation` VALUES ('586', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 17:27:35');
INSERT INTO `operation` VALUES ('587', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 17:28:44');
INSERT INTO `operation` VALUES ('588', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 17:28:57');
INSERT INTO `operation` VALUES ('589', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 17:29:01');
INSERT INTO `operation` VALUES ('590', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-01-19 17:29:04');
INSERT INTO `operation` VALUES ('591', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-01-19 17:30:43');
INSERT INTO `operation` VALUES ('592', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-01-19 17:31:15');
INSERT INTO `operation` VALUES ('593', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 17:31:28');
INSERT INTO `operation` VALUES ('594', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:29:09');
INSERT INTO `operation` VALUES ('595', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:29:11');
INSERT INTO `operation` VALUES ('596', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:29:12');
INSERT INTO `operation` VALUES ('597', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:30:39');
INSERT INTO `operation` VALUES ('598', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:30:42');
INSERT INTO `operation` VALUES ('599', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:30:45');
INSERT INTO `operation` VALUES ('600', '20', 'com.pang.back.Controller.UserInfoController.updateUserInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:30:52');
INSERT INTO `operation` VALUES ('601', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:31:15');
INSERT INTO `operation` VALUES ('602', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:32:07');
INSERT INTO `operation` VALUES ('603', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:32:13');
INSERT INTO `operation` VALUES ('604', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:35:20');
INSERT INTO `operation` VALUES ('605', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:35:24');
INSERT INTO `operation` VALUES ('606', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:35:35');
INSERT INTO `operation` VALUES ('607', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:41:09');
INSERT INTO `operation` VALUES ('608', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:41:15');
INSERT INTO `operation` VALUES ('609', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:41:21');
INSERT INTO `operation` VALUES ('610', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 21:48:03');
INSERT INTO `operation` VALUES ('611', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 22:06:33');
INSERT INTO `operation` VALUES ('612', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 22:17:36');
INSERT INTO `operation` VALUES ('613', '20', 'com.pang.back.Controller.StaffInfoController.updateStaffInfo', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-01-19 22:25:22');
INSERT INTO `operation` VALUES ('614', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-01-27 13:16:42');
INSERT INTO `operation` VALUES ('615', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 14:06:15');
INSERT INTO `operation` VALUES ('616', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 14:06:26');
INSERT INTO `operation` VALUES ('617', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 14:06:30');
INSERT INTO `operation` VALUES ('618', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:06:39');
INSERT INTO `operation` VALUES ('619', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:14:54');
INSERT INTO `operation` VALUES ('620', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:41:09');
INSERT INTO `operation` VALUES ('621', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:44:45');
INSERT INTO `operation` VALUES ('622', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:48:50');
INSERT INTO `operation` VALUES ('623', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:48:50');
INSERT INTO `operation` VALUES ('624', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:58:40');
INSERT INTO `operation` VALUES ('625', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 14:58:41');
INSERT INTO `operation` VALUES ('626', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:03:26');
INSERT INTO `operation` VALUES ('627', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:03:26');
INSERT INTO `operation` VALUES ('628', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:06:41');
INSERT INTO `operation` VALUES ('629', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:06:42');
INSERT INTO `operation` VALUES ('630', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:11:13');
INSERT INTO `operation` VALUES ('631', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:11:14');
INSERT INTO `operation` VALUES ('632', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:23:21');
INSERT INTO `operation` VALUES ('633', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:23:25');
INSERT INTO `operation` VALUES ('634', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:23:42');
INSERT INTO `operation` VALUES ('635', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:23:50');
INSERT INTO `operation` VALUES ('636', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:23:53');
INSERT INTO `operation` VALUES ('637', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:24:02');
INSERT INTO `operation` VALUES ('638', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:24:05');
INSERT INTO `operation` VALUES ('639', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:26:16');
INSERT INTO `operation` VALUES ('640', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:26:22');
INSERT INTO `operation` VALUES ('641', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:26:25');
INSERT INTO `operation` VALUES ('642', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:26:55');
INSERT INTO `operation` VALUES ('643', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:01');
INSERT INTO `operation` VALUES ('644', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:03');
INSERT INTO `operation` VALUES ('645', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:08');
INSERT INTO `operation` VALUES ('646', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:12');
INSERT INTO `operation` VALUES ('647', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:16');
INSERT INTO `operation` VALUES ('648', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:20');
INSERT INTO `operation` VALUES ('649', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:27:23');
INSERT INTO `operation` VALUES ('650', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:29:22');
INSERT INTO `operation` VALUES ('651', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:29:24');
INSERT INTO `operation` VALUES ('652', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:31:47');
INSERT INTO `operation` VALUES ('653', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:38:42');
INSERT INTO `operation` VALUES ('654', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:38:50');
INSERT INTO `operation` VALUES ('655', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:40:36');
INSERT INTO `operation` VALUES ('656', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:40:36');
INSERT INTO `operation` VALUES ('657', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:41:23');
INSERT INTO `operation` VALUES ('658', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:41:34');
INSERT INTO `operation` VALUES ('659', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:51:49');
INSERT INTO `operation` VALUES ('660', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:51:50');
INSERT INTO `operation` VALUES ('661', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 15:53:37');
INSERT INTO `operation` VALUES ('662', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 16:03:36');
INSERT INTO `operation` VALUES ('663', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 16:17:47');
INSERT INTO `operation` VALUES ('664', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-05 16:17:48');
INSERT INTO `operation` VALUES ('665', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 16:17:56');
INSERT INTO `operation` VALUES ('666', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 16:18:27');
INSERT INTO `operation` VALUES ('667', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-05 16:18:30');
INSERT INTO `operation` VALUES ('668', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:07:48');
INSERT INTO `operation` VALUES ('669', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:07:49');
INSERT INTO `operation` VALUES ('670', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:08:51');
INSERT INTO `operation` VALUES ('671', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:28:41');
INSERT INTO `operation` VALUES ('672', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:48:44');
INSERT INTO `operation` VALUES ('673', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 15:54:22');
INSERT INTO `operation` VALUES ('674', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:07:45');
INSERT INTO `operation` VALUES ('675', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:11:16');
INSERT INTO `operation` VALUES ('676', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:14:16');
INSERT INTO `operation` VALUES ('677', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:15:48');
INSERT INTO `operation` VALUES ('678', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:16:05');
INSERT INTO `operation` VALUES ('679', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:16:49');
INSERT INTO `operation` VALUES ('680', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:17:18');
INSERT INTO `operation` VALUES ('681', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:17:34');
INSERT INTO `operation` VALUES ('682', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:17:48');
INSERT INTO `operation` VALUES ('683', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:17:54');
INSERT INTO `operation` VALUES ('684', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 16:18:07');
INSERT INTO `operation` VALUES ('685', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:18:26');
INSERT INTO `operation` VALUES ('686', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:18:27');
INSERT INTO `operation` VALUES ('687', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:22:25');
INSERT INTO `operation` VALUES ('688', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:26:21');
INSERT INTO `operation` VALUES ('689', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:41:08');
INSERT INTO `operation` VALUES ('690', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:41:10');
INSERT INTO `operation` VALUES ('691', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:42:30');
INSERT INTO `operation` VALUES ('692', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:45:28');
INSERT INTO `operation` VALUES ('693', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:48:19');
INSERT INTO `operation` VALUES ('694', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 16:50:34');
INSERT INTO `operation` VALUES ('695', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 17:09:44');
INSERT INTO `operation` VALUES ('696', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 17:26:31');
INSERT INTO `operation` VALUES ('697', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 17:30:39');
INSERT INTO `operation` VALUES ('698', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 17:35:28');
INSERT INTO `operation` VALUES ('699', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-06 17:46:23');
INSERT INTO `operation` VALUES ('700', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-06 20:38:15');
INSERT INTO `operation` VALUES ('701', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-09 22:06:07');
INSERT INTO `operation` VALUES ('702', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-09 22:07:36');
INSERT INTO `operation` VALUES ('703', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-09 22:52:16');
INSERT INTO `operation` VALUES ('704', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-09 23:00:45');
INSERT INTO `operation` VALUES ('705', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-09 23:03:37');
INSERT INTO `operation` VALUES ('706', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-10 15:42:09');
INSERT INTO `operation` VALUES ('707', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-10 16:27:46');
INSERT INTO `operation` VALUES ('708', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '127.0.0.1', '2020-02-10 18:51:56');
INSERT INTO `operation` VALUES ('709', '20', 'com.pang.back.Controller.GoodsController.deleteGoods', 'POST', '删除', '127.0.0.1', '2020-02-10 18:52:20');
INSERT INTO `operation` VALUES ('710', '20', 'com.pang.back.Controller.GoodsController.deleteGoods', 'POST', '删除', '127.0.0.1', '2020-02-10 18:52:23');
INSERT INTO `operation` VALUES ('711', '20', 'com.pang.back.Controller.GoodsController.deleteGoods', 'POST', '删除', '127.0.0.1', '2020-02-10 18:52:25');
INSERT INTO `operation` VALUES ('712', '20', 'com.pang.back.Controller.GoodsController.deleteGoods', 'POST', '删除', '127.0.0.1', '2020-02-10 18:52:26');
INSERT INTO `operation` VALUES ('713', '20', 'com.pang.back.Controller.GoodsController.deleteGoods', 'POST', '删除', '127.0.0.1', '2020-02-10 18:52:28');
INSERT INTO `operation` VALUES ('714', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-11 20:32:09');
INSERT INTO `operation` VALUES ('715', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:33:06');
INSERT INTO `operation` VALUES ('716', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:35:04');
INSERT INTO `operation` VALUES ('717', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:47:33');
INSERT INTO `operation` VALUES ('718', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:49:04');
INSERT INTO `operation` VALUES ('719', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:51:30');
INSERT INTO `operation` VALUES ('720', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:52:50');
INSERT INTO `operation` VALUES ('721', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:54:37');
INSERT INTO `operation` VALUES ('722', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:55:48');
INSERT INTO `operation` VALUES ('723', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 21:58:59');
INSERT INTO `operation` VALUES ('724', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 22:01:54');
INSERT INTO `operation` VALUES ('725', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 22:03:54');
INSERT INTO `operation` VALUES ('726', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 22:05:22');
INSERT INTO `operation` VALUES ('727', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-11 22:22:39');
INSERT INTO `operation` VALUES ('728', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 01:46:20');
INSERT INTO `operation` VALUES ('729', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 02:01:00');
INSERT INTO `operation` VALUES ('730', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 02:36:09');
INSERT INTO `operation` VALUES ('731', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 02:36:18');
INSERT INTO `operation` VALUES ('732', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 20:22:12');
INSERT INTO `operation` VALUES ('733', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 20:27:05');
INSERT INTO `operation` VALUES ('734', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:00:04');
INSERT INTO `operation` VALUES ('735', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:06:29');
INSERT INTO `operation` VALUES ('736', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:09:23');
INSERT INTO `operation` VALUES ('737', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:18:19');
INSERT INTO `operation` VALUES ('738', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:24:03');
INSERT INTO `operation` VALUES ('739', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:24:44');
INSERT INTO `operation` VALUES ('740', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:26:56');
INSERT INTO `operation` VALUES ('741', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:29:04');
INSERT INTO `operation` VALUES ('742', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:30:55');
INSERT INTO `operation` VALUES ('743', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:32:05');
INSERT INTO `operation` VALUES ('744', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:33:38');
INSERT INTO `operation` VALUES ('745', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:35:03');
INSERT INTO `operation` VALUES ('746', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:37:13');
INSERT INTO `operation` VALUES ('747', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:38:04');
INSERT INTO `operation` VALUES ('748', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:39:23');
INSERT INTO `operation` VALUES ('749', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:41:03');
INSERT INTO `operation` VALUES ('750', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:42:09');
INSERT INTO `operation` VALUES ('751', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:43:14');
INSERT INTO `operation` VALUES ('752', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:44:18');
INSERT INTO `operation` VALUES ('753', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:46:03');
INSERT INTO `operation` VALUES ('754', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:47:13');
INSERT INTO `operation` VALUES ('755', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:48:00');
INSERT INTO `operation` VALUES ('756', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:49:32');
INSERT INTO `operation` VALUES ('757', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:50:13');
INSERT INTO `operation` VALUES ('758', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:51:22');
INSERT INTO `operation` VALUES ('759', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:52:59');
INSERT INTO `operation` VALUES ('760', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:56:10');
INSERT INTO `operation` VALUES ('761', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:57:00');
INSERT INTO `operation` VALUES ('762', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:58:12');
INSERT INTO `operation` VALUES ('763', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 21:59:04');
INSERT INTO `operation` VALUES ('764', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:00:08');
INSERT INTO `operation` VALUES ('765', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:01:32');
INSERT INTO `operation` VALUES ('766', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:02:37');
INSERT INTO `operation` VALUES ('767', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:07:52');
INSERT INTO `operation` VALUES ('768', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:08:39');
INSERT INTO `operation` VALUES ('769', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:09:33');
INSERT INTO `operation` VALUES ('770', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:10:37');
INSERT INTO `operation` VALUES ('771', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:11:15');
INSERT INTO `operation` VALUES ('772', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:11:53');
INSERT INTO `operation` VALUES ('773', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:12:58');
INSERT INTO `operation` VALUES ('774', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:13:50');
INSERT INTO `operation` VALUES ('775', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:14:44');
INSERT INTO `operation` VALUES ('776', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:15:44');
INSERT INTO `operation` VALUES ('777', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:16:50');
INSERT INTO `operation` VALUES ('778', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:17:31');
INSERT INTO `operation` VALUES ('779', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:18:20');
INSERT INTO `operation` VALUES ('780', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:20:14');
INSERT INTO `operation` VALUES ('781', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:21:30');
INSERT INTO `operation` VALUES ('782', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:22:29');
INSERT INTO `operation` VALUES ('783', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:23:21');
INSERT INTO `operation` VALUES ('784', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:24:45');
INSERT INTO `operation` VALUES ('785', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:25:33');
INSERT INTO `operation` VALUES ('786', '20', 'com.pang.back.Controller.PublicController.updateGoods', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-12 22:25:43');
INSERT INTO `operation` VALUES ('787', '20', 'com.pang.back.Controller.GoodsController.updateGoods', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-12 22:25:50');
INSERT INTO `operation` VALUES ('788', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:25:53');
INSERT INTO `operation` VALUES ('789', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:26:56');
INSERT INTO `operation` VALUES ('790', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:27:48');
INSERT INTO `operation` VALUES ('791', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:28:36');
INSERT INTO `operation` VALUES ('792', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:29:23');
INSERT INTO `operation` VALUES ('793', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:39:20');
INSERT INTO `operation` VALUES ('794', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:45:08');
INSERT INTO `operation` VALUES ('795', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:47:02');
INSERT INTO `operation` VALUES ('796', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:48:48');
INSERT INTO `operation` VALUES ('797', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:51:14');
INSERT INTO `operation` VALUES ('798', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:53:08');
INSERT INTO `operation` VALUES ('799', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:55:33');
INSERT INTO `operation` VALUES ('800', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 22:58:28');
INSERT INTO `operation` VALUES ('801', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:01:52');
INSERT INTO `operation` VALUES ('802', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:05:56');
INSERT INTO `operation` VALUES ('803', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:07:46');
INSERT INTO `operation` VALUES ('804', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:09:58');
INSERT INTO `operation` VALUES ('805', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:11:31');
INSERT INTO `operation` VALUES ('806', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:13:15');
INSERT INTO `operation` VALUES ('807', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:19:13');
INSERT INTO `operation` VALUES ('808', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:21:35');
INSERT INTO `operation` VALUES ('809', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:23:32');
INSERT INTO `operation` VALUES ('810', '20', 'com.pang.back.Controller.GoodsController.addGoods', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-12 23:25:10');
INSERT INTO `operation` VALUES ('811', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 15:58:06');
INSERT INTO `operation` VALUES ('812', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 15:58:45');
INSERT INTO `operation` VALUES ('813', '20', 'com.pang.back.Controller.GoodsClassController.updateGoodsClass', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-13 16:00:18');
INSERT INTO `operation` VALUES ('814', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 16:00:35');
INSERT INTO `operation` VALUES ('815', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 16:00:49');
INSERT INTO `operation` VALUES ('816', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 16:04:10');
INSERT INTO `operation` VALUES ('817', '20', 'com.pang.back.Controller.GoodsClassController.addGoodsClass', 'POST', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 16:04:24');
INSERT INTO `operation` VALUES ('818', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 16:04:36');
INSERT INTO `operation` VALUES ('819', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 17:54:36');
INSERT INTO `operation` VALUES ('820', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 17:55:24');
INSERT INTO `operation` VALUES ('821', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 18:22:00');
INSERT INTO `operation` VALUES ('822', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 18:25:47');
INSERT INTO `operation` VALUES ('823', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 18:27:24');
INSERT INTO `operation` VALUES ('824', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 18:28:22');
INSERT INTO `operation` VALUES ('825', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 18:28:30');
INSERT INTO `operation` VALUES ('826', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 21:08:03');
INSERT INTO `operation` VALUES ('827', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 21:11:39');
INSERT INTO `operation` VALUES ('828', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 21:28:08');
INSERT INTO `operation` VALUES ('829', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 22:23:44');
INSERT INTO `operation` VALUES ('830', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 22:25:23');
INSERT INTO `operation` VALUES ('831', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 22:26:25');
INSERT INTO `operation` VALUES ('832', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-02-13 22:40:17');
INSERT INTO `operation` VALUES ('833', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 21:44:10');
INSERT INTO `operation` VALUES ('834', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 21:48:14');
INSERT INTO `operation` VALUES ('835', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 21:48:18');
INSERT INTO `operation` VALUES ('836', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 21:48:34');
INSERT INTO `operation` VALUES ('837', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 22:02:46');
INSERT INTO `operation` VALUES ('838', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 22:05:47');
INSERT INTO `operation` VALUES ('839', '20', 'com.pang.back.Controller.UserController.addUser', 'POST', '添加', '127.0.0.1', '2020-02-23 22:05:57');
INSERT INTO `operation` VALUES ('840', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-23 22:30:33');
INSERT INTO `operation` VALUES ('841', '20', 'com.pang.back.Controller.UserController.deleteUser', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-02-23 22:30:38');
INSERT INTO `operation` VALUES ('842', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-24 00:15:03');
INSERT INTO `operation` VALUES ('843', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-24 00:17:50');
INSERT INTO `operation` VALUES ('844', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-24 00:17:54');
INSERT INTO `operation` VALUES ('845', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-24 00:20:33');
INSERT INTO `operation` VALUES ('846', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-24 16:51:39');
INSERT INTO `operation` VALUES ('847', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-25 19:16:31');
INSERT INTO `operation` VALUES ('848', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-02-29 15:07:24');
INSERT INTO `operation` VALUES ('849', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-01 17:43:03');
INSERT INTO `operation` VALUES ('850', '20', 'com.pang.back.Controller.PublicController.addGoods', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-03-01 17:43:07');
INSERT INTO `operation` VALUES ('851', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-11 18:37:38');
INSERT INTO `operation` VALUES ('852', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-11 18:37:44');
INSERT INTO `operation` VALUES ('853', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 18:37:04');
INSERT INTO `operation` VALUES ('854', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 18:40:48');
INSERT INTO `operation` VALUES ('855', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 19:29:24');
INSERT INTO `operation` VALUES ('856', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 19:39:52');
INSERT INTO `operation` VALUES ('857', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 19:43:02');
INSERT INTO `operation` VALUES ('858', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 19:54:35');
INSERT INTO `operation` VALUES ('859', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 19:57:07');
INSERT INTO `operation` VALUES ('860', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 20:00:29');
INSERT INTO `operation` VALUES ('861', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 20:32:19');
INSERT INTO `operation` VALUES ('862', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 20:38:14');
INSERT INTO `operation` VALUES ('863', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 20:56:17');
INSERT INTO `operation` VALUES ('864', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:00:28');
INSERT INTO `operation` VALUES ('865', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:02:55');
INSERT INTO `operation` VALUES ('866', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:05:48');
INSERT INTO `operation` VALUES ('867', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 21:39:38');
INSERT INTO `operation` VALUES ('868', '20', 'com.pang.back.Controller.OrderController.batchDelete', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 21:39:48');
INSERT INTO `operation` VALUES ('869', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:49:49');
INSERT INTO `operation` VALUES ('870', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:50:05');
INSERT INTO `operation` VALUES ('871', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 21:50:08');
INSERT INTO `operation` VALUES ('872', '20', 'com.pang.back.Controller.OrderController.batchDelete', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 21:50:28');
INSERT INTO `operation` VALUES ('873', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-20 23:50:43');
INSERT INTO `operation` VALUES ('874', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:51:48');
INSERT INTO `operation` VALUES ('875', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:01');
INSERT INTO `operation` VALUES ('876', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:03');
INSERT INTO `operation` VALUES ('877', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:08');
INSERT INTO `operation` VALUES ('878', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:11');
INSERT INTO `operation` VALUES ('879', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:23');
INSERT INTO `operation` VALUES ('880', '20', 'com.pang.back.Controller.OrderController.deleteOrderByOrderID', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:52:25');
INSERT INTO `operation` VALUES ('881', '20', 'com.pang.back.Controller.OrderController.batchDelete', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-20 23:55:01');
INSERT INTO `operation` VALUES ('882', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 00:34:10');
INSERT INTO `operation` VALUES ('883', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 01:39:59');
INSERT INTO `operation` VALUES ('884', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 02:15:57');
INSERT INTO `operation` VALUES ('885', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:07:20');
INSERT INTO `operation` VALUES ('886', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:07:33');
INSERT INTO `operation` VALUES ('887', '20', 'com.pang.back.Controller.OrderController.batchDelete', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-21 03:21:22');
INSERT INTO `operation` VALUES ('888', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:27:31');
INSERT INTO `operation` VALUES ('889', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:28:22');
INSERT INTO `operation` VALUES ('890', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:31:29');
INSERT INTO `operation` VALUES ('891', '20', 'com.pang.back.Controller.OrderController.batchDelete', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-03-21 03:37:22');
INSERT INTO `operation` VALUES ('892', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 03:46:30');
INSERT INTO `operation` VALUES ('893', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 19:40:01');
INSERT INTO `operation` VALUES ('894', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 20:18:15');
INSERT INTO `operation` VALUES ('895', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-21 22:27:40');
INSERT INTO `operation` VALUES ('896', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 19:08:34');
INSERT INTO `operation` VALUES ('897', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 21:25:10');
INSERT INTO `operation` VALUES ('898', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 21:25:36');
INSERT INTO `operation` VALUES ('899', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 21:49:10');
INSERT INTO `operation` VALUES ('900', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 22:26:53');
INSERT INTO `operation` VALUES ('901', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 22:26:55');
INSERT INTO `operation` VALUES ('902', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 22:59:26');
INSERT INTO `operation` VALUES ('903', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 22:59:36');
INSERT INTO `operation` VALUES ('904', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 23:02:16');
INSERT INTO `operation` VALUES ('905', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 23:04:22');
INSERT INTO `operation` VALUES ('906', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 23:17:04');
INSERT INTO `operation` VALUES ('907', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 23:21:39');
INSERT INTO `operation` VALUES ('908', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-03-29 23:24:03');
INSERT INTO `operation` VALUES ('909', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 20:02:59');
INSERT INTO `operation` VALUES ('910', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 20:38:19');
INSERT INTO `operation` VALUES ('911', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 20:42:56');
INSERT INTO `operation` VALUES ('912', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 20:43:12');
INSERT INTO `operation` VALUES ('913', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 20:46:32');
INSERT INTO `operation` VALUES ('914', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 23:44:38');
INSERT INTO `operation` VALUES ('915', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 23:51:35');
INSERT INTO `operation` VALUES ('916', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-03-30 23:57:09');
INSERT INTO `operation` VALUES ('917', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 00:08:22');
INSERT INTO `operation` VALUES ('918', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 00:11:38');
INSERT INTO `operation` VALUES ('919', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-04-28 00:11:47');
INSERT INTO `operation` VALUES ('920', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 00:11:53');
INSERT INTO `operation` VALUES ('921', '20', 'com.pang.back.Controller.PublicController.user', 'POST', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:39:58');
INSERT INTO `operation` VALUES ('922', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:40:01');
INSERT INTO `operation` VALUES ('923', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:40:03');
INSERT INTO `operation` VALUES ('924', '20', 'com.pang.back.Controller.PublicController.userInfo', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:40:14');
INSERT INTO `operation` VALUES ('925', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:40:26');
INSERT INTO `operation` VALUES ('926', '20', 'com.pang.back.Controller.PublicController.user', 'GET', '修改', '0:0:0:0:0:0:0:1', '2020-04-28 15:43:47');
INSERT INTO `operation` VALUES ('927', '20', 'com.pang.back.Controller.PublicController.addClass', 'GET', '添加', '0:0:0:0:0:0:0:1', '2020-04-28 15:45:03');
INSERT INTO `operation` VALUES ('928', '20', 'com.pang.back.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-04-28 16:03:38');
INSERT INTO `operation` VALUES ('929', '20', 'com.pang.back.Controller.NotifyController.deleteMessage', 'POST', '删除', '0:0:0:0:0:0:0:1', '2020-04-28 16:03:39');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderID` bigint(11) NOT NULL,
  `consigneeName` varchar(255) NOT NULL,
  `consigneePhone` varchar(255) NOT NULL,
  `consigneeAddress` varchar(255) NOT NULL,
  `subscriberName` varchar(255) NOT NULL,
  `subscriberPhone` varchar(255) NOT NULL,
  `deliveryDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `greetingMessage` varchar(255) DEFAULT NULL,
  `orderStatus` varchar(255) NOT NULL,
  `orderPriceSum` varchar(255) NOT NULL,
  `orderUpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('6060066949634', 'SmallPang', '13929753093', '山西省大同市平城区地铁站', '胖', '13929753093', '2020-03-10 02:43:32', '', '已评价', '678.0', '2020-03-10 02:43:32');
INSERT INTO `order` VALUES ('6060066949635', 'SmallPang', '13929753093', '天津市天津城区河东区地铁站', '胖', '13929753093', '2020-03-10 16:27:26', '开心点啦肥仔', '已评价', '339.0', '2020-03-10 16:27:26');
INSERT INTO `order` VALUES ('6060066949636', 'SmallPang', '13929753093', '河北省石家庄市新华区官桥', '胖', '13929753093', '2020-04-09 18:36:51', 'happy', '已删除', '1398.0', '2020-04-09 18:36:51');
INSERT INTO `order` VALUES ('6060066949637', 'SmallPang', '13929753093', '北京市北京城区西城区官桥', 'wo胖', '13929753093', '2020-04-09 18:35:50', 'happy', '已评价', '738.0', '2020-04-09 18:35:50');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `ogID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` bigint(11) NOT NULL,
  `goodsID` int(11) NOT NULL,
  `goodsSum` varchar(255) NOT NULL,
  PRIMARY KEY (`ogID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES ('39', '6060066949626', '70', '2');
INSERT INTO `order_goods` VALUES ('40', '6060066949628', '17', '1');
INSERT INTO `order_goods` VALUES ('41', '6060066949628', '17', '1');
INSERT INTO `order_goods` VALUES ('42', '6060066949629', '70', '2');
INSERT INTO `order_goods` VALUES ('43', '6060066949629', '70', '2');
INSERT INTO `order_goods` VALUES ('44', '6060066949630', '42', '1');
INSERT INTO `order_goods` VALUES ('45', '6060066949630', '42', '1');
INSERT INTO `order_goods` VALUES ('46', '6060066949631', '42', '1');
INSERT INTO `order_goods` VALUES ('47', '6060066949631', '42', '1');
INSERT INTO `order_goods` VALUES ('48', '6060066949632', '24', '1');
INSERT INTO `order_goods` VALUES ('49', '6060066949632', '24', '1');
INSERT INTO `order_goods` VALUES ('50', '6060066949633', '17', '2');
INSERT INTO `order_goods` VALUES ('51', '6060066949633', '17', '2');
INSERT INTO `order_goods` VALUES ('52', '6060066949634', '18', '2');
INSERT INTO `order_goods` VALUES ('53', '6060066949635', '18', '1');
INSERT INTO `order_goods` VALUES ('54', '6060066949636', '19', '2');
INSERT INTO `order_goods` VALUES ('55', '6060066949637', '113', '2');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `shoppingCartID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `goodsID` varchar(255) NOT NULL,
  `goodsSum` varchar(255) NOT NULL,
  `shoppingCartUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shoppingCartID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('25', '10124', '40', '1', '2020-03-09 17:07:52');
INSERT INTO `shoppingcart` VALUES ('31', '10126', '18', '4', '2020-04-27 23:55:09');
INSERT INTO `shoppingcart` VALUES ('33', '10126', '41', '5', '2020-04-27 23:55:27');
INSERT INTO `shoppingcart` VALUES ('34', '10126', '42', '4', '2020-04-27 23:55:29');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `staffPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `staffRole` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('19', '$2a$10$UQj0nWoNK8gInjXAZd0lJuJnszq.09C192kdtf0eKcuxXve6VMjKG', '店长', '正常', '2019-12-19 00:31:30');
INSERT INTO `staff` VALUES ('20', '$2a$10$oM71kNzgQNVzfFShKh1ZSu8IjWtJxHP4zmD5PD8keG5ryqGdJFX/2', '店长', '正常', '2019-12-25 01:08:50');
INSERT INTO `staff` VALUES ('21', '$2a$10$K3E/1O9yOBNrzMHm654EhOfWGhdYH6ozV51UndNvj9UuyMpK2YCTW', '店长', '正常', '2019-12-18 23:03:20');
INSERT INTO `staff` VALUES ('32', '$2a$10$WxRIk8iBuRK38VPxF1BQKOjmv4TkucGKNVeQt/oTSvmbGa9lZjzFW', '店员', '正常', '2019-12-19 00:31:05');
INSERT INTO `staff` VALUES ('33', '$2a$10$Y/Fp2poY8p9tlMcqyYGRB.fH5h/E5oADMhc3MIOO2HhJe40lpOvtO', '店员', '正常', '2020-01-10 20:15:41');
INSERT INTO `staff` VALUES ('34', '$2a$10$y6ukyuaORUwB5T2VIOK7gOkAPgBpCFjy/IFhhJRw9kePHnRwtyPBq', '店员', '正常', '2020-01-10 20:17:25');

-- ----------------------------
-- Table structure for staffinfo
-- ----------------------------
DROP TABLE IF EXISTS `staffinfo`;
CREATE TABLE `staffinfo` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `staffName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `staffSex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffBirthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffHeadPortrait` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `staffInfoUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffinfo
-- ----------------------------
INSERT INTO `staffinfo` VALUES ('19', '我胖', '男', '2019-11-23', '13956894695', 'http://localhost:8889/19_HeadPortrait.jpg', '11', '2020-01-19 22:25:22');
INSERT INTO `staffinfo` VALUES ('20', '我胖', '男', '2019-10-28', '13614528965', 'http://localhost:8889/20_timg (2).jpg', '中国河北省北京市海淀区北京大学', '2020-01-07 16:27:49');
INSERT INTO `staffinfo` VALUES ('21', '欢', '男', '1998-2-27', '13696584582', 'http://localhost:8889/21_欢.jpg', '', '2019-12-23 16:17:22');
INSERT INTO `staffinfo` VALUES ('32', 'qqqqq', '男', '2020-0-10', '15216487962', 'http://localhost:8889/32_604a67f07e41b0cca4054a850fc42759e3a0ed89 - 副本.jpg', '', '2020-01-10 20:14:01');
INSERT INTO `staffinfo` VALUES ('33', '12', '男', '2020-0-10', '13689654589', 'http://localhost:8889/33_12.jpg', '', '2020-01-10 20:16:40');
INSERT INTO `staffinfo` VALUES ('34', 'weq', '男', '2020-0-10', '13689652356', 'http://localhost:8889/34_weq.jpg', '', '2020-01-10 20:17:39');

-- ----------------------------
-- Table structure for staffmessage
-- ----------------------------
DROP TABLE IF EXISTS `staffmessage`;
CREATE TABLE `staffmessage` (
  `staffMessageID` int(11) NOT NULL AUTO_INCREMENT,
  `staffID` int(11) NOT NULL,
  `senderID` int(11) NOT NULL,
  `staffMessageContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `staffMessageStatus` int(11) NOT NULL,
  `staffMessageTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffMessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffmessage
-- ----------------------------
INSERT INTO `staffmessage` VALUES ('49', '19', '20', '3', '0', '2019-12-28 21:41:51');
INSERT INTO `staffmessage` VALUES ('51', '21', '20', '3', '0', '2019-12-28 21:41:51');
INSERT INTO `staffmessage` VALUES ('52', '32', '20', '3', '0', '2019-12-28 21:41:51');
INSERT INTO `staffmessage` VALUES ('53', '19', '20', '4', '0', '2019-12-28 21:42:01');
INSERT INTO `staffmessage` VALUES ('55', '21', '20', '4', '0', '2019-12-28 21:42:01');
INSERT INTO `staffmessage` VALUES ('56', '32', '20', '4', '0', '2019-12-28 21:42:01');
INSERT INTO `staffmessage` VALUES ('57', '19', '20', '警告', '0', '2019-12-28 22:50:35');
INSERT INTO `staffmessage` VALUES ('59', '21', '20', '警告', '0', '2019-12-28 22:50:35');
INSERT INTO `staffmessage` VALUES ('60', '32', '20', '警告', '0', '2019-12-28 22:50:35');
INSERT INTO `staffmessage` VALUES ('61', '19', '20', '明天放假', '0', '2019-12-28 22:50:52');
INSERT INTO `staffmessage` VALUES ('63', '21', '20', '明天放假', '0', '2019-12-28 22:50:52');
INSERT INTO `staffmessage` VALUES ('64', '32', '20', '明天放假', '0', '2019-12-28 22:50:52');
INSERT INTO `staffmessage` VALUES ('65', '19', '20', '放假了', '0', '2019-12-29 14:31:39');
INSERT INTO `staffmessage` VALUES ('67', '21', '20', '放假了', '0', '2019-12-29 14:31:39');
INSERT INTO `staffmessage` VALUES ('68', '32', '20', '放假了', '0', '2019-12-29 14:31:40');
INSERT INTO `staffmessage` VALUES ('69', '19', '20', '333', '0', '2019-12-29 14:38:06');
INSERT INTO `staffmessage` VALUES ('71', '21', '20', '333', '0', '2019-12-29 14:38:06');
INSERT INTO `staffmessage` VALUES ('72', '32', '20', '333', '0', '2019-12-29 14:38:06');
INSERT INTO `staffmessage` VALUES ('73', '19', '20', '444', '0', '2019-12-29 14:38:18');
INSERT INTO `staffmessage` VALUES ('75', '21', '20', '444', '0', '2019-12-29 14:38:18');
INSERT INTO `staffmessage` VALUES ('76', '32', '20', '444', '0', '2019-12-29 14:38:18');
INSERT INTO `staffmessage` VALUES ('77', '19', '20', '5555', '0', '2019-12-29 14:38:21');
INSERT INTO `staffmessage` VALUES ('79', '21', '20', '5555', '0', '2019-12-29 14:38:21');
INSERT INTO `staffmessage` VALUES ('80', '32', '20', '5555', '0', '2019-12-29 14:38:21');
INSERT INTO `staffmessage` VALUES ('81', '19', '20', '666', '0', '2019-12-29 14:39:58');
INSERT INTO `staffmessage` VALUES ('83', '21', '20', '666', '0', '2019-12-29 14:39:58');
INSERT INTO `staffmessage` VALUES ('84', '32', '20', '666', '0', '2019-12-29 14:39:58');
INSERT INTO `staffmessage` VALUES ('85', '19', '20', '31', '0', '2019-12-29 14:41:44');
INSERT INTO `staffmessage` VALUES ('87', '21', '20', '31', '0', '2019-12-29 14:41:44');
INSERT INTO `staffmessage` VALUES ('88', '32', '20', '31', '0', '2019-12-29 14:41:44');
INSERT INTO `staffmessage` VALUES ('89', '19', '20', '31', '0', '2019-12-29 14:41:45');
INSERT INTO `staffmessage` VALUES ('91', '21', '20', '31', '0', '2019-12-29 14:41:45');
INSERT INTO `staffmessage` VALUES ('92', '32', '20', '31', '0', '2019-12-29 14:41:45');
INSERT INTO `staffmessage` VALUES ('93', '19', '20', '31', '0', '2019-12-29 14:41:46');
INSERT INTO `staffmessage` VALUES ('95', '21', '20', '31', '0', '2019-12-29 14:41:46');
INSERT INTO `staffmessage` VALUES ('96', '32', '20', '31', '0', '2019-12-29 14:41:46');
INSERT INTO `staffmessage` VALUES ('97', '19', '20', '222', '0', '2019-12-29 15:07:19');
INSERT INTO `staffmessage` VALUES ('99', '21', '20', '222', '0', '2019-12-29 15:07:19');
INSERT INTO `staffmessage` VALUES ('100', '32', '20', '222', '0', '2019-12-29 15:07:19');
INSERT INTO `staffmessage` VALUES ('101', '19', '20', '222', '0', '2019-12-29 15:07:20');
INSERT INTO `staffmessage` VALUES ('103', '21', '20', '222', '0', '2019-12-29 15:07:20');
INSERT INTO `staffmessage` VALUES ('104', '32', '20', '222', '0', '2019-12-29 15:07:20');
INSERT INTO `staffmessage` VALUES ('105', '19', '20', '333', '0', '2019-12-29 15:25:56');
INSERT INTO `staffmessage` VALUES ('107', '21', '20', '333', '0', '2019-12-29 15:25:56');
INSERT INTO `staffmessage` VALUES ('108', '32', '20', '333', '0', '2019-12-29 15:25:56');
INSERT INTO `staffmessage` VALUES ('109', '19', '20', '4', '0', '2019-12-29 15:26:00');
INSERT INTO `staffmessage` VALUES ('111', '21', '20', '4', '0', '2019-12-29 15:26:00');
INSERT INTO `staffmessage` VALUES ('112', '32', '20', '4', '0', '2019-12-29 15:26:00');
INSERT INTO `staffmessage` VALUES ('113', '19', '20', '5', '0', '2019-12-29 15:26:01');
INSERT INTO `staffmessage` VALUES ('115', '21', '20', '5', '0', '2019-12-29 15:26:01');
INSERT INTO `staffmessage` VALUES ('116', '32', '20', '5', '0', '2019-12-29 15:26:01');
INSERT INTO `staffmessage` VALUES ('117', '19', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');
INSERT INTO `staffmessage` VALUES ('118', '20', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');
INSERT INTO `staffmessage` VALUES ('119', '21', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');
INSERT INTO `staffmessage` VALUES ('120', '32', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');
INSERT INTO `staffmessage` VALUES ('121', '33', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');
INSERT INTO `staffmessage` VALUES ('122', '34', '20', '五一劳动节放假通知：5-1日至5-5日，共五天，三天为法律节假日，带薪假期，祝各位生活愉快！', '0', '2020-04-28 16:03:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(255) NOT NULL AUTO_INCREMENT,
  `userPhone` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userStatus` varchar(255) NOT NULL,
  `userUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=10127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10095', '', '$2a$10$UzJnkibVF9RghukFPIXRle./veOLNGGzJYzGn.dyM0KEYk31mCxT2', '正常', '2019-12-19 01:38:08');
INSERT INTO `user` VALUES ('10096', '', '$2a$10$JAksT4b/WPpVaF1Jdfg1beDbgzyOdrWlP3w.bT/dO.TP.x./HQIqy', '正常', '2019-12-19 01:41:09');
INSERT INTO `user` VALUES ('10097', '', '$2a$10$cocqD9u9FYf5ZSqMPhwGWOxeLtC3fevOfaH62hA5cp1UY5Pdkxx7q', '正常', '2019-12-19 10:26:40');
INSERT INTO `user` VALUES ('10098', '', '$2a$10$4jGppKKgHwvxbTi.8WGtM.4ABkrE11ka058PW5bGBRTppowbOdB.u', '正常', '2019-12-19 10:28:56');
INSERT INTO `user` VALUES ('10099', '', '$2a$10$FEyZncgjacf.nnmg.o.Bde39RubRmWeUwbPMFnm3rOkk4eJw6slOC', '正常', '2019-12-19 10:29:54');
INSERT INTO `user` VALUES ('10101', '', '$2a$10$zOxqXNFCjnVq8F.VG5sa2.HIct43XvYB6PJaTdiykOCLzdp9CE24G', '正常', '2019-12-19 10:54:35');
INSERT INTO `user` VALUES ('10102', '', '$2a$10$MeVdSGEU8Gq2axyLOr6eAeQBz8yLDBxC81vYutKKM3a8Pu7BKU2uW', '正常', '2019-12-19 10:54:52');
INSERT INTO `user` VALUES ('10103', '', '$2a$10$8EZJRJmwcf6A6XbqpdCr8.LKgRgGxAyATGTjXQ9ykalpUhgfMvLo6', '正常', '2019-12-22 14:21:46');
INSERT INTO `user` VALUES ('10104', '', '$2a$10$uP2a/a7J.D.CFas34frs5uxzBdXn44MbK/XmZdH7RS6jCiOo96H5W', '正常', '2019-12-22 15:45:39');
INSERT INTO `user` VALUES ('10105', '', '$2a$10$28rKX04tArUUR5dq6rEyt.DSsah7rGtX/GE6b02DacirZVJB8OlfO', '正常', '2019-12-22 15:45:41');
INSERT INTO `user` VALUES ('10106', '', '$2a$10$S3Mzbu2ARZ5L9TAyoHixreQqHtcPmE3g9JoXe..kmy5gTr9Zw85zK', '正常', '2019-12-22 15:45:44');
INSERT INTO `user` VALUES ('10107', '', '$2a$10$uxur6aB.YAnfk7C5KWZofeMakUWp66mvi20rBOjQg6eiEl6qILB2W', '正常', '2019-12-22 15:45:46');
INSERT INTO `user` VALUES ('10108', '', '$2a$10$gv9Lj6/tYJYKUF0l1R928.rhPoQRRfSdfEejpHaA.ahcASuvPYXle', '正常', '2019-12-22 15:45:48');
INSERT INTO `user` VALUES ('10109', '', '$2a$10$DlZN9lNUd/ZZH1xY2mPtjOAQ.3jTA3lNcejZFAfFMOxdgTHrOf.L2', '正常', '2019-12-22 15:45:50');
INSERT INTO `user` VALUES ('10124', '13929753093', '10090327', '正常', '2020-02-24 12:10:35');
INSERT INTO `user` VALUES ('10126', '17819839352', 'o*o*05B7B6/o#A700*5171#27771A/#B', '正常', '2020-03-21 22:09:30');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userSex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userBirthday` varchar(255) DEFAULT NULL,
  `userHeadPortrait` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userInfoUpdateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('10096', 'pang', '男', '1-2-11', 'http://localhost:8889/10096_1578986876(1).png', '广东省化州市', '2020-01-19 21:30:52');
INSERT INTO `userinfo` VALUES ('10098', '1', '男', '2019-11-1', 'http://localhost:8889/10098_604a67f07e41b0cca4054a850fc42759e3a0ed89.jpg', '0.0.0', '2019-12-26 19:02:34');
INSERT INTO `userinfo` VALUES ('10102', '11111', '男', '2019-11-6', 'http://localhost:8889/10102_19747320_131328126660_2.jpg', '', '2019-12-26 18:39:43');
INSERT INTO `userinfo` VALUES ('10103', 'qqq', '男', '2019-11-22', 'http://localhost:8889/10103_1446102551364.jpg', 'Maoming', '2019-12-22 14:22:46');
INSERT INTO `userinfo` VALUES ('10104', 'q', '男', '2019-11-1', 'http://localhost:8889/10104_200803260720E9ACBCE381AEE796BEE8B5B0.jpg', '', '2019-12-22 21:16:15');
INSERT INTO `userinfo` VALUES ('10105', 'qqq', '男', '2019-11-22', 'http://localhost:8889/10105_timg (1).jpg', '广东省茂名市化州县官桥镇大路下村16号', '2019-12-23 16:36:12');
INSERT INTO `userinfo` VALUES ('10107', '我胖', '男', '2019-11-23', 'http://localhost:8889/10107_我胖.jpg', '', '2019-12-23 10:23:41');
INSERT INTO `userinfo` VALUES ('10108', '胖', '男', '2019-11-23', 'http://localhost:8889/10108_胖.jpg', '', '2019-12-26 21:46:21');
INSERT INTO `userinfo` VALUES ('10109', '黄建和', '男', '2019-11-23', 'http://localhost:8889/10109_黄建和.jpg', '', '2019-12-23 00:29:33');
INSERT INTO `userinfo` VALUES ('10123', 'smallpang', null, null, null, null, '2020-02-21 18:10:33');
INSERT INTO `userinfo` VALUES ('10124', '我胖', '女', '2020-03-06', 'http://localhost:8889/10124_HeadPortrait.jpg', '地铁站', '2020-03-12 15:54:31');
INSERT INTO `userinfo` VALUES ('10125', '辣鸡花', null, null, null, null, '2020-03-21 21:18:22');
INSERT INTO `userinfo` VALUES ('10126', '辣鸡花3', '男', '2020-04-08', 'http://localhost:8889/10126_HeadPortrait.jpg', '地铁站', '2020-04-09 18:05:46');

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `uoID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `orderID` bigint(11) NOT NULL,
  PRIMARY KEY (`uoID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES ('52', '10124', '6060066949626');
INSERT INTO `user_order` VALUES ('53', '10124', '6060066949627');
INSERT INTO `user_order` VALUES ('54', '10124', '6060066949628');
INSERT INTO `user_order` VALUES ('55', '10124', '6060066949629');
INSERT INTO `user_order` VALUES ('56', '10124', '6060066949630');
INSERT INTO `user_order` VALUES ('57', '10124', '6060066949631');
INSERT INTO `user_order` VALUES ('58', '10124', '6060066949632');
INSERT INTO `user_order` VALUES ('59', '10124', '6060066949633');
INSERT INTO `user_order` VALUES ('60', '10124', '6060066949634');
INSERT INTO `user_order` VALUES ('61', '10124', '6060066949635');
INSERT INTO `user_order` VALUES ('62', '10126', '6060066949636');
INSERT INTO `user_order` VALUES ('63', '10126', '6060066949637');
