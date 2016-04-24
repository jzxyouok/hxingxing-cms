/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : hongka

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-20 11:20:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` char(10) NOT NULL DEFAULT '',
  `version` smallint(4) NOT NULL DEFAULT '0',
  `versionNo` char(15) NOT NULL DEFAULT '',
  `summary` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of app_version
-- ----------------------------
INSERT INTO `app_version` VALUES ('1', 'andriod', '2', '2.0', '摘要');

-- ----------------------------
-- Table structure for back_contents
-- ----------------------------
DROP TABLE IF EXISTS `back_contents`;
CREATE TABLE `back_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flag` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '推荐位',
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章/单页/碎片/备忘标题',
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章/单页缩略图',
  `author` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章/单页/碎片/备忘正文',
  `slug` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网址缩略名，文章、单页与碎片模型有缩略名，其它模型暂无',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'article' COMMENT '内容类型：article文章模型 page单页模型 fragment碎片模型 memo备忘模型',
  `user_id` int(12) NOT NULL DEFAULT '0' COMMENT '文章编辑用户id',
  `is_top` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶：1置顶，0不置顶',
  `owner_id` int(12) unsigned DEFAULT '0' COMMENT '归属用户id:一般备忘有归属用户id，0表示无任何归属',
  `outer_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外链地址',
  `category_id` int(10) NOT NULL COMMENT '文章分类id',
  `viewNum` int(6) NOT NULL DEFAULT '0',
  `likeNum` smallint(4) unsigned NOT NULL DEFAULT '0',
  `commentNum` smallint(4) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_slug_unique` (`slug`),
  KEY `content_title_index` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内容数据（文章/单页/碎片/备忘）表';

-- ----------------------------
-- Records of back_contents
-- ----------------------------
INSERT INTO `back_contents` VALUES ('20', '', '《太阳的后裔》不仅要翻拍，而且还要砸大钱拍！ ', '/uploads/content/20160414/570f14d8a7734_08o.jpg', '咖姐', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这几个礼拜，《太阳的后裔》用了100种方式成为热门话题，但万万没想到第101种，竟然会是下面&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;这种消息&lt;/span&gt;&lt;/strong&gt;！w&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/48797edbaa696208cab1ed379a0578f7.png&quot; style=&quot;height:128px; width:637px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;听说《太阳的后裔》要翻拍，&lt;span style=&quot;color:#A52A2A&quot;&gt;网友满脸都是大写的拒绝！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/ba7164a7d6e71fc6d5870f782ab3eaa4.png&quot; style=&quot;height:157px; width:200px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;中国的观众，都曾被深深桑害过。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这么多年来中国影视行业不曾放弃翻拍韩剧这条道路。屡战屡败，屡败屡战，在死性不改中打造出一部又一部烂片，江湖人称&ldquo;毁片不倦君&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;所以当这个消息一传出，就在网上炸出了满屏拒绝！&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/52a071829defbe72b3331a674b5926ce.png&quot; style=&quot;height:284px; width:601px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;某网友自发的微博投票&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;现在电视机前的观众们都被虐出了心理阴影&lt;/span&gt;，看到《太阳的后裔》惨遭毒手纷纷摆出了一个特写黑脸。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/99c4be89e3eeb30ea53b55a0f861e5b7.png&quot; style=&quot;height:199px; width:221px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;虽然韩剧翻拍基本没成过，但这一次不一样啊！《太阳的后裔》不是一部普通的韩剧，而是一部披着浪漫外衣的军旅剧！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;韩国的宋钟基帅帅哒，难道我们的军人就比他差吗？看到他们YY自己拯救世界，难道中国的军队不比韩国更强吗？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;为了振兴我国军人的形象，这部剧我们就要翻拍！而且必须超越！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;就算砸大钱，也绝对不能搞砸！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/ab8b1f79525437d20749fb32c920ed8c.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;想要做到超越，就必须知道同样是&ldquo;征兵宣传片&rdquo;军旅剧，为什么我们拍的就没法这么火？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;以下干货可能不中听，但绝对值得看。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;一方面，在经济发展的浪潮中，军队本就不再是社会关注的热点，更和男神、女神的风花雪月挂不上边。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;所以当我们的军旅电视剧给男女主人翁生拉硬扯的套上各种感情戏时，总是显得那么生硬。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;比如王志文和许晴主演的《DA师》，年轻师长和老板闺女的情感纠结让我们看着假的难受，更离谱的还有很多。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/cfc8dfdd3cc750245c8a436ddf6af095.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在这一点上，《太阳的后裔》真是给国产剧好好上了一课&mdash;&mdash;&lt;span style=&quot;color:#A52A2A&quot;&gt;军旅剧不仅可以有感情戏，还可将感情戏作为主线，放到军旅框架和时代背景里去讲，犹如名著《乱世佳人》。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/1135da8db5aaa4216fd7b9fd7ad1a573.png&quot; style=&quot;height:332px; width:500px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;另一方面，别看这段时间女人们天天舔着屏嚷嚷换老公，反观我们军队的小伙，还是找不到女朋友。&lt;/span&gt;有人把韩剧称作女人的春药，说白了看看就得，不能当饭吃。就像男人看再多的小电影，用再多的卫生纸，也不会哭着喊着非波多野结衣不娶。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;认不清这一点，我们的军旅剧就拍得放不开手脚，&lt;span style=&quot;color:#A52A2A&quot;&gt;一边又想反应军队现状，一边又想拔高军队形象，结果两头不靠，内部人看着假，外部人看着空，无聊透顶。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/a38045bbe2adf57a3b8047843a7f55e8.png&quot; style=&quot;height:348px; width:530px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;相比之下《太阳的后裔》就不同，撩骚就好好撩骚，从不会中途问一句&ldquo;中午盒饭吃什么&rdquo;，坏了彼此的兴致。这一点不得不再表扬一次《士兵突击》，观点不飘移，没有感情戏，结果也证明很成功。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/0465790c7ba3a09e469bfc23b6620796.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;最后，我们的偶像派明星的确也差点事。&lt;/span&gt;韩国影星从当实习生开始，唱歌、舞蹈、外语、书法、表演全方位训练和包装，你看那胸肌，练过的都知道，不下点功夫真不行。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;可怜我们的国产剧，只能动不动请李幼斌和张丰毅等为数不多的老硬汉撑场面，结果被人家的&ldquo;童颜巨肌&rdquo;彻底打败。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/c7e8b4356c75280c1f45f48d0793d9c6.png&quot; style=&quot;height:366px; width:550px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在《太阳的后裔》热播的当下，中方选择洽谈中国版翻拍事宜。其中当然少不了投机的成分，但是！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;趁着这部剧大热，我相信&lt;span style=&quot;color:#A52A2A&quot;&gt;这部翻拍军旅剧一定会得到前所未有的高关注度！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这难道不是一件好事吗?&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/e4b12d0aac53e71790642852223dded9.png&quot; style=&quot;height:157px; width:168px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;我知道！你一定很担心谁会取代&ldquo;宋仲基&rdquo;？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;选角甭担心，我国军旅剧绝对不止许三多！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/20f8d09ba44bd38c2964d027cea99e53.png&quot; style=&quot;height:205px; width:280px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;1号选手 &nbsp;鹿晗&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;特点：体力没问题&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;既然是军旅戏，那么就需要有个好身体。鹿晗作为从韩国回来的男娃，身体里自然植入了本土优良气质之外，在体力上也是无人能及。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/7c22864b4408848ec6e09ee1f01cd130.png&quot; style=&quot;height:427px; width:472px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;2号选手 &nbsp;吴亦凡&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;不穿军装也是个&ldquo;猛汉子&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;再来说一说有着相同经历的吴亦凡。好了，三个字一出尖叫声就已经此起彼伏。身高、身材、颜值没得说，而且人家在《老炮儿》中也奠定了完美的演技，那么还缺什么？答：缺得只是机会吧。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/6922741c492dd53384e2ce5823898836.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;3号选手 &nbsp;杨洋&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;特点：毕竟人家当过兵&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;如果说鲜肉种子选手中切实有军旅生活的，那应该就是杨洋了。作为一名军艺的毕业生，体会过摸爬滚打生活的他如果演起来应该是信手捏来。瞧这一身的军装架势，腰板儿挺得比标尺都直，英武得比起特种兵也是不输。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/b040d6e8b660890a3f2ba074bdd24dfa.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;4号选手 &nbsp;李易峰&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;特点：鲜肉里的演技担当&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在电视剧《麻雀》 中李易峰演起了双面特工，这超高难度的走心戏可是比简单的特种兵难多了好吗。不过请看李易峰的架势，明显是很好的hold住了。背带西装的特工造型，和粗衣麻布的军装造型，都说明了一个又有颜值又会演戏的男孩子，究竟是怎么一番形象。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/ae8b710e5627ad93c69c7973765bd3b3.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;好了，前有《太阳的后裔》带来的超高关注，后有小鲜肉的颜值保证。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;还等什么？一鼓作气，赶紧上啊！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;要我说，《太阳的后裔》翻拍得好！这正是我国军旅剧反击的大好机会！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;就算砸大钱，也要一定拍好了！把韩版比下去！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '20', 'article', '1', '1', '0', '', '2', '11', '30', '3', null, '2016-03-29 10:31:04', '2016-04-14 12:01:59');
INSERT INTO `back_contents` VALUES ('29', '', '你以为拍网剧不赚钱，可惜它们赚爆了！', '/uploads/content/20160414/570f47a6de7cb_54o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; style=&quot;text-align: center;&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot; style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;网剧到底是怎么赚钱的？&lt;/span&gt;&lt;/strong&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(127, 127, 127); font-size:14px&quot;&gt;演员要花钱，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(127, 127, 127); font-size:14px&quot;&gt;道具要花钱，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(127, 127, 127); font-size:14px&quot;&gt;制作要花钱，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(127, 127, 127); font-size:14px&quot;&gt;拍摄要花钱，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(127, 127, 127); font-size:14px&quot;&gt;场地要花钱。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;一眼望去都要钱，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;你以为拍网剧只能亏，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;可事实上它们却赚爆啦！&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;网剧都是怎么大赚的？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0)&quot;&gt;听咖姐算给你听！&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;从2014年开始就有特别多知名的网剧吸引着观众，《万万没想到》《后宫那些事儿》《屌丝男士》《鬼吹灯》《来自星星的继承者们》《废柴兄弟》再到2015年的《爵迹》、《花千骨2015》、《盗墓笔记》、《心理罪》、《太子妃升职记》等许多部网剧在互联网掀起了热潮。不仅播放量屡屡攀高，而且获得网友的一致好评和关注，同时也让大批前台幕后的制作团队进入大众视野，比如万合天宜、芭乐、有妖气。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2014年被称为网剧的元年，2015年网剧发展乘胜追击，取得了很好的成绩。不仅通过电视剧《花千骨》衍生了《花千骨2015》播放量达15.44亿，还出现了&ldquo;反哺&rdquo;现象（网络剧被改编成电视剧、电影），在影视行业渐渐获得&ldquo;主动权&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:20px&quot;&gt;﹁&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:18px&quot;&gt;网剧为什么火？&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:20px&quot;&gt;﹂&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;strong&gt;1&lt;/strong&gt;&lt;strong&gt;短平快&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;时下热播的网剧，单集时长都是几分钟或十几分钟的短片，迎合广大受众在智能手机、平板电脑等移动终端上观看，利用碎片化时间而非大块时间观看视频的需求。这样人们在等公交或上厕所时就可以在手机上看完一集。而这样的短剧也要求制作团队尽量缩短制作周期，紧跟网络热点及网民偏好快速反应、及时更新。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;2&lt;/strong&gt;&lt;strong&gt;多元化&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;无论你喜欢美好的校园剧、幽默的情景喜剧还是夸张至极的穿越剧，都可以在网剧中感受到无尽的的&ldquo;瞎扯&rdquo;但是题材选择上无疑是灵活和多元化。&ldquo;网剧是一种非常自由的载体，它是视频形式中所不可或缺的，甚至会成为未来影视制作的一种方向。&rdquo;是马中骏月提到的一点。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:24px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;3&lt;/strong&gt;&lt;strong&gt;接地气&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有业界人士在总结网剧特点时形象地指出，网剧是&ldquo;什么流行拍什么、什么有观众缘拍什么&rdquo;。尽管相比传统影视剧华丽的场景和大牌明星，网剧在制作及演员阵容上往往更为&ldquo;草根&rdquo;，然而恰恰因为这种人物形象及内容主题上的&ldquo;草根&rdquo;&ldquo;屌丝&rdquo;，使得网剧更亲近受众从而受到追捧。要与观众产生强烈的共鸣，网剧内容必然要紧扣热点、反映网民的真实心境。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;另外，随着影视剧观众群体的更新和成长，当下年轻人也成为网剧的目标受众。90后、95后甚至00后喜欢的恶搞、吐槽、轻松的生活方式也越来越多的融入网剧中，此外，由于他们的接受能力强，也让网剧尺度更大，有更宽的尺度。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:20px&quot;&gt;﹁&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:18px&quot;&gt;网剧怎么赚钱？&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:20px&quot;&gt;﹂&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;目前网络剧的收入无外乎这么几种：&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;第一种传统是广告投入，包括硬广和植入。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;第二种是内容收入，可以作为独立的内容呈现，并且可以进行反向输出。反向输出指将网剧卖给电视台播，甚至有可能到电影院。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;第三是直接的用户收入，比如网站的会员收入。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;第四部分是成本收入。衍生品比如说出版物、话剧游戏等。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;就拿2015年来说，各家视频网站开始探索新的盈利模式，比如会员制、内容收费、衍生品销售、品牌推广等收益方式。去年7月，《盗墓笔记》开放&ldquo;付费看全集&rdquo;模式，被业内视为&ldquo;打开了新窗口&rdquo;。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在互联网不断烧钱的模式基础上，让业内看到了盈利的希望。&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;不过就目前来说，广告植入仍然是一部网剧收入来源的中流砥柱。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;我们以万合天宜的网络剧为例：&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/cdcd10c7e6cf424df8daa9e6c09c3f7a.jpg&quot; style=&quot;height:460px; width:582px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/1fdaf2d45225634af412b6cf580f7139.jpg&quot; style=&quot;height:302px; width:580px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d937e3be8125d06ecff69f54a05d577d.jpg&quot; style=&quot;height:348px; width:585px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;众网剧为了好好hold住广告收入，八仙过海各显神通&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，当我们再回过头去定睛一看，居然发现网剧圈真的滋养出了几朵耀眼的&ldquo;奇葩&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;它们的广告植入软到极点也好，硬到极点也好，这些广告对观众的吸引力甚至超越了正片，惹众人喷饭，引弹幕无数，real魔性。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/ef98d530c2d2fc67d889b9639d0814e4.jpg&quot; style=&quot;height:302px; width:580px&quot; /&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;还记得当年《献宝笔记》里的红牛吗&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;下面有几个经典案例，&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;咖姐要你一起围（tu）观（cao）。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;搜狐派&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;《屌丝男士》里现代都市的背景设定、相对集中的白领受众群、灵活机动的碎片化结构、出众的平台与播放成绩，令它的三大喜剧受到了诸多广告主的青睐。&lt;/span&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;由于是百分百搜狐自制，广告植入的操作也分外便捷，许多品牌都得到了量身订做的&ldquo;段子&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;据《屌丝男士》的搜狐商务团队介绍，项目的招商一般是提前2~3个月推出产品售卖方案，包括赞助席位、资源明细及售卖价格，给予品牌主市场充分的时间来判断，之后按照品牌主特性提供个性合作方案与资源。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;至于《屌丝男士》这类自制项目的剧情植入，&lt;/span&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;搜狐视频方面会配备专门的营销策略团队对客户的brief（简报）进行解读，力图让编剧团队在前期脚本撰写时就能够准确把握客户诉求。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136); font-size:14px&quot;&gt;例如《屌丝男士2》中的一段，大鹏以为自己弄坏了联想专卖店的yoga笔记本，留下钱开溜，之后店员过来轻松把笔记本还原，既符合主角&ldquo;屌丝&rdquo;的设定，又恰到好处地传递了这款产品的特点，是一个将产品融入剧情中的正面案例，相当典型。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/5e3b8cfd8d6377741394893e15f91e17.jpg&quot; style=&quot;height:1429px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;万合天宜派&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;《万万没想到》片头或真或假的品牌赞助，加一句脑洞大开的slogan，是万合天宜最经典也是最知名的广告模式，至今被诸多网剧模仿采用。正所谓，有的人遮遮掩掩，把内容做成了广告，而他们不避不让，把广告做成了内容，当真很6。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/22e7fd16aeb48a5cac273b8b23d32455.jpg&quot; style=&quot;height:324px; width:580px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2988f4524efa91a7d01e38e7effcb8e2.jpg&quot; style=&quot;height:322px; width:580px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;如今万合的各大项目纷纷开花结果，广告主携金而来，除了片头赞助，他们还在片中、片尾开辟了形形色色的广告位。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;《大侠黄飞鸿》的导演马诗歌言道，对于商业合作，&lt;/span&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;&ldquo;&lsquo;来者不拒，多多益善&rsquo;，我们总有办法把客户的需求融入到我们的剧集里边，并尽量保证不破坏观众的观感。&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;的确，在《大侠黄飞鸿》这个不甚正经的民国剧中，深度植入了一款热门手游和一款女性用品，说起来真的是hin穿越啊。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/65e79f534895bc3de1be3bc3fbd3f9a5.jpg&quot; style=&quot;height:1303px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px&quot;&gt;腾讯派&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;《暗黑者2》中深度植入了红牛（功能饮料）、高洁丝（女性用品）、江小白（青春酒品）、魅族手机（电子产品）等品牌，有些甚至成为了推理的线索。相对于褒贬不一的剧情植入，《暗黑者2》的新尝试&mdash;&mdash;中插广告倒是获得了较好的反响，打开一片新天地。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;中插广告，顾名思义，独立于剧情之外，在每集过半时强势插入，由原班演员出演，风格幽默诙谐，内容包罗万象。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有真的产品广告，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/521c9ff44d6cdb29ebf95ebdc1ef3578.jpg&quot; style=&quot;height:1402px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有社区好公民、警察老盆友Darker的公益广告，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/159aed87332d6cb3f499b612880c9572.jpg&quot; style=&quot;height:1049px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;制片人白一骢曾经在采访中坦言，这一季中插的售卖率并不高，一般都是在客户买了一定量的广告植入后免费赠送一、两条。不过&lt;/span&gt;&lt;span style=&quot;color:rgb(192, 0, 0); font-size:14px&quot;&gt;中插相比于传统植入，好处一看便知，即可以尽量不干涉情节、不破坏观众体验&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，非常适合需要营造并保持悬疑、惊悚、高大上气氛的剧情剧。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;经由七年蓄力，一朝爆发，2015年网络剧在题材、制作、点击方面不断进行突破，吸引了诸多资本与从业者，或许广告主们明年也将结束他们的观望，放手与大小网络剧项目进行合作。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;如何让传统品牌客户与网生代观众进行对接，如何真正利用网络剧的灵活机动，摸到盈利的脉络，催生出真正口碑、商业双赢的精品剧，是一个值得全行业思考的话题。过去的广告植入我们这么玩，但今后，希望会有更多剧集出现，给我们更多答案。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*部分内容来源：骨朵网络影视&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '29', 'article', '6', '0', '0', '', '5', '38', '6', '3', null, '2016-04-07 11:42:36', '2016-04-14 15:32:56');
INSERT INTO `back_contents` VALUES ('26', '', '新人上位秘笈：用这几招，红起来挡不住！', '/uploads/content/20160414/570f479bceabe_43o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;红咖文创工场&lt;/strong&gt; &lt;/span&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;微信号 hongkaapp&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;功能介绍 咖姐来了！关注文娱创业，聚焦影视资本，教你立足投资大风口。站的是高处，看的是远方，大局观、投资观、创业观，塑造你的影视行业新三观！&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;千军万马奔艺考，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;千方百计当网红。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;但，有件事你真的想好了吗？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;好不容易挤破头，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;成为网红闯进了演艺圈，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;新人&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;要如何快速上位？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FFFFE0&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16)&quot;&gt;&lt;strong&gt;遇上神剧，红起来挡不住&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在影视圈，有时候看的是命。有的人演了一部烂剧，红了；有的人演了一串好剧，愣是没出头。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;不是每个明星都能有一入行就当主角的好运，他们或多或少都有过辗转各大剧组只为演配角或者毫不起眼龙套的机会，但当碰到一部收视&ldquo;神剧&rdquo;、一个好的角色时，运气就会挡也挡不住！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b7ccc2661e3893f6b60904984e89b855.png&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在这个暑期档，因为《花千骨》、《旋风少女》、《无心法师》等作品的爆红，&ldquo;杀阡陌&rdquo;马可、&ldquo;东方彧卿&rdquo;张丹峰、&ldquo;落十一&rdquo;董春辉、&ldquo;亦枫&rdquo;吴磊、&ldquo;张显宗&rdquo;张若昀等都尝到极速上位狂涨粉的滋味！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/07b0ec601bc16b003144e69b8d16df8e.png&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;选秀综艺总有一款适合你&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;现在选秀综艺那么多，找款&ldquo;国民级&rdquo;的上，立马在全国人民面前混熟脸。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;看看&ldquo;武大校花&rdquo;黄灿灿，人家走的就是这条路。先是去《天天向上》证明自己长得漂亮不靠PS。然后又参加了《一站到底》，检验自己的IQ实力。经过了双重考验，黄灿灿继续打怪升级，挑战热门综艺《奔跑吧兄弟》，靠着上综艺节目，把自己的人气一下子捧上顶峰。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8250c996656ede1728f494cfbbe465cb.png&quot; style=&quot;height:314px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;至于芒果台热捧的呆萌&ldquo;火星人&rdquo;华晨宇，以及《好声音3》夺冠的韩范儿&ldquo;金花&rdquo;张碧晨，也都是成功案例。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d1c1ca8a43cd49fb175a08dfd6ea6e36.png&quot; style=&quot;height:424px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;找个愿意跟你玩儿的人&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;想混好贵圈，找个愿意跟你玩儿的贵人或者愿意带你的前辈，上位速度就蹭蹭蹭往上升！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;《美人鱼》女主角林允年仅18岁，从12万名参赛者中脱颖而出，决选过程堪称过关斩将，包括表情模仿、现场卸妆、鱼尾服t台走秀等奇葩环节，最终6人获得了签订参演协议的机会。而林允气质清新，在接受严格特训后得以进组拍摄《美人鱼》。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/96bc9aa8bc5f0d469165bdc3fa6f9036.png&quot; style=&quot;height:383px; width:638px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;传言中，陈学冬不也是跟新晋导演郭敬明&ldquo;好&rdquo;上之后，从此一发不可收拾的吗？唱歌演戏参加综艺节目样样不耽误。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/066fa9cf149f32eda703f2362b57436e.png&quot; style=&quot;height:365px; width:346px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FFFFE0&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16)&quot;&gt;&lt;strong&gt;给力亲戚少不了&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;老爹带儿子演戏已经不新鲜，李（保田）叔叔，陈（宝国）叔叔，张（国立）叔叔都分别带着自己的儿子同台飙戏，不但如此，也有老子导演，儿子主演的组合，可怜天下父母心，为了熊孩子们，星爸也是拼了！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/1f68a79726fd40308fb3f3e34a03048f.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;要说起影视关系户还要提到郭靖宇和杨志刚，细数郭靖宇导演的几部电视剧，每部剧的男主都有杨志刚，铁打的杨志刚，流水的美女，郭导你对杨志刚也太好了！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/163613a9cb91cfd1c1de627ab8c75363.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:rgb(255, 255, 255); color:rgb(62, 62, 62)&quot;&gt;直到咖姐知道郭靖宇和杨志刚虽不同姓却是亲兄弟，这才顿悟&mdash;&mdash;原来影视圈要想混得好，给力亲戚不能少！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/45cd6f11b3ef2cbf771f58fd9c757161.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FFFFE0&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16)&quot;&gt;&lt;strong&gt;跟名人谈恋爱，想不红都难&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在娱乐圈有这样一群年轻姑娘，凭借那张充满胶原蛋白的脸，快狠准成功扑倒大叔，成为&ldquo;王&rdquo;的女人。比如奶茶妹妹、昆凌、张予曦这3位93后，因为&ldquo;男朋友&rdquo;而在花季年龄就一个箭步攀上人生巅峰，综艺节目不断邀约，名气大涨。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/58f55bba86eb9627d4cdc0b2b413468c.png&quot; style=&quot;height:340px; width:510px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;去年昆凌在参加东方卫视《与星共舞》时，突然宣布退出节目赛程，她强忍泪水说：&ldquo;因为这个月18号要做一件很重要的事，因此做出要退出比赛的决定。&rdquo;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;原来，1月18日周杰伦生日当天，她将与周董步入婚礼殿堂！还有比这样华丽地退赛更能表达自己是&ldquo;人生赢家&rdquo;的方式吗？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/e2811ba859c63ffac921edbc37c31e25.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '26', 'article', '2', '0', '0', '', '2', '5', '9', '1', null, '2016-03-30 09:29:13', '2016-04-14 15:32:44');
INSERT INTO `back_contents` VALUES ('19', '', '就算你是普通人，也能靠当演员发家致富！ ', '/uploads/content/20160414/570f4775bf6e0_05o.jpg', '红咖', '&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;想进演艺圈，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;又怕被忽悠？&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;懂行又靠谱的咖姐来啦！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;教你入贵圈、抬身价，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;分分钟靠演赚钱！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;想进贵圈，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;先要读懂它的&ldquo;地位排名&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;才知道自己要怎么往上爬。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;演艺圈的等级共有9级&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;1 群众演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;2 群特演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;3 跟组演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;4 特约演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;5 角色演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;6 配角&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;7 主角&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;8 明星演员&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;9 明星大腕&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;等级越高，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;收入自然也是水涨船高。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;要混到什么层级，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;才能靠演艺圈混口饭吃？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;演艺圈收入大剧透&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;群众演员&lt;/span&gt;：40元一工（国家规定8小时一工），超过按每小时5元算。 过凌晨24点额外加10元，淋雨，抬轿，哭丧等特殊需要双方协定后加钱。理鬓角10元，刮光30元。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;群特演员&lt;/span&gt;：70元一工，超时按10元每时。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;跟组演员&lt;/span&gt;：剧组自己招聘的，一般4000元左右，提供住宿就餐。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;混到这个层面，你的收入就比较稳定了，一个组拍戏有时一个月就解决了，一年多跟几个组，一年收入个十几二十万没问题。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;特约演员&lt;/span&gt;：又可细分为小特（150-300元）、中特（200-400元）、大特（500-800元），不同等级有不同的表演要求，中特就会有短台词，大特演员则要求有较强表演功底。&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;角色演员及以上的&lt;/span&gt;，就属于有点小星了，剧组会和你单独谈工资。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;从群演开始混，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;能不能迅速在圈里吃香，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;靠的不是脸，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;而是交际能力。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;那些在各个剧组里，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;懂得做人讲话动听的，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在咖姐眼里都属于&ldquo;有钱途&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;想要在圈里好好做人？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;咖姐教你几招。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;第一步：学点表演基础&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;表演专业的学生应该没什么问题，如果你是半路转行，建议先去中戏、北影报个进修班，一年3.5万的学费不要求你有任何基础，虽然不便宜，但学成后再去找戏，你已经甩那些不舍得自我投资的人十万八千里。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;毕竟这一行真要往上爬，靠的还是演技和关系，没有演技，首先你就和一场戏赚八百一千的大特无缘了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;第二步：找机会到组里开混&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;作为专业学院的学生，能享受到最大好处就是会经常有导演去学校挑演员。而且一般老师也会给介绍导演，会把你平时舞台上的表演片段寄给用人剧组。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;对于没有任何专业训练但却热衷于表演的普通人来说，其实最为有效的一个方法，就是去到一些影视基地和拍摄现场寻找机会了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;首先你要准备的是个人资料，上面要写明你的年龄/身高/体重/爱好/特长。最好能附上一张你无冠免镜的照片，千万别拍艺术照，这种资料看的就是你的五官，也别化大浓装。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;要想去剧组拍戏，首先要了解一些剧组主要的驻扎地。当然，在很多影视基地上也有一些演员工会，那可千万不能去。去哪只能影响你以后的发展，因为哪怕是一个小跟班剧组也不会去那选，在那选的都是些只需要一个背影，或者是有什么大场面时用来充人数的群众演员。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;你可以跑龙套，但千万别演群众啊。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;第三步：有人脉就有钱途&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在演艺圈其实最最注重的是人脉关系。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;所以无论你是一个性格多么火暴的人，在刚刚迈入这个圈子的时候请不要得罪任何一个人。尤其是剧组的工作人员，哪怕只是一个小小剧务或者场记都有可能成为你的&ldquo;绊脚石&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;对于一个菜鸟来说，想要拿到角色，其实并不是和导演交流。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在角色方面上，一些戏份比较多的角色都是由有关系的同志们已经预定好了，主角当然是由投资方和导演共同选定的。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;如果你没有人脉，那么你只能捡一些小鱼小虾来吃吃了。比如某个客栈的跑堂的，某个卖花姑娘。又或者是某个教派的小侍女或是小捕快什么的。总之无论角色的大小，只要能说上几句台词，能露上几个镜头。最好是能和主角站一块沾点光。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;想要拿到这些小角色，只有能找到剧组的演员副导了。只有演员副导才负责所有的非主角演员的选拔。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;你说你不仅想填饱肚子，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;还想要出人头地当巨星？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;咖姐建议你，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;看看下面几位巨星的爆红秘诀，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;让你再也不怕被埋没！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/5e3041da47cb9ca28360e7bf59a5ff3c.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;周星驰&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;大家还记着《喜剧之王》这部电影吧，里面的剧情就有许多部分是周星驰当年跑龙套的真实写照。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;当年，周星驰曾经在许多巨制中出现过，有的是还有些动作的角色，有的甚至一直站在主角的后面成为一个背景，当然时不时还会有一些角色能让周星驰能发挥一两句台词的空间。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;不过即使是这样，周星驰每一个动作、每一个表情、每一句对白都还是充满了自己的风格。即使是小角色，也要认真对待，周星驰的巨星之路就是从演一个个小角色开始的。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/2904d0eca34bf83a4a8d1a759b89cb18.png&quot; style=&quot;height:283px; width:340px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;周润发&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;别看刘德华、梁家辉都给周润发当过龙套演员，其实周润发自己也是从做龙套开始发家的。周润发考入无线艺训班之后，和吴孟达等人一起出去找跑龙套的工作，一个小时只能赚25块钱。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;不过周润发当年在跑龙套的同时也不忘宣传自己，他常常把自己打扮一番，守在上下电梯口，见到大腕大人就主动问候一声，这样聪明的做法也自然引起了无线电视高层的注意。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;就这样，周润发一边跑龙套，一边主动打招呼，终于获得了出演主角的资格。此后，《上海滩》的许文强，一炮走红。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/b6eb78e41b3f99e50f6b0d923fafeb93.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;傅彪&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;被业内人成为&ldquo;戏痴&rdquo;的傅彪，也是从群演开始的。当时傅彪颜值不高，一开始当群演没什么戏接，他就跑去当场务，在冯小刚的剧组搬箱子。晚上睡觉时傅彪会打呼，其他人就在他嘴里塞臭袜子，但傅彪没有离组，反而是干活最卖力的那一个。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;久而久之，冯小刚注意到这个卖力干活的场务，决定安排个角色给他，以示感谢。这个角色，就是后来《甲方乙方》中的张富贵。一上戏，冯小刚发现傅彪还颇有天赋，就让他加入&ldquo;冯家班&rdquo;，从此一步步崭露头角。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;对于许多北漂群演来说，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;王宝强就是他们的奋斗目标。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;而他曾经蹲过的北影厂门口，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;也成为了北京戏漂必须膜拜的地方。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/8d431055397c7509a14c981c381a0cef.png&quot; style=&quot;height:328px; width:640px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;王宝强从小家境不好，8岁时，他看了《少林寺》后想去演戏， &ldquo;以后让我在农村待一辈子，种一辈子地，有什么意思？&rdquo;在他看来，自己一没有念书的智商，二没有深造的经济能力。有理有据父母无法反驳，8岁的王宝强便去少林寺做俗家弟子，一做便是6年，随后便揣着几百块钱便北上做北漂实现自己的演员梦去了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/a402acdb7245a4882a48637aac27beee.png&quot; style=&quot;height:220px; width:364px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;因为有武术功底，常常做动作替身，他说自己曾在一部电影里，需要从两米多高的防火梯摔倒在水泥地上，他就爬上梯子直接跳。最后收到的是当天50块钱的报酬，不过，就是这种拼命三郎的范儿，让很多找群众演员的中介，知道了有个不怕死，敢真摔的替身叫做王宝强。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/ccb43b5470d63bc32446c0ea6adb9c4e.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;没活儿的时候，王宝强会去做工地工人，用工钱去冲洗自己的照片发给大小导演，为的只是自己还想做演员。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;2004年，王宝强获得了冯小刚电影《天下无贼》中傻根的角色。观众记住了淳朴、老实、傻得可以的王宝强。如果说一个演员不能被角色定型拘泥，但我觉得前提是：你得有个让人记得住的角色。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/13a63a78fd5d5ae09d54da37f41397e9.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;看到这里，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;或许你心里总有个声音：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&ldquo;到北京当戏漂哪有那么容易？&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;走任何一条路，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;都需要付出努力。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;但咖姐知道，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;有些梦，我们总也忘不掉。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;有些事，再辛苦我们也想坚持。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;长按下方二维码关注咖姐，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;让你的演艺之梦，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;少走一些弯路。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '19', 'article', '2', '1', '0', '', '6', '12', '11', '3', null, '2016-03-24 16:38:27', '2016-04-14 15:32:08');
INSERT INTO `back_contents` VALUES ('17', '', '就算韩剧版权费3年涨了300倍，还是很便宜！！', '/uploads/content/20160414/570f150466465_52o.jpg', '咖姐', '&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;最近坊间总是流传着这样一种说法&mdash;&mdash;躲过了《继承者》、《来自星星的你》，最终还是没躲过《太阳的后裔》！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;最近一部《太阳的后裔》，给爱奇艺带来了4亿播放量和百万会员，明眼人都看得出，爱奇艺这次又做了场好买卖。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;可是你造吗，这部让妹子们舔屏的现象级韩剧，&lt;strong&gt;其实很！便！宜！&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/82dfd0f8fb4f30f6c814dfdf416a47eb.png&quot; style=&quot;height:328px; width:440px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;咖姐来帮你算一笔账：爱奇艺对《太阳的后裔》的收购价是一集23万美元（约150万元人民币），这是什么概念？《琅琊榜2》还未开拍已经开出了800万一集的价格，《后宫如懿传》的网络版权售价是单集900万元！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;算下来，90集《后宫如懿传》的网络销售价格超过了8亿元！而《太阳的后裔》总购买成本不过2400万元，连《如懿传》的零头都不到，是不是很良心？！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/07e74399eec84000ea588c076a808080.png&quot; style=&quot;height:224px; width:224px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;更让人跌破眼镜的是，《太阳的后裔》并没有被贱卖，事实上它已经争气地拿到了史上最高价！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;三四年前，韩剧在中国的网络转播权每集仅1000-3000美元，到了2013年却迅速突破单集1万美元，而都教授的《来自星星的你》，一集也不过3.5万美元。2014年5月《Doctor异乡人》8万美元/集，7月《命中注定我爱你》12万美元/集，9月《对我而言，可爱的她》20万美元/集。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这么一算，&lt;strong&gt;韩剧出口中国的版权费三年涨了快300倍&lt;/strong&gt;，比起来天价学区房简直不算什么！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;更让人大跌眼镜的是，&lt;strong&gt;即使涨得不要不要的，跟国产剧比起来，韩剧依然还是便宜到哭！&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/76f214eac396e92ec861b69946c28463.png&quot; style=&quot;height:206px; width:500px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;《太阳的后裔》的成功，带来的不仅是利益，更创造了一种全新的商业模式，同时也体现了中国资本家的足（cai）智（da）多（qi）谋（cu）。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/84b2ec672cbbc83ec57ede557fe73ab7.png&quot; style=&quot;height:456px; width:501px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;该剧韩国制片方仅出口中国的费用就几乎收回了因海外取景和事先制作而投入的巨额制作费，爱奇艺作为独家播出平台仅会员费的收入早就超出购买版权的成本，而其背后的中国资本华策影视又因同占该剧上下游的投资，达到了&ldquo;双吃&rdquo;的效果。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;高，实在是高！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/e0550a7bf342cebf666696eb4b44e6c4.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;《太阳的后裔》成功之后，下一个风口在哪里？有人说是中韩合拍，毕竟既能满足政策要求，也能达到韩剧效果。但其实这几年来中韩合拍剧集一直不少，却无一爆款，可见中国观众对于&ldquo;中韩混血&rdquo;其实并不感冒。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/3f5894b306d4cb98ab9b21ca26f63530.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;相较于中韩合拍，&lt;strong&gt;或许中方投资全韩国班底更能引发关注&lt;/strong&gt;，但这背后需要有强大的韩国公司与团队配合。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;所以，近年来中国资本越来越渗透至韩国，华策入股了VEW，搜狐注资了韩国keyeast娱乐传媒公司，QQ音乐宣布与拥有BIGBANG、2NE1等超人气团体的韩国YG娱乐展开音乐方面的战略合作，阿里则投资了SM。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;或许巨头们也都发现了，眼看着国内大IP被捧成天价，不如转战韩国，利用韩剧对女性市场的精确把握，爆一款，赚一款！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/e553b8a651acf07918dff23626bd9f0b.gif&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n', '17', 'article', '2', '1', '0', '', '1', '33', '16', '3', null, '2016-03-24 09:41:38', '2016-04-14 11:57:00');
INSERT INTO `back_contents` VALUES ('18', '', '&ldquo;水军&rdquo;是怎么&ldquo;捧红&rdquo;一部影视作品的？', '/uploads/content/20160414/570f14f6aeef6_38o.jpg', '咖姐', '&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;说一件趣事。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;《万万没想到：西游篇》上映前，有人发现在《唐人街探案》的豆瓣评论中出现了不少《万万》的好评，被怀疑是&ldquo;水军刷错了片子&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;因为这件事，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&ldquo;&lt;/span&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;水军&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&rdquo;再次成为热门话题。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;有趣的是，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;与此相对应的另一个词&ldquo;&lt;/span&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;自来水&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&rdquo;，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;也是出自西游题材的电影。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;《西游记之大圣归来》创造了 9.56 亿的内地动画电影票房新纪录，带起了一阵久违的国产动画讨论热潮。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;值得注意的是，在《大圣归来》热映时，出现了一个名叫&ldquo;自来水&rdquo;的词&mdash;&mdash;是指看完觉得电影好，完全凭自己意愿推荐电影的人，与传统&ldquo;水军&rdquo;大不相同。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;观影者爱喝电影自来水，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;正如他们厌恶水军的虚假影评。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;但无法否认的是，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;水军确实存在，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;甚至成了电影营销&ldquo;标配&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;今天咖姐就来带你看看，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&ldquo;水军&rdquo;是如何工作，&lt;br /&gt;\r\n又是如何&ldquo;捧红&rdquo;一部影视作品的？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/0f37b23918152ae39bbbfc0ef95598b5.png&quot; style=&quot;height:212px; width:496px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;电影什么时候会动用水军？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;一般而言，本身内容还不错的影片不会一开始就动用水军，更多使用到水军的是集中在影片上映三天到一周之内，口碑若不好，会试图紧急找&ldquo;水军&rdquo;支援一下。比如当年的《王的盛宴》、《鸿门宴》、《一九四二》，当时《王的盛宴》因豆瓣评分不高，其宣传人员为了试图挽救曾公开宣称是被&ldquo;水军&rdquo;抹黑了，为了抵制黑水军的恶行，他们不得不找来水军为自己&ldquo;洗白&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这个说法看起来像正当防卫，但这种行为本质上仍是不正当的市场竞争手段。业界和观众心里自有论断，尤其在类似的事情重复发生时，即使最终赢得了票房，在观众心中的口碑也不会因&ldquo;水军作业&rdquo;而动摇。去年由陆川执导的《九层妖塔》获得了超过 6 亿多的票房，但豆瓣评分仅为 4.3 分，口碑也不行。有八卦的网友爆料称，在该片上映的后半段时间，该片的官方微博和陆川导演的官微又出现了大量刷&ldquo;好评&rdquo;的水军。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/28cd3a05bf9d64c40640c2a03e74a854.png&quot; style=&quot;height:519px; width:331px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;至于是不是每一部影片都会用到水军？事实上，真正会大量使用水军的项目也都是些小成本制作，本身片子质量不太好的。一位从事电影营销 2 年多的人士表示，&ldquo;导演和制片人对于自己的片子大体上都是盲目自信的，没有人会觉得自己的片子不好，像一些大导演就更加不用愁了。说实在的，有时候我们做这些效果出来主要还是为了取悦片方，而不是做给观众看的。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;水军为谁工作？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;有一种说法是，&ldquo;水军&rdquo;服务是电影营销环节里的一项标配，通常为了在说法上听起来不那么&ldquo;灰色&rdquo;，业内习惯统称为&ldquo;口碑营销&rdquo;。而一般，手中常备&ldquo;水军&rdquo;资源的一般有三类：片方，电影营销公司，专业水军服务机构。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;最近帮几部热门影片的主演做过微博刷好评服务的一位水军说，一般影视项目的服务周期是 2 周左右，最近他们做的一单是 2 天刷 4000 条评论。他们中比较&ldquo;专业&rdquo;的做法是，在活儿做完之后，都有截图保存，按量结算费用。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;不只单个影视项目有这类需求，一些明星个人为了自己的品牌形象，对水军的需求量也很大。上述这位水军还爆料称，同行里最近有人刚替刘涛、杨紫做过类似服务。他们都有自己主演的新片在映，分别是《芈月传》和《诛仙》。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/d1652027b7c54d325cc2f4e9a9c07fc6.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;水军最爱哪个平台？&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;相比起豆瓣、时光网，其他像微博、微信、贴吧这类平台的性价比相对更高。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;一位淘宝&ldquo;水军&rdquo;服务卖家就对刷豆瓣评分表现出些许抗拒。&ldquo;像刷豆瓣评分的活儿，他们有时会看情况来接单，比较复杂，出得起价的不多。&rdquo;他还直言，自己的团队习惯了赚快钱，通常光是做微博、贴吧的关注、转发、加粉、灌水等服务的收入也是很可观的，没必要接一些吃力不讨好的活儿。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;一位从事电影营销多年的人士说，刷电影评分的服务是大部分客户（片方）都会提出的要求，而他们一提供的平台服务主要是微博（要求上热搜、上话题榜前几）、百度指数（要求一周出现一个高峰值）、微指数等这些，像豆瓣电影和时光网的刷评分、评论的门槛相对高，投入和回报基本不成正比，不如在微博找大号刷软文，造话题，再找一些水军来灌水效果会来得更明显。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在这一点上，大多数水军跟营销宣传人员的意见一致。&ldquo;很多影视公司或者电影营销公司现在都还是以微博为主要阵地，尤其是还涉及到一些明星个人的品牌营销，他们都不太考虑别的平台。微博上有大V、有媒体、有观众，多开放啊，要造话题、要转发，这些互动都是看得见的，性价比也高。&rdquo;一位水军行业的从业者说。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/d1da4c823e529a366838f766a28ffdf8.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;当水军，也是有贫富差距的&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;如果你在淘宝搜索&ldquo;水军&rdquo;、&ldquo;刷粉&rdquo;等关键词，可以看到数百个提供服务的卖家可选。有一些会直接询问你需要的服务再给出报价方案，有些则直接发你一份公开报价。针对各类服务都有标准套餐和浮动套餐可选，微博、微信、QQ 空间、视频网站等一切你想得到的社交网络平台的服务都有人承接，并且有明确标价。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;这里有一份相对折中的报价&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;微信阅读量 20 元换 1 千&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;5 元换 100 个赞&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;朋友圈转发 1 元一条&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;新浪微博40 元换 100 个转发&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;V 号/达人转发则40 元一条&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;100 万粉丝以内的 V 号转发价一般 500 元以内&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;转发价一般比直发价便宜 60&mdash;100 元&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;数百万粉的价格600 元到一两千的都有&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;所谓正规的&ldquo;水军&rdquo;团队大致可分为两类，一类是三五个人到十几个人规模的临时团队，据说有些为了赚快钱，把价格降到业内最低，俗称&ldquo; 5 毛党&rdquo;，但如果接单不稳定，团队很容易就分崩离析了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;一些更&ldquo;专业&rdquo;的水军通常在全国各地建有十几个微信群的专业团队，有统一管理标准，从上到下分级（比如&ldquo;特种部队&rdquo;、&ldquo;各群管理者所在的总司令部&rdquo;、还有专门负责培训、行政等工作的，以及从 1&mdash;10 按编号划分的执行队伍）各有代号，分工明确。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;总体而言，从事这个服务的人群大多是在校学生、或已婚、赋闲在家的女性为主。一个&ldquo;水军&rdquo;服务机构的管理者就如此声称自己做的不是微商，不是传销，而是帮助中国未来数万身居二三线城市的全职&ldquo;妈妈&rdquo;实现在家就业。按照他们团队的收入水准，一般普通员工的收入平均在 600 元，小组长级别的在 2000 元，中层管理员则在 4000 元&mdash;6000 元不等，月收入过万的都属于核心高管成员，一般控制在 5 个左右。（按照机构的大小，人员配比又有不同。）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237/cms/public/uploads/images/a583a9e90ac4dfa934e1bb13e99c52a3.png&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&ldquo;水军&rdquo;能给票房带来多大影响?&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;不得不说，还是有相当大的一部分人会因为影评和评分去选择看哪部电影，像一些视频网站、智能电视盒子甚至在内容分区上也设置有类似&ldquo;豆瓣高分专辑&rdquo;的专区，这些对票房的刺激作用是存在的，但具体能影响多大，至今没有可以衡量的标准。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;甚至有时候，大家并不是一味地只看高评分电影，还存在一些怪现象，比如当年的《富春山居图》上映后差评口碑几乎呈一边倒，一些观众反而抱着要亲自鉴定&ldquo;究竟有多烂&rdquo;的心态走进了电影院，以至于该片的最终票房收益接近 3 亿元。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;在这种种行为背后，是市场规则被破坏后呈现出的&ldquo;畸形&rdquo;状态。实际上，从中笑到最后的人很少，大多数人似乎都成了受害者，不只片方，甚至波及演员。比如，因主演《富春山居图》的刘德华就曾被粉丝吐槽，在一次发布会上，刘德华在被问及相关问题时曾起身向观众连说三遍&ldquo;对不起&rdquo;，并表示：&ldquo;选片不力就是我最大的缺点！因为我是一个高估自己眼光的人，总以为无论什么剧本到了我手上都会变好，下次我做好一点。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;&ldquo;尽管水军行业也在不断与时俱进，利用一些更讨巧的技法试图跟时代产生新的接轨，他们也有向建立有水军防御机制的平台发起挑战，但它们作为营销环节中占比很小的一环，在不同的阵地上起到的末端影响仍是很小的。在一些雇佣过水军服务的宣传人员中，用过后悔的占比更多，雇佣他们的人也觉得假，因为水军群体的总体质量是不高的。&rdquo;一位做艺人宣传的人士这样说。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;一位影视行业的从业者对此观点表示了赞同，他认为，刷影评的&ldquo;水军&rdquo;无论再怎么专业，其操纵手法都还是比较机械的。这两年电影行业蓬勃发展，看电影的人越来越多，大家选择去看一部电影的参考标准也更多了。虽然看分数去看电影的人大有人在，但那一定不是唯一标准。 对于片方或宣传方来说，与其动用水军，不如在正规的营销宣传物料上花心思，比如精美的预告片、剧照、衍生品等。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:宋体,simsun&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '18', 'article', '2', '1', '0', '', '1', '16', '12', '2', null, '2016-03-24 10:01:39', '2016-04-14 11:56:43');
INSERT INTO `back_contents` VALUES ('27', '', '都当上了大明星，为什么他们偏要转行当导演？', '/uploads/content/20160414/570f308f74620_23o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;h2 style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;近年来，&lt;/span&gt;&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;明星转型导演已然成风，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;有些作品在票房上甚至彻底压倒科班出身的导演。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;苏有朋导演的《左耳》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8a6586e39be819d9e9e2b66963a170bf.png&quot; style=&quot;height:261px; width:567px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;br /&gt;\r\n&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;邓超导演作品《恶棍天使》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2b5b362d3101117deea311f14cce09be.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;虽然因狂刷微博掉粉16万，&lt;/span&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;但就票房来看成绩还是不俗的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;陈思诚导演作品《唐人街探案》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f1dd5cfd1d3cc6c01503b9a79a122364.png&quot; style=&quot;height:237px; width:562px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;明星转型当导演接连收获好成绩，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;让越来越多的艺人看得心痒。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;咖姐&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;带你看看，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;2016年&lt;/span&gt;明星导演榜还会有谁？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;林心如自导自演电影版《东宫》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/c23b897880af5bbfed2e5df6808f70d0.png&quot; style=&quot;height:225px; width:544px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;据报道此剧是自《倾世皇妃》和《秀丽江山之长歌行》主演兼制作人身份之后林心如自导自演的又一力作。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;王宝强导演作品《大脑天竺》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/1bbd9842482d428b37e9a09a5a6574cf.png&quot; style=&quot;height:216px; width:567px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/adcc760380e448cc2593d14f3d74f920.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;自去年底，王宝强透露自己将首度跨界当导演，远赴印度拍摄《大闹天竺》。《大闹天竺》主打自己最为擅长的喜剧类型，将打造成一部现代版《西游记》。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;钟汉良导演作品《沙漏》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8a629f9f3254ff61556bfbb9ad9c18d6.png&quot; style=&quot;height:314px; width:545px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;影片由饶雪漫担任编剧、韩寒担任监制，不少观众惊呼：&ldquo;这导演颜值真高！&rdquo;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;姜武导演作品《发小儿》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:sans-serif&quot;&gt;▼&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d024b6b8a48f97aced0ba4f901c24147.png&quot; style=&quot;height:255px; width:554px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;据悉将于春节后开拍&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;蔡康永导演作品《吃吃的爱》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;span style=&quot;font-family:sans-serif&quot;&gt;▼&lt;/span&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/9d82a6aa1b2114b585a678bc6b7b2373.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;张洪量导演作品《广岛之恋》&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;span style=&quot;font-family:sans-serif&quot;&gt;▼&lt;/span&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/267836d0783e17b158c7d0ae4452a223.png&quot; style=&quot;height:258px; width:556px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;早在2012年徐峥执导的《泰囧》票房大卖12.6亿，2013年赵薇执导《致我们终将逝去的青春》创下票房奇迹。开始明星转型导演已蔚然成风。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/74a0414e34ba823c2bde7d2b0146461a.png&quot; style=&quot;height:376px; width:570px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;就在其他人还在苦苦追赶着这股潮流时，赵薇已将视角转向其他领域，打算执导动画片！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/638c78679e1e876987aa1a56dd76e514.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(85, 85, 85); font-size:14px&quot;&gt;日前，阿里巴巴影业CEO张强在武汉参加2016年中国电影长江论坛时透露今年将拍摄动画片《还珠格格》，由赵薇担任该片导演。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;明星扎堆&ldquo;导演梦&rdquo;的背后，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;到底是为了啥？&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;遭遇瓶颈，还是演而优则导？&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;我们从赵薇、徐峥、杨采妮、邓超等例子来看，转型导演的多是娱乐圈里中在原有领域已颇有建树，却苦于难以突破瓶颈，因此，转型当导演，或多或少能解决他们的瓶颈问题，演而优则导，则是这个圈子另外一种趋势。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b7bce0e35b6362498ec03471d7fba340.png&quot; style=&quot;height:334px; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;徐峥近年来在导演领域也已经风生水起了，但他表示：&lt;/span&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&ldquo;这个年纪当演员，很多导演已经不会主动找他们主演电影，也很难遇到合适的剧本，与其继续面对尴尬，还不如升级当导演，为自己拓宽演艺事业的版图。&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;因此就有一大批明星希望转型。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/cf6734ea769e76ec0344ee7bf787ee06.png&quot; style=&quot;height:300px; width:450px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;王宝强在谈到自己转型当导演的原因时就直言不讳：&lt;/span&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&ldquo;这些年最大的感受就是导演的权力太大，在片场演员就是孙猴子，再大牌也蹦不出导演的手掌心&rdquo;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;。&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;想升级自己也是很多演员目前的心理。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;另一个原因，做生不如做熟。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;演艺人员转型可以有很多种，有跨界入互联网企业的、有转型做生意的搞投资的，但为何大家都对当导演趋之若鹜？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8429713144af07c8a4e248b65fe90c49.png&quot; style=&quot;height:400px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;明星做导演却拥有天然优势，这毕竟是本专业的事。&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;从演员来讲，多年的演艺经验让他们对导演工作比外人熟悉，再有就是拥有，丰厚的人脉资源。在演员、监制等方面，艺人都可发挥优势。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;明星的光环，影片自带的&ldquo;卖点&rdquo;。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;而从投资方和发行商的角度来看，比起扶植新导演，与明星导演合作的风险更低，明星自身的人气所引发的话题及市场号召力，远比一个年轻导演来得更强。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;当然，也不是所有明星都有着一个&ldquo;导演梦&rdquo;，很多时候，电影公司的推波助澜也是明星走上导演路的一大原因。越来越多的电影公司不再有耐心去培养新导演，而是纷纷邀请明星当导演，甚至不惜牺牲作品的质量。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在票房丰收的同时，伴随的争议也一直从未间断，质量欠佳、拍完一两部就无以为继，都让不少人对其背后动机产生质疑，&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;拍电影，拍的到底是自身的电影梦？还是看到时下电影市场火热，钱不捞白不捞地玩票？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;都说不想当导演的不是好演员，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;但并非每个好明星都适合当导演。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;事实上，明星跨界投资失败的案例也不在少数。不是每个好明星都是好导演。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/626267003ca2c9b2852031549abcc876.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;不得不说的有周董，在音乐事业上经久不衰，第一部导演作品《不能说的秘密》反响不错之后，再试水影视剧 《熊猫人》却收视惨淡，后来执导电影《天台爱情》也反响平平；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/c99123b5d638579843e13b505ab5744c.png&quot; style=&quot;height:400px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;何炅人缘颇佳，一拍电影就吸引了大批明星助阵，但依然难掩其导演处子作《栀子花开》的口碑争议；&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/ad6d66848ace5bd824997cff1a7de0b5.png&quot; style=&quot;height:459px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;章子怡是国内一线演员，但其监制的《非常完美》、《非常幸运》反响一般，去年底，由其担任制片人的《从天儿降》更是口碑不佳，让人惊呼：&ldquo;怎么会这样？&rdquo; &nbsp; &nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;明星拍电影，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;也不是百试百灵。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;专业素养&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;国外明星转型当导演的成功案例不少，但他们多数都是先 从基层角色开始锻炼。反观国内的明星导演、监制，缺乏专业训练，临场上阵，其质量可想而知。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;心态浮躁&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有人带着圆梦的心态，玩一两部戏就走人；换句话说，很多明星还是希望更多地留在台前，而不是幕后，尤其是在自己正当韶华、光彩照人的时候。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;对于明星转行导演昙花一现的现象。&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;江小鱼指出：&lt;/span&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&ldquo;真正具有导演才华的人其实微乎其微，有的明星可能就是觉得导演没自己想的那么好玩，就不玩了。&rdquo;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;而且，试过一次之后，明星就会深知做一个成功的导演，仅有资源和帮衬是不够的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;朱时茂说，演员只需要把自己的角色演好就没事儿了，但导演不一样。&lt;/span&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&ldquo;演员真正想要把导演这件事儿做成职业的话，是需要下苦功夫的。如果没有专门研究过导演这门学问，不了解影片美学，把握不了风格，就拍不出理想的效果。&rdquo;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;明星要成为好演员，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(172, 29, 16); color:rgb(255, 255, 255); font-size:14px&quot;&gt;必须做对3件事。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;1、选择合适的剧本；所有明星转行做导演，几乎都有一个共同的契机，就是遇到了好项目。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;著名娱评人鸿水建议道：&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&ldquo;演员做导演一定要有想法，而且要选择自己熟悉的题材，这个题材还得适合市场。同时明星不是专业导演，不要什么题材都去尝试，连冯小刚都是拍了多年喜剧，才敢去拍战争和悲剧电影的。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;可见一个好的题材才是转型成功的前提条件。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2、搭建好的班底。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;搭建好的影视剧组班底，是能否成功完成好制作的第二要素。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;3、而更重要的是淡化自己。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;朱时茂转型做导演感悟说：&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;&ldquo;一个人的精力是有限的，又导又演肯定现场忙乱，完全地诠释自己的想法就会很困难。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;如果想两全的话必定一个人的精力是有限的，就算再有活力有拼劲，顾得了一样，必定另一样要完美是很难的。所以明星必须理性，忘记自己的光环，才能专注做好导演。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16)&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;明星转型做导演成绩斐然是好事&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;但在这一热门现象的背后，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;明星也应该保持清醒。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;有人冲着快钱而去，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;希望靠着自己还有点影响力赚点票房，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;却缺乏对导演这一行业的敬畏之心。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;在此咖姐奉劝各位想&ldquo;导&rdquo;演员，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;珍惜观众对你的信任，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;带着诚意做好作品，&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(172, 29, 16); font-size:14px&quot;&gt;切勿透支自我信誉。&nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_tool&quot; id=&quot;js_toobar3&quot;&gt;\r\n&lt;div class=&quot;media_tool_meta tips_global meta_primary&quot; id=&quot;js_read_area3&quot; style=&quot;display:none;&quot;&gt;阅读&lt;/div&gt;\r\n&lt;a class=&quot;media_tool_meta tips_global meta_extra&quot; href=&quot;javascript:void(0);&quot; id=&quot;js_report_article3&quot; style=&quot;display:none;&quot;&gt;投诉&lt;/a&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_area_primary sougou&quot; id=&quot;sg_tj&quot; style=&quot;display:none&quot;&gt;&nbsp;&lt;/div&gt;\r\n', '27', 'article', '2', '0', '0', '', '4', '9', '22', '1', null, '2016-03-30 17:29:52', '2016-04-14 13:54:27');
INSERT INTO `back_contents` VALUES ('25', '', '低成本网剧如何搞定宣发？最靠谱的就这三条路！', '/uploads/content/20160414/570f15e1997a4_33o.jpg', '咖姐', '&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2015年网剧井喷，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;全年355部轮番上阵。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;只不过咖姐忍不住要问一句：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;这么多网剧上线，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;为什么为人所知的却寥寥无几？&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8c53e3cbcbcab7d1d7cfa8a3f63231e9.jpg&quot; style=&quot;height:394px; width:500px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;宣发，&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;是网剧团队最遗憾的所在。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;网络剧遇到的情况和几年前电影遭遇的情形很相似，制作团队一股脑扑上去做内容，好容易拍完做完要上线了，才发现没有渠道把心血之作送到观众面前。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;对很多创作者来说，宣传发行都是流程中最遗憾的所在。有些团队有发行意识，却因为没有经验，踏上雷区或是被忽悠多花钱；有些团队没有专业人员，明知发行的重要性，却没有能力组建宣发团队；有些作者有艺术理想但能力有限，作品不够好，拿不到推广资源；有些团队经费紧张，光是制作就已经砸锅卖铁，更别说宣传发行。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;那么对于第三方网络剧而言，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;究竟应该如何在网络发行？&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;你有三条路可以走。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;覆盖式发行：培养IP，寻找变现机会&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作为内容生产方，核心诉求就是内容传播的最大化。要想最大化，就必须多渠道覆盖。只有第三方全网发行覆盖人群最大，才利于培养IP，拥有更多变现机会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;网剧可基于自身优秀的内容，通过全平台、多维度媒体的交叉推广合作，短时间内迅速增大曝光量、积累粉丝、提升影响力。以此发展潜在的粉丝电商、IP衍生价值。特别是一些游戏类网剧、动画系列剧等强IP可变现内容，如果依靠单一视频网站渠道，在视频网站都还没有实现盈利的时候，内容生产者想要从中建立自己的商业模式，是相当困难的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有些创作者担心非独家拿不到好的推荐位，其实不必过于心焦。优质内容就算全网推广，也能拿到比较好的资源。虽说视频网站为标榜独特性排斥全网发行，但几乎所有网站都存在缺乏优质内容的状况。&lt;span style=&quot;color:#A52A2A&quot;&gt;如果有创作者倾向独家，也不要急在第一季，第二季才是最好的选择。&lt;/span&gt;因为这时，你已经全网试水，用好品质打响业内知名度，获取最大范围的受众认知，议价权和商业介入的可能性都会大大提升。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/9209689441fddde81deecb1476a71e26.jpg&quot; style=&quot;height:436px; width:640px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;比如早期&ldquo;飞碟说&rdquo;，不与任何一家视频网站独家合作，单单凭借优秀的内容，在多家视频网站全网发行的同时，培养自身粉丝，通过自身与许多品牌的商业植入合作发展壮大，成为Motion动画一哥。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d855a19ffadb1eacacfbf39bd7db732e.jpg&quot; style=&quot;height:252px; width:448px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;多体位发行：宣发同步，量身定制方案&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;多数创作者以推荐资源换独家发行，以为作品上了推荐位就完成了发行。然而，这其中暗藏玄机。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;首先，相较于平台出品的自制内容，&ldquo;独家内容&rdquo;只是抱来的孩子，并不能给到顶级推广资源。其次，所有平台对&ldquo;独家内容&rdquo;的发行都只是&ldquo;有发无宣&rdquo;，除了推荐位，最多辅助微博、微信推广，这是远远不够的。如果没有大量的活动策划和推广经费，《小苹果》的火爆神话是难以实现的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f382ab8bac86c2edfe61e898557d0ed7.jpg&quot; style=&quot;height:370px; width:600px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;专业的宣发，可以有效弥补播出平台&ldquo;有发无宣&rdquo;的缺憾；通过定制发行方案，使网剧的传播效果最大化。&lt;/span&gt;很多网剧开始关注宣传造势，因为越来越多创作者发现即便作品拿到最好的推荐位，拥有非常棒的收视和口碑，如果宣传不到位，IP依然难以形成。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;只有宣传和发行同步，品牌打造才能事半功倍。根据近2年《盗墓笔记》、《暗黑着》、《心理罪》等独家网剧的宣传情况，可看出几乎所有知名网剧都立足网络，同时采用多种形式、多个纬度的立体宣发，比如：&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;A 及时创建微博、微信等&lt;span style=&quot;color:#FF0000&quot;&gt;官方自媒体账号&lt;/span&gt;，引导粉丝沉淀。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;B 正片发行前推出&lt;span style=&quot;color:#FF0000&quot;&gt;预告片、主题曲&lt;/span&gt;等，预热市场，为发行蓄势。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;C 采购推广资源，配合&lt;span style=&quot;color:#FF0000&quot;&gt;剧集内容和时下热点&lt;/span&gt;，策划话题或事件营销。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;D 配合剧集发行，在不同时间节点发布&lt;span style=&quot;color:#FF0000&quot;&gt;宣传稿&lt;/span&gt;，策划主创和品牌曝光。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;E&nbsp;举办&lt;span style=&quot;color:#FF0000&quot;&gt;线上、线下活动&lt;/span&gt;，增加活跃粉丝，增加粘性。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;F&nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;制作周边和相关手办&lt;/span&gt;，开发IP价值，探索商业可能性。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;G&nbsp;公布&lt;span style=&quot;color:#FF0000&quot;&gt;发行总结&lt;/span&gt;，适当公关，增加品牌价值。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;H 关注行业动态，选送&lt;span style=&quot;color:#FF0000&quot;&gt;各大电影节和颁奖礼&lt;/span&gt;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&hellip;&hellip;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;全媒体发行：线上线下联纵，多方位爆破&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身在这个内容井喷的年头，视频网站的资源位是有限的，视频网站主打项目的名额也是有限的。&lt;span style=&quot;color:#A52A2A&quot;&gt;所以除了集中攻克大平台之外，很多其他渠道也可以为我们所用。&lt;/span&gt;比如美拍、秒拍、快手等移动终端的短视频平台；比如今日头条、网易新闻客户端、魔力盒、百思不得姐等各种有视频出口的移动终端；比如电视、广播、影院等传统媒体；比如公交、地铁、航空，分众传媒，户外媒体和运营商线下渠道，等等。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/bc1dc3e926025c48cba48a152bf6e3da.jpg&quot; style=&quot;height:316px; width:490px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;对大多数创作者来说，这些渠道是可遇而不可求的。他们只能一边埋头苦干，一边瞭望远方。这样一心二用，很辛苦，也很低效，因为开辟、维护渠道既耗费精力，有时还可能白忙一场。所以，这里不得不提到第三场发行。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;目前国内的第三方发行为了区别于视频网站，通常会构建自身的发行王国，开拓一些长期合作的多样渠道伙伴，&lt;/span&gt;如上面提到那些。如果说，视频网站利用&ldquo;平台强势推荐，集中曝光&rdquo;的打法为&ldquo;点状爆破&rdquo;。那么，第三方发行公司 &ldquo;线上线下联纵，点线面全方位曝光&rdquo;的打法就是&ldquo;遍地开花&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/0d802a25ad81782d0530b8cb298e1dfa.jpg&quot; style=&quot;height:368px; width:554px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;面对目前优质内容紧缺的现状，一些发行公司甚至可以倾尽力去&ldquo;砸&rdquo;一个爆火网剧。而且相比平台，第三方发行可以帮制作团队精确匹配资源位，代为洽谈品牌合作，用专业能力为创作者争取更多权益。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;近几个月，我们在一些公共场合，公交站、地铁、电影院、机顶盒等渠道，看到越来越多网络剧展示。很多网络剧从视频网站进入各种移动web和各种属性APP。此外，很多网络剧获得了院线级待遇，一系列发布会、首映会、线下活动、庆功会等等，可谓怎么高逼格怎么来。而这些&ldquo;幺蛾子&rdquo;多半是第三方发行公司的功劳。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;人常说，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;这是一个好时代，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;一个不会埋没人才的时代。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;各种渠道、媒体挤破了头，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;想去寻找那些哪怕&ldquo;稍有才华&rdquo;的作者。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;然而很多人喜欢说&ldquo;内容为王&rdquo;，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;却忽略了&ldquo;渠道同样为王&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;金子被埋在地底，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;就永远无法发光。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;而身为金子的你，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;要学会自己破土而出。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;* 内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '25', 'article', '1', '0', '0', '', '2', '1', '12', '4', null, '2016-03-29 22:24:32', '2016-04-14 12:11:24');
INSERT INTO `back_contents` VALUES ('24', '', '当经纪人，让明星替你打工！', '/uploads/content/20160414/570f478af3c5b_26o.jpg', '咖姐', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;从衣食住行到出谋划策，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;每一个成功的艺人背后，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;注定有一个伟大的经纪人。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;内地娱乐圈从来不缺励志故事，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;经纪人也能一跃枝头变凤凰。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/72618269d022f3d0b9542f73f1396e3c.png&quot; style=&quot;height:368px; width:300px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;以内地第一经纪人王京花为例，她从陈道明身边小助理起步，做到橙天拾捌文化经纪公司总经理，18年捧红80位明星，范冰冰、李冰冰、刘嘉玲、杨紫琼都曾被她纳入旗下。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;娱乐圈靠的毕竟是人脉，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;不过没有明星亲戚也别哭，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;咖姐教你曲线救国。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#FFF0F5&quot;&gt;&lt;span style=&quot;background-color:#FF0000&quot;&gt;第一条路：进经纪公司&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;其实现在市面上，有很多经纪公司、传媒公司在招经纪人岗位。这类公司以团队形式经营艺人，以合同方式决定签约年限、收入分成等细节问题。公司将安排下属经纪人为艺人做各种具体工作，这些经纪人一般拿固定薪金。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;进入公司之后，一般从助理职位开始做起，慢慢积累了一些经验特别是人脉，就可以往上爬。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;如果你能够自己去挖掘新人，并将她从无到有捧成明星，那不仅是一种本事，更重要的是让明星为你打工，收入倍儿高。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:#FFF0F5&quot;&gt;&lt;span style=&quot;background-color:#FF0000&quot;&gt;第二条路：当记者&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/e526e5b1d98f6b4431794879fb7e8b64.png&quot; style=&quot;height:367px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;黄晓明的经纪人黄斌，曾经是《新闻晨报》的电影记者，他总跑第五代导演口的，一来二去跟陈凯歌非常熟，后来跳进电影圈，2010年他负责陈凯歌《赵氏孤儿》宣传时候认识了黄晓明，当时黄晓明离开华谊正需要一个新的经纪人，就这样开始跟黄晓明合作。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b8154ee93865717cb086c4a5fcb06633.png&quot; style=&quot;height:333px; width:500px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;佟大为的经纪人赵静&lt;/strong&gt;是艺术学院编剧专业毕业，但&lt;strong&gt;毕业后去了报社做了电影记者，然后进入了新浪做了电影编辑&lt;/strong&gt;，在新浪最后的职位是高级编辑，因为一次电影节关系跟佟大为认识了，然后被佟大为高新挖走。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;从上面那些经纪人背景都不难看出来，艺人的经纪人大部分都是记者出身&lt;/span&gt;，记者出身好处很多，首先，很容易和媒体搞好关系，特别一些负面新闻，很容易被压下去。另外，记者思维敏锐能嗅觉灵敏，这对艺人应对突发事件很有帮助。第三，记者人脉广，可以帮着艺人打通关系。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:#FFF0F5&quot;&gt;&lt;span style=&quot;background-color:#FF0000&quot;&gt;第三条路：当伯乐&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;香港著名经纪人陈家瑛，将从北京到香港闯天下的王菲，一手捧为亚洲天后；李小婉在《大明宫词》选角时，差点错过非科班出身的周迅。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;经纪人的眼光是非常重要的，捧红了一个大腕明星，你也跟着成为王牌经纪人。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/fa04e55088bac08eac65bad42600cb04.png&quot; style=&quot;height:404px; width:640px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;首先说说挑选的范围：基本上，&lt;strong&gt;中戏、上戏、北电&lt;/strong&gt;等各大专业院校的表演系学生是经纪人主要的挑选对象。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;另外，&lt;strong&gt;艺人最重要的自然是颜值&lt;/strong&gt;：身高、体重、容貌、是否有观众缘，另外&lt;strong&gt;内在修养也十分重要&lt;/strong&gt;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在接到一个角色后，演员必须在很短的时间里就对角色有准确的把握是需要有对剧本的历史背景熟知、对角色的工作、职位的了解、如果是古装戏、更要清晰的明白当时的礼仪、走路的仪态等。这都要求演员能够做好非常深度的功课。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2774893d5cc481cc467199a633c4bd6a.png&quot; style=&quot;height:351px; width:550px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;strong&gt;当然在挑选艺人的时候，也要关注艺人的人品和心态&lt;/strong&gt;，在这个竞争如动物世界一般的影视圈，怀有明星梦想的新人很多，然而怀揣着一颗感知之心，拥有平和心态，愿意持之以恒的演员却不多。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;所以一个真正优秀、狡猾、资深的经纪人只有对新人的经历做深度了解，才能帮助他们准确定位、包装、打造、宣传，避免新人少走弯路，尽快地被观众认可。找到合适他们的角色和包装、发展、宣传的方向。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;当明星经纪人，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;要懂投资、懂营销更要懂做人，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;八面玲珑样样精通。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;可以说你把这份工作做好了，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;那你做什么都小菜一碟。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;论经纪人的自我修养，&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;看完就一个大写的服！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/cfc5b646767707ee579794041bf592f9.png&quot; style=&quot;height:337px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作为经纪人，需要对艺人进行个人形象定位，个人形象塑造等等，同时还会有危机公关处理，对传播方式，媒介，途径一定是要知道的，涉及内容较广，所以需要掌握的东西也比较多，如&lt;strong&gt;大众传播学，市场营销学，消费心理学，心理学，市场调研&lt;/strong&gt;，文化活动策划自然也就成为了课程之一。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作为一名经纪人，艺人的生活起居，以及&lt;strong&gt;个人职业生涯发展&lt;/strong&gt;都是需要你来规划的，同时还需要对其的财务状况有一个起码的了解，所以&lt;strong&gt;经济学原理&lt;/strong&gt;，&lt;strong&gt;基础会计&lt;/strong&gt;自然也是必须学的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;艺人的工作是由经纪人进行安排和统筹的，自然免不了待人接物，所以需要对一些谈判技巧和礼仪进行掌握：&lt;strong&gt;商务谈判，商务礼仪，商务英语，英语口语&lt;/strong&gt;自然是必不可少的项目。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有了谈判就会有合同，有演出就会涉及版权，所以&lt;strong&gt;艺术商业法规&lt;/strong&gt;是一门非常重要的必修课。如果法律素养不够的话，轻则损失钱财，丢了饭碗，重则锒铛入狱。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;明星经纪人是搞文化产业的，&lt;strong&gt;文化产业概论&lt;/strong&gt;是必修之一吧。文化产业又是一个介于宏观经济和微观经济之间的东东，学起来有点怪怪的。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;现在已经从PC时代过渡到了移动互联网的时代。&lt;strong&gt;电子商务&lt;/strong&gt;风生水起，电子商务必须要会吧。艺人的一些自媒体也都是需要经纪人来把关的。对于&lt;strong&gt;自媒体&lt;/strong&gt;的内容审核，日常的维护，都十分重要。所以商务写作也是科目之一。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;有的人热衷台前，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;也有人甘于幕后。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;在明星闪耀的背后，&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;经纪人也同样值得赞赏。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#000000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;* 内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '24', 'article', '2', '0', '0', '', '2', '3', '12', '5', null, '2016-03-29 19:00:34', '2016-04-14 15:32:28');
INSERT INTO `back_contents` VALUES ('28', '', '【男色】2016娱乐圈小鲜肉来啦！个个帅气逼人，颜值爆表！', '/uploads/content/20160414/570f15b1bfeea_45o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;strong&gt;红咖文创工场&lt;/strong&gt;\r\n\r\n&lt;p&gt;微信号 hongkaapp&lt;/p&gt;\r\n\r\n&lt;p&gt;功能介绍 咖姐来了！关注文娱创业，聚焦影视资本，教你立足投资大风口。站的是高处，看的是远方，大局观、投资观、创业观，塑造你的影视行业新三观！&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;回首2015年，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;外有EXO吴亦凡和鹿晗的强势回归，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;内有《小时代》《古剑奇谭》一帮&ldquo;颜神&rdquo;爆红，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-family:微软雅黑; font-size:14px&quot;&gt;娱乐圈被小鲜肉们强！占！了！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;再看2016年，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;究竟哪位小鲜肉将突围而出，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;成为娱乐圈的下一匹爆红黑马？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(0, 122, 170); font-size:14px&quot;&gt;今天咖姐就为大家细细盘点下，&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;2016年最有潜力成为黑马的小鲜肉们！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;前方&lt;/span&gt;&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;多图&lt;/span&gt;&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;预警！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;赶紧备好纸巾！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(255, 76, 65); font-family:sans-serif; font-size:14px&quot;&gt;▼&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;1&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&nbsp;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;张雨剑&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/4f113fa498de332dfbefe2db15177d7d.jpg&quot; style=&quot;height:953px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：2月9日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：184cm&nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：74kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：上海戏剧学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(172, 57, 255); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《幻城》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(255, 79, 121); font-size:14px&quot;&gt;《余罪》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 209, 0); font-size:14px&quot;&gt;《隐形的翅膀》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 213, 255); font-size:14px&quot;&gt;《琅琊榜》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 169, 0); font-size:14px&quot;&gt;《喋血孤岛》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b339903ad98e35644d175cbf32dcdb78.jpg&quot; style=&quot;height:959px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2011年，在五月天的3D演唱会电影&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《追梦3DNA》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;出演了单车快递员&ldquo;雨剑&rdquo;，清新自然的表演不但给观众留下了过目难忘的深刻印象，更是获得了该片导演孔玟燕的认可。因此，粉丝们给了他一个&ldquo;快递哥哥&rdquo;的称号。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2013年，在陈伟祥执导的&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《喋血孤岛》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;中饰演古美门修司。2014年2月参演古装权谋剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《琅琊榜》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演靖王（王凯饰）属下列战英。2015年3月,参演暖爱青春偶像剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《隐形的翅膀》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，张雨剑出演该剧的男主角高飞。同年8月由张雨剑携手张一山、吴优等联袂主演的刑侦大戏&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《余醉》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;杀青，张雨剑在剧中是扮演解冰与警校同窗张一山成为&ldquo;情敌&rdquo;解冰，为博得校花安嘉璐芳心上演了一场精彩纷呈的&ldquo;互撕&rdquo;戏码。10月，张雨剑参演电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《幻城》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，在剧中饰演风族的精灵片风.12月，参演古装宫廷剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《芈月传》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演唐勒。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2015是张雨剑知名度大幅提升的一年，从《琅琊榜》的热播到《幻城》的瞩目期待，进入2016，他将蓄势待发，他的魅力，值得你我期待。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b1959ac504488495db7afd2e44dce7c2.jpg&quot; style=&quot;height:525px; width:435px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;&nbsp;张若昀&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8f19bf8f35c6ba83bcf306bdf618608b.jpg&quot; style=&quot;height:785px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：8月24日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：181cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：70kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：北京电影学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《十五年等待的候鸟》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(0, 213, 255); font-size:14px&quot;&gt;《男神执事团》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 209, 0); font-size:14px&quot;&gt;《无心法师》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 185, 149); font-size:14px&quot;&gt;《麻雀》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 79, 121); font-size:14px&quot;&gt;《青丘狐传说》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(172, 57, 255); font-size:14px&quot;&gt;《新雪豹》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8aacab067966c988fcd324b3523ad90a.jpg&quot; style=&quot;height:569px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2004年，16岁的张若昀参演首部电视剧，由高圆圆主演的&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《海的誓言》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;中&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;饰演少年欧阳正。10年因参演文章主演的战争爱情题材电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《雪豹》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演刘志辉，而受到了大家的关注。11年，主演《雪豹》姊妹篇励志革命剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《黑狐》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，张若昀在剧中担当男主角，饰演方天翼。14年12月，张若昀参演网络偶像剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《男神执事团》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演男主角杰。同月又参演民国玄幻网络剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《无心法师》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演张显宗。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/4d57990643954069bf309d12f2b38ede.jpg&quot; style=&quot;height:500px; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2015年4月，张若昀与蒋劲夫、金晨、乔欣一同主演电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《青丘狐传说》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;。8月，张若昀与李易峰，周冬雨，阚清子，张鲁一等一同出演海飞原著小说改编的现象级革命剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《麻雀》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演唐山海。11月&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《十五年等待候鸟》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，搭档孙怡演绎一出&ldquo;你可能不会爱我&rdquo;的双暗恋情缘。担当男主饰演裴尚轩。同月与吴彦祖、张静初、张若昀、郭采洁、张孝全等两岸三地众多明星，参演林岭东执导的电&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;影&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《飞霜》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演潘子文。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/4074a9ab3e282ee523266f7557aa7ff4.jpg&quot; style=&quot;height:962px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;张若昀因拍&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《雪豹》、《黑狐》、《新雪豹》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;等军旅题材电视剧被观众所熟知，并获封&ldquo;军装美男&rdquo;的称号。而随着作品的热播，有网友评价说他是继《步步惊心》中的十四爷，&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《甄嬛传》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;中的果郡王之后，又一个在台湾走红的&ldquo;小鲜肉&rdquo;。2016年相信张若昀会给大家带来更多更好的作品。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/e1c85e6656910ec96ab38642c40c5d8a.jpg&quot; style=&quot;height:500px; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;3&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;&nbsp;徐可&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/3c08a0d8fe091ba053a250969cd3c17f.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：7月16日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：179cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：66kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：中国传媒大学&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(255, 79, 121); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《幻城》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(255, 185, 149); font-size:14px&quot;&gt;《我的奇妙男友》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 169, 0); font-size:14px&quot;&gt;《北上广不相信眼泪》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(217, 33, 66); font-size:14px&quot;&gt;《青春万万岁》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 209, 0); font-size:14px&quot;&gt;《我为宫狂2》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 213, 255); font-size:14px&quot;&gt;《冲天炮》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(172, 57, 255); font-size:14px&quot;&gt;《吉祥天宝》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;background-color:rgb(255, 76, 65); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《老爸回家》&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/89a3938856685e075ca1667810e5a910.jpg&quot; style=&quot;height:360px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2010年，在校实习的徐可客串了刘烨、高圆圆主演的电影&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《无人驾驶》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;。11年12月，参演了首部电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《初见水晶湖》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演邵佳明。12年5月，参演张一山、刘威主演的电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《老爸回家》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演薛大林。同年7月加盟黄圣依主演的电视剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:16px&quot;&gt;《&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;第22条婚规》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演happy。还参演了电影&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《望远镜》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演李昂，并受到了冯小刚导演的好评。14年参演马伊琍、朱亚文主演的电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《北上广不相信眼泪》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演陶可道。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/885f3d6f7ac7ab6cac36884e47985dc3.jpg&quot; style=&quot;height:408px; width:489px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年参演的青春喜剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《青春万万岁》&lt;/span&gt;播出。后加盟由邓科执导、作家水阡墨担任编剧的爱情悬疑喜剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《我的奇妙男友》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，饰演叶琛。现正在拍摄郭敬明作品&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《幻城》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，在其中扮演星旧。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/c87024a249a454fcecbd5ac9d5176092.jpg&quot; style=&quot;height:427px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;五官俊美的徐可，穿搭韩范儿十足，星味尽显，被网友称之为&ldquo;国民校草&rdquo;,15年，徐可的荧幕表现更是一种惊喜，这个大男孩用天生的帅气和无敌的亲和力赢得了所有人的喜爱，2016，他坚持心中所想，秉承一种信念，将自己最好的一面通过荧屏展现给所有喜爱他的观众，让我们一起期待他的爆发吧。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/5e751d443a4e94c108f7cb68290dbde2.jpg&quot; style=&quot;height:825px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;4&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;&nbsp;尹正&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/ba4f22d86c66cd6157fc5c8e992f27f2.jpg&quot; style=&quot;height:961px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：12月30日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：178cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：62kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：星海音乐学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(0, 213, 255); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《龙门镖局》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(255, 169, 0); font-size:14px&quot;&gt;《夏洛特烦恼》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 185, 149); font-size:14px&quot;&gt;《他来了，请闭眼》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 209, 0); font-size:14px&quot;&gt;《不可思议》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 79, 121); font-size:14px&quot;&gt;《麻雀》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/a401dd4417e4487381e7df8533b488f8.jpg&quot; style=&quot;height:427px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2013年尹正与袁咏仪等合作，在宁财神编剧的古装剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《龙门镖局》&lt;/span&gt;中饰演&ldquo;山鸡&rdquo;一角，正式进入娱乐圈，同年与王宝强、小沈阳等出演电影《不可思异》，饰演威廉一角，这是其首部电影作品，并获得一众好评。14年3月与艾德&middot;维斯特维克等主演的好莱坞电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《绝命航班》&lt;/span&gt;上映，尹正饰演万虎一角。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f0b320f81d47bbaff96a86ccb2cc1c1d.jpg&quot; style=&quot;height:400px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年在侯鸿亮监制的电视剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《他来了，请闭眼》&lt;/span&gt;中饰演傅子遇。在电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《夏洛特烦恼》&lt;/span&gt;中饰演饰演区长儿子袁华，人气一路飙升，凭借帅气的外形获封为新一代男神。影片中尹正充分发挥搞笑实力，被网友戏称明明可以靠颜艺吃饭偏偏要如此拼命，令人忍俊不禁。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d403c96488f21c1d2fe6885f0ab57ee0.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;尹正外形俊朗，却又夹杂几分雅痞气质，且是典型的戏痴，演戏能够玩儿命，且非常敬业，表演能力超棒.现实生活中，尹正更是个暖男一枚，工作再忙也会抽出时间来和粉丝互动，可谓有求必应，令粉丝感动不已。16年在湖南卫视开年大戏&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《麻雀》&lt;/span&gt;中饰演心狠手辣的苏三省。&lt;span style=&quot;font-size:14px&quot;&gt;&ldquo;演技&rdquo;与&ldquo;颜值&rdquo;双向发展的他，堪称时下最炙手可热的当红&ldquo;炸子鸡&rdquo;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/e93796b1c9863f618dbefa51b1dd49af.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;5&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&nbsp;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;&nbsp;&lt;span style=&quot;font-size:14px&quot;&gt;刘昊然&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/0fde157746f2a9a2912714ace180538f.jpg&quot; style=&quot;height:961px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：10月10日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：184cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：70kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：中央戏剧学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(217, 33, 66); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《北京爱情故事》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(255, 79, 121); font-size:14px&quot;&gt;《唐人街探案》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 169, 0); font-size:14px&quot;&gt;《双生》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 213, 255); font-size:14px&quot;&gt;《最好的我们》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/68e65f4e20e6574200c654cfb3b698b6.jpg&quot; style=&quot;height:427px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;14年2月，由刘昊然主演的&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《北京爱情故事》&lt;/span&gt;上映，片中自然真挚的表演获得了观众的认可，并凭借该片获得第21届北京大学生电影节的最佳新人奖提名。后加盟由湖南卫视、中国人民解放军八一电影制片厂联合制作的国防教育特别节目&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《真正男子汉》&lt;/span&gt;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/27d09310dc1a36900e1751a71c4d2eaa.jpg&quot; style=&quot;height:386px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年与王宝强合作主演悬疑探案喜剧电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《唐人街探案》&lt;/span&gt;登上院线，刘昊然饰演&nbsp;&ldquo;秦风&rdquo;，和王宝强组成了唐人街神探搭档，该片在中国内地票房超8亿元，可谓是票房口碑双丰收。后跟谭松韵参演青春网络剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《最好的我们》&lt;/span&gt;，在剧中出演&ldquo;学霸&rdquo;余淮，该剧已定档于2016年上线。16年1月23日，刘昊然与陈都灵合作主演的悬疑爱情电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《双生》&lt;/span&gt;开机拍摄。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/1250f73fb580c3347c286af74980af37.jpg&quot; style=&quot;height:883px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;他是陈思诚万里挑一选中的，当时的他还只是一名16岁的普通学生，从未有任何表演经历。笑起来干净纯粹的他有可爱的小虎牙，被佟丽娅亲密直呼：&ldquo;这个是我的虎牙弟弟&rdquo;。&nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/d19010d078df935bc529fcfd5f7d1365.jpg&quot; style=&quot;height:856px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;初涉银幕，就有幸与诸多巨星合作，激动和兴奋之外更多的是忐忑。然而，他用努力跟实力向观众证明了自己表演天赋。他对角色的演绎真挚动人，让观众眼前一亮。刘嘉玲曾对他也不吝赞美：&ldquo;我看到昊然的部分，很感动，觉得很美好，很温暖！&rdquo;梁家辉也对刘昊然的表演赞誉有加，直言其让自己非常意外，虽没有任何专业表演培训，却是一位非常具有潜力的90后。2016年期待他能带来更多触及心灵的作品。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b261376c8ab7b57e486d73db18a5d6cb.jpg&quot; style=&quot;height:360px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;6&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;&nbsp;张彬彬&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/ffdbfe038cb9b35dde8811c0cab95227.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：1月9日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：183cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：70kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：上海戏剧学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(0, 209, 0); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《匆匆那年2》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(215, 171, 169); font-size:14px&quot;&gt;《隐形的翅膀》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 185, 149); font-size:14px&quot;&gt;《微时代》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(217, 33, 66); font-size:14px&quot;&gt;《寂寞空庭春欲晚》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/0cba4e7b47c692c38682cc1714d8ec81.jpg&quot; style=&quot;height:931px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;2013年，被剧组选中的张彬彬首次搭档杨幂、余文乐、等演员合作参演由刘一志执导的青春偶像剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《微时代》&lt;/span&gt;，在剧中饰演韩定一，正式暂露头角，并被观众所熟知。14年，又搭档王艺嘉等参演玄幻周播剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《都市妖奇谈》&lt;/span&gt;，在剧中饰演&ldquo;帅痞地狼&rdquo;刘地。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b23b8530268a5100295a70d7bec1554a.jpg&quot; style=&quot;height:280px; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:left&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年，搭档贾静雯参演偶像剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《隐形的翅膀》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，在剧中饰演段罡。后接拍电视剧&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《寂寞空庭春欲晚》&lt;/span&gt;&lt;span style=&quot;font-size:14px&quot;&gt;，这是张彬彬的首部清宫电视剧，并搭档刘恺威、郑爽等演员，在剧中饰演满清才子纳兰容若。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/45a4737023d9e4947dcd7429525d0c81.jpg&quot; style=&quot;height:419px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;张彬彬外形俊朗，身材高挑，虽然年纪轻轻，但他身上温暖、踏实的气质备受观众喜欢，而他深情的眼神搭配呆萌的表情，也诠释了一个迷人又可爱的花样暖男。相信16年的他定能继续爆发他积蓄已久的小宇宙，成为令人瞩目的耀眼之星。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/c217163fc365aa7179b15a313a1aa3ea.jpg&quot; style=&quot;height:393px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;7&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&nbsp;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;刘芮麟&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b6c1883bdbd5778af968f069805c19c9.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;生日：10月6日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：180cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：65kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：北京电影学院&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(217, 33, 66); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《我爱男闺蜜》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(215, 171, 169); font-size:14px&quot;&gt;《记得少年那首歌》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 169, 0); font-size:14px&quot;&gt;《老板来了》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(255, 79, 121); font-size:14px&quot;&gt;《滚蛋吧肿瘤君》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 209, 0); font-size:14px&quot;&gt;《我的证人》&lt;/span&gt;&lt;/span&gt;等&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/24970ab166026bc041e061b4f8337c8a.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;11年刘芮麟正式进入娱乐圈，接拍了科幻剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《铠甲勇士拿瓦》&lt;/span&gt;饰演马阔海。13年9月参演了叶京导演执导的电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《记得少年那首歌》&lt;/span&gt;，饰演少年薛北京。同年11月参演汪俊执导的都市情感剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《我爱男闺蜜》&lt;/span&gt;在剧中饰演莫小康，值得一提的是&ldquo;莫小康&rdquo;这个人物是全剧中为数不多的初出社会的年轻人，单是刘芮麟参与的试镜就达八次之多，足见汪俊导演对这个角色的重视程度。14年&nbsp;9月刘芮麟接拍了由耀客传媒出品的电视剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《老板来了》&lt;/span&gt;，在剧中饰演呆萌系技术宅男汤汤，目前该剧正在腾讯视频火热播出。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/51193d4eece4459cccea1584f80b631e.jpg&quot; style=&quot;height:400px; width:280px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年8月，刘芮麟参演的电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《滚蛋吧肿瘤君》&lt;/span&gt;上映，饰演熊顿的男闺蜜。剧中呆萌、逗趣、暖心的表演，瞬间击中各路女性观众的芳心，堪称男闺蜜的最佳典范。后又参演电影&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《我是证人》&lt;/span&gt;饰演杨幂的叛逆弟弟梁聪。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/bc64b8918202aba7cb962bfca8d2f0c8.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;15年可以说是刘芮麟极具关键的一年，几部佳作接连上映，让观众对这个身高180，童颜长腿的90后留下了深刻的印象。16年，刘芮麟参演的&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《睡在我上铺的兄弟》《记得少年那首歌》《21克拉》&lt;/span&gt;等作品也会相继跟大家见面，让我们一起期待他的全面爆发吧。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2d022a4233dd543c05972e3b7d1ce632.jpg&quot; style=&quot;height:959px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;8&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&nbsp;&lt;span style=&quot;color:rgb(0, 0, 0); font-size:14px&quot;&gt;邓伦&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/aa3df1129f2252b77407d258b1737c10.jpg&quot; style=&quot;height:960px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;background-color:rgba(211, 207, 206, 0.117647); font-size:14px&quot;&gt;基本资料&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;生日：10月21日&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;身高：185cm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;体重：65kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;学历：&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;上海戏剧学院&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;作品：&lt;span style=&quot;background-color:rgb(255, 172, 170); color:rgb(255, 255, 255); font-size:14px&quot;&gt;《十五年等待候鸟》&lt;/span&gt;&lt;span style=&quot;color:rgb(255, 255, 255); font-size:14px&quot;&gt;、&lt;span style=&quot;background-color:rgb(255, 185, 149); font-size:14px&quot;&gt;《封神》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(0, 213, 255); font-size:14px&quot;&gt;《白鹿原》&lt;/span&gt;、&lt;span style=&quot;background-color:rgb(217, 33, 66); font-size:14px&quot;&gt;《花非花雾非雾》&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;等&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/15ec887cb4a50b2dcd876eb2b423662d.jpg&quot; style=&quot;height:427px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;邓伦，毕业于上海戏剧学院，因主演琼瑶剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《花非花雾非雾》&lt;/span&gt;而为大众熟知，与剧中搭档杨紫共同被评为当年的&ldquo;完美恋人&rdquo;。热爱表演的他全年无休堪称劳模，多部重量级大剧将于2016年集中播出，开启霸屏模式。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;由邓伦主演的&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《十五年等待候鸟》&lt;/span&gt;即将于3月中在湖南卫视周播，他饰演的冰冷系男神柳千仁是原著小说中人气超高的角色。柳千仁是一个极端深情也极端冷漠的人，却唯独在女主角黎璃面前溃不成军。而在与罗晋、王丽坤等主演的巨型神话偶像剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《封神》&lt;/span&gt;中，邓伦颠覆出演亦正亦邪的男版狐妖子虚一角，堪称魔道极品、暗黑霸主。狐妖子虚是全新原创的角色，邓伦充满想象力的表演将子虚从妖性到人性转变的历程演绎的淋漓尽致。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b03f73d326d5d7bd62c051e478dfc47c.jpg&quot; style=&quot;height:420px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;长相帅气、青春气息十足花美男并不是只会演偶像剧，在2016年最受关注的史诗大剧&lt;span style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;《白鹿原》&lt;/span&gt;中，邓伦饰演进步青年鹿兆海，与张嘉译、秦海璐、刘佩琦等一众戏骨在剧中飙戏。鹿兆海是原著中最令人心痛的人物，也是白鹿原的精魂所在。经历了几年的磨砺，在各种题材，偶像剧与正剧中游走的他已经表现出一名90后新生代男演员优秀的表演能力。随着几部大剧的播出，邓伦的名字和面孔也必将被更多观众熟知。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/dfb0e1816686bc6589f85a24a958d0ec.jpg&quot; style=&quot;height:367px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '28', 'article', '2', '0', '0', '', '4', '33', '10', '3', null, '2016-03-31 20:48:06', '2016-04-14 12:05:51');
INSERT INTO `back_contents` VALUES ('31', '', '【明猩Talk】哪怕十年后电影冷下来了，我也一样会去做', '/uploads/content/20160414/570f15923f09a_14o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;p&gt;洪亮，24岁时他创立了自己的品牌&mdash;&mdash;&ldquo;無他&rdquo;影业。&lt;/p&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;虽然他的作品曾获得第21届金鸡百花奖微电影单元优胜奖，所执导的多部微电影系列在网络获得过亿点击量。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;但是洪亮认为，他近三年所做的事情，才能真正算是将要取得的成绩。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;目前他正在筹备的四部电影和两部网剧，都将在这一两年间开拍、上线。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;说起这十年，洪亮说：&ldquo;我只是简单的把自己认为对的事情坚持下去了。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/941e6a54d7075dfea2176006d5805bf2.jpg&quot; style=&quot;height:480px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;说起创立&ldquo;無他&rdquo;的理由，洪亮说其实这源于当初一个很单纯的想法：&ldquo;我想要尽力把东西往最好的方向做，所以就决定建立一个自己的品牌。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;無他&rdquo;取自《卖油翁》的&ldquo;无他惟手熟尔&rdquo;，既是表达心无杂念、一门心思把电影做好的状态，也是熟能生巧、越做越好的过程，同时也有勿忘初心的意思，希望自己不被世上的其他事情所诱惑，不要因此分散了注意力。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;無他，只要瞄准你的初心，努力做好。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;当初的一个想法，转眼已经坚持了十年，影视行业也经历着翻天覆地的变化。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;前几年影视行业不太好的时候，洪亮身边的同行有些拍着拍着，觉得房地产有商机，就转行去做了房地产，也有些去做了水果、农产品、互联网。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;现在影视行业变好了，常常会有人问洪亮：&ldquo;当初你怎么会知道影视行业有前途？真好。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;洪亮笑着说：&ldquo;我做电影，只是把它当作一个自己真正喜欢的事情，所以一直坚持去做。我不知道它好，也不知道它坏，我只知道这件事是我喜欢做而且可以做好的，就像是我的使命一样。哪怕在未来十年它冷下来了，那我也一样会去做。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f97af310b7efc222e906fe4c36268d26.jpg&quot; style=&quot;height:426px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在百度百科里，除却创立&ldquo;無他&rdquo;影业品牌，洪亮的第二个经历是参加红粉笔乡村教育计划并谱写主题曲《多一点点爱》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;事实上，在报考大学前，他就曾因为&ldquo;兴趣广泛&rdquo;而犯了难。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我喜欢文学、历史，也喜欢美术、音乐。&rdquo;洪亮笑着说：&ldquo;我发现文学（剧本）、哲学（主题）、美术（摄影）、音乐，都是构建世界的砖、瓦，而导演就像是这个新世界的设计师，利用这些材料构建一个属于自己的但同时又是开放的世界，所以当时我选择了上海大学的导演系。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;如果说电影是洪亮构建世界的载体，那么音乐就像是其中的一把钥匙。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;因为机缘巧合，他曾无意中接触到红粉笔乡村教育计划，觉得很有意义，就一连参加了六次活动，先后去了丽江、青海等地，5&middot;12大地震之后，他也曾去绵竹支教。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;洪亮坦言，去支教时，自己特别反对带着物质的东西去，因为这样会让当地的孩子形成一种索取的惯性。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我去那里，一般给他们上是音乐课或语文课，教会带给他们看大世界的眼光。&rdquo;他回忆道，&ldquo;上课时，我会让孩子们选一首自己喜欢的诗或可爱的句子，然后把它当成词，谱写成一首歌。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我觉得最重要的是带给他们开阔的心境，以及一个观察美的视角。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/c34bf5101bf9d400221e915d0657e42a.jpg&quot; style=&quot;height:426px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;从2000年进入大学开始，洪亮就认准了导演这条路。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;他说，2009年策划导演的独立电影《柒》，才是他真正意义上内心的处女作。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;去年他还拍了一部院线电影《私奔七十年》，讲述被父母抛弃的高中生石头，遇见了身患绝症的同学小如，两个绝望的少年相约用七天时间，去体验七十年里毕业、恋爱、结婚、生子等人生大事。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;两个少年在悲欢纠葛之中，对生命有了进一步的理解和感悟，他们终于能够释怀，坦然面对死亡，感悟生命的真正意义。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;目前这部电影正在过审中，并将送去参加电影节，而后在国内院线上映。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/b43b6fc63472a9ca08b8eea7d92ab440.jpg&quot; style=&quot;height:268px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;说起未来，洪亮有四部电影正在筹备中。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;其中包括高智商烧脑电影《时空碎片》，它或将是国内首部一镜到底的电影、国内首部以AI为主角的电影《你的人设弱爆了》、国内第一部超能力公路喜剧电影《半途而飞》，以及都市爱情喜剧电影《不作不嗨》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;同时，他还将做两部网剧。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;一部叫做《无能超能》，讲述一个屌丝获得无用超能力的故事；另一个是《脑洞全开》，类似于《世界奇妙物语》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;四部电影和两部网剧，这么多内容究竟是如何研发出来的？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;洪亮介绍说：&ldquo;从几年前开始，我和我的朋友们就在开发一个影视的评估研发系统，希望能从项目创作方面，在行业内立起一个新的标准。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;目前，这个系统已经研发完成，他们正忙活着为它取名、注册公司，之后咖姐将为大家带来更加详尽的采访报道，一起期待吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/a0c2084b3f4067f120ab08b877d337a9.jpg&quot; style=&quot;height:800px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '31', 'article', '6', '0', '0', '', '6', '0', '0', '0', null, '2016-04-11 14:11:55', '2016-04-14 12:05:23');
INSERT INTO `back_contents` VALUES ('32', '', '【明猩Talk】我的梦想，就是将一生投入到佛教电影里', '/uploads/content/20160414/570f157fbb759_55o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;strong&gt;红咖文创工场&lt;/strong&gt;\r\n\r\n&lt;p&gt;微信号 hongkaapp&lt;/p&gt;\r\n\r\n&lt;p&gt;功能介绍 咖姐来了！关注文娱创业，聚焦影视资本，教你立足投资大风口。站的是高处，看的是远方，大局观、投资观、创业观，塑造你的影视行业新三观！&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;提到佛教电影，张智焜说：&ldquo;我的梦想就是一生的精力与时间投入到佛教电影里。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这是他当导演的第八年，他说一路走来，贵在坚持：&ldquo;头四年，我在电视台里拍些方言剧、乡村爱情故事，自己看了都忍不住想笑。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;不过在三年前，张智焜因缘接触了佛教电影，便下定决心从此投入佛教电影当中。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/982f6e139525eee32d8cccac67c1c225.jpg&quot; style=&quot;height:800px; width:606px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;如今，他自编自导的佛教微电影《前世今生》，成为了迄今为止第一部点击率破亿的佛教电影，荣获中国微电影华南地区最佳影片、珠影国际微电影大赛最佳人气奖、羊城印象国际微电影节50强影片等诸多殊荣。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;一部微电影，张智焜耗费一年半的时间，自己投资了20多万，总投资30万。精力耗尽，但也收获颇丰。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8f801f96737ac5af70b9de3ecbc3e532.jpg&quot; style=&quot;height:600px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&ldquo;在寺院安静的生活里，我才能写出佛教的电影剧本。&rdquo;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;《前世今生》的故事改编自佛家的四大经典爱情故事之一《前世谁埋了你》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;为了打磨好《前世今生》的剧本，张智焜足足花了半年时间，跑到汉地、藏地的寺院去，只为在寺院中闭关、感受。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/83b187d18b88dba4764bd296eb254517.jpg&quot; style=&quot;height:570px; visibility:visible !important; width:429px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;现在人对情感执着非常严重。我拍这部电影也是想帮那些情执比较严重的人，希望他们通过这部电影有所感悟，缘聚缘散，不必执着，活在当下。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;也因此，在片中也出现了不少佛教暗喻，比如男女主角曾经一起放生的海龟，在男主角意欲自尽时，化现为一位老和尚来开释他。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/878ba830fa9444263e0e54fc9f26241e.jpg&quot; style=&quot;height:853px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&ldquo;有信仰的观众才能解读我对这部戏诠释。&rdquo;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在影片中，有一幕女主角被困在地狱中，婴孩肢体从天而降化成血海，场景令人触目惊心。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;但恰恰是这一段，张智焜说，起码要3万文字才能解释清楚，电影里只用了7分钟来表达，什么是中阴身，人死之后要面临什么，我们应该做什么？认真看这部戏承载量真的很大。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/2684a21c9dd3ff8d0b176d9ee61c080e.jpg&quot; style=&quot;height:320px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;比如在讲述女主角前世的故事中，女主角因情自杀，但因生前多次堕胎，死后受婴灵报复。但她因害怕而忏悔，所以重罪轻报，变成一只螃蟹来夹了她一下，第一个路人大叫，这就是表现；第二人经过就是盖衣服的人，也算是有缘人，这个就叫，善有善报恶有恶报；第三个，就是念佛之人，也就是度她的人，念佛出现光明，得到解脱。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/72ef5d977b597335ac9c50d55a232975.jpg&quot; style=&quot;height:726px; visibility:visible !important; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&ldquo;人活着，不能太世俗。&rdquo;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2014、2015年这两年的时间，张智焜带队跟着上师进藏，从川藏、西藏到青藏，记录上师穿越春夏秋冬、山川河流的朝圣之路，最终拍摄完成纪录片《上师之路》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/15068140a6666b825f3af9711334f1b8.jpg&quot; style=&quot;height:426px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我一共进藏四次。第一次 6个人，第二次4个人，第三次 2个人 ，直到第四次 ，只剩我自己了。&rdquo;张智焜说，&ldquo;因为没钱发工资，但片子不能不拍，一旦停下就就错过了。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;最后，他一个人坚持把片子拍完。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/2f5d621f8a7b1fd391f2627091905998.jpg&quot; style=&quot;height:566px; visibility:visible !important; width:429px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;《上师之路》一共 5小集，每集6分钟，全片一共30分钟，预计2016年底全网上线。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;提及此事，张智焜说心中的感悟太多，无法用语言完全表达，但觉人活着，不能太世俗。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;上师发心之单纯，就是为大众祈福。从川藏出发，一路磕头到西藏，最后到青藏。说到底，我们人类为什么那么痛苦？往往是因为要的太多、欲望太重。而佛教电影与其它电影的不同之处就在这里，告诉你正确的价值观、世界观。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/acd81ef1551c0a8c2e9e6ebaf7be3a30.jpg&quot; style=&quot;height:427px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/2125e101d97216b8dacb283030f33d07.jpg&quot; style=&quot;height:423px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&nbsp;&ldquo;我的梦想就是一生的精力与时间投入到佛教电影里&rdquo;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;一开始张智焜决定做佛教电影时，遭到了身边同行、朋友的反对。&ldquo;他们没有一个人愿意参与，毕竟宗教题材始终都比较敏感。说白了就是怕，太多单位可以查你，没有人敢跟你玩。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;但他并没有因此放弃，而是发了一个大愿&ldquo;哪怕最后只剩我一人，也要把佛教事业进行下去。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;为此，张智焜成立了&ldquo;菩禔心光&rdquo;，他说：&ldquo;一路走来，磨难太多，但我无所畏惧。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/be1671217b7a810cb7fa112ddcfa6926.jpg&quot; style=&quot;height:360px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2016年，&ldquo;菩禔心光&rdquo;将拍摄大电影《机器人妈妈》、院线电影《功夫素食》以及栏目剧《舌尖上的素食》、《禅茶》等。目前《机器人妈妈》已经开机，《舌尖上的素食》也将于5月份开机。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这一路上，张智焜一直履行着自己的诺言&mdash;&mdash;&lt;strong&gt;将&lt;/strong&gt;&lt;strong&gt;一生的精力与时间投入到佛教电影里。&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/68f02c97fea881ae377699825e0cd9b3.jpg&quot; style=&quot;height:880px; line-height:25.6px; visibility:visible !important; white-space:normal; width:640px&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_tool&quot; id=&quot;js_toobar3&quot;&gt;\r\n&lt;div class=&quot;media_tool_meta tips_global meta_primary&quot; id=&quot;js_read_area3&quot; style=&quot;display:none;&quot;&gt;阅读&lt;/div&gt;\r\n&lt;a class=&quot;media_tool_meta tips_global meta_extra&quot; href=&quot;javascript:void(0);&quot; id=&quot;js_report_article3&quot; style=&quot;display:none;&quot;&gt;投诉&lt;/a&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_area_primary sougou&quot; id=&quot;sg_tj&quot; style=&quot;display:none&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_area_extra&quot;&gt;\r\n&lt;div class=&quot;mpda_bottom_container&quot; id=&quot;js_bottom_ad_area&quot;&gt;*内容来源：微信公众号【红咖文创工场】&lt;/div&gt;\r\n\r\n&lt;div class=&quot;mpda_bottom_container&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;mpda_bottom_container&quot;&gt;&nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '32', 'article', '6', '0', '0', '', '6', '0', '0', '0', null, '2016-04-11 14:36:28', '2016-04-14 12:02:41');
INSERT INTO `back_contents` VALUES ('33', '', '想创业搞网剧，你需要多少启动资金？', '/uploads/content/20160414/570f157033b84_40o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;strong&gt;红咖文创工场&lt;/strong&gt;\r\n\r\n&lt;p&gt;微信号 hongkaapp&lt;/p&gt;\r\n\r\n&lt;p&gt;功能介绍 咖姐来了！关注文娱创业，聚焦影视资本，教你立足投资大风口。站的是高处，看的是远方，大局观、投资观、创业观，塑造你的影视行业新三观！&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;虽然这几年大IP、大明星、大制作的超级网剧越来越多，但这些大剧说到底只是塔尖上的20%。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;80%的网生内容仍是草根气息浓郁的中小制作，扛着创意取胜的旗帜，被一个个穷&ldquo;哔&mdash;&mdash;&rdquo;剧组的血汗泪泡得深沉。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;不过那些看上去好穷、实际上也好穷的片子未必不能逆袭，反而那些拿钱砸出来的片子说扑街就扑街，毕竟互联网是一个更倾向于内容为王的地方。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;有道是：&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;剧组的资金是有限的，可是为观众服务是无限的，要把有限的资金投入到无限的为观众服务之中去。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;至于拍部网络影视剧最省要花多少钱？&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;这里有个低配方案，供您看着入行。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/8eedbcb0286258524d56d54d30bc5768.gif&quot; style=&quot;height:220px; visibility:visible !important; width:440px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;我们就选一个最普通的类型，来接着分（suan）析（qian）。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;拍一部现代剧（不用特殊服装），描述三至四个人之间（不用太多演员）的都市爱情剧（不要特效）。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;拍20集，每集20分钟，预计拍摄周期2个月，我们来一套&ldquo;低配&rdquo;剧组！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;那这个组里会有多少人？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;导演组2人，1个导演1个场记，导演2000元/天，场记按月算150元/天。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;摄影组3人，1个掌机指导1500元/天，大助调焦500元/天，二助推车300元/天。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;道具美术组5人，1个师傅带1个助理3个场工，预计每天3000元以内。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;灯光组5人，也是1个师傅带1个助理3个场工，预计每天3000元以内。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;录音2人，1人1200元/天，总共2400元/天。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;化妆组3人，1个化妆师800元/天，2个助理300元/天。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;低配&rdquo;剧组总共20个人，住宿费算住旅社两人1间房100元/天，伙食30元/天。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;也就是说，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;在工作人员身上，两个月要花掉你95万左右。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这还没有算上前期摄影器材、灯光设备、车辆、道具、服装的钱。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;就算你车找朋友借，锅碗瓢盆的道具从家里自己掏，服装让演员自己带，摄影器材灯光设备你有办法搞到人免费借给你。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;我还有演员的片酬没跟你算呢&lt;/span&gt;，而且以上都是市场最低价，别忘了每天打出1500元的机动金做意外花销。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;大致拍完两个月，还有后期制作、宣传发行等你打点。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这些七七八八加起来，150万转眼就烟消云散。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;是不是心都碎了？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/def2702e204b82c57669b78f25442f16.jpg&quot; style=&quot;height:218px; visibility:visible !important; width:377px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;一部每集几分钟的网剧，大致投资在几十万元；每集20分钟，投资必然上百万；而每集45分钟的正剧，没有几千万是绝对拿不下来的。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;但这钱真的没法再省了吗？不是！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;保住底裤的秘诀，在于找到符合自己能力的题材。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;最省钱的肯定是情景剧，&lt;/span&gt;在一个房间里解决所有问题，不用兴师动众整个剧组搞场景大迁徙，先省了车和司机，而且演员拍来拍去也就那么几个，连群演都不用配，真正多快好省！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;据说拍《爱情公寓》的时候，现场就像演小品似的基本不NG，多机位一次搞定，分分钟一集就拍出来了。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/20a2c83aa8e06a38f7a6fad930e11bf8.jpg&quot; style=&quot;height:246px; visibility:visible !important; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;不过情景剧最费钱的就是多机位的拍摄方式，虽然这样的拍法大大提高了效率，但毕竟设备租赁和摄像师都是要钱的啊大哥！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;同理还有恐怖片&lt;/span&gt;，因为剧情从来就没出过那栋楼，而且估摸着连灯光的钱都能省一点，所以理所应当成了小成本制作的最爱。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/fbbc2525b0bbabbf3151430a4ecace3f.jpg&quot; style=&quot;height:332px; visibility:visible !important; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;此外，还有一种题材也比较省&mdash;&mdash;半纪实片。&lt;/span&gt;这种类型立意可大可小，大至留守儿童公益片、弱势群体生活写实，小至你身边的亲人朋友，楼下孤苦伶仃的修鞋老人。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;所谓的半纪实片，本质是记录生活。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;之所以说它&ldquo;半&rdquo;，是因为它终归要高于一台DV记录家庭聚会的那种&ldquo;记录&rdquo;。但总的来说，半纪实片对画面摄影的要求不那么高，而且还可以省下一大笔请演员、群演的费用。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;千万要牢记，所有涉及舞美、特效、烟花炸药、后期特效的题材，比如武侠啊玄幻啊战争啊全都是烧钱的命！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;选对了题材之后，该省的尽量省，但不能省的也别瞎省。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;咖姐觉得，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;你能统筹好拍摄时间，合理安排摄制进程，保质保量完成内容，就是在帮自己省钱了！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/44f204975e7102c9eb8bfaed36993d55.gif&quot; style=&quot;height:220px; visibility:visible !important; width:391px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;其实拍网剧的日子，就是边省钱边烧钱，边吃糠咽菜边抓紧梦想的过程。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2010年的优质口碑网剧《毛骗》，堪称&ldquo;城乡结合部&rdquo;版的《飞天大盗》，被业内戏称从未见过如此&ldquo;穷困潦倒&rdquo;的剧组。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/70af64643c0ca4607a3e8c53804e1df8.jpg&quot; style=&quot;height:360px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;制片人李洪亮曾经说过：&ldquo;拍第一季的时候，剧组只有十几个人，总投入几十万。大部分开支都用在人员工资上，以至于服化道的劣势尽显无遗，服装是演员自己的，道具自己动手制造，相似就行，场景尽量找朋友或一些免费的公众场合，设备倒是花了一点钱购买，期间本着能省则省，不花一分不该花的钱，坚持着过来了。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;但《毛骗》在豆瓣的评分高达8.5分，而迷倒全中国的《太阳的后裔》的分数也才8.1，堪称&ldquo;用好本子征服了全网络&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/a571ba0231137dafb5a8612b54cc0d8c.jpg&quot; style=&quot;height:342px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;拍网剧就算是穷，那又怎么了？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;细数那些比较有名的穷&ldquo;哔&mdash;&mdash;&rdquo;剧组，包括特效红红火火恍恍惚惚的《灵魂摆渡》，没钱给郭京飞买粉底的《暗黑者》，以及传说中欠姜sir（姜广涛，著名配音演员、导演）两百块补词费的《拐个皇帝回现代》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;当剧情足够抓人、或者感情足够深时，略显粗糙的制作感觉都是萌萌哒。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这一时期，&ldquo;穷&rdquo;再也不是需要避讳的话题，而是引发网友们欢快讨论的槽点，有时连官博都会抢先调侃、顺便推广。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;穷出风格，穷出水平，穷得好魔性，拍网剧就是在穷&ldquo;哔&mdash;&mdash;&rdquo;外表下的欢脱旅程。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/29be2369b77817e69f84b4d8bdc2920b.jpg&quot; style=&quot;height:763px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/7ec30397ce475285729c11fb004bf67e.jpg&quot; style=&quot;height:791px; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f3b48f502c9e296d4fdc3eb02ca11546.jpg&quot; style=&quot;height:822px; width:638px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2cffc1551fc98c2bec57bf7d5440cb63.jpg&quot; style=&quot;height:380px; width:638px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;十年前，一部电视电影的平均投资是40万。多数用磁带拍，后期可以磁转胶。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;而对于非科班出身的，通过盗版碟培养起美学观念的广大门槛之外的电影新青年，DV价格的平民化，在康庄大道外搭出几条独木桥，为孤胆英雄们提供了起义的出路。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;一部DV，一台可进行非线性编辑的电脑，价格可以控制在2万以内&mdash;&mdash;杨天乙历时一年拍的纪录片《老头》，是早期一部给DV新青年们以鼓舞的作品。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/eb75175480b0d39ed7c5ac66ca96e653.jpg&quot; style=&quot;height:427px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;那时候如果想拍一部15分钟短片，在只有满腔热情没有任何设备的情况下，租拍摄机器的费用一天不到百元，租编辑机房的费用一个小时几十元，全部采用自然光，同期录音，场景自行解决，演员友情出镜，控制在几天内完成作品，2000元就有可能完成。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;十年后，在影视剧投资动辄上千万甚至上亿的今天，难道就杀死小成本制作的生路了吗？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;虽然时代不同了，但优秀的内容永远都能&ldquo;吃香喝辣&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;拍网剧不是一件容易的事，而所有你缩衣节食跟整个剧组一起穷&ldquo;哔&mdash;&mdash;&rdquo;的岁月，都会在网络世界留下印记。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;人人都想知道怎么在资金有限的情况下拍好剧，道理谁都懂，但遇到的时候还是一样的苦逼操蛋。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;&nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;但既然决定走这条路，就来干了这碗鸡汤，祝诸位莫忘初心！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '33', 'article', '6', '0', '0', '', '2', '95', '1', '0', null, '2016-04-12 15:02:04', '2016-04-14 12:05:04');
INSERT INTO `back_contents` VALUES ('34', '', '【明猩Talk】他们在横店也许是路人甲，但在这里是主角', '/uploads/content/20160414/570f155c77617_20o.jpg', '咖姐', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;&ldquo;很多人听我的声音觉得像是二十多岁的人，其实我已经四十岁了。&rdquo;宋世高笑着说，他如今是当地小有名气的编剧，自称&ldquo;野路子&rdquo;出身，只把编剧当兴趣。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;说起宋世高的入行经历，其实也是一种机缘巧合。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2012年初春，在连云港本地有个网络自制栏目《榆城乐事》很热火，这是一部偏轻喜剧风格的&ldquo;微剧集&rdquo;，由本土人士自编自导自演，用最地道的本土方言和诙谐幽默的表现手法，将赣榆人的家长里短、喜怒哀乐淋漓展现。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在一次偶然的机会中，宋世高和《榆城乐事》的主创人员李小宁同桌吃饭，他半开玩笑地说：&ldquo;你拍电影吗？我写个剧本，你给我拍了怎么样？&rdquo;没想到对方爽快答应。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/6d275f013fb0baccbdc15372c7351bc4.jpg&quot; style=&quot;height:427px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;如今回想起这件事，宋世高笑着说自己当年有些&ldquo;大言不惭&rdquo;，其实在此之前，他一点没有写作剧本的经验，脑子里只有高中学过的《雷雨》剧本的印象。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;那时候我觉得，剧本应该就是把人物、语言、动作描绘出来，串成一个故事。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;当初饭桌上的一句玩笑话，宋世高却将它认真地记下了。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;回家后，他连夜赶工用了两天时间写出剧本《回家过年》，讲述了80后90后独生子女回谁家过年的故事。故事虽然简单，但对地道方言的巧妙运用却使它锦上添花。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;当时李小宁正在愁着不知道拍什么片子，看到这个剧本之后，一拍定案赶在春节前就将它拍了出来。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;宋世高说：&ldquo;第一次写剧本就能够被拍成电影，对我个人而言这是一件很令人振奋的事情，让我觉得这件事情实在太有意思了！&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/a42b540e37bb1654df5e36e46e875758.jpg&quot; style=&quot;height:427px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;说实话，写剧本很不容易。每一个人物形象的设定、每一句语言、每一个动作、每一副场景都需要构思好，还要写出来。&rdquo;宋世高感慨，&ldquo;拍电影是一件团队协作的事，导演、演员、摄影、灯光、后期，每个人都很辛苦。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;有时候要拍到半夜两三点，虽然大家都不是专业的，但都很认真，很让人感动。&rdquo;说起拍摄经历，宋世高说：&ldquo;导演要反复跟演员说戏，演员遇上淋雨戏又真心遭罪，即使拍完马上就扔到澡堂里去，也难免会得感冒。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在过去的采访中，宋世高曾经说过这么一个故事：&ldquo;连云港的冬季，海边的风是非常大的，它呼啸地叫嚣着吹过来，冰冷得像刀子一样，把裸露在外面的皮肤割得生疼。&rdquo;他清晰记得，有一场戏的主角是一个不满10岁的小女孩，因为剧情需要，她必须穿着单薄的衣衫在海边拍摄。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;但整整一天时间，小女孩都没有喊一声冷。还有整个剧组，虽然都是非专业人士，但大家都很认真地对待着这样一个新奇而陌生的工作，在寒风中坚守着自己的岗位。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;监制李小宁和摄影师张贺利，为了拍出更完美的角度和画质，踩着泥泞不惜把双脚泡在海水里，每一个剧情都要反复好几个角度拍摄，过程极其艰辛。忙碌起来，他们甚至都没有机会喝上一口水。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我默默地尽最大可能为他们做着服务工作，嘴上没说，心里却被这一切深深地感动着。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/7d0fa00b4981973686cc934c6ee96be6.jpg&quot; style=&quot;height:360px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;非科班出身的他，如何能提高自己的编剧能力？宋世高说，多看多想多读书吧，多补充一些编剧方面的知识。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;当然，光是纸上谈兵不行，毕竟故事来源于生活。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;宋世高平时喜欢和朋友相约聊天，在席间喝的不只是酒，更是一个个故事。他说，有人的地方就有故事，我喜欢做一个倾听者，这些有意思的故事都是我创作的素材，有时候将这些故事插到剧本当中，就是一个绝佳的桥段。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在生活中做一个有心人，也是提升自我的一条途径。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;日常生活当中，宋世高有属于自己的本职工作，这是他生活和家庭开支的主要来源，而编剧更像是一个业余爱好，单纯是因为喜欢而去做的一件事情。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/d6211d86ac7fd2381e053117dc81f12c.jpg&quot; style=&quot;height:545px; line-height:25.6px; visibility:visible !important; white-space:normal; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;宋世高说，这或许就是兴趣与专业之间最大的区别：不以编剧为生，所以对这项工作没有那么大的压力。同样一个剧本，也不必想方设法将它变现，以此支撑接下来的创作和生活。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;因此在题材选择上，我更多以自己的感兴趣为导向，而不是市场需要。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在他看来，不管是专业或者非专业，对待剧本创作的态度都一样是认真和专注。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;而且，无论是在哪一个领域，即使是非科班出身的编剧，也不排除会有比科班更好的可能性。&ldquo;只要全身心投入，我相信都会有好成绩。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/479a0c1008c22918d272638c83946556.jpg&quot; style=&quot;height:480px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;去年宋世高曾经报名了一个编剧培训班，本想请假到北京接受培训，却因为种种原因未能成行。但他说，因为这次报名，相识了几位培训班的同学，感受到了他们内心的梦想和激情。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;这次没有去成，确实是种遗憾。这可能就是我与专业编剧之间的区别。他们会比我自由许多，但在其位谋其政，我并不后悔。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;宋世高说，现在自己每年能写出一两部剧本就足矣，不追求利益，不靠剧本来求生活，希望能找到一些符合社会题材的剧本来打磨，写出大家认可的剧本，拍出来才有意义。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;工作归工作，编剧归编剧，梦想不能放弃。现在宋世高除了写剧本，也想学习一些电影剪辑、导演的知识，这样有助于理解导演的意图，写出更好的剧本。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;今年下半年，他或许会和李小宁导演合作拍一部低成本网络电影试试水，希望能不靠噱头，而是用故事来吸引观众。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/59aee438ebb7107a6294cf68d4ed19eb.jpg&quot; style=&quot;height:853px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在北京、横店之外，还有许多散落在全国各地的影视圈人，他们或许会戏称自己是&ldquo;十八线开外的编剧、导演、演员&rdquo;，但他们同样享受着作品完成后的满足，忍受着拍摄时的风吹雨打。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;在这所谓的&ldquo;十八线开外&rdquo;身上，那种单纯的热爱和追求，反而是影视圈里最弥足可贵的。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;采访的最后，宋世高说自己还是比较幸运的，写出来的剧本都能被拍出来，一路走来都还比较顺利。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;虽然现在经济上还有一些压力，但为了缓解这块，他们开设了一个名叫&ldquo;赣榆银才&rdquo;的公众号，定期播放方言搞笑视频栏目《暴走赣榆》，之后还将推出普通话原创搞笑视频。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;对于未来，他信心满满。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&ldquo;我相信只要努力坚持下去，就会有回报。&rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/bc9a10a5ccd4e6381584753fea1b9ba0.jpg&quot; style=&quot;height:853px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '34', 'article', '6', '0', '0', '', '6', '7', '5', '0', null, '2016-04-12 15:18:41', '2016-04-14 12:03:32');
INSERT INTO `back_contents` VALUES ('35', '', '票房泡沫被政策戳破！清明档电影票房玩裸奔，砸了！', '/uploads/content/20160414/570f1548579e1_00o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;四月份的中国票房验证了一句话：&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;少壮不学好，老大徒伤悲。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;经历过全民狂热的春节档，你让我如何直面凄惨的四月票房？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;整个清明档惨得不能再惨，一直到今天都还没回过神来，账面上一塌糊涂，账面下一片鬼哭狼嚎。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;这是电影票房跟我们开了一个巨大的愚人节玩笑？还是自&ldquo;刷票&rdquo;出事之后，国产影片纷纷裸奔院线？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;有点意思。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/c4d62270d9ca3ae21d240f0d5d321dfe.jpg&quot; style=&quot;height:220px; visibility:visible !important; width:322px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;仅仅是两个月前，中国电影市场还一片大好。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;春节档破了多项票房纪录，《美人鱼》成为第一部票房过30亿的国产片，而第一季度全国票房累计144.93亿元，同比增长近50%。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;此时此刻的电影市场，面色红如有光泽，感觉都要上天了！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/44006a517a8c1de1cc9b13bf35cdb745.jpg&quot; style=&quot;height:200px; visibility:visible !important; width:234px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;清明档紧跟着上线，显然是打算乘胜追击大赚一笔。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;就在这时，诡异的事发生了&mdash;&mdash;观众在一夜之间忽然全部消失。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;清明档的电影院，应了它的名字，冷冷清清，凄凄惨惨戚戚。就连清明后的那个周末，也是止都止不住的颓势。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;上周五（4月8日）总票房不足1亿元，被冠以&ldquo;最差周末&rdquo;之名，而当日上映的《伦敦陷落》，只拿到600万票房就成为票房第一。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;名为&ldquo;陷落&rdquo;的电影，在中国电影票房陷落之时登上榜首，就像是一声刺耳的冷笑。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/f8ba66c2d900cd17deafc612549d63e8.jpg&quot; style=&quot;height:454px; visibility:visible !important; width:607px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;到底是哪里出错了？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;估计是因为《叶问3》刷票出事，所以国产片纷纷裸奔上线，显示出了自己的&ldquo;真实水准&rdquo;。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;毕竟刚在3月份上映的《叶问3》刷票刷出狗血剧情，被广电总局电影局&ldquo;约谈&rdquo;不说，还拖垮了十方控股、神开股份、明华科技等快鹿系上市公司的股价。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;损了名声又折钱，堪称&ldquo;电影刷票&rdquo;史上的一场灾难。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;而紧随其后上映的国产片，估计为了避风头，纷纷选择裸着上。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/931e0d0d498d14b4f0dc4e8bb7d47dd6.jpg&quot; style=&quot;height:300px; visibility:visible !important; width:534px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这就像是上海楼市调控的新政出炉后，本来比天还高的房价应声轰然倒塌，更传有别墅房价一夜暴跌160万。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;把挂牌价格虚抬160万也叫跌？这所谓的&ldquo;降&rdquo;，也不能叫降。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;政策一个动作，整个行业一场地震。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;新政不过是挤掉了房价的一小层泡沫，但电影票房还有更大的泡沫等着被戳破。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;据说中国电影80%都刷票，20%是因为没钱刷。今年清明档的惨淡，也让我们得以重估中国电影票房的潜力到底如何。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/4243b6f76b2856d39e2cf3f7e10f616d.jpg&quot; style=&quot;height:306px; visibility:visible !important; width:265px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;不过将票房惨淡与《叶问3》刷票失败相联系，不过是一种猜测。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;要知道真正的原因，就不能忽略了电影本身。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;有人说，清明档期比较尴尬，在春节档之后，五一档之前，夹在中间，假期也只有三天，档期未成气候，自然也就表现不佳。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;那我们拿同一时间的票房排行榜来对比一下，究竟跟档期有没有关系？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2015年4月13日周一，排名第一的《速度与激情7》当天票房1.77亿，国产片《战狼》当天票房1084万。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/e061afc819622cdbbafae68ab809c13d.jpg&quot; style=&quot;height:505px; visibility:visible !important; width:469px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;相比之下，2016年4月12日，同样是周一。第一名《伦敦陷落》当天票房596万，而国产片依然排名第二，《火锅英雄》当天票房236万。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/6498da700f58c18acc0bdae980898712.jpg&quot; style=&quot;height:315px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;《速度与激情7》凭借不俗的影片质量，以及主角逝世的意外，在全球上映时都引起观影热潮，能斩获高票房也是意料之内；而《战狼》作为国内首部3D动作战争电影，历时七年全力打造，对国产战争片的&ldquo;破格&rdquo;可圈可点。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/3a2a773c767e243335fcb94bb1676d94.jpg&quot; style=&quot;height:400px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;那今年呢？&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;其实今年清明档的阵容并不差，&lt;/span&gt;进口片有《蝙蝠侠大战超人》和《疯狂动物城》，一个是动作大片，一个是合家欢题材。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;国产片则放出了《我的特工爷爷》、《火锅英雄》和《睡在我上铺的兄弟》，可谓是动作、犯罪剧情和青春校园题材一应俱全。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这看起来异常靠谱的阵容，怎么就成了如此萎靡不振的清明档市场？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;原因绝不是大家都忙着扫墓祭祖那么简单。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/08c6da452ac1e80734ae0ffee077f3f6.jpg&quot; style=&quot;height:330px; visibility:visible !important; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;表面上看虽然上映的影片众多，类型也都齐全，但却缺乏口碑爆款。&lt;/span&gt;这样一堆质量平庸甚至偏差的影片，自然无法在有限的假期内将口碑发酵，最后转化为票房数字。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;再者，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;《蝙蝠侠大战超人》也是清明档票房失利的罪魁祸首之一。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;如果说去年《速7》扛起了一面进口大片的旗帜，那么今年《蝙超》也同样被寄予厚望。但谁都没想到，这部片居然在清明假期被已经上映一个月的《疯狂动物城》轻松干翻！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;据说这是一部让粉转路人的片，别问我真的假的评分自在人心。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/db23214e0d8362e79bf07eb44e9a3f9e.jpg&quot; style=&quot;height:281px; visibility:visible !important; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;档期内没有哪一部片遥遥领先竞争对手，其实这也是个问题。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;看今年清明档的冠亚军《我的特工爷爷》和《火锅英雄》，表现齐头并进，谁也没能领先谁一个身段，也从侧面放映出它们无法引爆市场热度，自然也难以扛起拯救票房的大任。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;所以说，票房烂不能怪档期，最终要怪的还是你自己。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;至于这跟&ldquo;裸奔上线&rdquo;有没有什么关系，只是笑谈，可别太当真。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/3983a60944a9aad317f4f85e5f854e45.jpg&quot; style=&quot;height:338px; visibility:visible !important; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;四月票房的低迷，其实也给电影人亮起了一盏警钟。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;不管是现在还是未来，这都是一个&ldquo;内容为王&rdquo;的时代，电影市场的泡沫越吹越大，但也越来越脆弱，而扎破它的那根针，先是观影者挑剔的眼光，后是资本狂热散尽之后的理智。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;如今广电总局严查刷单，逼得清明档电影票房玩裸奔，就是对电影行业泡沫的一次清洗！&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/44846afb2501a135d5af843edd6dbdd9.jpg&quot; style=&quot;height:333px; visibility:visible !important; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;说到底，电影行业的泡沫始于资本狂潮的推动，幕后推手想要推动股价上涨，趁机在股市里圈钱，但如果真这么下去，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;这场少数人的资本游戏就会摧毁真正具有发展潜力的弱势电影，使中国电影活在票房数字的虚假梦境里。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;从这个角度来说，咖姐要给总局大大点个赞，吼一声做得对！&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;而对于此时此刻的低迷，你该关心的不只是票房到底什么时候涨回来，而是好电影到底什么时候才能遍布江湖？&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;等泡沫退去，自然会有真正的好片出现。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '35', 'article', '6', '0', '0', '', '1', '25', '1', '1', null, '2016-04-13 14:40:33', '2016-04-14 11:58:07');
INSERT INTO `back_contents` VALUES ('36', '', '【明猩Talk】吕仲男：我要做中国最好的喜剧编剧', '/uploads/content/20160414/570f153318c1f_39o.jpg', '咖姐', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;strong&gt;红咖文创工场&lt;/strong&gt;\r\n\r\n&lt;p&gt;微信号 hongkaapp&lt;/p&gt;\r\n\r\n&lt;p&gt;功能介绍 咖姐来了！关注文娱创业，聚焦影视资本，教你立足投资大风口。站的是高处，看的是远方，大局观、投资观、创业观，塑造你的影视行业新三观！&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/8b5dd12568f7bf2542e78da8efaef729.jpg&quot; style=&quot;height:852px; visibility:visible !important; width:640px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;吕仲男，新晋喜剧编剧，《乡村爱情》导演徐正超首席弟子&lt;/strong&gt;，北京徐正超导演工作室签约编剧，主要作品：喜剧栏目剧《本山快乐营》、轻喜剧电视连续剧《不是钱的事》、轻喜剧电视连续剧《收获的季节》、院线电影《男神时代》、院线电影《一团乱麻》。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;2009年&mdash;2011年黑龙江卫视大型喜剧栏目剧《本山快乐营》同时段收视率全国第一&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;合作演员：赵本山、小沈阳、刘流、宋小宝、刘小光、王小利&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;2012年轻喜剧电视连续剧《不是钱的事》登陆江苏、山东、天津、黑龙江四大卫视，收视率全国第六&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;合作演员：赵本山、小沈阳、于月仙、程野、唐鉴军、小沈龙&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;2013年轻喜剧电视连续剧《收获的季节》登陆北京、黑龙江两大卫视，收视率全国第四&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;合作演员：赵本山、宋小宝、小沈阳、毕畅&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;2014年黑色幽默喜剧电影《一团乱麻》未上映已入围北京中国大学生电影节&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;次年入围休斯顿国际电影节&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;合作演员：东靖川、李艾瑾、胡嘉爱、张超&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;2015年在爱情喜剧电影《男神时代》中任文学编剧于9月2日上映，4天票房过800万&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(136, 136, 136)&quot;&gt;合作演员：李菲儿、任贤恺、韩国《浪漫满屋》人气偶像李英爱、小时代原班人马&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;大学毕业后，我一直想从事跟文学有关的工作，但就是干不上，换了28种工作、每件干得都差点饿死，特别不得志但我都穷那样了，还养金鱼呢，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;我总觉得一个真正的文艺青年，日子再难也不能没了情调。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;拜师&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2008年底，因为机缘巧合吧，我师傅写《不差钱》没时间改小品，崔姐就推荐我，我都没想到我师傅还看过我卖小品的博客，就说小吕啊，写得还行让他改吧，我就改了我师傅的作品《开机之前》还有个郭东临演的小品叫《赶火车》临录前一天，崔姐给了我一个春晚节目单、上面有我名字，我连跑再颠跑回家给我妈看，我妈当时就哭了，我儿成名了，老人不懂、其实还差十万八千里呢。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;2009年3月21日我师傅开始带我，那一天我永远忘不了，我改变命运的日子。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/135e4483f3bb3a727b2aeb51f500f0a4.jpg&quot; style=&quot;height:425px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;师傅&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;我师傅对剧本写作上非常严，一遍遍不停的改，不崩溃几次的剧本他不带满意的，但生活中心特别细，对我非常照顾，他会算计几天没吃好的了，带我上个大饭店、没买衣服就把他裤子给我、他曾经给我一条工装裤，我一直没穿、他可能觉得我不爱捡别人的衣服、其实不是、是很珍惜，想保留一辈子。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;我师傅总拿大白熊的故事吓我，但总未放弃过我，7年了他扶着我走过。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;我师傅之所以成这么大腕，我觉得两点最可贵，一是思维不一样、我俩在一起看书，他手里捧本梁漱溟的《这个世界会好吗？》我手里的是东北菜谱，这就是区别，我师傅的努力程度我也赶不上，属拿破伦的他，觉太少了，我跟我师傅一起生活七年，每天早上他都能堵我被窝，我就较劲想比我师傅起得早，半夜上厕所趴门缝看，结果我师傅在那看书呢。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;我师傅对我的影响太大了，他会告诉我你不要那么急，思考有时比勤奋更重要&lt;/span&gt;，还有他会观察我，随时告诉我写作方向，告诉我优势在哪、劣势在哪、我爆发力强、但不擅长多线索结构、我师傅就告诉我超过五条线的电影你别写会蒙的。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/b3660cb9121ce10a31ff709f89362bcf.jpg&quot; style=&quot;height:366px; visibility:visible !important; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0)&quot;&gt;写作&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;写作是一件孤独的事，只能一个人完成，谁都帮不了你，我每天中午12点起床、开始写一直写到早上6点，这期间会吃两顿饭太忙了就一顿，除了送外卖的基本上不接触人，送外卖的来了我就会跟他聊很久，问他店里生意好不好？有没有结婚，小孩怎么样？幸亏都是男的，不然会以为我图谋不轨，我&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;写作从来都是背着人，连家人都不见，一是怕他们打扰我写作，二是我写作的样子很疯、会开心、会痛哭流涕、会兴奋得手舞足蹈我很怕吓到他们。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;在我看来，最高级的喜剧其实是悲剧，写满了小人物的辛酸，周星驰演得其实都是悲剧，只不过人们拿他当喜剧看。小人物心底的那份善良是最光辉的，我最爱写小人物。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/6d60a3ebc24ff325f32b440b473fd316.jpg&quot; style=&quot;height:478px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;毫不客气的说我师傅捧红了小沈阳，而我们团队捧红了宋小宝和国际巨星尼古拉斯赵四。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;宋小宝表演风格很炸，人来疯满舞台跑那种，给他写上来就重头戏，让他把气氛带起来，一番一番往上翻，不用怕，他都能接住，现场翻包袱能力特别强。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;赵四是个戏痴、他边吃盒饭边念台词，嘴还不往一抽一抽的，直漏饭，我油然起敬、给他写戏、更强调情境，一个尴尬的情境让他去受罪，观众最爱看他受罪，就好像泰囧里的徐铮。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;刘诗诗、诗爷是个吃货、她到一地方就能迅速知道哪的菜好吃，还很慷慨请我跟我师傅吃过泰国菜，希望她能看到这篇采访还请我师傅和我吃。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;金鸿鸣，就是《乡村爱情》里的白清明，他是演员里最帅的，每次我俩出去吃饭，都好多小女孩要跟他合影、还朝他要电话，我就说留我的行吗？小女孩就瞪我。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:rgb(255, 255, 255)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:rgb(255, 0, 0); color:rgb(255, 255, 255)&quot;&gt;题材&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;小品&lt;/span&gt;、其实是15分钟的舞台剧、最关键是要有好玩的故事和尴尬的情境、只要在情境里就好办，咋写咋好玩。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;电视剧&lt;/span&gt;是写人物状态的变化，最关键是要有好的人物，《不是钱的事》写的是一群草台班子、二人转演员，面临改革大潮如何创新回归市场、重塑自我的事，一听就是写人物状态。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;电影&lt;/span&gt;是我最喜欢的，也是最能发挥我的优势的，电影像梦、分为三个部分、大部分电影都是三幕剧结构、悬念交代人物或事件、喜剧那一定是好玩的，就比如要我写007、正常的007甩帅，仍钩子啪勾住了顺绳子上墙、我写永远是不知道钩子仍哪去了，要不砸到女主角坑队友、要不从天上掉下来给男主角脑袋砸个包，第二幕是现实，让主角陷入困境、残酷的现实一再打击、生活的败絮一览无遗、其实是在掏观众的共鸣，到了第三幕开始飞跃、创造奇迹、高潮迭起、虐心感动，最后小人物创造了奇迹、有美国梦的意思，带人做梦，好的电影就是带观众坐过山车、玩的就是刺激，要不观众为啥买票，不刺激在家看电视剧多好。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;每个人写作多多少少都有自己的影子，我也有，我的电影大多是小人物有大梦想、痴情、犯二，最后都创造了奇迹，&lt;/span&gt;我最喜欢的电影剧本是李樯的《立春》里面的女一觉得就是在写我，别人眼中的奇葩、高傲不合群的怪物、执着得追梦，不过结局不一样立春里的女一是对生活妥协而我永远不会，我将来一定要成腕的这点我很自信。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/5f281b9138b92c1975f4d590e5f1332c.jpg&quot; style=&quot;height:426px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;这是中国喜剧电影最好的时代也是最坏的时代&lt;/span&gt;，说他最好，是毋庸置疑的，《美人鱼》票房30多亿，中国电影票房都井喷了、前所未有的好，依我看这只是一个开始，中国电影市场还潜在更大的票房。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;说他最坏是因为他缺类型、市场不能被过分娱乐的电影快餐霸占&lt;/span&gt;。我每天都能接到制片人给我打电话定制电影、类型都是固定的，要大IP、 大场面、爆炸、追逐、枪战、床戏、喜剧、感动、虐心、强情结、快节奏所有好莱坞大片的元素都全了，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;这是保证电影高票房的元素，但高票房一定是高品质吗？&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;这种娱乐大餐我们还能吃多久，我很喜欢韩国电影《七号房的礼物》《和声》更强调细节、看完哭得稀里哗啦的，但这种限制级的首先中国电影市场不分级的情况下没法拍，就让拍了，不是大片谁能投？制片人念的是生意经、赔钱的买卖不会干，中国最好的喜剧电影其实是我师傅编剧的《三枪拍案惊奇》尽管他票房只有三亿多，但不能以票房论英雄、《三枪》开创了惊悚喜剧的先例，写的是人性，你把《三枪》和《泰囧》都送奥斯卡评奖去，恐怕《三枪》更有胜算吧，这谁都否认不了。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/bb95c6b5102b42f134ca5f401315b2c9.jpg&quot; style=&quot;height:480px; line-height:25.6px; visibility:visible !important; white-space:normal; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;我的写作类型，一种法国类型电影鼻牛喜剧、也叫傻子喜剧、每个电影里都有个傻子、王宝强似的人物，《你丫闭嘴》《憨豆特工》是这种电影的经典案例、我最近要上映的《阿B特工》和正在写的《大侦探福尔马林》就是这类，类似大片各种元素都包括，还有《泰囧》里徐铮和王宝强这样的活宝搭档，看起来会很刺激、很爽。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;另外一种类型是写小人物的辛酸，我正在谈剧本合同的《绑架小狗君》就是这类的、写的是一个小人物，顶头上司把答应他的房子给小舅子了，无奈之下绑架了大哥的狗的故事，好玩、尴尬、还有一丝心酸和无奈。&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;我一直在想会不会有一种电影、他各种元素都占、里面有辛酸、有人性、大片的元素一样都不少、还有情怀不小众，《老炮儿》《功夫》的出现让我眼前一亮，我尝试写了一版东北版的《老炮儿》院线电影，我师傅很重视，在筹备，希望电影上线的时候能得到大家的支持。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;最后的话，&lt;span style=&quot;color:rgb(255, 0, 0)&quot;&gt;永不言败、永不言弃、我要做中国最好的喜剧编剧。&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://112.74.86.237:8081/uploads/images/3b48ef868b2b3c49e3e857d669181866.jpg&quot; style=&quot;height:453px; visibility:visible !important; width:640px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;*内容来源：微信公众号【红咖文创工场】&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '36', 'article', '6', '0', '0', '', '6', '35', '18', '1', null, '2016-04-13 14:53:28', '2016-04-14 12:02:49');
INSERT INTO `back_contents` VALUES ('37', '', '《火锅英雄》，像做牛油火锅一样拍电影', '/uploads/content/20160414/570f15169ab90_10o.jpg', '木西', '&lt;div class=&quot;main_box&quot;&gt;&nbsp;&lt;/div&gt;\r\n&lt;!--Start 内容--&gt;\r\n\r\n&lt;div class=&quot;main_box flow_page yahei&quot;&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;\r\n&lt;div class=&quot;flow_left&quot;&gt;\r\n&lt;div class=&quot;flow_content&quot;&gt;\r\n&lt;p&gt;&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160401/1459524257_75266.jpg&quot; /&gt;&lt;br /&gt;\r\n说起火锅，在大多数四川人和重庆人的脑海中能够想起的基本上就是刘一手、陆派&middot;巴倒烫、皇城老妈等等这些牛油类的火锅。确实，在很多人眼里，只有牛油火锅才叫真正的火锅。吃火锅看似简单，其实也是各种复杂与流程，大到锅底口味的搭配，小到油碟的配置比例，更不说需要把控火候与食品的新鲜程度。各盘荤素泛着油脂和肌肉纤维的微光，仿佛还在随着脉搏，这样才能博得客人新鲜感上认同，待不时炉火一沸，筷子小心翼翼地将一片肉从白瓷盘上夹起来，缓慢地浸没在沸腾的锅底当中，数着秒数，把控好时间、节奏，只有客人心中被挑逗得恰到好处之后，才能像挑起一片锦绣丝绸一般，将已换装成浅灰色的肉片迎接出水面，在早已调制好的油碟中划过一回，这样观众最终才能尝到火锅所赋予食品的鲜，甜，嫩，香，脆。&lt;br /&gt;\r\n&lt;br /&gt;\r\n提到《火锅英雄》，话题自然离不开火锅和重庆，就像导演说的：&ldquo;《火锅英雄》是我拍自己的家乡，家乡给到的回忆，任何人都是忘不掉的，里面的人物就是我身边的朋友和我自己&rdquo;。导演杨庆上一部作品还要追溯到2009年的《夜店》，片子上映后，导演如同消失不见，一沉积就是七年。杨庆虽然作品不多，但是一部《夜店》足够让人看出作者的用心。《火锅英雄》上映之后，有人说导演是&ldquo;黑色怪才&rdquo;，黑色幽默玩起来浑然天成。《火锅英雄》如果从观影的角度，可以看到犯罪，青春，友情，迷影......如同火锅一样，这样混杂的食材，怎么做才能够味而又正宗，专访导演杨庆，导演从创立故事，定位，元素，一步一步解析如何拍摄制作《火锅英雄》。&lt;span style=&quot;color:#999999&quot;&gt;（PS：《火锅英雄》上映当天，导演也当上了爸爸，求导演对4月1日心理感受= &nbsp;。=&lt;/span&gt;&lt;span style=&quot;color:#999999&quot;&gt;）&lt;/span&gt;&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160401/1459524420_25456.jpg&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#E56600&quot;&gt;&lt;big&gt;&lt;strong&gt;备料：&lt;/strong&gt; &lt;/big&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n《火锅英雄》的想法在09年的时候就有了，但是一直没想好怎么弄，不知道怎么才能够让这个故事得以被拍摄。后来到动手写剧本都已经到了2012年了。在09年的时候，故事已经有了一个雏形，风格气质都现在一样有些黑色，但是故事上缺乏一些东西。后来我决定跟故事走，我自己想出来故事的基调、情感的方向，跟着故事去走，大概有一个这样的过程。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#E56600&quot;&gt;&lt;big&gt;&lt;strong&gt;锅底：&lt;/strong&gt; &lt;/big&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n感情线是故事的基础，劫案是故事的元素。这个故事的创意就是先有的感情线。《火锅英雄》是我拍自己的家乡，家乡给任何人的回忆，都是忘不掉的，所以在这个故事当中，感情线是自然而然存在的。金融案只是一个包装，不是我的兴趣点，使用这个元素是因为故事、人物这样出现会更有戏剧性。这个故事里面最宝贵的是他们几个人的情感，讲的是人与人的情感，同学的情感，男女的情感，兄弟的情感，人与家人，与家乡，与故人的情感，故事里面情感讲好了之后，什么东西放到里面都不会突兀，就像火锅，如果底料做好了，什么菜都可以扔到里面去，扔进去捞出来就是火锅的味道，所以我觉得故事把情感做好了，什么都OK，我们都是有情感的动物，情感决定了我们去哪、以及要做什么。&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160402/1459529218_45110.jpg&quot; /&gt;&lt;br /&gt;\r\n电影里的重庆，就是我自己生活中所理解、所看到的重庆，我就这样去拍它，是带着自己的感觉去拍摄，我并不会因为它有什么地标，或者别的电影拍过，所以我也要去拍，每一个导演的心目中，一定都有他自己最爱的城市，马丁&middot;斯科塞斯拍纽约，跟别人拍纽约是不一样的，他喜欢拍纽约的意大利人群，他有他自己的情感放在里面，当有了情感，赋予那种空间之后，自然拍摄的就会跟别人不一样。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#E56600&quot;&gt;&lt;big&gt;&lt;strong&gt;油碟：&lt;/strong&gt;&lt;/big&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n电影在气质上，我希望前半段是安静而危险的感觉，就像电影开头，劫匪在雨中默默地开车来到银行，然后很平静的走进去，进入到里面以后会再跳一层空间，进入到内部的内部，然后故事是从内部勾出来。故事里的人物对于我来讲，就是没有离开当地的同学。我是离开家乡到北京混的一个人，他们是留在老家的，是一种更原生态、更真实的人吧。&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160402/1459529432_15755.jpg&quot; /&gt;&lt;br /&gt;\r\n其实故事里的三个人其实就是某一个人的几面而已，对于我来说，创作这几个人物就是我身边熟悉的哥们、兄弟，甚至是我自己的每一面，只是把他们放到三个角色的身上而已。每个人都代表着某一面，但是合起来就是一个人。这三个人在一起十几年了，每个人不得不自己选择某一个位置呆着，家乡的生存空间就是这么大，有人发声，那就有人会自动的沉默，你做了船的舵手，那另一个就去做舵尾，他们就是这样一种生存关系，相互依赖，然后各自找到自己的位置，各安其命，这样才能够在一起做哥们、做兄弟。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#E56600&quot;&gt;&lt;big&gt;&lt;strong&gt;菜品：&lt;/strong&gt;&lt;/big&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【于小惠（白百何饰）】：&lt;/strong&gt;&lt;/span&gt;我也不太明白，她为什么要做这个事情。我觉得这个就是人性，在剧情里不是非得找到她为什么做，为什么不做。如果一定要她给一个理由，那就是有时候我觉得往往感觉上更瘦弱文静的女孩子，她可能会做出比很多身边男人，还要勇敢的事情，在我的生活中就见过女孩比男性还要勇敢的那一瞬间。故事里那三个兄弟已经在社会上混了那么多年，好像感觉什么事都经历过了，这个女孩在金融机构上班，在感觉上她似乎没见过什么世面，但是当她决定要做的时候，她反而更大胆，因为她心里有更珍贵、藏的更深的感情，我觉得人性这个东西，是很难去琢磨透的东西，所以有时候我们必须跟着人物走。&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160402/1459529172_57906.jpg&quot; /&gt;&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【面具】：&lt;/strong&gt;&lt;/span&gt;西游记跟故事里的四个主演是有暗合的，我们故事里是&ldquo;3+1&rdquo;，三个男同学加一个女同学，三个男人动手，女同学动脑子，然后西游记里面师徒也是&ldquo;3+1&rdquo;，师父说往哪走，徒弟们就往哪走，师父有难徒弟们会去救他。而且我觉得《西游记》是能够被解读的，《西游记》能够被大家再一次阐释它的空间太大了，它对现代社会依然没有脱离某种关系。并且在四个劫匪里面，第一个死掉的就是带&ldquo;孙悟空&rdquo;面具的，在性格里面可以看到，那个人不是和其他人很合群，存在着一些爱出头的竞争关系），而且《西游记》是我们祖宗的东西，我过去看美国那些劫案电影，他们有的用美国总统的面具（电影《惊爆点》有使用过），我想我们还是用我们自己的吧。还有一个问题就是版权，其实我们之前也有想过选别的面具，但是需要单独花钱购买版权，但《西游记》是可以避开这条的。&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160402/1459529072_46018.jpg&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【拍摄手法】：&lt;/strong&gt;&lt;/span&gt;我是一个不太看重技术的导演，我觉得所有的技术问题到我这里，我觉得OK就可以用。我完全跟随自己的感觉走，我写剧本、导戏都是这样，我做人也是这样的，我不想拍了，我就不拍了，六年之后，我自己想通了我就拍，没有任何东西可以束缚我，也没有任何一个技术手段或者说方式可以来束缚我。我一定要找到我自己自在的方式，跟随我自己内心的感觉走，所以那些技术手段对于我来说，没有什么是必须要维持的，也没有什么必须不能做的。像打斗的横移镜头，我想用长镜头拍摄一个动作场面，但是那段的场景是我们搭的，因为是打群架，地方非常窄，我们只能把景拆掉一半，在旁边拍。这是我明确跟摄影师沟通后，大家全力付出这样去做的，它真的没有什么理可以去讲。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【音乐】：&lt;/strong&gt;&lt;/span&gt;（注意到没，电影里其实一直没有出现草蜢的歌）在电影中音乐可能会煽情，但我对这个东西是特别谨慎的，我是小心翼翼的运用这种手段，因为我觉得那样不高级。这个电影里面我知道我会用老歌，但我希望用的高级，简洁，并且更细腻一点，所以我非常谨慎这首歌在电影当中出现。我觉得音乐本身有它自己的能量，有它自己的作用，但是如何使用它，这是考验每一个创作者对自己作品的尊重问题，不是说别人怎么用了，你就要怎么用，别人拿来煽了你也要拿来煽，这是每个创作者自己内心的坚持以及天分所决定的。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img alt=&quot;《火锅英雄》，像做牛油火锅一样拍电影&quot; src=&quot;http://77fkxu.com1.z0.glb.clouddn.com/20160402/1459528981_30482.jpg&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【暗恋情人的初次见面】&lt;/strong&gt;&lt;span style=&quot;color:#000000&quot;&gt;刘波和于小惠的初次见面&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#000000&quot;&gt;拍&lt;/span&gt;摄的很简单，但这个简单是建立在极强的故事悬念基础之上，他们俩见面会发生什么？所以我就特意挑选了一个非常日常的环境：便利店。两个人之间那种很微妙、很心理的东西，镜头语言是不足以去表达，我觉得我给了一个长镜头，两个人站在那里，心里有再多的东西，表面上流露出来的只有尴尬，我只需要拍尴尬就好了，心里面的东西，根本不需要去讲、不需要去拍，观众自己会去猜、去想。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#003399&quot;&gt;&lt;strong&gt;【团队合作】：&lt;/strong&gt;&lt;/span&gt;拍摄这个电影，就像是我们电影当中那帮人一样，首先都是那种互相信任的，彼此有共同的理想目标。我觉得我们在一起，还是因为心里面有那份对电影的热爱跟执着，其实我没有去想怎么工作，怎么分工，没考虑过这些东西，我觉得对电影执着到那个程度的时候，大家彼此的情义都在电影里面，我们的制片人也是陪着我这个电影，陪着我扛了三年走过来的，我们不是简单的临时遇到，然后在一起合作，再然后解散的这么一个组合，我们是早就认定对方是同道中人，并且已经有好几年时间的经历了。我们跟他们在一起就是哥们，一直在一起弄这个项目，这个东西不是能用所谓的行业的，做事情的规矩方式能够去工作的。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;span style=&quot;color:#666666&quot;&gt;ps：这次采访，其实更像观影后的问答，针对片子&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;导演一对一的解答，最后，问导演，自己觉得片子怎么样，导演说：&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;我觉得一切都恰到好处，我既不能再多&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;也不能再少，这个故事几年做下来，现在这个样子就是我现在的能力，这是我&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;能做到的最佳平衡点，我不知道再过几年我看这个片子&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;，会不会觉得它哪个地方多&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;哪个地方少，但是对于我目前的&lt;/span&gt;&lt;span style=&quot;color:#666666&quot;&gt;审美来说，目前就是最佳平衡点。&lt;span style=&quot;color:#000000&quot;&gt;最后，&lt;/span&gt;&lt;span style=&quot;color:#000000&quot;&gt;虽然导演没有埋怨，&lt;/span&gt;&lt;span style=&quot;color:#000000&quot;&gt;其实我个人觉得还有一个点要说下，这个片子因为审查的原因，一直有更改，仅台词就有&lt;/span&gt;&lt;span style=&quot;color:#000000&quot;&gt;70多处。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;内容来源：影视工业网（原文链接 http://107cine.com/stream/77722/）&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '37', 'article', '6', '0', '0', '', '5', '28', '2', '0', null, '2016-04-13 15:28:47', '2016-04-14 12:04:36');
INSERT INTO `back_contents` VALUES ('38', '', '专访 | 《御姐拳皇》幕后大咖来给你讲讲这部网大到底有多燃爆！', '/uploads/content/20160415/571099a1d89f9_57o.jpg', '', '&lt;div class=&quot;rich_media&quot; id=&quot;js_article&quot;&gt;\r\n&lt;div class=&quot;top_banner&quot; id=&quot;js_top_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_inner&quot;&gt;\r\n&lt;div id=&quot;page-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_area_primary&quot; id=&quot;img-content&quot;&gt;\r\n&lt;div class=&quot;rich_media_meta_list&quot;&gt;\r\n&lt;div class=&quot;profile_container&quot; id=&quot;js_profile_qrcode&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;div class=&quot;profile_inner&quot;&gt;&lt;strong&gt;星座控&lt;/strong&gt;\r\n\r\n&lt;p&gt;微信号 signfans&lt;/p&gt;\r\n\r\n&lt;p&gt;功能介绍 所有星座控聚集的地方，内容多来自国外知名星座网站，让你提前知道未来的运势。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_content &quot; id=&quot;js_content&quot;&gt;\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;提起网络电影，如果你还依然停留在&ldquo;小成本、小阵容、小格局&rdquo;的印象里，那真的不怪你，怪就怪发展中的网络电影市场有太多的鱼目混珠，太多的套路，观众看不见精品，更看不到电影制作人的真诚。但让人欣慰的是，在市场的发展过程中，依然有人愿意拿出全部精力，花费更多心血，投入更大真诚，用精品带动精品，用实力证明实力。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(0, 0, 255); font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/2add62b572f15e61b3ea0c1a718e69b8.jpg&quot; style=&quot;height:675px; width:526px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;　　正如小编今天要说的这部网大&mdash;&mdash;&lt;/span&gt;&lt;span style=&quot;color:rgb(171, 25, 66); font-size:14px&quot;&gt;由爱奇艺影业出品，北京昊盈太和文化传播有限公司联合出品的《御姐拳皇》&lt;/span&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;该剧上线当日仅10分钟，在爱奇艺的瞬时点击次数就高达10万，随后以每分钟2万的速度稳步递增！1小时点击量破百万，12小时点击量破300万，单日播放量在全网排行榜上称霸，全面开启霸屏霸榜模式！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0px; margin-right:0px; text-align:center&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62)&quot;&gt;&lt;span style=&quot;background-color:#B22222&quot;&gt;&nbsp;&lt;strong&gt;不仅点击超高，更要口碑燃爆！&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0; text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;《御姐拳皇》一经上线就赢得网友的一致安利强推，现在上线不到一周，好评也不断刷新：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(0, 0, 255); font-size:14px&quot;&gt;好评图片&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;　　究竟是一部怎样的作品能够如此让观众盛赞不断？《御姐拳皇》又有哪些因素成就爆款？&lt;/span&gt;&lt;span style=&quot;color:rgb(171, 25, 66); font-size:14px&quot;&gt;第一制片人&lt;/span&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;也对其&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;监制高侨、制片人于泳洋、导演董伟&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;等幕后主创们进行了一轮&ldquo;轰炸式&rdquo;专访，让我们来看一看这部作品到底有多燃爆！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0px; margin-right:0px; text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0px; margin-right:0px; text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62)&quot;&gt;&lt;span style=&quot;background-color:#B22222&quot;&gt;&nbsp;卡司齐聚，必须给力，阵容一个字，硬！&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0; text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;　　值得一提的是，该片由&ldquo;成龙唯一女弟子&rdquo;徐冬梅领衔主演，中国首条WBC职业泰拳金腰带获得者侯旭、《新水浒传》中饰演鲁智深的功夫硬汉晋松、以及精通&ldquo;六合八法拳&rdquo;的老牌打星陈之辉主演，《唐人街探案》中的大个子金刚桑平、&ldquo;超越梦想一起飞&rdquo;的梦想歌手汪正正本色客串，讲述了一个拥有&ldquo;麒麟右臂&rdquo;却一直压抑自己天生神力的妹子为爱踏上拳击擂台、并打倒大反派的故事。开启了电影华丽的全打星阵容与热血燃爆的动作元素构建的新篇章。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(0, 0, 255); font-size:14px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/a775579e3a00643e07cfb8d370e77377.jpg&quot; style=&quot;height:290px; width:435px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;&nbsp;记者：女主打造完成后，做为主创人员，你们自己喜不喜欢？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;导演董伟：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;对于这个角色而言，无论是性格、外形还是动作武打，徐冬梅绝对是最适合且唯一适合的演员。当初选演员的时候，觉得就是她了。并且她在拍摄过程中非常努力，表面看起来她好像拽拽的，其实非常能吃苦，每天几乎都是20小时的工作量。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：对于其他演员的选择又是如何考量的呢？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;导演董伟：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;当初决定要拍这部动作电影，可说是网络动作片的开山之作，我们最基础的要求是，演员必须能打，是实打实地打。我们就想到了成龙大哥的&ldquo;成家班&rdquo;，冬梅是成龙大哥的唯一女弟子，而晋松、桑平又是真正的功夫硬汉，再加上中国首条WBC职业泰拳金腰带获得者侯旭，我们觉得动作的元素就集齐了。其实剧中任何一个角色，我们都是找最适合的演员，这也是对观众的负责。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0; text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:#B22222&quot;&gt;&nbsp;动作燃爆，拳拳到肉，视效一个字，牛！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：《御姐拳皇》立项之初，是出于怎样的考虑？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;监制高侨：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;接触到女拳击手这一题材时，觉得这个点非常好。首先，这一项目有区别于其他的动作电影，中国传统动作电影多以男性为主，在中国的大环境下，影视作品中很少出现以女性为主的。向国外类似于《异行》《疯狂的麦克斯4》等电影中，均以女性形象为主，最终效果相信大家有目共睹，很震撼。所以，以武打戏为主的女强人形象，撑起整个影片，这一切入点是很有创意的。其次，在整个网络大电影市场中，之前也做过诸多元素的尝试，动作电影不管是在成本、时间、演员表演、拍摄等方面的要求都是很高的，而这部作品可以说是目前整个网络大电影中，作为动作电影规格很高的一部作品。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：这部作品的创作灵感来自于哪些方面？这种题材，对于导演等主创方有什么特别的意义？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;导演董伟：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;首先&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，从剧本创作来说，本着想丰富动作片的类型，像剧中不仅只有拳击的元素，还加入了街战、格斗、甚至中国传统的武侠等元素，使整体影片的类型更加丰富。&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;其次&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，影片也借鉴了《九七拳皇》等游戏中的元素，影片名称一度定为《拳皇一六》，另外，每个所谓的大师级人物都有其绝招，例如，化骨绵掌、麒麟臂、逍遥派等。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：拍摄中最困难的点在哪？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;导演董伟：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;首先时间紧任务重&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;。拍摄周期很短，短到我们一度怀疑能不能拍完，尤其还是一部动作片，后来我们高强度拍摄，甚至一天拍了17个小时，终于如期完成。&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;另外就是想要实现一些好的想法&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，例如，拍摄动作时需要一支长镜头，像拍摄故事片的时候，它的焦点、情绪是可以通过技术完成的，但拍摄动作片则不同，有时候一个动作拍十遍只有一遍可用。这时候制片人提出要拍摄一组长镜头，要求拳拳到肉，实打实的，演员不用替身。在中国动作电影中，长镜头运用的很少，但只要拍好了，就一定是一大亮点。该片中，也会有一个长达3分钟的长镜头出现，真的是拳拳到肉。大概在影片30分钟左右的时候。拍摄的时候整整打了十七分钟，从二楼到一楼，很精彩。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：这部影片的投入多少成本？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;监制高侨：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;算上人力及其他资源，总投入超过200万，爱奇艺花重金打造，我们在和爱奇艺一起做第一个吃螃蟹的人，我们也在关注爱奇艺网络大电影的其他类型和题材。与其他的制作商共同进步。影片成本来说，对于动作片的成本，一定不会很低，爱奇艺在这方面也曾说过，我们不拍很low的作品，而且我们不做跟风的，一定要开很新的类型。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0px; margin-right:0px; text-align:center&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;background-color:#B22222&quot;&gt;&nbsp;真诚付出，领先行业，坚持一个字，精！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：本片以武侠动作为主，之前也发行过其他动作类型的影片，例如《斗地主大作战》、《棋侠》等，动作类型是不是爱奇艺现在重点发展方向？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;制片人于泳洋：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;这是不一定的，主要还是看项目本身的特点，以《御姐拳皇》为例，主要表达的是&mdash;&mdash;高手在民间。看似平凡的人，有时候往往身怀绝技，就想影片中的街边烤鱿鱼的、买光盘的，他们看似平凡普通，但当遇到险情可以挺身而出。从这一观点引伸出本片要表达的人生观、世界观。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：影片在诸多方面甚至已超出了院线电影的质量，但最终仍选择网络发行，是有哪些坚持？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;制片人于泳洋：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;量身打造网络电影并且只做精品，是爱奇艺平台和昊盈太和文化一贯的坚持，包括之前爱奇艺的所有作品都是为了网络量身打造，无论是从制作上还是营销方面都具备超强网感，是专门为网络定制的。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：成本提高后，成本回收是否有难度？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;监制高侨：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;不管对于爱奇艺还是我们都有一定难度，我们既然选择了网络大电影，又与爱奇艺合作，我们执着于拍好片子为主，也对爱奇艺平台有着足够的相信。&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;我们都不会一味地想着投资和回报的多少，那些成天想着靠打个擦边球谋取一些小利润的，趁早不要做网络大电影。因为做互联网电影，完全有可能先砸钱，不求盈利。拍摄好片子后，钱自然会回来。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：请您预估一下动作市场？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;监制高侨：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;因为我们是第一个，像这部电影一样拳拳到肉，打戏为主的作品在网络大电影中还没有过，所以我们也是没办法具体预估，作为主创方肯定是很有信心的，但更重要的还是看观众的反馈。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：未来，爱奇艺对于网络大电影的类型会不会有偏向？&nbsp; &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;制片人于泳洋：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;我们做的并不是跟风的事，而是开创的事，我们更愿意做探路者，尝试更多的类型，只争做排头兵，不做跟风的。我们之前的作品类型都不尽相同，以后还会做各种类型的尝试。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;记者：对于新加入的年轻的做网络大电影的团队，有何建议意见？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(123, 12, 0); font-size:14px&quot;&gt;导演董伟：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;年轻人做网络大电影，针对于创作者来说，&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;首先要对得起自己&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，做的作品一定是真诚的表达。&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;其次，多去了解社会，而不是画地为牢，自我陶醉&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(62, 62, 62); font-size:14px&quot;&gt;，自我禁锢，在坚持自己的基础上多关注社会发生的热点话题和观众喜欢的类型，听取他人意见，也要下定决心坚持下去。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:0; margin-right:0&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&lt;span style=&quot;color:#A9A9A9&quot;&gt;&lt;span style=&quot;font-family:微软雅黑; font-size:12px&quot;&gt;来源自第一制片人&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_tool&quot; id=&quot;js_toobar3&quot;&gt;\r\n&lt;div class=&quot;media_tool_meta tips_global meta_primary&quot; id=&quot;js_read_area3&quot; style=&quot;display:none;&quot;&gt;阅读&lt;/div&gt;\r\n&lt;a class=&quot;media_tool_meta tips_global meta_extra&quot; href=&quot;javascript:void(0);&quot; id=&quot;js_report_article3&quot; style=&quot;display:none;&quot;&gt;投诉&lt;/a&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_area_primary sougou&quot; id=&quot;sg_tj&quot; style=&quot;display:none&quot;&gt;&nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;rich_media_area_extra&quot;&gt;\r\n&lt;div class=&quot;mpda_bottom_container&quot; id=&quot;js_bottom_ad_area&quot;&gt;&nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '38', 'article', '6', '0', '0', '', '6', '0', '0', '0', null, '2016-04-15 15:35:41', '2016-04-15 15:36:00');
INSERT INTO `back_contents` VALUES ('39', '', '《赏金猎人》钟汉良搞笑李敏镐成动作担当', '/uploads/content/20160415/57109bb7a45d8_51o.jpg', '', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;4月13日，电影《赏金猎人》在京举办&ldquo;一诺千金&rdquo;主题发布会，导演申太罗携两大男主李敏镐、钟汉良，以及主演唐嫣、徐正曦、吴千语出席活动。李敏镐是赏金猎人里的动作担当，将在片中大展身手；唐嫣化身冷艳女boss号令两大男神；钟汉良一改戏路变搞笑智多星，戏里甩脱偶像包袱，戏外也变身段子手，笑称在说普通话这件事上，自己在李敏镐身上找到了自信。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/cbb978ef046dbf82802f4c0aa23a41ab.jpg&quot; style=&quot;height:533px; width:800px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;智多星小哇的偶像包袱，掉了！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;在李敏镐面前说普通话，自信！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;用制片人黄百鸣的话来说，《赏金猎人》是一部&ldquo;在桥段和动作上都有很新的突破&rdquo;的电影，而演员们更是展现了前所未见的一面，一改自己擅长的戏路。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;经常以深情霸道形象示人的钟汉良成为&ldquo;赏金猎人&rdquo;团队的智多星，他透露自己的角色&ldquo;有智谋，负责赚钱，类似经纪人&rdquo;，而最重要的是很搞笑。小哇回忆刚进组的那几天，当他做起那些搞怪的表情，连李敏镐都忍不住问以前那个帅气正常的小哇去了哪，做这些表情难道没有包袱吗？钟汉良诚恳自曝：&ldquo;其实头几天是有的&rdquo;，不过，为了完成这个角色，小哇决定豁出去，每天都和导演一起想如何才能搞笑。而他做搞怪表情的秘诀竟然是模仿导演，小哇笑称导演的面部表情非常生动，让自己忍不住偷师。总之，男神小哇的偶像包袱，掉了！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;戏里要搞笑，戏外的小哇也变成了段子手。他称赞李敏镐非常敬业，为了让大家入戏，还特意练习了普通话说台词，万万没想到，小哇话锋一转开始表扬起自己：&ldquo;然后我就觉得自己普通话讲得特别好，自信大到不行。&rdquo;在韩国友人面前找自信可还行！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;吴千语在戏中出演一个20岁就进麻省理工读书的天才黑客，她作为技术大拿给团队设计了很多有趣的武器。众位主演在发布会现场展示了这些武器，小哇挑选了一副简单的黑框眼镜，却被吴千语踢爆带上之后&ldquo;能看见我们没穿衣服&rdquo;，小哇机智澄清：&ldquo;可能开关没开。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;小哇戏里是智多星，戏外也是剧组的点子王。李敏镐爆料钟汉良特别会调节片场气氛，还贡献出很多有趣的点子，加入了很多剧本中没有的小桥段。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/8b5bfc1e90d779b545de622d96504fe6.jpg&quot; style=&quot;height:366px; width:550px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;唐嫣演冷艳boss号令两男神&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;李敏镐戏里身手了得戏外调皮&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;唐嫣在戏中出演的是冷艳女boss，专长是发号施令，指挥别人冲锋陷阵，而两大男神就是她的得力干将，钟汉良负责智谋李敏镐负责打斗。两大男神在发布会现场还大玩&ldquo;兄弟五连拍&rdquo;，基情满满默契十足。身为钟汉良和李敏镐两大男神的&ldquo;BOSS&rdquo;，唐嫣表示&ldquo;毫无压力&rdquo;，因为她才是&ldquo;赏金猎人&rdquo;团队真正的领导者。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;黄百鸣介绍，赏金猎人不是警察，但干的是警察的事，上天入地去抓罪犯，戏里自然少不了大场面动作戏。钟汉良笑称自己虽然不负责打戏，但也经历了爆破、飞车的场面，大开眼界，&ldquo;之前都是看别的电影，原来自己在里面也蛮厉害的。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;李敏镐作为团队的动作担当，将在戏中一展身手。他回忆有一场和唐嫣的打戏，是他第一次和女生拍打戏，戏中两人身手了得，但实际在拍摄现场，李敏镐和唐嫣非常调皮，&ldquo;都没有认真练习，一直在开玩笑。&rdquo;唐嫣透露自己有很多和李敏镐配合的打戏，《赏金猎人》也算是她拍摄的最惊险的一部电影。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《赏金猎人》是李敏镐第一次出演合拍片，他坦言因为担心语言障碍，所以很紧张，但大家都很照顾他，和中国演员的合作也很开心。并透露，出演《赏金猎人》是对中国粉丝的承诺。十年前，他刚出道时，曾经向中国粉丝许下诺言：我一定要和中国演员合作，让粉丝在家门口就能看到我的电影。&nbsp;&nbsp;十年后，他终于兑现了这个诺言。为此，发布会的主题定为一诺千金。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;据悉，《赏金猎人》将于暑期档上映。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '39', 'article', '6', '0', '0', '', '5', '0', '0', '0', null, '2016-04-15 15:44:19', '2016-04-15 15:50:10');
INSERT INTO `back_contents` VALUES ('40', '', '戚薇:我演的是不一样的戚哥版杜拉拉', '/uploads/content/20160415/57109d21aa454_53o.jpg', '', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;由&ldquo;偶像剧教父&rdquo;刘俊杰执导，戚薇、王耀庆联袂主演的都市情感剧《我是杜拉拉》4月16日将登陆江苏卫视幸福剧场。该剧号称&ldquo;杜拉拉系列&rdquo;终极版，除了职场斗争，还有婆媳斗争、小三夺爱等戏码，显得更接地气，也更有人间烟火味，《我是杜拉拉》自筹拍之日起就吸引了很多观众的目光。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/27402b50164db9c4e7d8841e49645866.jpg&quot; style=&quot;height:306px; line-height:20.8px; width:500px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color:#ff9999&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;戚薇：我想要给大家一个属于戚哥版的杜拉拉&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;被粉丝称为&ldquo;戚哥&rdquo;的戚薇，2014年与爱人李承铉举行了甜蜜婚礼，并于不久前晋升为辣妈。这是戚薇产后复出的第一部电视剧，她表示，和剧中杜拉拉一样经历了婚姻历练，对角色有全新的理解和诠释，&ldquo;我们剧名叫《我是杜拉拉》，我觉得应该改成&lsquo;我才是杜拉拉&rsquo;，虽然之前众多女星都出演过杜拉拉，但这次会给观众一个属于戚哥版的杜拉拉。&rdquo;戚薇还透露，&ldquo;演杜拉拉这个角色其实挺累的，有时候收工回家我都在想，如果现实生活中的我也面临着她那些问题，能不能撑得住？&rdquo;戚薇还大方承认自己并不擅长做饭，&ldquo;我只会煲汤，进到厨房完全是无从下手的状态，正好戏中的杜拉拉是不太擅长做家务的。&rdquo;据悉，在长达3个月的拍摄期里，戚薇举家搬迁上海，带着女儿Lucky进驻剧组，更是在产后恢复期中狂瘦身，她坦言：&ldquo;我以前没有减肥过，但是这次是真的刻意在减。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/56ff72731566121498311bc510f76247.jpg&quot; style=&quot;height:366px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;color:#ff9999&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;这版&ldquo;杜拉拉&rdquo;除了职场 还有家庭&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;职场小说《杜拉拉升职记》讲述了都市白领杜拉拉从一个默默无闻的小职员成长为企业高管的故事，被誉为中国白领必读的职场修炼小说，并曾被多次改编为电影、电视剧。戚薇之前，众多女星曾演绎不同版本的杜拉拉。2009年有姚晨的话剧版《杜拉拉升职记》；2010年王珞丹主演电视剧版《杜拉拉升职记》；同年，徐静蕾的电影版《杜拉拉升职记》上映；此外，电影版《杜拉拉追婚记》、网络剧《杜拉拉升职记》也相继上映。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;这次，由执导了《薰衣草》、《王子变青蛙》、《爱情魔发师》、《杉杉来吃》、《何以笙箫默》等偶像剧、有&ldquo;台湾偶像剧之父&rdquo;之称的刘俊杰执导，与其他版本的&ldquo;杜拉拉&rdquo;不同的是，该剧讲述了杜拉拉婚后职场和家庭的生活。导演刘俊杰称，该剧将作为&ldquo;杜拉拉系列&rdquo;的终极作品。剧中，杜拉拉与王伟的婚姻生活，不仅有婆婆、岳母的强势介入，还有初恋情人、小三等意外状况，更有&ldquo;催婚&rdquo;等几乎所有80后夫妻都曾面临的窘境，把职场生存法则、婆媳关系处理、中年情感危机等社会元素植入其中，打造一部女强人的生存法则。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;王耀庆曾在网剧《杜拉拉升职记》中饰演过王伟一角，此次他再次挑战这个角色。王耀庆对搭档戚薇的性格表示欣赏，&ldquo;她确实个性非常开朗，像女汉子。&rdquo;王耀庆还透露，戚薇这次拍戏尺度全开，不怕李承铉吃醋。而对于处在产后减肥期的搭档戚薇，王耀庆还主动担起了减肥助教的角色。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', null, 'article', '6', '0', '0', '', '5', '3', '0', '0', null, '2016-04-15 15:49:58', '2016-04-15 15:49:58');
INSERT INTO `back_contents` VALUES ('41', '', '情怀还是钱，台湾导演为何爱拍文艺片？', '/uploads/content/20160415/57109e650dad8_17o.jpg', '', '&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;大陆给予电影的各种上映保护在台湾是没有的，所以台湾电影只能和好莱坞硬碰硬，这样的情况下绝大部分都要亏本，去年周杰伦的《天台爱情》和《环太平洋》一起上映，西片一天38场，杰伦一天6场，场次也都很糟糕，没办法，观众只喜欢看西片。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;如果你是一位孤身来到台北，怀揣电影梦想的年轻人，如何成为一位电影导演呢？办证上岗、申请投资、自由拍摄、复杂审查，然后基本就听天由命了。台湾导演是整个华语区最苦、最累的导演，他们大部分都要自掏腰包贴补电影的拍摄，最终也很难收获很好的票房成绩，即便是周杰伦，如果没有大陆的票房，他的《天台爱情》在台湾也只能被欺负、排挤。记者花费多天时间，采访台湾&ldquo;电影委员会&rdquo;，台湾影视及流行音乐产业局，电影人侯孝贤、蔡明亮、朱延平等人，分析台湾电影工业制作流程，解密一部电影如何在台湾诞生。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/780fcbd11ad7d356b9689aeb14600819.jpg&quot; style=&quot;height:357px; width:543px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《天台爱情》剧照&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;无论是谁先办资格证&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;在台湾拍电影自由度很高，但却并不是每个人都可以去拍电影的，无论是做导演、编剧、演员甚至制片人，都需要取得资格证，无证上岗视为违法行为，不但要被罚款，电影拍摄完成也不允许上映。台湾&ldquo;电影委员会&rdquo;的工作人员说，资格证其实很容易申请，基本上任何人都可以申请，而且基本上任何人都可以申请下来，&ldquo;如果你不是台湾永久居民，就需要在申请资格证之前先申请&lsquo;艺术类&rsquo;工作许可证，这个证件仅申请就需要7~10个工作日，不过证件的审核则需要30个工作日之久。&rdquo;该工作证在台湾工作的时间从30天到180天不等。至于申请电影从业人员资格证，则只需要向台湾影视及流行音乐产业局递出申请表，只要你不是在逃的犯罪分子，填表之后5个工作日后就可以拿到此证，该证件要求电影拍摄时随身携带，丢失必须补办。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;另外，未满20岁者申请演员资格证需要监护人签字同意，这个资格证台湾演艺人员人手一份，无论是李安还是林青霞。&ldquo;电影委员会&rdquo;的工作人员说：&ldquo;拍电影期间所有人的资格证都是需要随身携带的，所以剧组里面所有人的资格证都是由监制那边专人统一保管的，因为很担心大家会弄丢掉，如果丢掉就要立刻补办，这个人就有几天不能进组了。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;虽然台湾开放了大陆演职人员入台拍电影的资格，但限制不少，朱延平说：&ldquo;一部台湾电影里面的大陆主要演员不能超过总人数的三分之一，职员数目不能超过台湾职员总数。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;有利有弊的&ldquo;辅导金&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;台湾电影资金欠缺，即使是侯孝贤、张艾嘉这种知名导演，想要找投资或寻求商业合作，都十分艰难，所以绝大部分导演都是求助有关部门。台湾有一个&ldquo;辅导金&rdquo;计划，帮助导演们投资电影，且不求回报。该计划的长片&ldquo;辅导金&rdquo;是台湾导演们的首选，因为它的金额最高，而且可以重复申请。里面细为三个类别：一般组能申请到2000万新台币(约合410万元人民币)，要求导演执导过两部以上的电影长片，其中至少一部影片在台北地区票房达到50万新台币(约合10万元人民币)；新人组和纪录片组可以申请1000万新台币(约合205万元人民币)，但要求导演执导过一部长片、20分钟以上的短片或75分钟以上的单元剧；电视电影仅能申请500万新台币(约合102万元人民币)，要求导演至少有制作过单元剧的经验。不过长片辅导金只能用于拍摄60分钟以上的影片，不能做其他用途；如果没有任何拍摄经验，那就可以申请&ldquo;剧本开发补助金&rdquo;，只要有一个能拍摄成60分钟以上影片的剧本，就有机会得到50万新台币(约合10万元人民币)的资金，但要求电影必须在15个月内拍摄完毕，且一生只能申请一次。实际上很多大导演都曾用这个&ldquo;辅导金&rdquo;拍摄，比如张艾嘉的《20 30 40》，李安的《喜宴》、《推手》和《饮食男女》，杨德昌的《牯岭街少年杀人事件》、侯孝贤的《戏梦人生》、蔡明亮的《爱情万岁》、魏德圣的《海角七号》&hellip;&hellip;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/f93b5a2e8210db2ba5dfc1a592ae4f28.jpg&quot; style=&quot;height:381px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《牯岭街少年杀人事件》剧照。影片曾因选角及资金问题造成很大困扰，但最终获得第28届金马奖最佳影片。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;不过，针对这个&ldquo;辅导金&rdquo;计划台湾电影人说法不一，文艺片导演很喜欢，比如蔡明亮就说：&ldquo;如果没有&lsquo;辅导金&rsquo;，那台湾电影早就死掉了，因为没有人愿意投台湾影片。&rdquo;但是该&ldquo;辅导金&rdquo;董事长和片商公会的理事长朱延平却说：&ldquo;很多人套取&lsquo;辅导金&rsquo;，然后制作很低劣的电影。后来我们又设置了很多门槛，又去监控&lsquo;辅导金&rsquo;的用处。但&lsquo;辅导金&rsquo;的确帮了很多人，最初设立的原意是想鼓励更多商业创作，但因为该资金的投入不需要回报，所以还是有很多人拿去拍文艺片，根本不会像大陆导演或者好莱坞导演那样遵循市场规律。&rdquo;&ldquo;台湾电影教母&rdquo;焦雄屏也说，台湾导演只想拿奖。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;金马创投会也是来钱途径&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&ldquo;辅导金&rdquo;只是投资的资金，如果想要得到名导的帮助，那么金马奖设立的金马创投会就是最佳选择了。金马创投会帮助的电影不仅限于台湾电影，只要是华语地区的影片均可参加，曾得到过创投会支持的影片包括《赛德克&middot;巴莱》、《逆光飞翔》、《痞子英雄》等台湾电影，也包括管虎的《杀生》等大陆电影，甚至还有今年金马奖最佳影片《爸妈不在家》这样的新加坡电影。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;创投会在每年金马奖开始前半年报名，仅需要提供剧本以及导演、制片人、编剧的名单，然后由侯孝贤等人从中选出最有潜力的作品，不但会颁发100万新台币(约合20.5万元人民币)的创作资金，还会提供1万欧元(约合8万元人民币)的后期制作赞助费。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;侯孝贤告诉记者说：&ldquo;参加金马创投会实际的目的不在于钱，100万新台币对于很多大陆影片来说根本不多，但是由于创投会会得到华语地区很多大导演、制片公司的关注，这样就很容易得到一些有声望导演的支持，电影也比较容易被介绍到海外的电影节上。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/9e045474e6213c4806bcea6ef63ddbfc.jpg&quot; style=&quot;height:300px; width:600px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《爸妈不在家》剧照&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;有商业企图就得自己贴钱&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;即使一部电影既拿到&ldquo;辅导金&rdquo;又得到了金马创投会的支持，那也只有2100万新台币，折合人民币只有400多万，另外还有1万欧元即8万多人民币的后制资金，在大陆只能拍《孤岛惊魂》、《密室》这种小成本影片。这种低廉成本就造成了台湾导演大部分都拍文艺片的状况，而那些想要有商业企图的导演和制片人就要自掏腰包，或者把房产抵押给银行贷款贴补，比如《海角七号》导演魏德圣就曾抵押房子筹措拍片资金，《囧男孩》的导演杨雅喆则说：&ldquo;我们剧组并没有抵押房子，但是(制片人)李烈把她妈妈的房子给抵押了。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;虽然投资来得很艰难，但拍摄的过程很自由，无论资金来自哪里，提供资金者都不会干涉创作自由，台湾资深制片人李烈说：&ldquo;台湾拍电影是很自由的，在法规的规定下，电影人有一个蛮大的空间去创作，比在大陆要好很多。&rdquo;不过资金也限制了台湾电影的格局，比如台湾电影都不喜欢拍外景，因为按照规定，凡是外景，无论是公共场所还是私有场所，都需要向台湾&ldquo;电影委员会&rdquo;申请协助拍摄，不但要提供比较高的费用，而且还会浪费很多时间。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;审查手续复杂过审很容易&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;像大陆电影一样，在台湾电影完全制作完成后，需要第一时间送审。送审之前需要两个提前的手续，第一是把样片送到影视及流行音乐管理局申请电影版权归属，第二是向税务部门申请&ldquo;文化艺术事业减免营业税及娱乐税&rdquo;，之后才是正式审查手续。先申请电影片检查，该检查除了正片检查外，还需要检查预告片、纪录片、广告片等，而且均需收费。该检查一般只要不是违法乱纪、提倡邪教、宣扬极度色情或暴力，一般都能通过，如果没能通过检查处会通知导演进行修改，检查合格后检查处会对电影进行分级，导演就可以根据级别申请准演执照了，再由检查处进行复检，合格后该片就可以排期上映了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/16f2007b4a20f7f4773efce9dcc3fe2d.jpg&quot; style=&quot;height:290px; width:450px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《海角七号》剧照&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;上映档期由排片人定生死&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;在大陆，一部电影得到上映许可，下一步就是制片公司申请档期。但是在台湾，档期是由一批专门的人来做的，他们叫排片人。台湾&ldquo;电影委员会&rdquo;的工作人员说：&ldquo;排片人都是独立的，他们游走在电影院和电影公司之间，先帮电影公司去跟各大影片公司订租影片、安排档期，然后再把电影公司那些比较不容易有好票房的电影推荐给电影院。&rdquo;不过排片人只负责把电影推荐给电影院，排片数量则由电影院自己说了算。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;由于台湾观众基本上只喜欢好莱坞电影，所以台湾电影基本上都无法占据好档期，排片上也相当吃亏，在圣诞、新年、春节这些档期里，排片量还不足好莱坞大片的零头。华纳威秀电影院经理就说：&ldquo;大陆给予电影的各种上映保护在台湾是没有的，所以台湾电影只能和好莱坞硬碰硬，这样的情况下绝大部分都要亏本，今年周杰伦的《天台爱情》和《环太平洋》一起上映，西片一天38场，杰伦一天6场，场次也都很糟糕，没办法，观众只喜欢看西片。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;海外参展回来记得拿奖金&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;台湾多文艺片，跟情怀有关，跟台湾水土有关。此外，朱延平说，目前由于商业片在台湾当地收不回成本，而极少的投资数字也根本无法卖去大陆和大陆的商业片竞争，所以绝大部分台湾导演还是喜欢一门心思去拍摄能够在海外得奖的文艺片，而这些文艺片除了能让导演本人获得国际声誉，从而得到海外投资外，还可以在台湾当地拿到奖金。他说：&ldquo;台湾有超多组织奖励电影去海外，无论是拿奖还是参展，回来都有钱拿，影视及流行音乐管理局还设立专门的奖金，虽然这个奖金导演们拿到之后都去还债了。不过缺点是台湾电影就变得越来越小众，都出去拿奖了，但真正能拿到奖的又有几个呢？所以台湾电影才出现了现在这种观众也不爱、影展也不爱的濒死状态。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/cb42d4a2bc80c89ace88a93dd6ea0e94.jpg&quot; style=&quot;height:367px; width:550px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《那些年，我们一起追的女孩》剧照&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人开始前往大陆谋求发展&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;虽然有《那些年，我们一起追的女孩》、《海角七号》等不足10部电影曾在台湾创下票房奇迹，但实际上大部分台湾电影在本地是无法赚到钱的，而且以台湾电影的投资数字，即便拍商业片也根本无法到大陆和大陆商业片竞争，所以很多台湾制片人开始前往大陆谋求发展，焦雄屏、李烈、柴智屏等纷纷来到大陆，朱延平说：&ldquo;制片人的嗅觉总是更敏锐，他们虽然不愿意承认大陆的机会更多，但是的确已经开始把工作重心转移到大陆，那边有更多的资金，更多的机会。我们都知道，台湾电影的希望肯定是在大陆的，但是台湾很多导演都想不通这件事，第一他们不愿意迁就市场尝试商业创作，只是一门心思拍那种很闷的小众电影，大陆不会有人投资，第二他们习惯了孤芳自赏，根本不愿意融入市场，那就在台湾那个小小的格局里面越走越窄吧。&rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&lt;span style=&quot;color:#A9A9A9&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;来源：1905电影网&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '41', 'article', '6', '0', '0', '', '2', '0', '0', '0', null, '2016-04-19 16:08:46', '2016-04-15 16:08:56');
INSERT INTO `back_contents` VALUES ('42', '', '【制片动态】如何把一个有争议的话题改编成爆款电影？', '/uploads/content/20160415/5710b3d781f30_47o.jpg', '', '&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;网络时代，热点频现，而网络大电影门槛低、周期短等特点，让它容易在题材上紧跟热点、制造话题、吸引人眼球。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;有些社会话题是有时效的，比如：干爹、绿茶婊、海天盛宴、斗鱼直播&ldquo;造人&rdquo;等，这类话题跟起来容易但风险大，往往电影才刚出来，热点就已经不&ldquo;热&rdquo;了。有些话题虽然敏感，但是持久，比如堕胎、末日灾难、同性恋、一夜情、异能&hellip;&hellip; 这些都是人们长期关注也都有强烈主张的议题。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;利用有争议的话题去拍网络大电影，是一个影视选题的捷径，但要把这些争议的话题拍成爆款，却也没那么容易。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#ff6633&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;观众为什么要在乎你的观点&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;大部分想看这种片的观众，对这些议题都已经有相当的投入了，不管是堕胎、同性恋、核电、或是新移民，他们都思考过社会、政府该往哪些方向前进。这些观众的心都已定。他们想要的是，被听见，而不是去听创作者的观点。他们想看的是，强化他们主张的电影。那，在这群观众中，一个创作者能提出什么建设性的观点? 然后，观众又为什么要在乎?&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;这时，你当然可以马上拿起笔，写出一个立场鲜明的角色，马上拍成一部，阐述自己立场的电影，但是，这样做会让大众迫不及待的想冲向戏院，去了解你在想什么吗? 应该不会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/10fbabd72ae114a20348076a585f6e2f.jpg&quot; style=&quot;height:337px; width:600px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;《狼图腾》聚集环境保护议题&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;你的电影中，搞不好还有几个很不错的论点，但这些论点都藏在电影里，观众要先买票才看的到。如果你最引以为傲的论点，都很难让人知晓，到底要靠什么吸引观众买票入场哪?&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;答案是，&lt;/span&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;不是要用论点、不是用主题、也不是用创作者立场，去吸引观众入场。而是要用故事 &mdash;主题被述说的方式&mdash;去吸引观众。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;如果你的电影在讲一个女人突然发现她怀孕了，她开始紧张，生活开始失衡。这样的故事，或许里面有些冲突和戏剧性，但是，故事本身是不吸引人的。&lt;br /&gt;\r\n&lt;br /&gt;\r\n如果你的电影在讲一个女人突然发现她怀孕了，然后她发现她先生是个杀人魔，这样的故事，或许刺激了些。但，感觉还是不太够。&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/0c6aa5bc7619972796247c9608a6223e.jpg&quot; style=&quot;height:413px; width:590px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;如果你的电影在讲一个女人，为了要逼她男友结婚，假装怀孕，但，她后来又反悔了，假装去医院做个假堕胎手术，误打误撞，变成了支持堕胎的公众人物。女主角从假怀孕，到假堕胎，最后变成假名人，这时，堕胎主题，就从一个笼统的主题，变成了这个主角专属的两难处境。&lt;br /&gt;\r\n&lt;br /&gt;\r\n上述三个故事，都有自己的发挥空间，也都各自有观众群。但，这里的重点是，观众会选择看一部电影，绝大部份，是因为主角的两难处境跟自己有共鸣。&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6633&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;你的论点是不是已经被讲烂了？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;当你在拍争议性议题、或任何形式的电影时，记得，这些电影的议题，都已经存在社会上很久了，也被千百个故事包装过了，也就是说，这些议题的 - 好处、坏处 - 也都被分析到烂了。我们都知道战争不好、不公，因利益而生，这些都是老生常谈了，但，如果你被交付要拍一部战争片，你要如何拍，才不会让人觉得是陈腔烂调。这时，不是要假装战争片里讲的主题，不是陈腔烂调，它是。但是，技巧是要找出新的方法，让观众重新认识这些主题。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;这里所谓的技巧，就是指故事，大部分观众在意的是，故事想问的问题，而不是主题想问的问题，如果你要讲一个战争不好的故事 - 一个小兵为了逃兵，不惜干掉长官，假装成长官逃兵，然后，被敌军抓到，被关到敌军俘虏营里，还被自己同袍当领袖，最后，在战争中找到自己的故事 - 这个故事，可以探索战争的各个层面，但它更是这个小兵的个人旅程，一个没准备好，就被推向内在、与外在战场的故事，也因为有这个故事，才能让观众对这个电影，有很强的共鸣点。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://112.74.86.237:8081/uploads/images/df678bdcee1c7a4f6f83109c7ff15afc.jpg&quot; style=&quot;height:768px; width:1024px&quot; /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;如果你让主题变成电影的卖点，例如一部讲埃博拉病毒的电影，就用埃博拉病毒本身去宣传它，这样做，有可能会成功，但运气成份较多，也跟时机有关。但是，让故事问一个有趣的问题，或是让故事有一个很难解的两难处境，都会让这部电影，更渊远流长，有更多成功的机会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#ff6633&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;你的故事只有单一面向吗？&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;主题越有争议性，创作者越有可能有强烈的感受，有些主题很复杂，有灰色地带，有些则没有。如果你的故事跟强暴有关，你要把强暴犯，用公平的眼光拍，还是要把他拍成坏蛋? 但，请记得，一个单一面向的故事，就算议题只有单一面向，也不会是好看的戏剧。&lt;br /&gt;\r\n&lt;br /&gt;\r\n但，另一方面，一个主角如果永远是对的，他也知道他是对的，最后也被证明，他是对的，也不是不可行 - James Bond (詹姆士邦德)、Indiana Jones (印第安纳琼斯)，都是这种主角。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;但是，碰到电影的主题，一直只讲一边的好，另一边的坏，电影很快就会变成过度简化的卡通了。&lt;br /&gt;\r\n&lt;br /&gt;\r\n但是，反过来说，用过多的面向去探讨一个主题，拍出角色的每个面向，让我们看不出对与错，看不出想法，也会让电影变的很冗长。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;所以，如果探讨太多面向、探讨太少面向，都很无聊，到底要如何拍一个不会失焦，也不会过度简化的故事?&lt;br /&gt;\r\n&lt;br /&gt;\r\n答案是，&lt;/span&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;电影中唯一重要的观点，只有主角的观点&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;。主角的观点 &mdash;不是创作者的观点&mdash;才是观众想多了解的。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;主角的观点&mdash;他对一些事情的看法&mdash;越清楚越好。这样，不只可以创造出一个立场鲜明的角色，也可以创造出挑战他立场的反派，让主角巩固自己的立场。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;一个立场不明，对事情没有想法的角色，很难诠释。也只代表，创作者对许多事情没有想法。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;另外，一个角色的立场，很清楚的好处是，当他的立场被挑战时，他会想站稳脚步，不想被打败，这样的故事，比一个没有方向的故事，有意义多了。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&lt;span style=&quot;color:#A9A9A9&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;来源：教你写剧本&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:right&quot;&gt;&nbsp;&lt;/p&gt;\r\n', '42', 'article', '6', '0', '0', '', '2', '0', '0', '0', null, '2016-04-15 16:39:48', '2016-04-15 17:26:48');
INSERT INTO `back_contents` VALUES ('43', '', '最新通告', '/uploads/content/20160415/5710b20271d7b_58o.jpg', '', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;一、网络大电影《姐姐我爱你》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;题材：青春、爱情、悬疑&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：北京、英国&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：2016年5月&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：10天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：严亮&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：目前暂时接受电子文件&lt;br /&gt;\r\n剧中主要角色均未定！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;二、电视剧《找个好男人嫁了吧》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：彭芾 代表作(我的极品老妈)&lt;br /&gt;\r\n演员副导：于飞&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;题材：当代都市情感&lt;br /&gt;\r\n拍摄地点：海南&lt;br /&gt;\r\n开机时间暂定：5月&lt;br /&gt;\r\n戏中角色待定中&lt;br /&gt;\r\n欢迎各大经纪人及专业演员见组洽谈，请带文字版资料。另需跟组演员。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;三、《龙珠传奇》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：周远舟&nbsp;《麻雀》《诛仙青云志》&lt;br /&gt;\r\n导演：朱少杰&nbsp;《诛仙青云志》《乱世佳人》《烽火佳人》&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人：邓细斌&lt;br /&gt;\r\n编剧：李亚玲&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;题材类型：传奇清装大戏&lt;br /&gt;\r\n拍摄地：横店&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;正式筹备：五月十五号开机。&lt;br /&gt;\r\n拍摄周期：105天&lt;br /&gt;\r\n已定演员：杨紫，秦俊杰&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;四、电视剧《我的爱情不刹车》&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演:蓝志伟 代表作品《神话》、《欢天喜地七仙女》&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人:黄斐&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拟定拍摄地点：上海市、江苏苏州、内蒙古&lt;br /&gt;\r\n预计开机时间：2016年5月中旬&lt;br /&gt;\r\n项目周期：待定&lt;br /&gt;\r\n演员统筹:张文杰&nbsp;&lt;br /&gt;\r\n演员统筹:运合工作室&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品方：国洲影视（上海）有限公司&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;\r\n&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;五、电影《小强大战外星人》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：李凯 代表作品《疯狂的蠢贼》《失魂岛》&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;编剧：杨庆 代表作品《夜店》《火锅英雄》&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间:2016年5月初&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期:60天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：重庆&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;已定演员：王宁 修睿 李梦&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员副导演：姚泰卯&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;需大量喜剧演员，欢迎推荐&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;目前只接受电子资料，合适约见。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;六、电影《公寓怪谈》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：窦微&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;影片类型：惊悚/悬疑&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：4月中旬&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：北京&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;人物角色均未定：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市朝阳区朝阳门外吉市口东路佳汇国际中心7层&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;七、电影《午夜直播间》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：魏子鸿 &nbsp;代表作品《危城奸霸》&mdash;执行导演；&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;影片类型：惊悚/喜剧&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：五月中旬&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：30天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：北京&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市朝阳区朝阳门外吉市口东路佳汇国际中心7层&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;七、电影《小心爱妻出没》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;原著作者：赤川次郎（日本）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;监制：文隽（香港）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：黎妙雪（香港）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;影片类型：喜剧&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：七月中旬&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：45天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：杭州/广州&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;主演：郭涛，马苏，王太利，谢依霖等&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;未定角色：男二，女二，男三，女三&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市朝阳区朝阳门外吉市口东路佳汇国际中心7层&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品：风明源创文化传媒有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;承制：风明源创（天津）文化传媒有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;备注：以上演员要求高颜值美女帅哥或网红，或有特点具备喜剧天赋。没有经纪人经纪公司者优先。另外公司除以上已经进入筹备期的电影项目外，今年投资制作的影视剧项目不少于十部，我们还会挑选满意的艺人洽谈与公司签约，为艺人进行全面包装。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;八、电影《打印情人》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：永康、杭州&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：15天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：4月25号前&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京、杭州&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;请发资料到邮箱。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;九、电视剧《股份农民》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：延艺（中国电视剧制作中心导演）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人：张霁虹&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：广西贺州&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：5月初&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：75天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;已定主演：张国强&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;Casting团队：ST工作室&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：忘归经济酒店（东方远洋店）8609室&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：北京华盛金榜国际传媒有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十、三十集古装剧《峨嵋风云》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;总制片人:龚智勇&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地:横店&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期三个月，2016年4月16开机&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹:周一&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备处:横店镇假日宾馆，1312房间&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十一、30集电视剧《爷们，咱能成》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品人：李景阳、杨国栋&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人：彭俊峰&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;编剧：邹亚丁&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：何涛 &nbsp;代表作《暴风骤雨》《兄弟兄弟》《天地英雄》《绝对底线》《对攻》等&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;题材：新农村建设&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：6月初&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄时长：100天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：暂定山东或河北&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：于采立&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市东城区银河SOHO D座10层51016室（方金影视）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品方：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;方金影视文化传播（北京）股份有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;北京合众影业文化发展有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;主演均未确定，正在洽谈国内一二线演员。本剧角色众多，请现场索要人物小传，欢迎各位经纪人和演员朋友们尽快前来投递纸质资料。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;工作时间为周一至周五上午11：00-下午17:00。来前请提前电话沟通。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十二、网络大电影《中国队长》&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：横店&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：2016年5月12号&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：15天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;目前筹备地址：阳光旅店7号楼一层123房间（16号将搬家到大望路飘酒店）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品方：福建迪塞尔文化传播有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;播出平台：爱奇艺，腾讯视频等&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;剧中角色众多，需要大胸美女主播、时尚性感美女、健美型男、反派人物。请各经纪公司及经纪人以及专业演员前来见组，投递资料（附带视频资料）；非专业人士勿扰，谢谢！请各路朋友帮忙转发谢谢。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十三、网络大电影《死神的爱》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品人 ：尚喜容&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;监制：颜光兴&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演 ：杨健武&nbsp;代表作 《鹿鼎记》97版《倚天屠龙记》吴启华版&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片主任：陈昌武&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;监制：颜光兴 代表作品：《英雄本色2》《倩女幽魂》&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：高碑店礼安门高碑店西店村81-1&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：北京枫尚世纪影视文化传播有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;本剧主要角色全部启用新人，欢迎个人及经济公司前来投递资料！&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十四、网络大电影《诡日记》&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;编 剧：孙雷、李旭、麦子&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：孙雷&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;影片类型：悬疑/惊悚&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地点：北京（暂定）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：2016年5月20号&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：20天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：于采立&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市东城区银河SOHO D座10层51016室（方金影视）请投递或邮寄纸质版资料&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;方金影视文化传播（北京）股份有限公司、&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;可乐影视文化传播（北京）有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;本剧主演需要小鲜肉小鲜花，时间紧任务重，欢迎前来投递纸质版资料。工作时间每天上午11：00-下午17:00，来前请提前电话沟通。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十五、网络大电影《贼窝火》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：孙雷&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;文学监制：查文白&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制片人：郅东辉&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;编剧：边垒&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;类型：都市喜剧&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：5月20日&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：20天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：北京&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：于采立&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：北京市东城区银河SOHO D座10层51016室（方金影视）请投递或邮寄纸质版资料&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;方金影视文化传播（北京）股份有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;可乐影视文化传播（北京）有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十六、网络IP大电影《茅山志》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;编剧/毕建威&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演/毕建威&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：4月25号&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;周期：12天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地址：全程北京&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：艳鹏&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：北京华兆天祥影视传媒有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;地址：暂时只接受电子版资料&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;十七、院线电影《梦回1935》&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：肖莫庸&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;类型：传记 战争&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：5月10号&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;周期：30天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地点：北京 四川雅安&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：侯柏男&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;十八、院线电影《激战车桥》&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;监制：江平&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：张馨&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;类型：传记 战争&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：6月中旬&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;周期：45天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地点：横店 江苏淮安&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;目前电子版演员资料整理筹备阶段&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;望诸多经纪人及演员朋友多多支持&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;期待合作&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;十九、悬疑电影《嫌疑人X的献身》&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;导演：苏有朋&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：70天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：保密&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;制作公司:光线传媒&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;演员统筹：陈致&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;需要双男主少年时期:12-16岁，帅气，睿智，双眼皮。（大量戏份）&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;望广大经纪人，演员朋友速度发送电子版资料。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地点：光线传媒&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;如需面试 提前预约&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#ff6666&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;&lt;strong&gt;二十、电影《变形者》开机倒计时&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;开机时间：4月18号&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄周期：30天&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;拍摄地：横店、义乌&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;选角导演：吕保杰&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;出品公司：北京宝庆影业传媒有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;浙江东阳风华正茂影视文化有限公司&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;筹备地址：横店都督南街57号盛都宾馆201房间。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:微软雅黑,microsoft yahei&quot;&gt;剧中还有大量角色未定，没来面试的演员抓紧哦&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', '43', 'article', '6', '0', '0', '', '3', '21', '5', '6', null, '2016-04-15 17:19:01', '2016-04-15 17:25:14');

-- ----------------------------
-- Table structure for back_flags
-- ----------------------------
DROP TABLE IF EXISTS `back_flags`;
CREATE TABLE `back_flags` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性名',
  `attr_full_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性全称名',
  `display_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of back_flags
-- ----------------------------
INSERT INTO `back_flags` VALUES ('1', 'l', 'link', '链接', '可用于友情链接');
INSERT INTO `back_flags` VALUES ('2', 'f', 'flash', '幻灯', '可用于页面幻灯片模型');
INSERT INTO `back_flags` VALUES ('3', 's', 'scrolling', '滚动', '可用于页面滚动效果的文章');
INSERT INTO `back_flags` VALUES ('4', 'h', 'hot', '热门', '可用于页面推荐性文章');

-- ----------------------------
-- Table structure for back_metas
-- ----------------------------
DROP TABLE IF EXISTS `back_metas`;
CREATE TABLE `back_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'meta名',
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略图',
  `slug` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略名',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'category' COMMENT 'meta类型: [category]-分类，[tag]-标签',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta描述',
  `count` int(10) unsigned DEFAULT '0' COMMENT 'meta被使用的次数',
  `sort` int(6) unsigned DEFAULT '0' COMMENT 'meta排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  KEY `name_index` (`name`),
  KEY `slug_index` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='META元数据（分类|标签） 表';

-- ----------------------------
-- Records of back_metas
-- ----------------------------
INSERT INTO `back_metas` VALUES ('1', '活动', null, 'slide', 'category', '', '0', '0');
INSERT INTO `back_metas` VALUES ('2', '资讯', null, 'news', 'category', '', '0', '0');
INSERT INTO `back_metas` VALUES ('3', '最新通告', null, 'common', 'category', '', '0', '0');
INSERT INTO `back_metas` VALUES ('4', '猩猩推荐', null, 'common', 'category', null, '0', '0');
INSERT INTO `back_metas` VALUES ('5', '猩圈动态', null, 'common', 'category', null, '0', '0');
INSERT INTO `back_metas` VALUES ('6', '明猩Talk', null, 'common', 'category', null, '0', '0');

-- ----------------------------
-- Table structure for back_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `back_password_resets`;
CREATE TABLE `back_password_resets` (
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `token` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '会话token',
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of back_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for back_permissions
-- ----------------------------
DROP TABLE IF EXISTS `back_permissions`;
CREATE TABLE `back_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名',
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限信息表';

-- ----------------------------
-- Records of back_permissions
-- ----------------------------
INSERT INTO `back_permissions` VALUES ('1', 'manage_contents', '管理内容', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `back_permissions` VALUES ('2', 'manage_users', '管理用户', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `back_permissions` VALUES ('3', 'manage_system', '管理系统', null, '2015-02-04 09:40:56', '2015-02-04 09:40:59');

-- ----------------------------
-- Table structure for back_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `back_permission_role`;
CREATE TABLE `back_permission_role` (
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限与用户组角色对应关系表';

-- ----------------------------
-- Records of back_permission_role
-- ----------------------------
INSERT INTO `back_permission_role` VALUES ('1', '2');
INSERT INTO `back_permission_role` VALUES ('1', '3');
INSERT INTO `back_permission_role` VALUES ('2', '1');
INSERT INTO `back_permission_role` VALUES ('2', '2');
INSERT INTO `back_permission_role` VALUES ('3', '1');
INSERT INTO `back_permission_role` VALUES ('3', '2');

-- ----------------------------
-- Table structure for back_relationships
-- ----------------------------
DROP TABLE IF EXISTS `back_relationships`;
CREATE TABLE `back_relationships` (
  `cid` int(10) unsigned NOT NULL COMMENT '内容数据id',
  `mid` int(10) unsigned NOT NULL COMMENT 'meta元数据id',
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内容与元数据关系联系表[考虑查询复杂度，目前只存储文章单页跟标签的关系]';

-- ----------------------------
-- Records of back_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for back_roles
-- ----------------------------
DROP TABLE IF EXISTS `back_roles`;
CREATE TABLE `back_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名',
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户组角色表';

-- ----------------------------
-- Records of back_roles
-- ----------------------------
INSERT INTO `back_roles` VALUES ('1', 'Founder', '创始人', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `back_roles` VALUES ('2', 'Admin', '超级管理员', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `back_roles` VALUES ('3', 'Editor', '编辑', null, '2015-02-04 17:12:22', '2015-02-04 17:12:22');
INSERT INTO `back_roles` VALUES ('4', 'Demo', '演示', null, '2015-02-04 17:13:03', '2015-02-04 17:13:03');

-- ----------------------------
-- Table structure for back_role_user
-- ----------------------------
DROP TABLE IF EXISTS `back_role_user`;
CREATE TABLE `back_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id_foreign` (`role_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of back_role_user
-- ----------------------------
INSERT INTO `back_role_user` VALUES ('1', '2');
INSERT INTO `back_role_user` VALUES ('2', '3');
INSERT INTO `back_role_user` VALUES ('3', '3');
INSERT INTO `back_role_user` VALUES ('4', '3');
INSERT INTO `back_role_user` VALUES ('5', '3');
INSERT INTO `back_role_user` VALUES ('6', '3');

-- ----------------------------
-- Table structure for back_settings
-- ----------------------------
DROP TABLE IF EXISTS `back_settings`;
CREATE TABLE `back_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '设置项名',
  `value` text COLLATE utf8_unicode_ci COMMENT '设置项值',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 0未启用 1启用 其它数字表示异常',
  `type_id` int(12) DEFAULT '0' COMMENT '设置所属类型id 0表示无任何归属类型',
  `sort` int(6) unsigned DEFAULT '0' COMMENT '设置排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  KEY `setting_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态设置表';

-- ----------------------------
-- Records of back_settings
-- ----------------------------
INSERT INTO `back_settings` VALUES ('1', 'default_setting', '默认设置', '1', '1', '999');
INSERT INTO `back_settings` VALUES ('2', 'system', '系统', '1', '2', '0');
INSERT INTO `back_settings` VALUES ('3', 'manager', '管理员', '1', '2', '0');
INSERT INTO `back_settings` VALUES ('4', 'content', '内容', '1', '2', '0');
INSERT INTO `back_settings` VALUES ('5', 'upload', '上传', '1', '2', '0');
INSERT INTO `back_settings` VALUES ('6', 'article', '文章', '1', '3', '0');
INSERT INTO `back_settings` VALUES ('7', 'page', '单页', '1', '3', '0');
INSERT INTO `back_settings` VALUES ('8', 'fragment', '碎片', '1', '3', '0');
INSERT INTO `back_settings` VALUES ('9', 'memo', '备忘', '1', '3', '0');
INSERT INTO `back_settings` VALUES ('10', 'Founder', '创始人', '1', '4', '0');
INSERT INTO `back_settings` VALUES ('11', 'Admin', '超级管理员', '1', '4', '0');
INSERT INTO `back_settings` VALUES ('12', 'Editor', '编辑', '1', '4', '0');
INSERT INTO `back_settings` VALUES ('13', 'Demo', '演示', '1', '4', '0');

-- ----------------------------
-- Table structure for back_setting_type
-- ----------------------------
DROP TABLE IF EXISTS `back_setting_type`;
CREATE TABLE `back_setting_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '设置类型项名',
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设置类型项值',
  `sort` int(6) unsigned DEFAULT '0' COMMENT '设置类型排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_type_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态设置类型表';

-- ----------------------------
-- Records of back_setting_type
-- ----------------------------
INSERT INTO `back_setting_type` VALUES ('1', 'default', '默认', '0');
INSERT INTO `back_setting_type` VALUES ('2', 'system_operation', '系统操作类型', '0');
INSERT INTO `back_setting_type` VALUES ('3', 'content_type', '内容类型', '0');
INSERT INTO `back_setting_type` VALUES ('4', 'role_type', '角色类型', '0');

-- ----------------------------
-- Table structure for back_system_log
-- ----------------------------
DROP TABLE IF EXISTS `back_system_log`;
CREATE TABLE `back_system_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '系统日志id',
  `user_id` int(12) DEFAULT '0' COMMENT '用户id（为0表示系统级操作，其它一般为管理型用户操作）',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'system' COMMENT '操作类型',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT '-' COMMENT '操作发起的url',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `operator_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作者ip',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志表';

-- ----------------------------
-- Records of back_system_log
-- ----------------------------
INSERT INTO `back_system_log` VALUES ('13', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:24:40', '2016-03-22 12:24:40');
INSERT INTO `back_system_log` VALUES ('14', '1', 'manager', '-', '管理员：成功新增一名管理用户hqc2016<hqc@sumhand.com>。', '27.154.55.210', null, '2016-03-22 12:26:57', '2016-03-22 12:26:57');
INSERT INTO `back_system_log` VALUES ('15', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 12:27:17', '2016-03-22 12:27:17');
INSERT INTO `back_system_log` VALUES ('16', '2', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：hqc2016[hqc@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:27:29', '2016-03-22 12:27:29');
INSERT INTO `back_system_log` VALUES ('17', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 12:29:23', '2016-03-22 12:29:23');
INSERT INTO `back_system_log` VALUES ('18', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:29:31', '2016-03-22 12:29:31');
INSERT INTO `back_system_log` VALUES ('19', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 12:29:54', '2016-03-22 12:29:54');
INSERT INTO `back_system_log` VALUES ('20', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:44:37', '2016-03-22 12:44:37');
INSERT INTO `back_system_log` VALUES ('21', '1', 'manager', 'http://112.74.86.237/cms/public/admin/user/1/edit', '管理员：超级管理员修改了id为1的管理用户资料。', '27.154.55.210', null, '2016-03-22 12:45:25', '2016-03-22 12:45:25');
INSERT INTO `back_system_log` VALUES ('22', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 12:45:32', '2016-03-22 12:45:32');
INSERT INTO `back_system_log` VALUES ('23', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:45:40', '2016-03-22 12:45:40');
INSERT INTO `back_system_log` VALUES ('24', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 12:56:39', '2016-03-22 12:56:39');
INSERT INTO `back_system_log` VALUES ('25', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 12:56:51', '2016-03-22 12:56:51');
INSERT INTO `back_system_log` VALUES ('26', '1', 'manager', '-', '管理员：成功新增一名管理用户demo<442367569@qq.com>。', '27.154.55.210', null, '2016-03-22 13:07:10', '2016-03-22 13:07:10');
INSERT INTO `back_system_log` VALUES ('27', '1', 'manager', 'http://112.74.86.237/cms/public/admin/user/3/edit', '管理员：超级管理员修改了id为3的管理用户资料。', '27.154.55.210', null, '2016-03-22 13:07:44', '2016-03-22 13:07:44');
INSERT INTO `back_system_log` VALUES ('28', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 13:07:54', '2016-03-22 13:07:54');
INSERT INTO `back_system_log` VALUES ('29', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 13:08:13', '2016-03-22 13:08:13');
INSERT INTO `back_system_log` VALUES ('30', '1', 'manager', 'http://112.74.86.237/cms/public/admin/user/3/edit', '管理员：超级管理员修改了id为3的管理用户资料。', '27.154.55.210', null, '2016-03-22 13:09:46', '2016-03-22 13:09:46');
INSERT INTO `back_system_log` VALUES ('31', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 13:09:50', '2016-03-22 13:09:50');
INSERT INTO `back_system_log` VALUES ('32', '3', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '27.154.55.210', null, '2016-03-22 13:09:55', '2016-03-22 13:09:55');
INSERT INTO `back_system_log` VALUES ('33', '3', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '27.154.55.210', null, '2016-03-22 13:16:56', '2016-03-22 13:16:56');
INSERT INTO `back_system_log` VALUES ('34', '3', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '27.154.55.210', null, '2016-03-22 13:34:10', '2016-03-22 13:34:10');
INSERT INTO `back_system_log` VALUES ('35', '3', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '27.154.55.210', null, '2016-03-22 13:34:19', '2016-03-22 13:34:19');
INSERT INTO `back_system_log` VALUES ('36', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 13:34:26', '2016-03-22 13:34:26');
INSERT INTO `back_system_log` VALUES ('37', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-22 14:53:38', '2016-03-22 14:53:38');
INSERT INTO `back_system_log` VALUES ('38', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-22 14:53:56', '2016-03-22 14:53:56');
INSERT INTO `back_system_log` VALUES ('39', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为uploads/content/20160323/56f24de7389c8_51o.jpg。', '27.154.55.210', null, '2016-03-23 16:03:51', '2016-03-23 16:03:51');
INSERT INTO `back_system_log` VALUES ('40', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为uploads/content/20160323/56f2511d0a26b_33o.jpg。', '27.154.55.210', null, '2016-03-23 16:17:33', '2016-03-23 16:17:33');
INSERT INTO `back_system_log` VALUES ('41', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：8565082_150040352101_2.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f25e9819ec9_04o.jpg。', '27.154.55.210', null, '2016-03-23 17:15:04', '2016-03-23 17:15:04');
INSERT INTO `back_system_log` VALUES ('42', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-23 17:15:52', '2016-03-23 17:15:52');
INSERT INTO `back_system_log` VALUES ('43', '3', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '27.154.55.210', null, '2016-03-23 17:15:55', '2016-03-23 17:15:55');
INSERT INTO `back_system_log` VALUES ('44', '3', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '27.154.55.210', null, '2016-03-23 17:43:25', '2016-03-23 17:43:25');
INSERT INTO `back_system_log` VALUES ('45', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-23 17:43:28', '2016-03-23 17:43:28');
INSERT INTO `back_system_log` VALUES ('46', '1', 'manager', 'http://112.74.86.237/cms/public/admin/user/3/edit', '管理员：超级管理员修改了id为3的管理用户资料。', '27.154.55.210', null, '2016-03-23 17:43:38', '2016-03-23 17:43:38');
INSERT INTO `back_system_log` VALUES ('47', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-23 17:43:41', '2016-03-23 17:43:41');
INSERT INTO `back_system_log` VALUES ('48', '3', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '27.154.55.210', null, '2016-03-23 17:43:45', '2016-03-23 17:43:45');
INSERT INTO `back_system_log` VALUES ('49', '3', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为uploads/content/20160323/56f2689ac1bf4_46o.jpg。', '27.154.55.210', null, '2016-03-23 17:57:46', '2016-03-23 17:57:46');
INSERT INTO `back_system_log` VALUES ('50', '3', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：huaqiangu.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f26f050ed1a_09o.jpg。', '27.154.55.210', null, '2016-03-23 18:25:09', '2016-03-23 18:25:09');
INSERT INTO `back_system_log` VALUES ('51', '3', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：8565082_150040352101_2.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f26f0e7df2b_18o.jpg。', '27.154.55.210', null, '2016-03-23 18:25:18', '2016-03-23 18:25:18');
INSERT INTO `back_system_log` VALUES ('52', '3', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：8565082_150040352101_2.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f26f22a1986_38o.jpg。', '27.154.55.210', null, '2016-03-23 18:25:38', '2016-03-23 18:25:38');
INSERT INTO `back_system_log` VALUES ('53', '3', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：8565082_150040352101_2.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f2709d91f0a_57o.jpg。', '27.154.55.210', null, '2016-03-23 18:31:57', '2016-03-23 18:31:57');
INSERT INTO `back_system_log` VALUES ('54', '2', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：8565082_150040352101_2.jpg，上传之后保存在服务器路径为uploads/content/20160323/56f270b8595b6_24o.jpg。', '27.154.55.210', null, '2016-03-23 18:32:24', '2016-03-23 18:32:24');
INSERT INTO `back_system_log` VALUES ('55', '3', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '27.154.55.210', null, '2016-03-23 18:59:32', '2016-03-23 18:59:32');
INSERT INTO `back_system_log` VALUES ('56', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-23 18:59:36', '2016-03-23 18:59:36');
INSERT INTO `back_system_log` VALUES ('57', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为uploads/content/20160323/56f284396730a_37o.jpg。', '27.154.55.210', null, '2016-03-23 19:55:37', '2016-03-23 19:55:37');
INSERT INTO `back_system_log` VALUES ('58', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为uploads/content/20160323/56f284d4d9d8a_12o.jpg。', '27.154.55.210', null, '2016-03-23 19:58:12', '2016-03-23 19:58:12');
INSERT INTO `back_system_log` VALUES ('59', '2', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：1.jpg，上传之后保存在服务器路径为uploads/content/20160324/56f3445e7e658_26o.jpg。', '27.154.55.210', null, '2016-03-24 09:35:26', '2016-03-24 09:35:26');
INSERT INTO `back_system_log` VALUES ('60', '2', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：1.jpg，上传之后保存在服务器路径为uploads/content/20160324/56f348660320f_38o.jpg。', '27.154.55.210', null, '2016-03-24 09:52:38', '2016-03-24 09:52:38');
INSERT INTO `back_system_log` VALUES ('61', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-24 10:04:03', '2016-03-24 10:04:03');
INSERT INTO `back_system_log` VALUES ('62', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-24 10:04:08', '2016-03-24 10:04:08');
INSERT INTO `back_system_log` VALUES ('63', '2', 'manager', 'http://112.74.86.237/cms/public/admin/me', '管理员：更新了我的账户 - 个人资料。', '27.154.55.210', null, '2016-03-24 10:17:22', '2016-03-24 10:17:22');
INSERT INTO `back_system_log` VALUES ('64', '2', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：红咖[hqc@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-03-24 10:35:41', '2016-03-24 10:35:41');
INSERT INTO `back_system_log` VALUES ('65', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-24 10:35:56', '2016-03-24 10:35:56');
INSERT INTO `back_system_log` VALUES ('66', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-24 11:03:07', '2016-03-24 11:03:07');
INSERT INTO `back_system_log` VALUES ('67', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-24 11:03:09', '2016-03-24 11:03:09');
INSERT INTO `back_system_log` VALUES ('68', '2', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：红咖[hqc@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-03-24 14:33:25', '2016-03-24 14:33:25');
INSERT INTO `back_system_log` VALUES ('69', '2', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：2.jpg，上传之后保存在服务器路径为uploads/content/20160324/56f39da29501b_18o.jpg。', '27.154.55.210', null, '2016-03-24 15:56:18', '2016-03-24 15:56:18');
INSERT INTO `back_system_log` VALUES ('70', '2', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：0.jpg，上传之后保存在服务器路径为uploads/content/20160324/56f3a3d371978_43o.jpg。', '27.154.55.210', null, '2016-03-24 16:22:43', '2016-03-24 16:22:43');
INSERT INTO `back_system_log` VALUES ('71', '2', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：红咖[hqc@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-03-24 16:48:26', '2016-03-24 16:48:26');
INSERT INTO `back_system_log` VALUES ('72', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-24 16:48:40', '2016-03-24 16:48:40');
INSERT INTO `back_system_log` VALUES ('73', '1', 'manager', '-', '管理员：成功新增一名管理用户spg2016<2679051713@qq.com>。', '27.154.55.210', null, '2016-03-24 16:52:21', '2016-03-24 16:52:21');
INSERT INTO `back_system_log` VALUES ('74', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '61.131.73.205', null, '2016-03-24 21:28:16', '2016-03-24 21:28:16');
INSERT INTO `back_system_log` VALUES ('75', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '61.131.73.205', null, '2016-03-24 21:30:14', '2016-03-24 21:30:14');
INSERT INTO `back_system_log` VALUES ('76', '3', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '61.131.73.205', null, '2016-03-24 21:30:20', '2016-03-24 21:30:20');
INSERT INTO `back_system_log` VALUES ('77', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '61.131.73.205', null, '2016-03-25 00:32:20', '2016-03-25 00:32:20');
INSERT INTO `back_system_log` VALUES ('78', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-25 09:08:04', '2016-03-25 09:08:04');
INSERT INTO `back_system_log` VALUES ('79', '2', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：红咖[hqc@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-03-25 09:45:34', '2016-03-25 09:45:34');
INSERT INTO `back_system_log` VALUES ('80', '2', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：红咖[hqc@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-03-25 13:14:27', '2016-03-25 13:14:27');
INSERT INTO `back_system_log` VALUES ('81', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-25 13:14:41', '2016-03-25 13:14:41');
INSERT INTO `back_system_log` VALUES ('82', '3', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '61.131.73.205', null, '2016-03-26 00:58:14', '2016-03-26 00:58:14');
INSERT INTO `back_system_log` VALUES ('83', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '61.131.73.205', null, '2016-03-26 00:58:20', '2016-03-26 00:58:20');
INSERT INTO `back_system_log` VALUES ('84', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-28 14:23:37', '2016-03-28 14:23:37');
INSERT INTO `back_system_log` VALUES ('85', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '120.42.97.217', null, '2016-03-28 22:22:34', '2016-03-28 22:22:34');
INSERT INTO `back_system_log` VALUES ('86', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '120.42.97.217', null, '2016-03-28 22:22:46', '2016-03-28 22:22:46');
INSERT INTO `back_system_log` VALUES ('87', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '120.42.97.217', null, '2016-03-29 08:18:41', '2016-03-29 08:18:41');
INSERT INTO `back_system_log` VALUES ('88', '1', 'manager', 'http://112.74.86.237/cms/public/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '120.42.97.217', null, '2016-03-29 08:18:51', '2016-03-29 08:18:51');
INSERT INTO `back_system_log` VALUES ('89', '1', 'manager', 'http://112.74.86.237/cms/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-29 09:12:56', '2016-03-29 09:12:56');
INSERT INTO `back_system_log` VALUES ('90', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：c5eb015257.jpg，上传之后保存在服务器路径为uploads/content/20160329/56f9e077532b9_03o.jpg。', '27.154.55.210', null, '2016-03-29 09:55:03', '2016-03-29 09:55:03');
INSERT INTO `back_system_log` VALUES ('91', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-29 10:35:41', '2016-03-29 10:35:41');
INSERT INTO `back_system_log` VALUES ('92', '1', 'upload', 'http://112.74.86.237/cms/public/admin/upload', '管理员：上传了图片文件，图片原始文件名：11.jpg，上传之后保存在服务器路径为uploads/content/20160329/56f9ea22ed999_18o.jpg。', '27.154.55.210', null, '2016-03-29 10:36:18', '2016-03-29 10:36:18');
INSERT INTO `back_system_log` VALUES ('93', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-29 14:32:11', '2016-03-29 14:32:11');
INSERT INTO `back_system_log` VALUES ('94', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-29 14:32:13', '2016-03-29 14:32:13');
INSERT INTO `back_system_log` VALUES ('95', '2', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：红咖[hqc@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-03-29 15:35:25', '2016-03-29 15:35:25');
INSERT INTO `back_system_log` VALUES ('96', '1', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：0 (2).jpg，上传之后保存在服务器路径为http://112.74.86.237:8081/uploads/content/20160329/56fa3307a594c_19o.jpg。', '27.154.55.210', null, '2016-03-29 15:47:19', '2016-03-29 15:47:19');
INSERT INTO `back_system_log` VALUES ('97', '1', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：射雕.jpg，上传之后保存在服务器路径为http://112.74.86.237:8081/uploads/content/20160329/56fa34b6e1084_30o.jpg。', '27.154.55.210', null, '2016-03-29 15:54:30', '2016-03-29 15:54:30');
INSERT INTO `back_system_log` VALUES ('98', '1', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：速度与激情7.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa3543ee328_51o.jpg。', '27.154.55.210', null, '2016-03-29 15:56:51', '2016-03-29 15:56:51');
INSERT INTO `back_system_log` VALUES ('99', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：0.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa3717e987f_39o.jpg。', '27.154.55.210', null, '2016-03-29 16:04:39', '2016-03-29 16:04:39');
INSERT INTO `back_system_log` VALUES ('100', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：0.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa3b9c9a3de_56o.jpg。', '27.154.55.210', null, '2016-03-29 16:23:56', '2016-03-29 16:23:56');
INSERT INTO `back_system_log` VALUES ('101', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：0.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa604f92d77_31o.jpg。', '27.154.55.210', null, '2016-03-29 19:00:31', '2016-03-29 19:00:31');
INSERT INTO `back_system_log` VALUES ('102', '2', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：红咖[hqc@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-03-29 19:00:43', '2016-03-29 19:00:43');
INSERT INTO `back_system_log` VALUES ('103', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-29 19:00:58', '2016-03-29 19:00:58');
INSERT INTO `back_system_log` VALUES ('104', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-29 19:19:06', '2016-03-29 19:19:06');
INSERT INTO `back_system_log` VALUES ('105', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-03-29 19:19:26', '2016-03-29 19:19:26');
INSERT INTO `back_system_log` VALUES ('106', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-03-29 19:19:34', '2016-03-29 19:19:34');
INSERT INTO `back_system_log` VALUES ('107', '3', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：test[442367569@qq.com] 登录系统。', '27.154.55.210', null, '2016-03-29 19:19:45', '2016-03-29 19:19:45');
INSERT INTO `back_system_log` VALUES ('108', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.250.5', null, '2016-03-29 21:53:50', '2016-03-29 21:53:50');
INSERT INTO `back_system_log` VALUES ('109', '1', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：11.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa8ce9b478d_49o.jpg。', '27.154.250.5', null, '2016-03-29 22:10:49', '2016-03-29 22:10:49');
INSERT INTO `back_system_log` VALUES ('110', '1', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：56f9e077532b9_03o.jpg，上传之后保存在服务器路径为/uploads/content/20160329/56fa90c8e5427_20o.jpg。', '27.154.250.5', null, '2016-03-29 22:27:20', '2016-03-29 22:27:20');
INSERT INTO `back_system_log` VALUES ('111', '2', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：红咖[hqc@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-03-30 09:00:19', '2016-03-30 09:00:19');
INSERT INTO `back_system_log` VALUES ('112', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：6.png，上传之后保存在服务器路径为/uploads/content/20160330/56fb2bdb3dbda_59o.png。', '27.154.55.210', null, '2016-03-30 09:28:59', '2016-03-30 09:28:59');
INSERT INTO `back_system_log` VALUES ('113', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：W020160311487306936986.jpg，上传之后保存在服务器路径为/uploads/content/20160330/56fb9c71050ef_21o.jpg。', '27.154.55.210', null, '2016-03-30 17:29:21', '2016-03-30 17:29:21');
INSERT INTO `back_system_log` VALUES ('114', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：b8ac6f3ea08710b462e957.jpg，上传之后保存在服务器路径为/uploads/content/20160330/56fb9f36a5c88_10o.jpg。', '27.154.55.210', null, '2016-03-30 17:41:10', '2016-03-30 17:41:10');
INSERT INTO `back_system_log` VALUES ('115', '1', 'manager', 'http://hongka-cms/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-03-31 18:37:20', '2016-03-31 18:37:20');
INSERT INTO `back_system_log` VALUES ('116', '2', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：11.jpg，上传之后保存在服务器路径为/uploads/content/20160331/56fd1c2957b47_33o.jpg。', '27.154.55.210', null, '2016-03-31 20:46:33', '2016-03-31 20:46:33');
INSERT INTO `back_system_log` VALUES ('117', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '117.30.53.62', null, '2016-04-01 19:36:51', '2016-04-01 19:36:51');
INSERT INTO `back_system_log` VALUES ('118', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '117.30.53.62', null, '2016-04-01 19:38:36', '2016-04-01 19:38:36');
INSERT INTO `back_system_log` VALUES ('119', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.47.251', null, '2016-04-03 16:59:07', '2016-04-03 16:59:07');
INSERT INTO `back_system_log` VALUES ('120', '2', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：红咖[hqc@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-04-05 12:52:59', '2016-04-05 12:52:59');
INSERT INTO `back_system_log` VALUES ('121', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-04-05 12:53:11', '2016-04-05 12:53:11');
INSERT INTO `back_system_log` VALUES ('122', '1', 'manager', '-', '管理员：成功新增一名管理用户SYQ2016<syq@sumhand.com>。', '27.154.55.210', null, '2016-04-05 12:55:22', '2016-04-05 12:55:22');
INSERT INTO `back_system_log` VALUES ('123', '5', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：SYQ2016[syq@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-05 13:41:32', '2016-04-05 13:41:32');
INSERT INTO `back_system_log` VALUES ('124', '3', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：test[442367569@qq.com] 登出系统。', '27.154.55.210', null, '2016-04-05 16:40:45', '2016-04-05 16:40:45');
INSERT INTO `back_system_log` VALUES ('125', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-04-05 16:40:47', '2016-04-05 16:40:47');
INSERT INTO `back_system_log` VALUES ('126', '1', 'manager', '-', '管理员：成功新增一名管理用户cfx2016<cfx@sumhand.com>。', '27.154.55.210', null, '2016-04-07 11:09:06', '2016-04-07 11:09:06');
INSERT INTO `back_system_log` VALUES ('127', '1', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '27.154.55.210', null, '2016-04-07 11:20:45', '2016-04-07 11:20:45');
INSERT INTO `back_system_log` VALUES ('128', '6', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：cfx2016[cfx@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-07 11:22:29', '2016-04-07 11:22:29');
INSERT INTO `back_system_log` VALUES ('129', '6', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：7fd8dbcf691036eab6a156a6968dee18.jpg，上传之后保存在服务器路径为/uploads/content/20160407/5705d4795853f_05o.jpg。', '27.154.55.210', null, '2016-04-07 11:31:05', '2016-04-07 11:31:05');
INSERT INTO `back_system_log` VALUES ('130', '6', 'manager', 'http://112.74.86.237:8081/auth/logout', '管理员：cfx2016[cfx@sumhand.com] 登出系统。', '27.154.55.210', null, '2016-04-07 11:48:39', '2016-04-07 11:48:39');
INSERT INTO `back_system_log` VALUES ('131', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-04-07 12:45:38', '2016-04-07 12:45:38');
INSERT INTO `back_system_log` VALUES ('132', '6', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：cfx2016[cfx@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-07 13:43:49', '2016-04-07 13:43:49');
INSERT INTO `back_system_log` VALUES ('133', '6', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：cfx2016[cfx@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-07 13:45:59', '2016-04-07 13:45:59');
INSERT INTO `back_system_log` VALUES ('134', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.55.210', null, '2016-04-07 13:53:27', '2016-04-07 13:53:27');
INSERT INTO `back_system_log` VALUES ('135', '1', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '27.154.47.251', null, '2016-04-07 20:55:00', '2016-04-07 20:55:00');
INSERT INTO `back_system_log` VALUES ('136', '6', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：cfx2016[cfx@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-08 09:46:27', '2016-04-08 09:46:27');
INSERT INTO `back_system_log` VALUES ('137', '6', 'manager', 'http://112.74.86.237:8081/auth/login', '管理员：cfx2016[cfx@sumhand.com] 登录系统。', '27.154.55.210', null, '2016-04-11 13:46:55', '2016-04-11 13:46:55');
INSERT INTO `back_system_log` VALUES ('138', '6', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：21.jpg，上传之后保存在服务器路径为/uploads/content/20160411/570b4024a010f_48o.jpg。', '27.154.55.210', null, '2016-04-11 14:11:48', '2016-04-11 14:11:48');
INSERT INTO `back_system_log` VALUES ('139', '6', 'upload', 'http://112.74.86.237:8081/admin/upload', '管理员：上传了图片文件，图片原始文件名：12.jpg，上传之后保存在服务器路径为/uploads/content/20160411/570b45e112da1_17o.jpg。', '27.154.55.210', null, '2016-04-11 14:36:17', '2016-04-11 14:36:17');

-- ----------------------------
-- Table structure for back_system_options
-- ----------------------------
DROP TABLE IF EXISTS `back_system_options`;
CREATE TABLE `back_system_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '配置选项名',
  `value` text COLLATE utf8_unicode_ci COMMENT '配置选项值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_option_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统配置选项表';

-- ----------------------------
-- Records of back_system_options
-- ----------------------------
INSERT INTO `back_system_options` VALUES ('1', 'website_keywords', '芽丝博客,芽丝,CMF,内容管理框架');
INSERT INTO `back_system_options` VALUES ('2', 'company_address', '');
INSERT INTO `back_system_options` VALUES ('3', 'website_title', '芽丝博客');
INSERT INTO `back_system_options` VALUES ('4', 'company_telephone', '800-168-8888');
INSERT INTO `back_system_options` VALUES ('5', 'company_full_name', '芽丝内容管理框架');
INSERT INTO `back_system_options` VALUES ('6', 'website_icp', '');
INSERT INTO `back_system_options` VALUES ('7', 'system_version', 'yascmf_alpha_1.0');
INSERT INTO `back_system_options` VALUES ('8', 'page_size', '10');
INSERT INTO `back_system_options` VALUES ('9', 'system_logo', 'http://cmf.yas.so/assets/img/yas_logo.png');
INSERT INTO `back_system_options` VALUES ('10', 'picture_watermark', 'http://cmf.yas.so/assets/img/yas_logo.png');
INSERT INTO `back_system_options` VALUES ('11', 'company_short_name', '芽丝博客');
INSERT INTO `back_system_options` VALUES ('12', 'system_author', '豆芽丝');
INSERT INTO `back_system_options` VALUES ('13', 'system_author_website', 'http://douyasi.com');
INSERT INTO `back_system_options` VALUES ('14', 'is_watermark', '0');

-- ----------------------------
-- Table structure for back_users
-- ----------------------------
DROP TABLE IF EXISTS `back_users`;
CREATE TABLE `back_users` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户登录名',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户屏显昵称，可以不同用户登录名',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户邮箱',
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `pid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户身份证号',
  `pid_card_thumb1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证证件正面（印有国徽图案、签发机关和有效期限）照片',
  `pid_card_thumb2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证证件反面（印有个人基本信息和照片）照片',
  `avatar` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户个人图像',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '固定/移动电话',
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `emergency_contact` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '紧急联系人信息',
  `servicer_id` int(12) DEFAULT '0' COMMENT '专属客服id，（为0表示其为无专属客服的管理用户）',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改更新时间',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否锁定限制用户登录，1锁定,0正常',
  `user_type` enum('visitor','customer','manager') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'visitor' COMMENT '用户类型：visitor 游客, customer 投资客户, manager 管理型用户',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '确认码',
  `confirmed` tinyint(1) DEFAULT '0' COMMENT '是否已通过验证 0：未通过 1：通过',
  `remember_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Laravel 追加的记住令牌',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`),
  UNIQUE KEY `user_email_unique` (`email`),
  UNIQUE KEY `user_pid_unique` (`pid`),
  KEY `user_nickname_index` (`nickname`),
  KEY `user_realname_index` (`realname`),
  KEY `user_phone_index` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of back_users
-- ----------------------------
INSERT INTO `back_users` VALUES ('1', 'admin', '$2y$10$e5s6C2Uh/jwYS43JPXw7vOLt/EUqPBr.8F3xQ4Vd57s7MkBPKt.Sq', 'Admin', 'admin@example.com', '管理员', null, null, null, null, null, null, null, null, null, '2016-03-21 09:29:12', '2016-04-07 11:20:45', '0', 'manager', '161590b511f23a7aca43e785ba037d4f', '1', 'NUGSJakqewRyNZVxTOnXO4zD608XWGKOkpjxGfQncqJiUy4bDlkXvCBQP2CN');
INSERT INTO `back_users` VALUES ('2', 'hqc2016', '$2y$10$JhJ1FiuKYtYaxLYESjqLQu8CqIoclNpSVu/QvfclhQhU0nWoC/7Ku', '红咖', 'hqc@sumhand.com', '何清城', null, null, null, null, null, null, null, '0', null, '2016-03-22 12:26:57', '2016-04-05 12:52:59', '0', 'manager', 'f441ca431545b0c0d8cd9d1469ba7fc0', '1', '8gppDNQm9gxzKFljkVxMiNFxmd8Ub6Aaz4hkZcMSdNDJ9cLen08PyVtjVIHt');
INSERT INTO `back_users` VALUES ('3', 'test', '$2y$10$2KTdx5ixWJnnU7W3POYMWOj4VVff1T7aImRodessIpXBIWyTvJ2ae', 'test', '442367569@qq.com', '测试', null, null, null, null, null, null, null, '0', null, '2016-03-22 13:07:10', '2016-04-05 16:40:45', '0', 'manager', 'be63ce84cd5d48209c3000b7d07d9580', '1', 'siCjJvM1acIkTCgF9sA9KhQ5ruxFu9oBIeDVy2LpHg8B1vEWvOALDUIPm4TL');
INSERT INTO `back_users` VALUES ('4', 'spg2016', '$2y$10$suearP9Jo0JI8kltaR8FD.8qaEnJCtEVatXfQOGIvK7QC3VuZdxnS', 'spg2016', '2679051713@qq.com', '宋瀑光', null, null, null, null, null, null, null, '0', null, '2016-03-24 16:52:21', '2016-03-24 16:52:21', '0', 'manager', '8a3b95d7ee4f78416acecf1b0780c148', '1', null);
INSERT INTO `back_users` VALUES ('5', 'SYQ2016', '$2y$10$fHDhRZ2UajHI8coU1he.puIPudVILeSxiqgYVb35DWiOl4lZiq4ai', 'SYQ2016', 'syq@sumhand.com', '宋元泉', null, null, null, null, null, null, null, '0', null, '2016-04-05 12:55:22', '2016-04-05 13:41:32', '0', 'manager', '1bf613dc6663f965f2565f2b51c2c9fd', '1', '25b15uWRjswyEWJIQrbjvHrEC4RatNwC8IShjmIVVScgoMYr5FtF8a0uatg8');
INSERT INTO `back_users` VALUES ('6', 'cfx2016', '$2y$10$0E5DIoyWy35EshxY29u9peYrQtvNmYGjpEeONRTyio2CxLrl0Rv32', 'cfx2016', 'cfx@sumhand.com', '池发秀', null, null, null, null, null, null, null, '0', null, '2016-04-07 11:09:06', '2016-04-07 11:48:39', '0', 'manager', 'eab0f416161986f3eff59a22b919dc4f', '1', 'GN6en9HmTGtkNV5sG9FZxKmZv1MHfojqNrEW6vzj4sLyT81yD41bhfRkO6qo');

-- ----------------------------
-- Table structure for category_cities
-- ----------------------------
DROP TABLE IF EXISTS `category_cities`;
CREATE TABLE `category_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `label` char(25) NOT NULL DEFAULT '',
  `category` char(20) NOT NULL,
  `index` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_cities
-- ----------------------------
INSERT INTO `category_cities` VALUES ('1', '0', '北京市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('2', '0', '上海市', 'city', 's');
INSERT INTO `category_cities` VALUES ('3', '0', '天津市', 'city', 't');
INSERT INTO `category_cities` VALUES ('4', '0', '重庆市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('5', '0', '河北省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('6', '0', '山西省', 'city', 's');
INSERT INTO `category_cities` VALUES ('7', '0', '内蒙古', 'city', 'n');
INSERT INTO `category_cities` VALUES ('8', '0', '辽宁省', 'city', 'l');
INSERT INTO `category_cities` VALUES ('9', '0', '吉林省', 'city', 'j');
INSERT INTO `category_cities` VALUES ('10', '0', '黑龙江省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('11', '0', '江苏省', 'city', 'j');
INSERT INTO `category_cities` VALUES ('12', '0', '浙江省', 'city', 'z');
INSERT INTO `category_cities` VALUES ('13', '0', '安徽省', 'city', 'a');
INSERT INTO `category_cities` VALUES ('14', '0', '福建省', 'city', 'f');
INSERT INTO `category_cities` VALUES ('15', '0', '江西省', 'city', 'j');
INSERT INTO `category_cities` VALUES ('16', '0', '山东省', 'city', 's');
INSERT INTO `category_cities` VALUES ('17', '0', '河南省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('18', '0', '湖北省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('19', '0', '湖南省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('20', '0', '广东省', 'city', 'g');
INSERT INTO `category_cities` VALUES ('21', '0', '广西', 'city', 'g');
INSERT INTO `category_cities` VALUES ('22', '0', '海南省', 'city', 'h');
INSERT INTO `category_cities` VALUES ('23', '0', '四川省', 'city', 's');
INSERT INTO `category_cities` VALUES ('24', '0', '贵州省', 'city', 'g');
INSERT INTO `category_cities` VALUES ('25', '0', '云南省', 'city', 'y');
INSERT INTO `category_cities` VALUES ('26', '0', '西藏', 'city', 'x');
INSERT INTO `category_cities` VALUES ('27', '0', '陕西省', 'city', 's');
INSERT INTO `category_cities` VALUES ('28', '0', '甘肃省', 'city', 'g');
INSERT INTO `category_cities` VALUES ('29', '0', '青海省', 'city', 'q');
INSERT INTO `category_cities` VALUES ('30', '0', '宁夏', 'city', 'n');
INSERT INTO `category_cities` VALUES ('31', '0', '新疆', 'city', 'x');
INSERT INTO `category_cities` VALUES ('32', '0', '台湾省', 'city', 't');
INSERT INTO `category_cities` VALUES ('33', '0', '香港', 'city', 'x');
INSERT INTO `category_cities` VALUES ('34', '0', '澳门', 'city', 'a');
INSERT INTO `category_cities` VALUES ('35', '1', '东城区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('36', '1', '西城区', 'city', 'x');
INSERT INTO `category_cities` VALUES ('37', '1', '崇文区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('38', '1', '宣武区', 'city', 'x');
INSERT INTO `category_cities` VALUES ('39', '1', '朝阳区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('40', '1', '丰台区', 'city', 'f');
INSERT INTO `category_cities` VALUES ('41', '1', '石景山区', 'city', 's');
INSERT INTO `category_cities` VALUES ('42', '1', '海淀区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('43', '1', '门头沟区', 'city', 'm');
INSERT INTO `category_cities` VALUES ('44', '1', '房山区', 'city', 'f');
INSERT INTO `category_cities` VALUES ('45', '1', '通州区', 'city', 't');
INSERT INTO `category_cities` VALUES ('46', '1', '顺义区', 'city', 's');
INSERT INTO `category_cities` VALUES ('47', '1', '昌平区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('48', '1', '大兴区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('49', '1', '怀柔区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('50', '1', '平谷区', 'city', 'p');
INSERT INTO `category_cities` VALUES ('51', '1', '密云县', 'city', 'm');
INSERT INTO `category_cities` VALUES ('52', '1', '延庆县', 'city', 'y');
INSERT INTO `category_cities` VALUES ('53', '2', '黄浦区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('54', '2', '卢湾区', 'city', 'l');
INSERT INTO `category_cities` VALUES ('55', '2', '徐汇区', 'city', 'x');
INSERT INTO `category_cities` VALUES ('56', '2', '长宁区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('57', '2', '静安区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('58', '2', '普陀区', 'city', 'p');
INSERT INTO `category_cities` VALUES ('59', '2', '闸北区', 'city', 'z');
INSERT INTO `category_cities` VALUES ('60', '2', '虹口区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('61', '2', '杨浦区', 'city', 'y');
INSERT INTO `category_cities` VALUES ('62', '2', '闵行区', 'city', 'm');
INSERT INTO `category_cities` VALUES ('63', '2', '宝山区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('64', '2', '嘉定区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('65', '2', '浦东新区', 'city', 'p');
INSERT INTO `category_cities` VALUES ('66', '2', '金山区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('67', '2', '松江区', 'city', 's');
INSERT INTO `category_cities` VALUES ('68', '2', '青浦区', 'city', 'q');
INSERT INTO `category_cities` VALUES ('69', '2', '南汇区', 'city', 'n');
INSERT INTO `category_cities` VALUES ('70', '2', '奉贤区', 'city', 'f');
INSERT INTO `category_cities` VALUES ('71', '2', '崇明县', 'city', 'c');
INSERT INTO `category_cities` VALUES ('72', '3', '和平区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('73', '3', '河东区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('74', '3', '河西区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('75', '3', '南开区', 'city', 'n');
INSERT INTO `category_cities` VALUES ('76', '3', '河北区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('77', '3', '红桥区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('78', '3', '塘沽区', 'city', 't');
INSERT INTO `category_cities` VALUES ('79', '3', '汉沽区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('80', '3', '大港区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('81', '3', '东丽区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('82', '3', '西青区', 'city', 'x');
INSERT INTO `category_cities` VALUES ('83', '3', '津南区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('84', '3', '北辰区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('85', '3', '武清区', 'city', 'w');
INSERT INTO `category_cities` VALUES ('86', '3', '宝坻区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('87', '3', '宁河县', 'city', 'n');
INSERT INTO `category_cities` VALUES ('88', '3', '静海县', 'city', 'j');
INSERT INTO `category_cities` VALUES ('89', '3', '蓟县', 'city', 'j');
INSERT INTO `category_cities` VALUES ('90', '4', '万州区', 'city', 'w');
INSERT INTO `category_cities` VALUES ('91', '4', '涪陵区', 'city', 'f');
INSERT INTO `category_cities` VALUES ('92', '4', '渝中区', 'city', 'y');
INSERT INTO `category_cities` VALUES ('93', '4', '大渡口区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('94', '4', '江北区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('95', '4', '沙坪坝区', 'city', 's');
INSERT INTO `category_cities` VALUES ('96', '4', '九龙坡区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('97', '4', '南岸区', 'city', 'n');
INSERT INTO `category_cities` VALUES ('98', '4', '北碚区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('99', '4', '万盛区', 'city', 'w');
INSERT INTO `category_cities` VALUES ('100', '4', '双桥区', 'city', 's');
INSERT INTO `category_cities` VALUES ('101', '4', '渝北区', 'city', 'y');
INSERT INTO `category_cities` VALUES ('102', '4', '巴南区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('103', '4', '黔江区', 'city', 'q');
INSERT INTO `category_cities` VALUES ('104', '4', '长寿区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('105', '4', '綦江县', 'city', 'q');
INSERT INTO `category_cities` VALUES ('106', '4', '潼南县', 'city', 't');
INSERT INTO `category_cities` VALUES ('107', '4', '铜梁县', 'city', 't');
INSERT INTO `category_cities` VALUES ('108', '4', '大足县', 'city', 'd');
INSERT INTO `category_cities` VALUES ('109', '4', '荣昌县', 'city', 'r');
INSERT INTO `category_cities` VALUES ('110', '4', '璧山县', 'city', 'b');
INSERT INTO `category_cities` VALUES ('111', '4', '梁平县', 'city', 'l');
INSERT INTO `category_cities` VALUES ('112', '4', '城口县', 'city', 'c');
INSERT INTO `category_cities` VALUES ('113', '4', '丰都县', 'city', 'f');
INSERT INTO `category_cities` VALUES ('114', '4', '垫江县', 'city', 'd');
INSERT INTO `category_cities` VALUES ('115', '4', '武隆县', 'city', 'w');
INSERT INTO `category_cities` VALUES ('116', '4', '忠县', 'city', 'z');
INSERT INTO `category_cities` VALUES ('117', '4', '开县', 'city', 'k');
INSERT INTO `category_cities` VALUES ('118', '4', '云阳县', 'city', 'y');
INSERT INTO `category_cities` VALUES ('119', '4', '奉节县', 'city', 'f');
INSERT INTO `category_cities` VALUES ('120', '4', '巫山县', 'city', 'w');
INSERT INTO `category_cities` VALUES ('121', '4', '巫溪县', 'city', 'w');
INSERT INTO `category_cities` VALUES ('122', '4', '石柱', 'city', 's');
INSERT INTO `category_cities` VALUES ('123', '4', '秀山', 'city', 'x');
INSERT INTO `category_cities` VALUES ('124', '4', '酉阳', 'city', 'y');
INSERT INTO `category_cities` VALUES ('125', '4', '彭水', 'city', 'p');
INSERT INTO `category_cities` VALUES ('126', '4', '江津市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('127', '4', '合川市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('128', '4', '永川市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('129', '4', '南川市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('130', '5', '石家庄市', 'city', 's');
INSERT INTO `category_cities` VALUES ('131', '5', '唐山市', 'city', 't');
INSERT INTO `category_cities` VALUES ('132', '5', '秦皇岛市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('133', '5', '邯郸市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('134', '5', '邢台市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('135', '5', '保定市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('136', '5', '张家口市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('137', '5', '承德市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('138', '5', '沧州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('139', '5', '廊坊市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('140', '5', '衡水市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('141', '6', '太原市', 'city', 't');
INSERT INTO `category_cities` VALUES ('142', '6', '大同市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('143', '6', '阳泉市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('144', '6', '长治市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('145', '6', '晋城市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('146', '6', '朔州市', 'city', 's');
INSERT INTO `category_cities` VALUES ('147', '6', '晋中市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('148', '6', '运城市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('149', '6', '忻州市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('150', '6', '临汾市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('151', '6', '吕梁市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('152', '7', '呼和浩特市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('153', '7', '包头市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('154', '7', '乌海市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('155', '7', '赤峰市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('156', '7', '通辽市', 'city', 't');
INSERT INTO `category_cities` VALUES ('157', '7', '鄂尔多斯市', 'city', 'e');
INSERT INTO `category_cities` VALUES ('158', '7', '呼伦贝尔市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('159', '7', '巴彦淖尔市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('160', '7', '乌兰察布市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('161', '7', '兴安盟', 'city', 'x');
INSERT INTO `category_cities` VALUES ('162', '7', '锡林郭勒盟', 'city', 'x');
INSERT INTO `category_cities` VALUES ('163', '7', '阿拉善盟', 'city', 'a');
INSERT INTO `category_cities` VALUES ('164', '8', '沈阳市', 'city', 's');
INSERT INTO `category_cities` VALUES ('165', '8', '大连市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('166', '8', '鞍山市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('167', '8', '抚顺市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('168', '8', '本溪市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('169', '8', '丹东市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('170', '8', '锦州市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('171', '8', '营口市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('172', '8', '阜新市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('173', '8', '辽阳市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('174', '8', '盘锦市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('175', '8', '铁岭市', 'city', 't');
INSERT INTO `category_cities` VALUES ('176', '8', '朝阳市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('177', '8', '葫芦岛市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('178', '9', '长春市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('179', '9', '吉林市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('180', '9', '四平市', 'city', 's');
INSERT INTO `category_cities` VALUES ('181', '9', '辽源市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('182', '9', '通化市', 'city', 't');
INSERT INTO `category_cities` VALUES ('183', '9', '白山市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('184', '9', '松原市', 'city', 's');
INSERT INTO `category_cities` VALUES ('185', '9', '白城市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('186', '9', '延边市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('187', '10', '哈尔滨市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('188', '10', '齐齐哈尔市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('189', '10', '鸡西市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('190', '10', '鹤岗市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('191', '10', '双鸭山市', 'city', 's');
INSERT INTO `category_cities` VALUES ('192', '10', '大庆市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('193', '10', '伊春市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('194', '10', '佳木斯市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('195', '10', '七台河市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('196', '10', '牡丹江市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('197', '10', '黑河市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('198', '10', '绥化市', 'city', 's');
INSERT INTO `category_cities` VALUES ('199', '10', '大兴安岭', 'city', 'd');
INSERT INTO `category_cities` VALUES ('200', '11', '南京市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('201', '11', '无锡市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('202', '11', '徐州市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('203', '11', '常州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('204', '11', '苏州市', 'city', 's');
INSERT INTO `category_cities` VALUES ('205', '11', '南通市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('206', '11', '连云港市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('207', '11', '淮安市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('208', '11', '盐城市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('209', '11', '扬州市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('210', '11', '镇江市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('211', '11', '泰州市', 'city', 't');
INSERT INTO `category_cities` VALUES ('212', '11', '宿迁市', 'city', 's');
INSERT INTO `category_cities` VALUES ('213', '12', '杭州市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('214', '12', '宁波市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('215', '12', '温州市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('216', '12', '嘉兴市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('217', '12', '湖州市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('218', '12', '绍兴市', 'city', 's');
INSERT INTO `category_cities` VALUES ('219', '12', '金华市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('220', '12', '衢州市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('221', '12', '舟山市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('222', '12', '台州市', 'city', 't');
INSERT INTO `category_cities` VALUES ('223', '12', '丽水市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('224', '13', '合肥市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('225', '13', '芜湖市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('226', '13', '蚌埠市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('227', '13', '淮南市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('228', '13', '马鞍山市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('229', '13', '淮北市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('230', '13', '铜陵市', 'city', 't');
INSERT INTO `category_cities` VALUES ('231', '13', '安庆市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('232', '13', '黄山市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('233', '13', '滁州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('234', '13', '阜阳市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('235', '13', '宿州市', 'city', 's');
INSERT INTO `category_cities` VALUES ('236', '13', '巢湖市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('237', '13', '六安市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('238', '13', '亳州市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('239', '13', '池州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('240', '13', '宣城市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('241', '14', '福州市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('242', '14', '厦门市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('243', '14', '莆田市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('244', '14', '三明市', 'city', 's');
INSERT INTO `category_cities` VALUES ('245', '14', '泉州市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('246', '14', '漳州市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('247', '14', '南平市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('248', '14', '龙岩市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('249', '14', '宁德市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('250', '15', '南昌市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('251', '15', '景德镇市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('252', '15', '萍乡市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('253', '15', '九江市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('254', '15', '新余市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('255', '15', '鹰潭市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('256', '15', '赣州市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('257', '15', '吉安市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('258', '15', '宜春市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('259', '15', '抚州市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('260', '15', '上饶市', 'city', 's');
INSERT INTO `category_cities` VALUES ('261', '16', '济南市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('262', '16', '青岛市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('263', '16', '淄博市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('264', '16', '枣庄市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('265', '16', '东营市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('266', '16', '烟台市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('267', '16', '潍坊市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('268', '16', '济宁市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('269', '16', '泰安市', 'city', 't');
INSERT INTO `category_cities` VALUES ('270', '16', '威海市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('271', '16', '日照市', 'city', 'r');
INSERT INTO `category_cities` VALUES ('272', '16', '莱芜市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('273', '16', '临沂市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('274', '16', '德州市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('275', '16', '聊城市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('276', '16', '滨州市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('277', '16', '荷泽市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('278', '17', '郑州市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('279', '17', '开封市', 'city', 'k');
INSERT INTO `category_cities` VALUES ('280', '17', '洛阳市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('281', '17', '平顶山市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('282', '17', '安阳市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('283', '17', '鹤壁市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('284', '17', '新乡市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('285', '17', '焦作市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('286', '17', '濮阳市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('287', '17', '许昌市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('288', '17', '漯河市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('289', '17', '三门峡市', 'city', 's');
INSERT INTO `category_cities` VALUES ('290', '17', '南阳市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('291', '17', '商丘市', 'city', 's');
INSERT INTO `category_cities` VALUES ('292', '17', '信阳市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('293', '17', '周口市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('294', '17', '驻马店市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('295', '18', '武汉市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('296', '18', '黄石市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('297', '18', '十堰市', 'city', 's');
INSERT INTO `category_cities` VALUES ('298', '18', '宜昌市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('299', '18', '襄樊市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('300', '18', '鄂州市', 'city', 'e');
INSERT INTO `category_cities` VALUES ('301', '18', '荆门市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('302', '18', '孝感市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('303', '18', '荆州市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('304', '18', '黄冈市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('305', '18', '咸宁市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('306', '18', '随州市', 'city', 's');
INSERT INTO `category_cities` VALUES ('307', '18', '恩施市', 'city', 'e');
INSERT INTO `category_cities` VALUES ('308', '18', '仙桃市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('309', '18', '潜江市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('310', '18', '天门市', 'city', 't');
INSERT INTO `category_cities` VALUES ('311', '18', '神农架林区', 'city', 's');
INSERT INTO `category_cities` VALUES ('312', '19', '长沙市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('313', '19', '株洲市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('314', '19', '湘潭市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('315', '19', '衡阳市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('316', '19', '邵阳市', 'city', 's');
INSERT INTO `category_cities` VALUES ('317', '19', '岳阳市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('318', '19', '常德市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('319', '19', '张家界市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('320', '19', '益阳市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('321', '19', '郴州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('322', '19', '永州市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('323', '19', '怀化市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('324', '19', '娄底市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('325', '19', '湘西', 'city', 'x');
INSERT INTO `category_cities` VALUES ('326', '20', '广州市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('327', '20', '韶关市', 'city', 's');
INSERT INTO `category_cities` VALUES ('328', '20', '深圳市', 'city', 's');
INSERT INTO `category_cities` VALUES ('329', '20', '珠海市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('330', '20', '汕头市', 'city', 's');
INSERT INTO `category_cities` VALUES ('331', '20', '佛山市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('332', '20', '江门市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('333', '20', '湛江市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('334', '20', '茂名市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('335', '20', '肇庆市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('336', '20', '惠州市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('337', '20', '梅州市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('338', '20', '汕尾市', 'city', 's');
INSERT INTO `category_cities` VALUES ('339', '20', '河源市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('340', '20', '阳江市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('341', '20', '清远市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('342', '20', '东莞市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('343', '20', '中山市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('344', '20', '潮州市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('345', '20', '揭阳市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('346', '20', '云浮市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('347', '21', '南宁市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('348', '21', '柳州市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('349', '21', '桂林市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('350', '21', '梧州市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('351', '21', '北海市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('352', '21', '防城港市', 'city', 'f');
INSERT INTO `category_cities` VALUES ('353', '21', '钦州市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('354', '21', '贵港市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('355', '21', '玉林市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('356', '21', '百色市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('357', '21', '贺州市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('358', '21', '河池市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('359', '21', '来宾市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('360', '21', '崇左市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('361', '22', '海口市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('362', '22', '三亚市', 'city', 's');
INSERT INTO `category_cities` VALUES ('363', '22', '五指山市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('364', '22', '琼海市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('365', '22', '儋州市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('366', '22', '文昌市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('367', '22', '万宁市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('368', '22', '东方市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('369', '22', '定安县', 'city', 'd');
INSERT INTO `category_cities` VALUES ('370', '22', '屯昌县', 'city', 't');
INSERT INTO `category_cities` VALUES ('371', '22', '澄迈县', 'city', 'c');
INSERT INTO `category_cities` VALUES ('372', '22', '临高县', 'city', 'l');
INSERT INTO `category_cities` VALUES ('373', '22', '白沙', 'city', 'b');
INSERT INTO `category_cities` VALUES ('374', '22', '昌江', 'city', 'c');
INSERT INTO `category_cities` VALUES ('375', '22', '乐东', 'city', 'l');
INSERT INTO `category_cities` VALUES ('376', '22', '陵水', 'city', 'l');
INSERT INTO `category_cities` VALUES ('377', '22', '保亭', 'city', 'b');
INSERT INTO `category_cities` VALUES ('378', '22', '琼中', 'city', 'q');
INSERT INTO `category_cities` VALUES ('379', '22', '西沙群岛', 'city', 'x');
INSERT INTO `category_cities` VALUES ('380', '22', '南沙群岛', 'city', 'n');
INSERT INTO `category_cities` VALUES ('381', '22', '中沙群岛', 'city', 'z');
INSERT INTO `category_cities` VALUES ('382', '23', '成都市', 'city', 'c');
INSERT INTO `category_cities` VALUES ('383', '23', '自贡市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('384', '23', '攀枝花市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('385', '23', '泸州市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('386', '23', '德阳市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('387', '23', '绵阳市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('388', '23', '广元市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('389', '23', '遂宁市', 'city', 's');
INSERT INTO `category_cities` VALUES ('390', '23', '内江市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('391', '23', '乐山市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('392', '23', '南充市', 'city', 'n');
INSERT INTO `category_cities` VALUES ('393', '23', '眉山市', 'city', 'm');
INSERT INTO `category_cities` VALUES ('394', '23', '宜宾市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('395', '23', '广安市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('396', '23', '达州市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('397', '23', '雅安市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('398', '23', '巴中市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('399', '23', '资阳市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('400', '23', '阿坝', 'city', 'a');
INSERT INTO `category_cities` VALUES ('401', '23', '甘孜', 'city', 'g');
INSERT INTO `category_cities` VALUES ('402', '23', '凉山', 'city', 'l');
INSERT INTO `category_cities` VALUES ('403', '24', '贵阳市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('404', '24', '六盘水市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('405', '24', '遵义市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('406', '24', '安顺市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('407', '24', '铜仁地区', 'city', 't');
INSERT INTO `category_cities` VALUES ('408', '24', '黔西南州', 'city', 'q');
INSERT INTO `category_cities` VALUES ('409', '24', '毕节地区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('410', '24', '黔东南州', 'city', 'q');
INSERT INTO `category_cities` VALUES ('411', '24', '黔南州', 'city', 'q');
INSERT INTO `category_cities` VALUES ('412', '25', '昆明市', 'city', 'k');
INSERT INTO `category_cities` VALUES ('413', '25', '曲靖市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('414', '25', '玉溪市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('415', '25', '保山市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('416', '25', '昭通市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('417', '25', '丽江市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('418', '25', '思茅市', 'city', 's');
INSERT INTO `category_cities` VALUES ('419', '25', '临沧市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('420', '25', '楚雄', 'city', 'c');
INSERT INTO `category_cities` VALUES ('421', '25', '红河州', 'city', 'h');
INSERT INTO `category_cities` VALUES ('422', '25', '文山州', 'city', 'w');
INSERT INTO `category_cities` VALUES ('423', '25', '西双版纳州', 'city', 'x');
INSERT INTO `category_cities` VALUES ('424', '25', '大理州', 'city', 'd');
INSERT INTO `category_cities` VALUES ('425', '25', '德宏州', 'city', 'd');
INSERT INTO `category_cities` VALUES ('426', '25', '怒江州', 'city', 'n');
INSERT INTO `category_cities` VALUES ('427', '25', '迪庆州', 'city', 'd');
INSERT INTO `category_cities` VALUES ('428', '26', '拉萨市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('429', '26', '昌都地区', 'city', 'c');
INSERT INTO `category_cities` VALUES ('430', '26', '山南地区', 'city', 's');
INSERT INTO `category_cities` VALUES ('431', '26', '日喀则地区', 'city', 'r');
INSERT INTO `category_cities` VALUES ('432', '26', '那曲地区', 'city', 'n');
INSERT INTO `category_cities` VALUES ('433', '26', '阿里地区', 'city', 'a');
INSERT INTO `category_cities` VALUES ('434', '26', '林芝地区', 'city', 'l');
INSERT INTO `category_cities` VALUES ('435', '27', '西安市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('436', '27', '铜川市', 'city', 't');
INSERT INTO `category_cities` VALUES ('437', '27', '宝鸡市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('438', '27', '咸阳市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('439', '27', '渭南市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('440', '27', '延安市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('441', '27', '汉中市', 'city', 'h');
INSERT INTO `category_cities` VALUES ('442', '27', '榆林市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('443', '27', '安康市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('444', '27', '商洛市', 'city', 's');
INSERT INTO `category_cities` VALUES ('445', '28', '兰州市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('446', '28', '嘉峪关市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('447', '28', '金昌市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('448', '28', '白银市', 'city', 'b');
INSERT INTO `category_cities` VALUES ('449', '28', '天水市', 'city', 't');
INSERT INTO `category_cities` VALUES ('450', '28', '武威市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('451', '28', '张掖市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('452', '28', '平凉市', 'city', 'p');
INSERT INTO `category_cities` VALUES ('453', '28', '酒泉市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('454', '28', '庆阳市', 'city', 'q');
INSERT INTO `category_cities` VALUES ('455', '28', '定西市', 'city', 'd');
INSERT INTO `category_cities` VALUES ('456', '28', '陇南市', 'city', 'l');
INSERT INTO `category_cities` VALUES ('457', '28', '临夏', 'city', 'l');
INSERT INTO `category_cities` VALUES ('458', '28', '甘南', 'city', 'g');
INSERT INTO `category_cities` VALUES ('459', '29', '西宁市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('460', '29', '海东地区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('461', '29', '海北州', 'city', 'h');
INSERT INTO `category_cities` VALUES ('462', '29', '黄南州', 'city', 'h');
INSERT INTO `category_cities` VALUES ('463', '29', '海南州', 'city', 'h');
INSERT INTO `category_cities` VALUES ('464', '29', '果洛州', 'city', 'g');
INSERT INTO `category_cities` VALUES ('465', '29', '玉树州', 'city', 'y');
INSERT INTO `category_cities` VALUES ('466', '29', '海西州', 'city', 'h');
INSERT INTO `category_cities` VALUES ('467', '30', '银川市', 'city', 'y');
INSERT INTO `category_cities` VALUES ('468', '30', '石嘴山市', 'city', 's');
INSERT INTO `category_cities` VALUES ('469', '30', '吴忠市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('470', '30', '固原市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('471', '30', '中卫市', 'city', 'z');
INSERT INTO `category_cities` VALUES ('472', '31', '乌鲁木齐市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('473', '31', '克拉玛依市', 'city', 'k');
INSERT INTO `category_cities` VALUES ('474', '31', '吐鲁番地区', 'city', 't');
INSERT INTO `category_cities` VALUES ('475', '31', '哈密地区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('476', '31', '昌吉州', 'city', 'c');
INSERT INTO `category_cities` VALUES ('477', '31', '博州', 'city', 'b');
INSERT INTO `category_cities` VALUES ('478', '31', '巴州', 'city', 'b');
INSERT INTO `category_cities` VALUES ('479', '31', '阿克苏地区', 'city', 'a');
INSERT INTO `category_cities` VALUES ('480', '31', '克州', 'city', 'k');
INSERT INTO `category_cities` VALUES ('481', '31', '喀什地区', 'city', 'k');
INSERT INTO `category_cities` VALUES ('482', '31', '和田地区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('483', '31', '伊犁州', 'city', 'y');
INSERT INTO `category_cities` VALUES ('484', '31', '塔城地区', 'city', 't');
INSERT INTO `category_cities` VALUES ('485', '31', '阿勒泰地区', 'city', 'a');
INSERT INTO `category_cities` VALUES ('486', '31', '石河子市', 'city', 's');
INSERT INTO `category_cities` VALUES ('487', '31', '阿拉尔市', 'city', 'a');
INSERT INTO `category_cities` VALUES ('488', '31', '图木舒克市', 'city', 't');
INSERT INTO `category_cities` VALUES ('489', '31', '五家渠市', 'city', 'w');
INSERT INTO `category_cities` VALUES ('490', '32', '台北市', 'city', 't');
INSERT INTO `category_cities` VALUES ('491', '32', '高雄市', 'city', 'g');
INSERT INTO `category_cities` VALUES ('492', '32', '基隆市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('493', '32', '新竹市', 'city', 'x');
INSERT INTO `category_cities` VALUES ('494', '32', '台中市', 'city', 't');
INSERT INTO `category_cities` VALUES ('495', '32', '嘉义市', 'city', 'j');
INSERT INTO `category_cities` VALUES ('496', '32', '台南市', 'city', 't');
INSERT INTO `category_cities` VALUES ('497', '32', '台北县', 'city', 't');
INSERT INTO `category_cities` VALUES ('498', '32', '桃园县', 'city', 't');
INSERT INTO `category_cities` VALUES ('499', '32', '新竹县', 'city', 'x');
INSERT INTO `category_cities` VALUES ('500', '32', '苗栗县', 'city', 'm');
INSERT INTO `category_cities` VALUES ('501', '32', '台中县', 'city', 't');
INSERT INTO `category_cities` VALUES ('502', '32', '彰化县', 'city', 'z');
INSERT INTO `category_cities` VALUES ('503', '32', '南投县', 'city', 'n');
INSERT INTO `category_cities` VALUES ('504', '32', '云林县', 'city', 'y');
INSERT INTO `category_cities` VALUES ('505', '32', '嘉义县', 'city', 'j');
INSERT INTO `category_cities` VALUES ('506', '32', '台南县', 'city', 't');
INSERT INTO `category_cities` VALUES ('507', '32', '高雄县', 'city', 'g');
INSERT INTO `category_cities` VALUES ('508', '32', '屏东县', 'city', 'p');
INSERT INTO `category_cities` VALUES ('509', '32', '宜兰县', 'city', 'y');
INSERT INTO `category_cities` VALUES ('510', '32', '花莲县', 'city', 'h');
INSERT INTO `category_cities` VALUES ('511', '32', '台东县', 'city', 't');
INSERT INTO `category_cities` VALUES ('512', '32', '澎湖县', 'city', 'p');
INSERT INTO `category_cities` VALUES ('513', '32', '金门县', 'city', 'j');
INSERT INTO `category_cities` VALUES ('514', '32', '连江县', 'city', 'l');
INSERT INTO `category_cities` VALUES ('515', '33', '中西区', 'city', 'z');
INSERT INTO `category_cities` VALUES ('516', '33', '东区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('517', '33', '南区', 'city', 'n');
INSERT INTO `category_cities` VALUES ('518', '33', '湾仔区', 'city', 'w');
INSERT INTO `category_cities` VALUES ('519', '33', '九龙城区', 'city', 'j');
INSERT INTO `category_cities` VALUES ('520', '33', '观塘区', 'city', 'g');
INSERT INTO `category_cities` VALUES ('521', '33', '深水埗区', 'city', 's');
INSERT INTO `category_cities` VALUES ('522', '33', '黄大仙区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('523', '33', '油尖旺区', 'city', 'y');
INSERT INTO `category_cities` VALUES ('524', '33', '离岛区', 'city', 'l');
INSERT INTO `category_cities` VALUES ('525', '33', '葵青区', 'city', 'k');
INSERT INTO `category_cities` VALUES ('526', '33', '北区', 'city', 'b');
INSERT INTO `category_cities` VALUES ('527', '33', '西贡区', 'city', 'x');
INSERT INTO `category_cities` VALUES ('528', '33', '沙田区', 'city', 's');
INSERT INTO `category_cities` VALUES ('529', '33', '大埔区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('530', '33', '荃湾区', 'city', 'q');
INSERT INTO `category_cities` VALUES ('531', '33', '屯门区', 'city', 't');
INSERT INTO `category_cities` VALUES ('532', '33', '元朗区', 'city', 'y');
INSERT INTO `category_cities` VALUES ('533', '34', '花地玛堂区', 'city', 'h');
INSERT INTO `category_cities` VALUES ('534', '34', '圣安多尼堂区', 'city', 's');
INSERT INTO `category_cities` VALUES ('535', '34', '大堂区', 'city', 'd');
INSERT INTO `category_cities` VALUES ('536', '34', '望德堂区', 'city', 'w');
INSERT INTO `category_cities` VALUES ('537', '34', '风顺堂区', 'city', 'f');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `infoType` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `email` varchar(30) NOT NULL DEFAULT '',
  `feedback` varchar(250) NOT NULL,
  `uid` int(11) NOT NULL,
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000' COMMENT '毫秒级时间戳',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('7', '1', 'sdfsdfs', 'sdfsdfs', '2', '1458719655185');
INSERT INTO `feedback` VALUES ('8', '1', 'sdfsdfsd', 'sdfsdfsd', '2', '1458719873513');
INSERT INTO `feedback` VALUES ('9', '1', 'dfgsdfg', 'dfgsdfg', '2', '1458720003290');
INSERT INTO `feedback` VALUES ('10', '1', '不错 继续加油', '不错 继续加油', '28', '1458811422302');
INSERT INTO `feedback` VALUES ('11', '1', '的点点滴滴点点滴滴到底多大多大多大', '的点点滴滴点点滴滴到底多大多大多大', '30', '1459320628037');
INSERT INTO `feedback` VALUES ('12', '1', '反反复复房', '反反复复房', '30', '1459320644319');
INSERT INTO `feedback` VALUES ('13', '1', '我', '我', '50', '1460096346892');
INSERT INTO `feedback` VALUES ('14', '1', '553065725@qq.com', '测试', '45', '1460338918072');
INSERT INTO `feedback` VALUES ('15', '1', '553065725@qq.com', '测试', '45', '1460338953014');
INSERT INTO `feedback` VALUES ('16', '1', '527200116@qq.com', '哦哦哦', '21', '1460518298114');
INSERT INTO `feedback` VALUES ('17', '1', '897862778@qq.com', '笨蛋\n', '49', '1460538641012');
INSERT INTO `feedback` VALUES ('18', '1', 'hqc@sumhand.com', '测试邮件。', '29', '1460942860231');
INSERT INTO `feedback` VALUES ('19', '1', '553065725@qq.com', '测试', '45', '1460944097798');
INSERT INTO `feedback` VALUES ('20', '1', '1014276604@qq.com', '啦啦啦', '26', '1460976037345');
INSERT INTO `feedback` VALUES ('21', '1', 'hello', 'H', '73', '1460996341988');
INSERT INTO `feedback` VALUES ('22', '1', 'hello', 'H', '73', '1460996346090');
INSERT INTO `feedback` VALUES ('23', '1', '897862778@qq.com', '测试', '49', '1461032576604');

-- ----------------------------
-- Table structure for file_hash
-- ----------------------------
DROP TABLE IF EXISTS `file_hash`;
CREATE TABLE `file_hash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `val` char(60) NOT NULL DEFAULT '',
  `url` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of file_hash
-- ----------------------------
INSERT INTO `file_hash` VALUES ('27', '25-ddbe500696e2e54a220c4f2354d8e26772366cfe', 'avatar/201603180217032554.jpg');
INSERT INTO `file_hash` VALUES ('28', '25-48e56882c9b821dc84e3c5f05270aa9c8d7827f4', 'avatar/201603180430032527.jpg');
INSERT INTO `file_hash` VALUES ('29', '25-458027f9d56dda9f0a26142d889c197be446c2c7', 'avatar/201603180723032550.jpg');
INSERT INTO `file_hash` VALUES ('30', '25-ca5b01a8539eb7a0ff5ff6e9708f65c9e7a97e83', 'avatar/201603180748032522.jpg');
INSERT INTO `file_hash` VALUES ('31', '21-de7cb876c7d182c08aa475f0d78d8078e281923c', 'avatar/201603180758032157.jpg');
INSERT INTO `file_hash` VALUES ('32', '21-cf7fa15b2ca427eea07da1d7f0ad33aa8c2a36c9', 'avatar/201603180801032167.jpg');
INSERT INTO `file_hash` VALUES ('33', '21-da39a3ee5e6b4b0d3255bfef95601890afd80709', 'avatar/201603180815032183.jpg');
INSERT INTO `file_hash` VALUES ('34', '21-a07e7418422d835b988e9230f9f731396d830fdc', 'avatar/201603180816032180.jpg');
INSERT INTO `file_hash` VALUES ('35', '21-81f29f1fd157f7b22b39f565dce6876fa7e25d10', 'avatar/201603180816032199.jpg');
INSERT INTO `file_hash` VALUES ('36', '21-848bb64920c88f4c4bb568bd5be2b5ffaf145584', 'avatar/201603180817032145.jpg');
INSERT INTO `file_hash` VALUES ('37', '21-d8ea0dc15e60b53c9643b32ed3e122b8797da5da', 'avatar/201603180817032169.jpg');
INSERT INTO `file_hash` VALUES ('38', '21-e2d250b74699029efc5e909c0787d36599107745', 'avatar/20160318081703218.jpg');
INSERT INTO `file_hash` VALUES ('39', '25-5157d636fabb79b127c4705664fa8e834f4a451c', 'avatar/201603180826032537.jpg');
INSERT INTO `file_hash` VALUES ('40', '25-88f1f50197face17d943871115e58931a6f80ed9', 'avatar/201603180827032586.jpg');
INSERT INTO `file_hash` VALUES ('41', '25-b22d92f96b3db322337b90b3fc32a719dd44f68a', 'avatar/201603180828032558.jpg');
INSERT INTO `file_hash` VALUES ('42', '25-cf4e3a9bf515c0453a7d65872932970973f8e34f', 'album/201603180843032590.jpg');
INSERT INTO `file_hash` VALUES ('43', '25-ff9482848fd38cb3a3d84626dd010344c85ea838', 'album/201603180843032533.jpg');
INSERT INTO `file_hash` VALUES ('44', '25-f25631015d59edee5bc92ca90c0cab1142987b6a', 'album/201603180845032591.jpg');
INSERT INTO `file_hash` VALUES ('45', '25-b84069e9ac2824b9a7933ef6accd3501a8ecc860', 'album/201603180845032532.jpg');
INSERT INTO `file_hash` VALUES ('46', '25-d03220500ebb74990ae0d28a16120c14b8f6105d', 'album/201603180845032544.jpg');
INSERT INTO `file_hash` VALUES ('47', '25-3deef995f58c5161367e9c448bbc34be7030acd0', 'album/201603180845032567.jpg');
INSERT INTO `file_hash` VALUES ('48', '25-55bf313aad782657984b2b860de476819ab599e4', 'album/201603180845032520.jpg');
INSERT INTO `file_hash` VALUES ('49', '25-09de1700b3be9284f83dbc53c19aa8e7ca5d17fa', 'worksCover/20160320072503258.j');
INSERT INTO `file_hash` VALUES ('50', '23-7dfbc8995898d336302a9e9f054eb876dd27305f', 'avatar/201603200728032325.jpg');
INSERT INTO `file_hash` VALUES ('51', '23-35602c823c5a123cd4904c65373678ee7854d2e4', 'avatar/201603200742032378.jpg');
INSERT INTO `file_hash` VALUES ('52', '23-8a4f38d0e19ad95ecc52affeb64a41d5b2911fa4', 'avatar/201603200743032387.jpg');
INSERT INTO `file_hash` VALUES ('53', '23-94d6ff83ad2e0202b2203e3b958d15c9f5857291', 'avatar/201603210130032331.jpg');
INSERT INTO `file_hash` VALUES ('54', '23-e3e91a9c46b2a1704f45744d46294603693ad54c', 'avatar/201603210133032348.jpg');
INSERT INTO `file_hash` VALUES ('55', '26-d862daa7a4f1cbee548cf191a8e9143570e35c48', 'avatar/201603210206032628.jpg');
INSERT INTO `file_hash` VALUES ('56', '26-2fbf5fa6bff76f5f73f70993ad1158ea24fb02e3', 'avatar/201603210209032685.jpg');
INSERT INTO `file_hash` VALUES ('57', '26-19e4e0df2e09daccfab8c15739d591debe81b81b', 'avatar/201603210218032650.jpg');
INSERT INTO `file_hash` VALUES ('58', '27-30ec149e2a007a473fdddcaf4088398ed4b72585', 'avatar/201603210350032752.jpg');
INSERT INTO `file_hash` VALUES ('59', '23-a87b11b8aa51de302dd4192c4f1229e8b582e5df', 'avatar/201603210542032319.jpg');
INSERT INTO `file_hash` VALUES ('60', '23-7eb8fc34217c07eab72b7396d0813c8e70e40bf6', 'album/201603210553032364.jpg');
INSERT INTO `file_hash` VALUES ('61', '23-7a3f1b510b7e238f661909352c24955c1b29422a', 'album/201603210553032342.jpg');
INSERT INTO `file_hash` VALUES ('62', '27-c38d37f1c1ffdce26df674413c017166bbf7e40c', 'avatar/201603210729032746.jpg');
INSERT INTO `file_hash` VALUES ('63', '27-1c0f72f1da1e772113095636f1ae29b2b5468f84', 'avatar/201603210729032727.jpg');
INSERT INTO `file_hash` VALUES ('64', '27-80df5cb5e70ca40c66b77cf6c5e7991ead765ce6', 'avatar/201603210732032760.jpg');
INSERT INTO `file_hash` VALUES ('65', '21-93bd02b00ec52f6683ef5caf4c461a7dbc928b39', 'avatar/201603210739032167.jpg');
INSERT INTO `file_hash` VALUES ('66', '21-6bffa3bca8c2b6fbcd3e1abe7a3de8d6f61a81f7', 'avatar/201603210740032145.jpg');
INSERT INTO `file_hash` VALUES ('67', '27-e0031749adfd2d2006180ad613d673c8c2016cb0', 'avatar/201603210742032712.jpg');
INSERT INTO `file_hash` VALUES ('68', '2-a4a697b478d7a3a1e07fe75ac477de7317d4c68a', 'avatar/20160321094403239.jpg');
INSERT INTO `file_hash` VALUES ('69', '23-ace365d3d81198e193fe7895ca40dd96124ab66e', 'avatar/201603211000032372.jpg');
INSERT INTO `file_hash` VALUES ('70', '23-4abbae553416026630e8f95f3a1a3bc540e539f5', 'album/20160321024103233.jpg');
INSERT INTO `file_hash` VALUES ('71', '23-200b97666763885ba8af156f7c13618010426e1e', 'album/201603210241032332.jpg');
INSERT INTO `file_hash` VALUES ('72', '23-09c0f1c958845ace5165ee80b2dd33fb602f3c23', 'album/201603210241032317.jpg');
INSERT INTO `file_hash` VALUES ('73', '23-92e85d0c7c53c7c22f6abc704f73ccb41e617984', 'album/201603210241032365.jpg');
INSERT INTO `file_hash` VALUES ('74', '27-00f4ff31cc8f1f8e79e52181151b6ac1134d5a7d', 'avatar/201603220123032729.jpg');
INSERT INTO `file_hash` VALUES ('75', '26-c766cf61ac959c993c55aab1f05394a026f78acc', 'avatar/20160322032903269.jpg');
INSERT INTO `file_hash` VALUES ('76', '27-3184c282b311d74e6154c02072eecfa38e4a65f3', 'avatar/20160322063003275.jpg');
INSERT INTO `file_hash` VALUES ('77', '27-87e0656f9b32783de31a67cc743613efb207caa5', 'avatar/201603220632032785.jpg');
INSERT INTO `file_hash` VALUES ('78', '27-90e39d984d8d5984c732048cae3ecb14338cf10c', 'avatar/201603220639032722.jpg');
INSERT INTO `file_hash` VALUES ('79', '26-578b715481f1d0cdc7dcd1f54569ed549f466464', 'avatar/201603220645032645.jpg');
INSERT INTO `file_hash` VALUES ('80', '26-0c44fc5cfa2a549ca02c4b63c7f00220c4fa6820', 'avatar/201603220651032664.jpg');
INSERT INTO `file_hash` VALUES ('81', '26-33e38bf3a3f310b2509bdc68e135f48dcf5aff70', 'avatar/201603220719032683.jpg');
INSERT INTO `file_hash` VALUES ('82', '25-64f0f901a81a82aad5d543564c6b29ed375b0677', 'operaCover/201603220810032564.jpg');
INSERT INTO `file_hash` VALUES ('83', '25-2fa417bf395461cb9f5ce42fc349d465ef963448', 'operaCover/201603220824032582.jpg');
INSERT INTO `file_hash` VALUES ('84', '25-0d3929531a4b23c113078073368e055e298aacd9', 'operaCover/201603220925032560.jpg');
INSERT INTO `file_hash` VALUES ('85', '25-0bf7705f0f01e8c5378010fe1535ccb0105437f8', 'operaCover/201603221114032528.jpg');
INSERT INTO `file_hash` VALUES ('86', '2-2fa417bf395461cb9f5ce42fc349d465ef963448', 'operaCover/20160323012503229.jpg');
INSERT INTO `file_hash` VALUES ('87', '27-ba11b10f6242a6a128412647ed897e1b5f9a18ec', 'avatar/201603230138032766.jpg');
INSERT INTO `file_hash` VALUES ('88', '27-5e32a46029bebff4d6f165a00e6f019f003f1eef', 'avatar/201603230141032787.jpg');
INSERT INTO `file_hash` VALUES ('89', '23-7ae883d3e7e2101be07a2e8c645fbba1b4739c21', 'avatar/201603230149032343.jpg');
INSERT INTO `file_hash` VALUES ('90', '25-169dc8abad6d6607db9cb2d82c229d543a6c8cc5', 'avatar/201603230152032591.jpg');
INSERT INTO `file_hash` VALUES ('91', '25-da48f85f386c02e5d194acb0047c8a3add94fb81', 'avatar/201603230153032534.jpg');
INSERT INTO `file_hash` VALUES ('92', '25-b784a8867ffab61db8eb45f7a3eba79e3398077a', 'operaCover/201603230201032577.jpg');
INSERT INTO `file_hash` VALUES ('93', '26-ab29575efc6a5c16550e6890c1ec1e2fb7521636', 'avatar/20160323074903267.jpg');
INSERT INTO `file_hash` VALUES ('94', '26-d55596c0d952a1cfef438b44892217189543168c', 'avatar/201603230754032623.jpg');
INSERT INTO `file_hash` VALUES ('95', '20-a94fb4640723c63158bbb45e217956d8d70b37b8', 'avatar/20160323081203201.jpg');
INSERT INTO `file_hash` VALUES ('96', '23-52d5848908b71444ee9ac17b1b7497340a375a07', 'avatar/201603230829032366.jpg');
INSERT INTO `file_hash` VALUES ('97', '25-c6693dbd110575788c398e7bac70088538f08585', 'avatar/201603231056032533.jpg');
INSERT INTO `file_hash` VALUES ('98', '2-407a7ca71f19ba08c6b7f11332d1253a05d35742', 'operaCover/20160324030803288.jpg');
INSERT INTO `file_hash` VALUES ('99', '28-2fa417bf395461cb9f5ce42fc349d465ef963448', 'avatar/201603240922032837.jpg');
INSERT INTO `file_hash` VALUES ('100', '26-9c90fe44d7af083177ea6034c8daa345a85cc0d1', 'avatar/20160324104603262.jpg');
INSERT INTO `file_hash` VALUES ('101', '29-78a424962d1674e2fc316fd3e1c1d9cff78b9c0f', 'avatar/201603241257032982.jpg');
INSERT INTO `file_hash` VALUES ('102', '30-f38e1525c9192fc8260600df33084f58003b34f8', 'avatar/201603251219033047.jpg');
INSERT INTO `file_hash` VALUES ('103', '25-77c670310fb2d17ab8556809834b9a9d95e17088', 'avatar/201603250716032579.jpg');
INSERT INTO `file_hash` VALUES ('104', '27-594154b1e2fd71df8f83e1b1ded6a01b0858af69', 'worksCover/201603250822032722.jpg');
INSERT INTO `file_hash` VALUES ('105', '27-067d2a7554b9a7258098510019c47ed94b0900f4', 'album/201603250826032767.jpg');
INSERT INTO `file_hash` VALUES ('106', '27-6d9a13f916c3b7ec73fe50b6c78fb8dab36128f9', 'album/201603250826032775.jpg');
INSERT INTO `file_hash` VALUES ('107', '27-0f27f54bc8a7b160329b3a341d803b0f328f0d84', 'album/201603250827032755.jpg');
INSERT INTO `file_hash` VALUES ('108', '27-bbd755732b03528b42015ed7da7b38ba53034dd4', 'album/201603250827032778.jpg');
INSERT INTO `file_hash` VALUES ('109', '27-92daf39ce609ab049df0cf7aa960027cca5770d8', 'album/201603250827032752.jpg');
INSERT INTO `file_hash` VALUES ('110', '27-4ca5086a3882d6e3c175239d7012b2fd7cf7c0bb', 'album/201603250827032729.jpg');
INSERT INTO `file_hash` VALUES ('111', '27-df3ed97d27cf006a0e2e2ef2b46cf5a11aa80271', 'album/201603250828032773.jpg');
INSERT INTO `file_hash` VALUES ('112', '27-1456a84d5019166f5f604ceeda7d942f49e4edcd', 'album/201603250829032747.jpg');
INSERT INTO `file_hash` VALUES ('113', '25-9b160baa47ac1fd30517dca88947a4ecf85495b0', 'album/201603250829032585.jpg');
INSERT INTO `file_hash` VALUES ('114', '25-20d03245b8b17c578de3484d49269c43716a58e7', 'worksCover/201603250832032579.jpg');
INSERT INTO `file_hash` VALUES ('115', '25-a58d3576860c1d649d65d9c872e4259be54d844c', 'worksCover/201603250849032558.jpg');
INSERT INTO `file_hash` VALUES ('116', '27-5509ddb20b0e930e80ae944e4691350fffcf84c6', 'album/201603250938032792.jpg');
INSERT INTO `file_hash` VALUES ('117', '27-ca029e6703ce8f29bf4c0f63c8043ffd1b749ab9', 'album/20160325093803278.jpg');
INSERT INTO `file_hash` VALUES ('118', '27-5f3681ada4a203274893165bd7b403440fcf5ebf', 'album/201603250938032788.jpg');
INSERT INTO `file_hash` VALUES ('119', '27-b9572e3ea20883bd72b700ab7b34aeb35a4b5717', 'album/201603250938032733.jpg');
INSERT INTO `file_hash` VALUES ('120', '25-e9a1ff93e59423816493bfcb0c96ef5fa40fe668', 'album/201603280314032532.jpg');
INSERT INTO `file_hash` VALUES ('121', '25-6f4fdf81d3e821ade725b9c5b5ffe7934d895b05', 'album/201603280314032591.jpg');
INSERT INTO `file_hash` VALUES ('122', '25-89e5f97f3cd4eb871b4760ffaa320eca409f1a7b', 'album/201603280314032516.jpg');
INSERT INTO `file_hash` VALUES ('123', '25-71468d190e378226d5c4337b6b31c204464b6bd7', 'album/201603280314032564.jpg');
INSERT INTO `file_hash` VALUES ('124', '25-ee2406ac6a85dc856df13b4977a100baf8ea95d0', 'album/201603280314032575.jpg');
INSERT INTO `file_hash` VALUES ('125', '25-296abbf8395fe65f60850832599e84e09a0c562a', 'album/201603280315032529.jpg');
INSERT INTO `file_hash` VALUES ('126', '25-06a1e217b45836d9cbd2df13e6bb6b540b1f5863', 'album/201603280743032545.jpg');
INSERT INTO `file_hash` VALUES ('127', '25-99cbf1655a8fd5bd2e1234c27dc79ced28f6e2bf', 'album/201603280743032542.jpg');
INSERT INTO `file_hash` VALUES ('128', '25-37146cfb74e6d92dc962017a730e4ec6cd3e0fae', 'album/20160328074403257.jpg');
INSERT INTO `file_hash` VALUES ('129', '25-6f5f2bd9e648ef42a9fef3b79f640b1802c0c167', 'album/20160328075403259.jpg');
INSERT INTO `file_hash` VALUES ('130', '25-c5e2b5bd11219d53c6a59b87e24ee0205e70037b', 'operaCover/201603280810032571.jpg');
INSERT INTO `file_hash` VALUES ('131', '25-98d28a8642870a97e17d90ea6d329029a1308abd', 'album/201603280817032528.jpg');
INSERT INTO `file_hash` VALUES ('132', '25-b59ba57492bcff9240bcc5e8aa36f6ea65591b93', 'album/201603280824032579.jpg');
INSERT INTO `file_hash` VALUES ('133', '25-5d34c5415a632d9488ed1ee41232c82a5f8b0995', 'album/201603280824032525.jpg');
INSERT INTO `file_hash` VALUES ('134', '23-d2bba7594f30658e7adbe568609bea657dfca1b9', 'album/201603290831032322.jpg');
INSERT INTO `file_hash` VALUES ('135', '23-99bb419e1d33e6d79aa5a27415428a924c32ab02', 'album/201603290831032330.jpg');
INSERT INTO `file_hash` VALUES ('136', '23-3a2f9c3ed397648dfac9831c6c59160faddfb172', 'album/201603290831032319.jpg');
INSERT INTO `file_hash` VALUES ('137', '23-90914855c528035f9d16c2a648fca8250ac09d70', 'album/201603290839032362.jpg');
INSERT INTO `file_hash` VALUES ('138', '23-1b7703e13813278248a1aa5110f0cec59810e0f7', 'album/201603290839032316.jpg');
INSERT INTO `file_hash` VALUES ('139', '23-66116875d697e66316fd6c59fff46ec469304880', 'album/20160329084103239.jpg');
INSERT INTO `file_hash` VALUES ('140', '23-88609786f440df65cd0d9d64614760f898d2dee3', 'album/201603290857032336.jpg');
INSERT INTO `file_hash` VALUES ('141', '23-7555abb18ded213e90b0f835776ded1cde286b0b', 'album/201603290857032329.jpg');
INSERT INTO `file_hash` VALUES ('142', '33-d862daa7a4f1cbee548cf191a8e9143570e35c48', 'avatar/201603291025033355.jpg');
INSERT INTO `file_hash` VALUES ('143', '35-d862daa7a4f1cbee548cf191a8e9143570e35c48', 'avatar/201603291118033527.jpg');
INSERT INTO `file_hash` VALUES ('144', '-a30c7aaae86b46f9ee4b097dab5172d6cc918435', 'avatar/2016033001430361.jpg');
INSERT INTO `file_hash` VALUES ('145', '25-4962203b9fbb889080f7cf787b39a53de18b6fec', 'avatar/20160330020303251.jpg');
INSERT INTO `file_hash` VALUES ('146', '25-18c28199eb9c179a8c5c63025739a89d45d5a742', 'avatar/201603300208032520.jpg');
INSERT INTO `file_hash` VALUES ('147', '25-3c0acdf562e342759e07c2c83c09d7ba40a123b7', 'avatar/201603300213032535.jpg');
INSERT INTO `file_hash` VALUES ('148', '25-407a7ca71f19ba08c6b7f11332d1253a05d35742', 'avatar/201603300217032557.jpg');
INSERT INTO `file_hash` VALUES ('149', '25-e139c3a4d965448c16275ef1a61c0c294f5bc954', 'avatar/201603300233032548.jpg');
INSERT INTO `file_hash` VALUES ('150', '25-5c9720e61e806906b01a0262fdbb1d0643a3d182', 'operaCover/201603300245032532.jpg');
INSERT INTO `file_hash` VALUES ('151', '23-fb7d2b52db8a970da3275c1ca9858c237d7553d4', 'album/201603300444032358.jpg');
INSERT INTO `file_hash` VALUES ('152', '23-a5b72880af15d7148bf80117a7a2b5fff677ce98', 'album/20160330044403235.jpg');
INSERT INTO `file_hash` VALUES ('153', '23-7d61dcca90ca72d935b96eeaf0b38e4e13d74282', 'album/201603300521032357.jpg');
INSERT INTO `file_hash` VALUES ('154', '23-b2f1a2e3a245cecce801a122828e6bab882cf024', 'album/201603300523032333.jpg');
INSERT INTO `file_hash` VALUES ('155', '25-19034b854655b07319553cee796961defda7f616', 'operaCover/201603300547032559.jpg');
INSERT INTO `file_hash` VALUES ('156', '23-fdf711400a90fda9d76bbe3594de76cd9ec4aed7', 'avatar/201603300552032375.jpg');
INSERT INTO `file_hash` VALUES ('157', '25-625016c989b4a971738a5d6d616426461355b61b', 'avatar/201603300552032542.jpg');
INSERT INTO `file_hash` VALUES ('158', '23-e1b87b392687e7d8f7cb0175c545082343100879', 'avatar/201603300557032356.jpg');
INSERT INTO `file_hash` VALUES ('159', '25-18df74f5f8527c6da79f566bea5ccaf362c0a5eb', 'avatar/201603300656032554.jpg');
INSERT INTO `file_hash` VALUES ('160', '23-9ad91003592f7d2f503da140b9c3bffb40d857e6', 'album/201603300812032323.jpg');
INSERT INTO `file_hash` VALUES ('161', '23-79d19f86b0a29447e5433d4b079a34c43f113c34', 'album/201603300813032374.jpg');
INSERT INTO `file_hash` VALUES ('162', '23-42462119d895a5cda90843556eab903c6f42dcb8', 'album/201603300815032319.jpg');
INSERT INTO `file_hash` VALUES ('163', '-7623b68733b9eba909cc9474d37aeb350fa1eb88', 'avatar/2016033008580346.jpg');
INSERT INTO `file_hash` VALUES ('164', '-4e0875c8f9b87b62a8eb424b0eacad8205369abc', 'avatar/2016033009440341.jpg');
INSERT INTO `file_hash` VALUES ('165', '23-c42cb93a5d3c2b3c7b05132aa77a2d201a8240ca', 'worksCover/20160330094903233.jpg');
INSERT INTO `file_hash` VALUES ('166', '-fe2a6163d62e79c5f48db1c6296ee83119591c39', 'avatar/2016033009560393.jpg');
INSERT INTO `file_hash` VALUES ('167', '26-1560c3a30745d07f1b3b64b3465ac865c505fe29', 'avatar/201603301004032681.jpg');
INSERT INTO `file_hash` VALUES ('168', '39-d862daa7a4f1cbee548cf191a8e9143570e35c48', 'avatar/201603301254033968.jpg');
INSERT INTO `file_hash` VALUES ('169', '26-b8f079d771fc89f4b1d368596da3c334bfedaaa4', 'avatar/20160331011203261.jpg');
INSERT INTO `file_hash` VALUES ('170', '-dfb183cb636da9aadf201759b8bb4c46e18b64e4', 'avatar/2016033101490365.jpg');
INSERT INTO `file_hash` VALUES ('171', '23-243929623283e1906fc8b7df0adaf446f1e071a1', 'avatar/201603310325032331.jpg');
INSERT INTO `file_hash` VALUES ('172', '23-4cee7c1987aea8e404662787c342c4bebb78f345', 'avatar/201603310327032329.jpg');
INSERT INTO `file_hash` VALUES ('173', '-6555a81e595471d4900e69cff32f5177c0dcf5c5', 'avatar/2016033105350321.jpg');
INSERT INTO `file_hash` VALUES ('174', '-3405e3d58e9def59feab71f64e6505014ebf28ed', 'avatar/2016033106310339.jpg');
INSERT INTO `file_hash` VALUES ('175', '26-e7c0398f129d0100750736ba1cd91064e4851115', 'avatar/201603310639032681.jpg');
INSERT INTO `file_hash` VALUES ('176', '25-8c52e0bba5e52fbba66221650fe68878d3bba55e', 'avatar/201603310639032554.jpg');
INSERT INTO `file_hash` VALUES ('177', '27-a454a1991ea3d933d43a6b1c88de61a7e7e78d46', 'avatar/201603310640032718.jpg');
INSERT INTO `file_hash` VALUES ('178', '26-a0f18536b2924046c2e90a4550771774b9e2e0a6', 'avatar/20160331064503266.jpg');
INSERT INTO `file_hash` VALUES ('179', '47-c74bcd225281ba07f16c2ace43fec791c1f1dfe7', 'avatar/20160331065503475.jpg');
INSERT INTO `file_hash` VALUES ('180', '47-90439d881cd7a0be2e6941d881988777fa392440', 'avatar/201603310655034784.jpg');
INSERT INTO `file_hash` VALUES ('181', '47-ee95c4b7cd1f2472a1399d427362faec51447a3f', 'avatar/201603310657034747.jpg');
INSERT INTO `file_hash` VALUES ('182', '25-d7c0457974d9cb1a4bf1cc48ade03806f243a83a', 'avatar/201603310742032558.jpg');
INSERT INTO `file_hash` VALUES ('183', '47-1f093b30db4f4f5ff5ab0bb73ba0b14d4d3e99cf', 'avatar/201603310804034718.jpg');
INSERT INTO `file_hash` VALUES ('184', '23-86516ed96e5a63f43e7770a5d1ea45552f432f1a', 'avatar/201603310810032325.jpg');
INSERT INTO `file_hash` VALUES ('185', '23-611e34a520719b4055a6c6288efaa561998a14e8', 'avatar/201603310848032366.jpg');
INSERT INTO `file_hash` VALUES ('186', '23-622729b0a1793b8aef59149b0139a8e8c40a4bb8', 'avatar/201603310851032346.jpg');
INSERT INTO `file_hash` VALUES ('187', '25-0c6b3e236e542fb2376c59fd4054ac3311dcafac', 'album/201603310957032569.jpg');
INSERT INTO `file_hash` VALUES ('188', '30-1754ed8cd9bfa3a6f5f0ce5ad21d0aa7f118e0c0', 'album/201603310957033082.jpg');
INSERT INTO `file_hash` VALUES ('189', '47-b6e12fb5e86959afbb5556aff9b1aedc4825d530', 'avatar/201603311009034710.jpg');
INSERT INTO `file_hash` VALUES ('190', '23-19ace8b3cc5dab7f401f4862c4269c1cf223f892', 'avatar/201603311141032316.jpg');
INSERT INTO `file_hash` VALUES ('191', '26-833ed7c69af3b8547d5990a78cf5d15f38ca4c61', 'avatar/201603311148032665.jpg');
INSERT INTO `file_hash` VALUES ('192', '27-e19783d7a54a2d77bd9c6157a4d44e9fbedeae90', 'avatar/201603311154032782.jpg');
INSERT INTO `file_hash` VALUES ('193', '26-ff18be2f4389e723f829685597a484a19e2a227d', 'avatar/201604010122042638.jpg');
INSERT INTO `file_hash` VALUES ('194', '25-94927aab9f840e757328fbfea370c3774c009f17', 'album/201604010232042596.jpg');
INSERT INTO `file_hash` VALUES ('195', '23-e7427f1ab41096614e83f040c73e7442f60fed5f', 'operaCover/201604010232042340.jpg');
INSERT INTO `file_hash` VALUES ('196', '23-348bfcba0340a93229bbe19c9a751280c0fb3d63', 'operaCover/201604010244042350.jpg');
INSERT INTO `file_hash` VALUES ('197', '23-13d4389259b7555ef80d47eb0a97254bec482817', 'operaCover/201604010308042377.jpg');
INSERT INTO `file_hash` VALUES ('198', '23-faa91904cbd9e7f158a638fd6540197ede3126df', 'operaCover/201604010316042336.jpg');
INSERT INTO `file_hash` VALUES ('199', '27-11ff064b8b68132cabda806f5519895352ee5bf7', 'avatar/201604010318042761.jpg');
INSERT INTO `file_hash` VALUES ('200', '23-2b43e3797d53aced7ea76386afa06ac672240242', 'operaCover/201604010346042389.jpg');
INSERT INTO `file_hash` VALUES ('201', '45-7623b68733b9eba909cc9474d37aeb350fa1eb88', 'avatar/201604010810044523.jpg');
INSERT INTO `file_hash` VALUES ('202', '27-343ba50bb8d2fbfaa8bffbb4cfefde840350e142', 'avatar/201604011018042779.jpg');
INSERT INTO `file_hash` VALUES ('203', '27-fc82c3c304acf362bf68662c7a608c519448f7bb', 'avatar/201604011018042748.jpg');
INSERT INTO `file_hash` VALUES ('204', '37-19e202134bd821b84929c6b8c510fdb6fb908817', 'avatar/201604011026043765.jpg');
INSERT INTO `file_hash` VALUES ('205', '45-c9b09d49443ae76f384e4bd9279f78e985abe750', 'avatar/201604011030044547.jpg');
INSERT INTO `file_hash` VALUES ('206', '23-c50246c7bb11c7f7ed2b139a6f1c8d222f677551', 'album/201604011039042357.jpg');
INSERT INTO `file_hash` VALUES ('207', '23-057de38f82658701af3dd4aeb842b86f620483ba', 'album/201604011042042310.jpg');
INSERT INTO `file_hash` VALUES ('208', '27-e71b6b58946f54dfec7bdb08876609f97d18ed09', 'avatar/201604040341042796.jpg');
INSERT INTO `file_hash` VALUES ('209', '49-1e60a54a20ec8f2d2060668873053d20c0bc7816', 'avatar/201604050601044989.jpg');
INSERT INTO `file_hash` VALUES ('210', '26-08b39a241049e76b1669a2046c5b1d701b95f2f5', 'avatar/201604051027042634.jpg');
INSERT INTO `file_hash` VALUES ('211', '26-a563ea0f99c8ba3c48726065a98ce09a457475f6', 'avatar/201604051027042679.jpg');
INSERT INTO `file_hash` VALUES ('212', '3-e387d0febe32ace906fa7773882f20ae44048543', 'operaCover/20160405113404358.jpg');
INSERT INTO `file_hash` VALUES ('213', '3-20048fd7b293a61d83216549564f58665e983400', 'avatar/20160406011704361.jpg');
INSERT INTO `file_hash` VALUES ('214', '3-6b255cc3fa5e35ceede239aa69d5f4d0c10124e2', 'avatar/20160406011804395.jpg');
INSERT INTO `file_hash` VALUES ('215', '3-b9f3d0d9670d080ffea6894ff8fcc1df447e6603', 'avatar/20160406011804352.jpg');
INSERT INTO `file_hash` VALUES ('216', '3-513e689471c8a34d35e2a190cdcc1fd94140ff6b', 'avatar/20160406011904324.jpg');
INSERT INTO `file_hash` VALUES ('217', '37-9588a52362b21140e4a7a19ef256d3b25a1b2d51', 'operaCover/201604060137043746.jpg');
INSERT INTO `file_hash` VALUES ('218', '25-ac9af268ec0f42056e49f56c7fbe93f999847f1b', 'avatar/201604060201042566.jpg');
INSERT INTO `file_hash` VALUES ('219', '25-fa6c6bbcceac51c279ed43216994c9c04b92b7f0', 'operaCover/201604060203042550.jpg');
INSERT INTO `file_hash` VALUES ('220', '45-a1cd3b0de4976ab448dda23d4d7a81c019ad1a45', 'operaCover/201604060227044581.jpg');
INSERT INTO `file_hash` VALUES ('221', '45-53edf6ca09bf1b106b81293b476bf99e23c43969', 'operaCover/201604060230044585.jpg');
INSERT INTO `file_hash` VALUES ('222', '45-d3327f750ca5094f4f31bec3fc57d0439c43b63b', 'operaCover/201604060326044595.jpg');
INSERT INTO `file_hash` VALUES ('223', '25-aa3753d77114914b5941f85f198ff247358eb66e', 'operaCover/201604060348042574.jpg');
INSERT INTO `file_hash` VALUES ('224', '25-4c0d19601ce159bcf5a323d5118074454b035f8d', 'operaCover/201604060633042522.jpg');
INSERT INTO `file_hash` VALUES ('225', '25-3a0d1664e925740f009f9563f05dc56bf5e274b8', 'operaCover/201604060755042523.jpg');
INSERT INTO `file_hash` VALUES ('226', '-b89dbcf4d54dd157a1dfb8096a5db91697223fec', 'avatar/2016040603200422.jpg');
INSERT INTO `file_hash` VALUES ('227', '50-95867de6bd15707463df976523b155abae70b468', 'avatar/20160406033904503.jpg');
INSERT INTO `file_hash` VALUES ('228', '51-f2c656555dda3a922d6be77d4482ef4f83104ce8', 'avatar/201604070234045183.jpg');
INSERT INTO `file_hash` VALUES ('229', '50-b89dbcf4d54dd157a1dfb8096a5db91697223fec', 'avatar/201604070632045027.jpg');
INSERT INTO `file_hash` VALUES ('230', '51-b2f795816140736bd39e4656e55d649a0410cead', 'worksCover/201604071149045115.jpg');
INSERT INTO `file_hash` VALUES ('231', '51-8fcc0e4bed631123820d326d828ca419809b2199', 'worksCover/201604071151045191.jpg');
INSERT INTO `file_hash` VALUES ('232', '51-8102ac87d0bdb8f176b0170aa5ca12a92746db3f', 'album/201604071153045123.jpg');
INSERT INTO `file_hash` VALUES ('233', '51-a6ef91463aa0bbabb0c45e842a847d63745ead3c', 'album/201604071153045113.jpg');
INSERT INTO `file_hash` VALUES ('234', '51-ba986b6308a4809d0b118889c92fd3339a5c6800', 'album/20160407115304512.jpg');
INSERT INTO `file_hash` VALUES ('235', '26-5af9f1d6b9c44cd29d548c6db6f87fff18659822', 'operaCover/201604071128042632.jpg');
INSERT INTO `file_hash` VALUES ('236', '52-5597cc56b4fa47eec01debd256a9d77bb845c47a', 'avatar/201604080214045212.jpg');
INSERT INTO `file_hash` VALUES ('237', '49-e71b6b58946f54dfec7bdb08876609f97d18ed09', 'avatar/201604080302044973.jpg');
INSERT INTO `file_hash` VALUES ('238', '50-3cd9ed8822d9a2b8acd209683ff2be0d942c2fd4', 'avatar/201604080458045015.jpg');
INSERT INTO `file_hash` VALUES ('239', '39-630ca2a92cba3cbb0ff44d56a5057972c5be1009', 'avatar/201604080459043956.jpg');
INSERT INTO `file_hash` VALUES ('240', '39-43de10f77f3aa82d3d4b974a7063556c753f7b8d', 'avatar/201604080459043958.jpg');
INSERT INTO `file_hash` VALUES ('241', '49-9ac6e35148996873a95bd1277671ee06078cb7e3', 'operaCover/201604080720044971.jpg');
INSERT INTO `file_hash` VALUES ('242', '26-d028b88f4c1862bd2facb7fb7561b0c00adb6eac', 'worksCover/201604080810042614.jpg');
INSERT INTO `file_hash` VALUES ('243', '26-36732138d0bc9c4ef933e4a7c5606fae4098510b', 'album/201604080811042648.jpg');
INSERT INTO `file_hash` VALUES ('244', '26-b79daef6894a002dd1de47cbf6296a21fba8a97a', 'album/201604080811042632.jpg');
INSERT INTO `file_hash` VALUES ('245', '26-969c3ec44b5e5c8cdfb1f40e5881a7a814e9f3d9', 'album/201604080811042673.jpg');
INSERT INTO `file_hash` VALUES ('246', '26-9f528e98a7d2fc07a0e995206386d9961e6f95b5', 'album/201604080811042640.jpg');
INSERT INTO `file_hash` VALUES ('247', '26-3572deeffc050f9601a96c80c53cb9da839b4b9e', 'album/201604080811042638.jpg');
INSERT INTO `file_hash` VALUES ('248', '26-b5d4c4c781ef756b211f37a37159852dce68c29b', 'album/20160408081104266.jpg');
INSERT INTO `file_hash` VALUES ('249', '52-4c0d19601ce159bcf5a323d5118074454b035f8d', 'worksCover/20160408095004527.jpg');
INSERT INTO `file_hash` VALUES ('250', '52-7f65c2e4b81b196d803a67395c2bd767832af4d7', 'album/201604080951045254.jpg');
INSERT INTO `file_hash` VALUES ('251', '52-996bfd8698a1d04f7641b0df0cbbce1895a18eb9', 'album/201604080951045292.jpg');
INSERT INTO `file_hash` VALUES ('252', '52-7c5e59e20c40f210f5959f803670d6adbf93d35e', 'album/201604080952045271.jpg');
INSERT INTO `file_hash` VALUES ('253', '52-6af59527d7d9fc89efb58ec83c5c59a410f0fb97', 'album/201604080952045237.jpg');
INSERT INTO `file_hash` VALUES ('254', '52-017a81a7cb4a1381db9c186633881c2e6f592a80', 'album/201604080952045274.jpg');
INSERT INTO `file_hash` VALUES ('255', '52-545d321082f473dbe33505778185dacf19e244f5', 'worksCover/201604080954045241.jpg');
INSERT INTO `file_hash` VALUES ('256', '39-c44ef30c2ce3680e65b779e0584bd77702b618f4', 'operaCover/201604081018043998.jpg');
INSERT INTO `file_hash` VALUES ('257', '8-bfc7719a0993f80464f5a32454738c4e0fa8bab2', 'avatar/20160408014704829.jpg');
INSERT INTO `file_hash` VALUES ('258', '51-bc00cfc4a8d0b5997c207cdd1f2747ebc12f6331', 'operaCover/201604111215045119.jpg');
INSERT INTO `file_hash` VALUES ('259', '51-078846469e36824ec06b7f40a71fd185c7094d2c', 'operaCover/201604111220045120.jpg');
INSERT INTO `file_hash` VALUES ('260', '47-71c94be7d7d26405c7d30f7f23c5f666924c8286', 'album/201604110118044790.jpg');
INSERT INTO `file_hash` VALUES ('261', '47-80dd1c5edfad7a52c3e85c0aac4c507d9b56591a', 'album/201604110118044733.jpg');
INSERT INTO `file_hash` VALUES ('262', '47-0b9820fba15514759bc0de0caa57c7d961fc320b', 'worksCover/201604110118044752.jpg');
INSERT INTO `file_hash` VALUES ('263', '45-427d244be42853c7bfacc9b8ee82e23f24ba888e', 'operaCover/201604110146044517.jpg');
INSERT INTO `file_hash` VALUES ('264', '55-189fe319fdc3f13bca97548ccabbd3bc149e6d9c', 'avatar/201604110255045559.jpg');
INSERT INTO `file_hash` VALUES ('265', '54-9760b2312b67017b9e41977e117702415c194b04', 'avatar/201604110307045498.jpg');
INSERT INTO `file_hash` VALUES ('266', '44-224d436112b87fbdc2c03302e4999ca41df98694', 'avatar/201604110309044432.jpg');
INSERT INTO `file_hash` VALUES ('267', '37-371a33433581b545f79f31775b7f12b467d79549', 'operaCover/201604110359043762.jpg');
INSERT INTO `file_hash` VALUES ('268', '44-4f3031aa6811d9663c5e1817e1138a8d8fc65a6c', 'operaCover/201604110402044482.jpg');
INSERT INTO `file_hash` VALUES ('269', '23-cb17100b383b8ec51ab227af3bb0bbc21c2973ec', 'avatar/201604110436042315.jpg');
INSERT INTO `file_hash` VALUES ('270', '39-0dc306e8ea9c9567b5dfac97e0c501e8e77b963e', 'operaCover/20160411044004392.jpg');
INSERT INTO `file_hash` VALUES ('271', '23-d69335b6c889a57084a797080aa0106ce12d4d14', 'avatar/201604110530042370.jpg');
INSERT INTO `file_hash` VALUES ('272', '23-c84d4739344975ef144908c1a904eb04d9188c9a', 'avatar/20160411053204235.jpg');
INSERT INTO `file_hash` VALUES ('273', '57-0a3b9c0c4772e35a65f023533a683160319bf357', 'avatar/20160411062204578.jpg');
INSERT INTO `file_hash` VALUES ('274', '23-0b1b89217c216e423bfbc4f137c390e8514365c4', 'avatar/201604110639042337.jpg');
INSERT INTO `file_hash` VALUES ('275', '26-8b92e3417bbef849473d18455d5612067273ea8f', 'avatar/201604110649042693.jpg');
INSERT INTO `file_hash` VALUES ('276', '23-0b0d975ccfd6641cd2a180ab6d2873cf194251cc', 'avatar/201604110650042389.jpg');
INSERT INTO `file_hash` VALUES ('277', '23-043ee72f3766e349448a5acbb9c620c9e4a7434d', 'avatar/201604110728042340.jpg');
INSERT INTO `file_hash` VALUES ('278', '57-5597cc56b4fa47eec01debd256a9d77bb845c47a', 'operaCover/201604110730045730.jpg');
INSERT INTO `file_hash` VALUES ('279', '-243929623283e1906fc8b7df0adaf446f1e071a1', 'avatar/2016041107380491.jpg');
INSERT INTO `file_hash` VALUES ('280', '57-847cca520ac912142aa08caf50f37a3796d2e847', 'album/201604110818045770.jpg');
INSERT INTO `file_hash` VALUES ('281', '57-02caa3dfd58ea750a78ac6907a7c696ea2c91b36', 'album/201604110821045778.jpg');
INSERT INTO `file_hash` VALUES ('282', '-c9efdaf0a8430ea4ee489d105dcfa0e040d318c7', 'avatar/2016041109070464.jpg');
INSERT INTO `file_hash` VALUES ('283', '-622729b0a1793b8aef59149b0139a8e8c40a4bb8', 'avatar/2016041201330492.jpg');
INSERT INTO `file_hash` VALUES ('284', '63-9760b2312b67017b9e41977e117702415c194b04', 'avatar/201604120140046381.jpg');
INSERT INTO `file_hash` VALUES ('285', '63-e11c742a269a2a99a03a53576f5e36984880a9ab', 'avatar/201604120141046328.jpg');
INSERT INTO `file_hash` VALUES ('286', '49-4ff9bf84182ce19f03de8a86f5b9c7689f38846e', 'album/201604120349044979.jpg');
INSERT INTO `file_hash` VALUES ('287', '49-933e0b504467843cb87f69345faed094377260f8', 'album/20160412034904499.jpg');
INSERT INTO `file_hash` VALUES ('288', '37-29f29ec001526877a62ad24170ec7c3935283a82', 'operaCover/201604120352043717.jpg');
INSERT INTO `file_hash` VALUES ('289', '65-2fa417bf395461cb9f5ce42fc349d465ef963448', 'avatar/20160412061604652.jpg');
INSERT INTO `file_hash` VALUES ('290', '28-4962203b9fbb889080f7cf787b39a53de18b6fec', 'avatar/201604120645042864.jpg');
INSERT INTO `file_hash` VALUES ('291', '66-43de10f77f3aa82d3d4b974a7063556c753f7b8d', 'avatar/201604120756046690.jpg');
INSERT INTO `file_hash` VALUES ('292', '37-d69d490577fd77a0dbfe5bdc92ec28c4d8d2c08a', 'avatar/201604120819043752.jpg');
INSERT INTO `file_hash` VALUES ('293', '30-58b04ac7a93756af814eda82e8f341dccf26b89c', 'operaCover/201604120914043041.jpg');
INSERT INTO `file_hash` VALUES ('294', '-af96d2878f29a7718df819808930fe9691daae9a', 'avatar/2016041303460476.jpg');
INSERT INTO `file_hash` VALUES ('295', '69-59f1921b3e089ab46938fb163408aafb927eefde', 'avatar/201604130354046970.jpg');
INSERT INTO `file_hash` VALUES ('296', '69-f1d540d6bdc1355457bb5e614e1addc469e25bf8', 'avatar/201604130355046931.jpg');
INSERT INTO `file_hash` VALUES ('297', '-89780e0acc6ee9e0703b43331c8d92f46760bd14', 'avatar/2016041304320482.jpg');
INSERT INTO `file_hash` VALUES ('298', '71-90d66947b573a4ca6e5485fe12c57287b897f2f9', 'avatar/201604130434047139.jpg');
INSERT INTO `file_hash` VALUES ('299', '71-22755b0e4109292054179339a7fd44de93b360b6', 'avatar/201604130454047185.jpg');
INSERT INTO `file_hash` VALUES ('300', '71-7a03ecb6e31539afd213209293ada4a0351d9fdb', 'avatar/201604130455047139.jpg');
INSERT INTO `file_hash` VALUES ('301', '71-ceca2145eaf1a607ce1892649267b927587c4422', 'operaCover/201604130602047143.jpg');
INSERT INTO `file_hash` VALUES ('302', '45-cc2ca710c65574f5c1162e8dc9b87c9aae96a475', 'worksCover/201604130700044561.jpg');
INSERT INTO `file_hash` VALUES ('303', '45-e83962dbbe4bb171c17c73e196b60e5b217e0792', 'album/201604130700044583.jpg');
INSERT INTO `file_hash` VALUES ('304', '45-1f78a0ef71718f3da2b93edfe013851188db7ab3', 'album/201604130700044553.jpg');
INSERT INTO `file_hash` VALUES ('305', '45-48fd19f7d6b1da7fcbdeb09e3174b347a9d413d9', 'album/201604130700044550.jpg');
INSERT INTO `file_hash` VALUES ('306', '45-2d28627585926b4fc4b3dcf964fa6b98473ae39b', 'album/201604130700044546.jpg');
INSERT INTO `file_hash` VALUES ('307', '45-f720cfcfb4ea8c1adbedcf91ed3de71e3a81eba8', 'album/201604130700044595.jpg');
INSERT INTO `file_hash` VALUES ('308', '57-2ad701840ea3681eb96af6f945ff86507c4e0c33', 'worksCover/201604130705045776.jpg');
INSERT INTO `file_hash` VALUES ('309', '29-7bce0d4989b29296c90e8cdb0bfd9e0d23359c95', 'worksCover/201604130841042914.jpg');
INSERT INTO `file_hash` VALUES ('310', '45-e66d9729949f8347e88b2cf51e56704ade3df0f0', 'album/201604130841044510.jpg');
INSERT INTO `file_hash` VALUES ('311', '45-798aa948d401adca62bdfe2812cbf9f64e9fa4be', 'album/20160413084104451.jpg');
INSERT INTO `file_hash` VALUES ('312', '29-fb0836c681b8e65202db3b0fc5befb47b1af96db', 'album/201604130842042955.jpg');
INSERT INTO `file_hash` VALUES ('313', '29-ea43096b675d7a00043722d71d1daaa4740670e4', 'album/20160413084204294.jpg');
INSERT INTO `file_hash` VALUES ('314', '29-10a75a9618225be8ea3a8dfaf683bdd7f1cb50f1', 'album/201604130850042957.jpg');
INSERT INTO `file_hash` VALUES ('315', '49-ea45e7c4e0852ac1a548e021deb756a2de972abe', 'album/201604130903044926.jpg');
INSERT INTO `file_hash` VALUES ('316', '49-5509ddb20b0e930e80ae944e4691350fffcf84c6', 'album/201604130903044977.jpg');
INSERT INTO `file_hash` VALUES ('317', '49-6d9a13f916c3b7ec73fe50b6c78fb8dab36128f9', 'album/201604130903044973.jpg');
INSERT INTO `file_hash` VALUES ('318', '73-86516ed96e5a63f43e7770a5d1ea45552f432f1a', 'avatar/201604140200047399.jpg');
INSERT INTO `file_hash` VALUES ('319', '45-3a86e1df951ffe33d920327af5df160245932e2f', 'operaCover/201604140301044549.jpg');
INSERT INTO `file_hash` VALUES ('320', '73-a5b72880af15d7148bf80117a7a2b5fff677ce98', 'worksCover/201604140356047329.jpg');
INSERT INTO `file_hash` VALUES ('321', '73-13d4389259b7555ef80d47eb0a97254bec482817', 'worksCover/201604140400047322.jpg');
INSERT INTO `file_hash` VALUES ('322', '73-057de38f82658701af3dd4aeb842b86f620483ba', 'worksCover/201604140440047379.jpg');
INSERT INTO `file_hash` VALUES ('323', '73-618638e04ea7b5bfc82cf6c05c6f6eedcab4a914', 'album/201604140500047399.jpg');
INSERT INTO `file_hash` VALUES ('324', '73-faa91904cbd9e7f158a638fd6540197ede3126df', 'album/201604140500047351.jpg');
INSERT INTO `file_hash` VALUES ('325', '73-42462119d895a5cda90843556eab903c6f42dcb8', 'worksCover/201604140503047383.jpg');
INSERT INTO `file_hash` VALUES ('326', '57-65c1edf1ebf32bceb65b336fef8471e5a142ea82', 'operaCover/201604140606045764.jpg');
INSERT INTO `file_hash` VALUES ('327', '71-da39a3ee5e6b4b0d3255bfef95601890afd80709', 'avatar/201604141034047151.jpg');
INSERT INTO `file_hash` VALUES ('328', '71-f90bbf6aef2c839273b125d1be106203bad988d1', 'avatar/201604141048047191.jpg');
INSERT INTO `file_hash` VALUES ('329', '71-b74562633d93f2d27e73f10f10665ebe08567825', 'avatar/20160414105704714.jpg');
INSERT INTO `file_hash` VALUES ('330', '71-cd6bd48abab4027aace5d47cb80c565a6a2660eb', 'avatar/201604141059047122.jpg');
INSERT INTO `file_hash` VALUES ('331', '71-a85cb63e64755997b30b046f24a43b5349c0ac85', 'avatar/201604141101047184.jpg');
INSERT INTO `file_hash` VALUES ('332', '71-8dff58f03b5cc98003c98e991da3e4c8bdefe0f9', 'avatar/201604141102047121.jpg');
INSERT INTO `file_hash` VALUES ('333', '71-e2a64401a7a196b15c354cc289816d4d47c51d30', 'avatar/201604141103047155.jpg');
INSERT INTO `file_hash` VALUES ('334', '71-b61d865a34e3df27961ffbc5f1fd5fd0ceb9ee02', 'avatar/201604141134047151.jpg');
INSERT INTO `file_hash` VALUES ('335', '71-c9e6a3e71fccd6c07adeeba1faf3e92250a8b55b', 'avatar/20160414113604716.jpg');
INSERT INTO `file_hash` VALUES ('336', '71-96ec825411a281ef21d59437fe0ace2fb98e7a41', 'avatar/201604141140047121.jpg');
INSERT INTO `file_hash` VALUES ('337', '71-fd626e73ae7e5a941223e5dcea8c220f623209c0', 'avatar/20160414114204713.jpg');
INSERT INTO `file_hash` VALUES ('338', '71-7f62d7452911ca9682f8bbd57e035b52213de777', 'avatar/201604141145047113.jpg');
INSERT INTO `file_hash` VALUES ('339', '71-ef7695408b11f8e581541eef32591817e141ccf7', 'avatar/201604141152047191.jpg');
INSERT INTO `file_hash` VALUES ('340', '71-043f72ae61d872adcba819aca33b724357802553', 'avatar/201604141154047159.jpg');
INSERT INTO `file_hash` VALUES ('341', '37-4552cc4db66fb6c3d1f871fe7c1970b35924f4b0', 'avatar/201604150613043754.jpg');
INSERT INTO `file_hash` VALUES ('342', '29-141ad045891a52459918f1623fb7fb88db75861a', 'operaCover/201604150750042937.jpg');
INSERT INTO `file_hash` VALUES ('343', '73-9dc7b60c651766addd7a855ecfe7950c86b15f7b', 'operaCover/201604160245047348.jpg');
INSERT INTO `file_hash` VALUES ('344', '73-60e30dbd561d1e6ac0eb91201d6936018c3a88b3', 'operaCover/201604160252047393.jpg');
INSERT INTO `file_hash` VALUES ('345', '73-21aed9e3d2e9d02fbd7ea880011b7972ec185da6', 'operaCover/201604160259047360.jpg');
INSERT INTO `file_hash` VALUES ('346', '73-5b4103fce20e7cb9f935ddba3b80aa2907e6a46e', 'operaCover/201604160303047366.jpg');
INSERT INTO `file_hash` VALUES ('347', '73-4df0ecfec3e5acb23ce178b5268c19c7f9ce4385', 'avatar/201604160309047323.jpg');
INSERT INTO `file_hash` VALUES ('348', '53-66116875d697e66316fd6c59fff46ec469304880', 'operaCover/20160417050404535.jpg');
INSERT INTO `file_hash` VALUES ('349', '37-85c8838970c9342cf3c3e6d6053eb2888ab8fb74', 'worksCover/20160417072804373.jpg');
INSERT INTO `file_hash` VALUES ('350', '37-bfc63cc01c52b1a42e9923283e14fa57e1a2a4d9', 'worksCover/201604170729043797.jpg');
INSERT INTO `file_hash` VALUES ('351', '37-851da403716ebac346e1965fe44ba2b471674738', 'worksCover/201604170735043729.jpg');
INSERT INTO `file_hash` VALUES ('352', '37-4fd78417b8f70d47b98c52b59e6e9d07cc30e18b', 'operaCover/201604170738043787.jpg');
INSERT INTO `file_hash` VALUES ('353', '45-317fae62ad5c5bac98c7305df109f8ca19b0d494', 'operaCover/201604170921044522.jpg');
INSERT INTO `file_hash` VALUES ('354', '23-94d12909d148c3c02ea8a7c91b7c3acab6abd4c7', 'album/201604180148042360.jpg');
INSERT INTO `file_hash` VALUES ('355', '23-44d2c4d7a13916b4cacbc662fd11b2903e3c7deb', 'album/201604180148042389.jpg');
INSERT INTO `file_hash` VALUES ('356', '23-e973252c64aaa9e2a43614a3f98bc99114febb6b', 'album/201604180148042384.jpg');
INSERT INTO `file_hash` VALUES ('357', '23-76fdab3a392498def07859bdd42d4bb0638c4e12', 'album/201604180148042386.jpg');
INSERT INTO `file_hash` VALUES ('358', '23-8905035ad4958123058ba0008a1b322160ca2027', 'worksCover/201604180149042343.jpg');
INSERT INTO `file_hash` VALUES ('359', '45-fe00074664cd88faca973302d77d041e9fc6801c', 'worksCover/201604180201044525.jpg');
INSERT INTO `file_hash` VALUES ('360', '23-1b309d8724df4716b1e4e9fe281574c8d9cf9de9', 'worksCover/201604180207042369.jpg');
INSERT INTO `file_hash` VALUES ('361', '23-80c35ca3b73878ef85b5a7c3ab7312d14d78e8b6', 'album/201604180208042313.jpg');
INSERT INTO `file_hash` VALUES ('362', '23-d9a6b45792d2dd0999ef9739cd789eb8ccca9c31', 'album/201604180208042353.jpg');
INSERT INTO `file_hash` VALUES ('363', '23-9ceb6e62bbffc56c785b5a254a833deb2d45a5e4', 'album/201604180208042365.jpg');
INSERT INTO `file_hash` VALUES ('364', '23-a36b2b5434381390a58187126a8b99e24c443583', 'album/20160418020804232.jpg');
INSERT INTO `file_hash` VALUES ('365', '23-da653447b05d2936c48b0961299d4421e78ee2af', 'avatar/201604180210042379.jpg');
INSERT INTO `file_hash` VALUES ('366', '45-1f21f22142eda4379893b9ed448412c1bfd62ec4', 'album/201604180211044542.jpg');
INSERT INTO `file_hash` VALUES ('367', '45-e9cf713989aab8f738c04f8aaad60585fb2e3909', 'album/201604180211044524.jpg');
INSERT INTO `file_hash` VALUES ('368', '45-1fa956b451f6fa8a5d78198aa9a5caba322d3be2', 'album/201604180211044556.jpg');
INSERT INTO `file_hash` VALUES ('369', '45-b44a3a7329960607ffc2f90f144c31feed8e2202', 'album/201604180211044527.jpg');
INSERT INTO `file_hash` VALUES ('370', '45-0c016a1293aa37a3be3eef4d7123d4887f31cdb6', 'album/201604180211044583.jpg');
INSERT INTO `file_hash` VALUES ('371', '45-29191249857d8eca9776b04a91faabd36b65d3e3', 'album/201604180211044536.jpg');
INSERT INTO `file_hash` VALUES ('372', '26-bb6a5f218e04d79c573f200d0fb6721e87124d71', 'worksCover/201604181201042655.jpg');
INSERT INTO `file_hash` VALUES ('373', '73-d6965ae874a1e56f469bcecce7dbde5f3574dd96', 'operaCover/201604180156047364.jpg');
INSERT INTO `file_hash` VALUES ('374', '57-92086258ba52732d76c007b334d6ab9e65716535', 'avatar/201604180508045717.jpg');
INSERT INTO `file_hash` VALUES ('375', '74-7c5f41ee3779aaba1f5a98f42e596fb27aec95ec', 'avatar/201604180533047420.jpg');
INSERT INTO `file_hash` VALUES ('376', '75-19ace8b3cc5dab7f401f4862c4269c1cf223f892', 'avatar/201604180545047539.jpg');
INSERT INTO `file_hash` VALUES ('377', '49-3335e869cde0521bfdf60490207f456e98c46c3a', 'operaCover/201604180657044928.jpg');
INSERT INTO `file_hash` VALUES ('378', '75-52d9a6ffa22294a94ccb385bd8310ff255c0792b', 'operaCover/201604180739047582.jpg');
INSERT INTO `file_hash` VALUES ('379', '49-fc82c3c304acf362bf68662c7a608c519448f7bb', 'avatar/201604191018044933.jpg');
INSERT INTO `file_hash` VALUES ('380', '23-eb5601d8572c5f1d97f6951ad4443d06a2954fe4', 'album/201604191101042363.jpg');
INSERT INTO `file_hash` VALUES ('381', '23-318280d74061ba9e8af8bff45eab02bd33695725', 'album/201604191101042347.jpg');
INSERT INTO `file_hash` VALUES ('382', '23-f78f01005b7db200e00cc6ce652ebef21d75e134', 'album/201604191101042383.jpg');
INSERT INTO `file_hash` VALUES ('383', '23-3939fbf36ecd55610ccf88b8262a601f1fd75c97', 'album/201604191101042311.jpg');
INSERT INTO `file_hash` VALUES ('384', '75-8f338ad4abe6f6fbb006e2f79e6929e530e7bf97', 'worksCover/201604191140047594.jpg');
INSERT INTO `file_hash` VALUES ('385', '75-f78f01005b7db200e00cc6ce652ebef21d75e134', 'album/201604191141047596.jpg');
INSERT INTO `file_hash` VALUES ('386', '75-62daf038ff12fc401d2ed2d9698e4807630938f3', 'worksCover/201604191156047573.jpg');
INSERT INTO `file_hash` VALUES ('387', '75-74e7f5d58fe2a0f49ebdcb8090181c96d76f30a6', 'album/201604191157047519.jpg');
INSERT INTO `file_hash` VALUES ('388', '75-2c23494c48625a05eb0a8ed8cc9819608e943d58', 'album/201604190135047588.jpg');
INSERT INTO `file_hash` VALUES ('389', '75-318280d74061ba9e8af8bff45eab02bd33695725', 'album/201604190135047551.jpg');
INSERT INTO `file_hash` VALUES ('390', '75-eb5601d8572c5f1d97f6951ad4443d06a2954fe4', 'album/201604190141047597.jpg');
INSERT INTO `file_hash` VALUES ('391', '75-57c6d64a595e42788450d8a8eaee07df07f87881', 'album/201604190141047542.jpg');
INSERT INTO `file_hash` VALUES ('392', '75-3939fbf36ecd55610ccf88b8262a601f1fd75c97', 'album/20160419014104753.jpg');
INSERT INTO `file_hash` VALUES ('393', '75-9d0d64bd33a047485cc873e7ad43709760756576', 'album/201604190144047526.jpg');
INSERT INTO `file_hash` VALUES ('394', '75-2d4a19e733af354f536e1374cb0f04b5cde1946c', 'album/201604190144047534.jpg');
INSERT INTO `file_hash` VALUES ('395', '57-b7c06b89c9ed75d33ce4516c12461b529d6103db', 'operaCover/201604190203045784.jpg');
INSERT INTO `file_hash` VALUES ('396', '57-b7a672023dbbbfc1f6d49f385f2ff51ec2c03c65', 'avatar/201604190223045711.jpg');
INSERT INTO `file_hash` VALUES ('397', '57-d61ddfed3045f0932a63af104f301284fb0e2048', 'worksCover/201604190225045776.jpg');
INSERT INTO `file_hash` VALUES ('398', '26-190c1efa248926cfb4ea0fe3ca1115a7016a2042', 'operaCover/201604190249042699.jpg');
INSERT INTO `file_hash` VALUES ('399', '49-87e617e196e9d02cc84723ef4776e20803b6a956', 'operaCover/201604190258044965.jpg');
INSERT INTO `file_hash` VALUES ('400', '71-55de84257c919e6e0fe72f33fc3eac01350b9590', 'operaCover/201604190301047144.jpg');

-- ----------------------------
-- Table structure for hot_search
-- ----------------------------
DROP TABLE IF EXISTS `hot_search`;
CREATE TABLE `hot_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `count` smallint(4) NOT NULL DEFAULT '1',
  `updTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of hot_search
-- ----------------------------
INSERT INTO `hot_search` VALUES ('1', '搜', '0', '6', '1459849078');
INSERT INTO `hot_search` VALUES ('2', '搜x', '0', '2', '1459850341');
INSERT INTO `hot_search` VALUES ('3', '男', '0', '22', '1459850401');
INSERT INTO `hot_search` VALUES ('4', '女', '0', '11', '1459850914');
INSERT INTO `hot_search` VALUES ('5', '女配', '0', '9', '1459855810');
INSERT INTO `hot_search` VALUES ('6', '男配', '0', '11', '1459855823');
INSERT INTO `hot_search` VALUES ('7', 'd', '0', '49', '1459856116');
INSERT INTO `hot_search` VALUES ('8', 'da', '0', '26', '1459856117');
INSERT INTO `hot_search` VALUES ('9', 'dan', '0', '1', '1459856117');
INSERT INTO `hot_search` VALUES ('10', 'dana', '0', '1', '1459856117');
INSERT INTO `hot_search` VALUES ('11', 'dan a', '0', '1', '1459856117');
INSERT INTO `hot_search` VALUES ('12', 'dan ao', '0', '1', '1459856117');
INSERT INTO `hot_search` VALUES ('13', 'da nao', '0', '1', '1459856117');
INSERT INTO `hot_search` VALUES ('14', '大闹', '0', '3', '1459856118');
INSERT INTO `hot_search` VALUES ('15', '大闹天空', '0', '1', '1459856119');
INSERT INTO `hot_search` VALUES ('16', '大闹天空', '0', '1', '1459856119');
INSERT INTO `hot_search` VALUES ('17', '大闹天', '0', '2', '1459856119');
INSERT INTO `hot_search` VALUES ('18', '大', '0', '35', '1459856728');
INSERT INTO `hot_search` VALUES ('19', 'X', '0', '6', '1459856760');
INSERT INTO `hot_search` VALUES ('20', 'Xx', '0', '1', '1459856760');
INSERT INTO `hot_search` VALUES ('21', 'Xxx', '0', '1', '1459856761');
INSERT INTO `hot_search` VALUES ('22', 'z', '0', '11', '1459856820');
INSERT INTO `hot_search` VALUES ('23', 'z c', '0', '4', '1459856820');
INSERT INTO `hot_search` VALUES ('24', 'z c r', '0', '4', '1459856820');
INSERT INTO `hot_search` VALUES ('25', '主持人', '0', '8', '1459856821');
INSERT INTO `hot_search` VALUES ('26', 's', '0', '11', '1459904467');
INSERT INTO `hot_search` VALUES ('27', 'sa', '0', '2', '1459904467');
INSERT INTO `hot_search` VALUES ('28', 'h', '0', '21', '1459909184');
INSERT INTO `hot_search` VALUES ('29', 'ha', '0', '1', '1459909184');
INSERT INTO `hot_search` VALUES ('30', 'ha h', '0', '1', '1459909185');
INSERT INTO `hot_search` VALUES ('31', '哈哈', '0', '2', '1459909185');
INSERT INTO `hot_search` VALUES ('32', '哈', '0', '1', '1459909187');
INSERT INTO `hot_search` VALUES ('33', 'n', '0', '26', '1459909188');
INSERT INTO `hot_search` VALUES ('34', 'na', '0', '17', '1459909188');
INSERT INTO `hot_search` VALUES ('35', 'nan', '0', '16', '1459909189');
INSERT INTO `hot_search` VALUES ('36', 'nan z', '0', '1', '1459909189');
INSERT INTO `hot_search` VALUES ('37', 'nan zh', '0', '1', '1459909189');
INSERT INTO `hot_search` VALUES ('38', 'nan zhu', '0', '1', '1459909189');
INSERT INTO `hot_search` VALUES ('39', '男主', '0', '2', '1459909190');
INSERT INTO `hot_search` VALUES ('40', 'nan p', '0', '1', '1459909194');
INSERT INTO `hot_search` VALUES ('41', 'nan pe', '0', '1', '1459909195');
INSERT INTO `hot_search` VALUES ('42', 'nan p e', '0', '1', '1459909195');
INSERT INTO `hot_search` VALUES ('43', 'nan p ei', '0', '1', '1459909195');
INSERT INTO `hot_search` VALUES ('44', 'nan pei', '0', '1', '1459909195');
INSERT INTO `hot_search` VALUES ('45', 'w', '0', '16', '1459912817');
INSERT INTO `hot_search` VALUES ('46', 'wa', '0', '6', '1459912826');
INSERT INTO `hot_search` VALUES ('47', 'wang', '0', '5', '1459912826');
INSERT INTO `hot_search` VALUES ('48', 'wan', '0', '6', '1459912826');
INSERT INTO `hot_search` VALUES ('49', '王', '0', '7', '1459912826');
INSERT INTO `hot_search` VALUES ('50', '王', '0', '1', '1459912826');
INSERT INTO `hot_search` VALUES ('51', 'q', '0', '10', '1459912862');
INSERT INTO `hot_search` VALUES ('52', 'q q', '0', '1', '1459912862');
INSERT INTO `hot_search` VALUES ('53', 'q q q', '0', '2', '1459912862');
INSERT INTO `hot_search` VALUES ('54', 'q q q q', '0', '1', '1459912863');
INSERT INTO `hot_search` VALUES ('55', 'qqq', '0', '4', '1459912863');
INSERT INTO `hot_search` VALUES ('56', 'qqql', '0', '1', '1459912864');
INSERT INTO `hot_search` VALUES ('57', 'qq', '0', '3', '1459912864');
INSERT INTO `hot_search` VALUES ('58', 'zh', '0', '4', '1459955042');
INSERT INTO `hot_search` VALUES ('59', 'zhu', '0', '2', '1459955042');
INSERT INTO `hot_search` VALUES ('60', '主', '0', '2', '1459955043');
INSERT INTO `hot_search` VALUES ('61', '主', '0', '1', '1459955043');
INSERT INTO `hot_search` VALUES ('62', 'zhi', '0', '1', '1459955089');
INSERT INTO `hot_search` VALUES ('63', 'zhi x', '0', '1', '1459955089');
INSERT INTO `hot_search` VALUES ('64', '执行', '0', '1', '1459955090');
INSERT INTO `hot_search` VALUES ('65', '执行', '0', '1', '1459955090');
INSERT INTO `hot_search` VALUES ('66', '执', '0', '1', '1459955091');
INSERT INTO `hot_search` VALUES ('67', 'dao', '0', '9', '1459955104');
INSERT INTO `hot_search` VALUES ('68', '导', '0', '1', '1459955106');
INSERT INTO `hot_search` VALUES ('69', '导', '0', '1', '1459955106');
INSERT INTO `hot_search` VALUES ('70', '芈月', '0', '1', '1459955148');
INSERT INTO `hot_search` VALUES ('71', '芈', '0', '1', '1459955149');
INSERT INTO `hot_search` VALUES ('72', 'zhua', '0', '1', '1459955151');
INSERT INTO `hot_search` VALUES ('73', 'zhuan', '0', '1', '1459955152');
INSERT INTO `hot_search` VALUES ('74', '传', '0', '1', '1459955154');
INSERT INTO `hot_search` VALUES ('75', '传', '0', '1', '1459955154');
INSERT INTO `hot_search` VALUES ('76', 'ni', '0', '2', '1459956048');
INSERT INTO `hot_search` VALUES ('77', '你', '0', '4', '1459956048');
INSERT INTO `hot_search` VALUES ('78', '你', '0', '1', '1459956048');
INSERT INTO `hot_search` VALUES ('79', '你c', '0', '1', '1459956049');
INSERT INTO `hot_search` VALUES ('80', '你ca', '0', '1', '1459956050');
INSERT INTO `hot_search` VALUES ('81', '你cai', '0', '1', '1459956050');
INSERT INTO `hot_search` VALUES ('82', '你猜', '0', '2', '1459956050');
INSERT INTO `hot_search` VALUES ('83', 'hu', '0', '2', '1459956174');
INSERT INTO `hot_search` VALUES ('84', 'hua', '0', '2', '1459956174');
INSERT INTO `hot_search` VALUES ('85', '花', '0', '5', '1459956174');
INSERT INTO `hot_search` VALUES ('86', '花', '0', '1', '1459956174');
INSERT INTO `hot_search` VALUES ('87', '花q', '0', '2', '1459956175');
INSERT INTO `hot_search` VALUES ('88', '花qi', '0', '2', '1459956176');
INSERT INTO `hot_search` VALUES ('89', '花qi a', '0', '2', '1459956176');
INSERT INTO `hot_search` VALUES ('90', '花qia', '0', '2', '1459956176');
INSERT INTO `hot_search` VALUES ('91', '花qi an', '0', '2', '1459956176');
INSERT INTO `hot_search` VALUES ('92', '花qian', '0', '2', '1459956176');
INSERT INTO `hot_search` VALUES ('93', '花qiang', '0', '2', '1459956177');
INSERT INTO `hot_search` VALUES ('94', '花qiangu', '0', '2', '1459956177');
INSERT INTO `hot_search` VALUES ('95', '花qian gu', '0', '2', '1459956177');
INSERT INTO `hot_search` VALUES ('96', '花千骨', '0', '3', '1459956177');
INSERT INTO `hot_search` VALUES ('97', '花千骨', '0', '1', '1459956177');
INSERT INTO `hot_search` VALUES ('98', 'sh', '0', '1', '1459959723');
INSERT INTO `hot_search` VALUES ('99', 'shi', '0', '1', '1459959723');
INSERT INTO `hot_search` VALUES ('100', 'shi x', '0', '1', '1459959723');
INSERT INTO `hot_search` VALUES ('101', '实习', '0', '2', '1459959725');
INSERT INTO `hot_search` VALUES ('102', '实习s', '0', '1', '1459959728');
INSERT INTO `hot_search` VALUES ('103', '实习sh', '0', '1', '1459959728');
INSERT INTO `hot_search` VALUES ('104', '实习she', '0', '1', '1459959729');
INSERT INTO `hot_search` VALUES ('105', '实习shen', '0', '1', '1459959729');
INSERT INTO `hot_search` VALUES ('106', '实习sheng', '0', '1', '1459959729');
INSERT INTO `hot_search` VALUES ('107', '实习生', '0', '11', '1459959730');
INSERT INTO `hot_search` VALUES ('108', '实习生', '0', '1', '1459959730');
INSERT INTO `hot_search` VALUES ('109', 's x', '0', '5', '1459959741');
INSERT INTO `hot_search` VALUES ('110', 's x s', '0', '5', '1459959741');
INSERT INTO `hot_search` VALUES ('111', '我', '0', '9', '1459999948');
INSERT INTO `hot_search` VALUES ('112', '我们', '0', '1', '1459999950');
INSERT INTO `hot_search` VALUES ('113', '我们', '0', '1', '1459999950');
INSERT INTO `hot_search` VALUES ('114', '主持', '0', '1', '1460044707');
INSERT INTO `hot_search` VALUES ('115', 'nv', '0', '5', '1460044714');
INSERT INTO `hot_search` VALUES ('116', 'f', '0', '2', '1460044806');
INSERT INTO `hot_search` VALUES ('117', 'fe', '0', '1', '1460044806');
INSERT INTO `hot_search` VALUES ('118', 'fen', '0', '1', '1460044806');
INSERT INTO `hot_search` VALUES ('119', 'feng', '0', '1', '1460044806');
INSERT INTO `hot_search` VALUES ('120', '疯', '0', '1', '1460044807');
INSERT INTO `hot_search` VALUES ('121', '疯', '0', '1', '1460044807');
INSERT INTO `hot_search` VALUES ('122', '疯k', '0', '1', '1460044808');
INSERT INTO `hot_search` VALUES ('123', '疯ku', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('124', '疯ku a', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('125', '疯kua', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('126', '疯ku an', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('127', '疯kuan', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('128', '疯kuang', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('129', '疯狂', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('130', '疯狂', '0', '1', '1460044809');
INSERT INTO `hot_search` VALUES ('131', 'e', '0', '1', '1460044887');
INSERT INTO `hot_search` VALUES ('132', 'er', '0', '1', '1460044887');
INSERT INTO `hot_search` VALUES ('133', '儿', '0', '2', '1460044887');
INSERT INTO `hot_search` VALUES ('134', 't', '0', '23', '1460044895');
INSERT INTO `hot_search` VALUES ('135', 'to', '0', '1', '1460044895');
INSERT INTO `hot_search` VALUES ('136', 'ton', '0', '1', '1460044895');
INSERT INTO `hot_search` VALUES ('137', 'tong', '0', '1', '1460044895');
INSERT INTO `hot_search` VALUES ('138', '童', '0', '2', '1460044896');
INSERT INTO `hot_search` VALUES ('139', 'r', '0', '1', '1460044902');
INSERT INTO `hot_search` VALUES ('140', 're', '0', '1', '1460044903');
INSERT INTO `hot_search` VALUES ('141', 'ren', '0', '1', '1460044903');
INSERT INTO `hot_search` VALUES ('142', '人', '0', '1', '1460044903');
INSERT INTO `hot_search` VALUES ('143', '人', '0', '1', '1460044903');
INSERT INTO `hot_search` VALUES ('144', 'c', '0', '20', '1460044917');
INSERT INTO `hot_search` VALUES ('145', 'ch', '0', '8', '1460044917');
INSERT INTO `hot_search` VALUES ('146', 'chi', '0', '1', '1460044917');
INSERT INTO `hot_search` VALUES ('147', '池', '0', '2', '1460044918');
INSERT INTO `hot_search` VALUES ('148', 'xi', '0', '5', '1460044925');
INSERT INTO `hot_search` VALUES ('149', 'xia', '0', '4', '1460044925');
INSERT INTO `hot_search` VALUES ('150', 'xian', '0', '2', '1460044925');
INSERT INTO `hot_search` VALUES ('151', 'xiang', '0', '2', '1460044926');
INSERT INTO `hot_search` VALUES ('152', 'xiang c', '0', '2', '1460044926');
INSERT INTO `hot_search` VALUES ('153', '乡村', '0', '6', '1460044927');
INSERT INTO `hot_search` VALUES ('154', '乡', '0', '1', '1460044927');
INSERT INTO `hot_search` VALUES ('155', '乡c', '0', '1', '1460044930');
INSERT INTO `hot_search` VALUES ('156', '乡cu', '0', '1', '1460044931');
INSERT INTO `hot_search` VALUES ('157', '乡cun', '0', '1', '1460044931');
INSERT INTO `hot_search` VALUES ('158', 'b', '0', '10', '1460044939');
INSERT INTO `hot_search` VALUES ('159', 'ba', '0', '3', '1460044939');
INSERT INTO `hot_search` VALUES ('160', 'bai', '0', '3', '1460044939');
INSERT INTO `hot_search` VALUES ('161', '白', '0', '2', '1460044940');
INSERT INTO `hot_search` VALUES ('162', 'du', '0', '1', '1460044944');
INSERT INTO `hot_search` VALUES ('163', 'dui', '0', '1', '1460044944');
INSERT INTO `hot_search` VALUES ('164', 'dui b', '0', '1', '1460044944');
INSERT INTO `hot_search` VALUES ('165', 'dui ba', '0', '1', '1460044945');
INSERT INTO `hot_search` VALUES ('166', 'dui bai', '0', '1', '1460044946');
INSERT INTO `hot_search` VALUES ('167', '对白', '0', '1', '1460044946');
INSERT INTO `hot_search` VALUES ('168', '对白', '0', '1', '1460044946');
INSERT INTO `hot_search` VALUES ('169', 'l', '0', '10', '1460044953');
INSERT INTO `hot_search` VALUES ('170', 'li', '0', '4', '1460044953');
INSERT INTO `hot_search` VALUES ('171', 'li s', '0', '1', '1460044953');
INSERT INTO `hot_search` VALUES ('172', '历史', '0', '2', '1460044954');
INSERT INTO `hot_search` VALUES ('173', 'h x', '0', '1', '1460100410');
INSERT INTO `hot_search` VALUES ('174', 'h x m', '0', '1', '1460100411');
INSERT INTO `hot_search` VALUES ('175', '黄晓明', '0', '1', '1460100412');
INSERT INTO `hot_search` VALUES ('176', '黄晓明', '0', '1', '1460100412');
INSERT INTO `hot_search` VALUES ('177', 'm', '0', '13', '1460123388');
INSERT INTO `hot_search` VALUES ('178', 'm r', '0', '1', '1460123388');
INSERT INTO `hot_search` VALUES ('179', 'm r y', '0', '1', '1460123389');
INSERT INTO `hot_search` VALUES ('180', '美人鱼', '0', '2', '1460123390');
INSERT INTO `hot_search` VALUES ('181', 'mi', '0', '7', '1460295825');
INSERT INTO `hot_search` VALUES ('182', 'mi m', '0', '6', '1460295825');
INSERT INTO `hot_search` VALUES ('183', '秘密', '0', '12', '1460295826');
INSERT INTO `hot_search` VALUES ('184', 'zi', '0', '2', '1460295836');
INSERT INTO `hot_search` VALUES ('185', 'ziu', '0', '2', '1460295836');
INSERT INTO `hot_search` VALUES ('186', 'ziu x', '0', '1', '1460295837');
INSERT INTO `hot_search` VALUES ('187', 'xiu', '0', '1', '1460295840');
INSERT INTO `hot_search` VALUES ('188', '秀', '0', '1', '1460295841');
INSERT INTO `hot_search` VALUES ('189', '秀', '0', '1', '1460295841');
INSERT INTO `hot_search` VALUES ('190', 'cu', '0', '1', '1460295864');
INSERT INTO `hot_search` VALUES ('191', 'cun', '0', '1', '1460295864');
INSERT INTO `hot_search` VALUES ('192', '村', '0', '1', '1460295865');
INSERT INTO `hot_search` VALUES ('193', '村', '0', '1', '1460295865');
INSERT INTO `hot_search` VALUES ('194', 'j', '0', '28', '1460295881');
INSERT INTO `hot_search` VALUES ('195', 'ji', '0', '26', '1460295881');
INSERT INTO `hot_search` VALUES ('196', 'jin', '0', '1', '1460295882');
INSERT INTO `hot_search` VALUES ('197', 'jing', '0', '1', '1460295882');
INSERT INTO `hot_search` VALUES ('198', 'jing s', '0', '1', '1460295883');
INSERT INTO `hot_search` VALUES ('199', '惊悚', '0', '1', '1460295884');
INSERT INTO `hot_search` VALUES ('200', '惊悚', '0', '1', '1460295884');
INSERT INTO `hot_search` VALUES ('201', 'di', '0', '3', '1460333735');
INSERT INTO `hot_search` VALUES ('202', 'di n', '0', '2', '1460333736');
INSERT INTO `hot_search` VALUES ('203', 'din', '0', '2', '1460333736');
INSERT INTO `hot_search` VALUES ('204', 'ding', '0', '2', '1460333736');
INSERT INTO `hot_search` VALUES ('205', '丁', '0', '17', '1460333737');
INSERT INTO `hot_search` VALUES ('206', '丁', '0', '1', '1460333737');
INSERT INTO `hot_search` VALUES ('207', 'y', '0', '8', '1460340542');
INSERT INTO `hot_search` VALUES ('208', 'yi', '0', '3', '1460340542');
INSERT INTO `hot_search` VALUES ('209', 'yin', '0', '1', '1460340542');
INSERT INTO `hot_search` VALUES ('210', '印', '0', '2', '1460340543');
INSERT INTO `hot_search` VALUES ('211', 'ta', '0', '12', '1460346888');
INSERT INTO `hot_search` VALUES ('212', 'tai', '0', '2', '1460346889');
INSERT INTO `hot_search` VALUES ('213', 'tai z', '0', '1', '1460346889');
INSERT INTO `hot_search` VALUES ('214', 'tai zi', '0', '1', '1460346889');
INSERT INTO `hot_search` VALUES ('215', '太子', '0', '2', '1460346889');
INSERT INTO `hot_search` VALUES ('216', '太', '0', '3', '1460346892');
INSERT INTO `hot_search` VALUES ('217', 'bi', '0', '2', '1460346894');
INSERT INTO `hot_search` VALUES ('218', 'bi a', '0', '1', '1460346894');
INSERT INTO `hot_search` VALUES ('219', 'bi an', '0', '1', '1460346894');
INSERT INTO `hot_search` VALUES ('220', 'bian', '0', '1', '1460346894');
INSERT INTO `hot_search` VALUES ('221', 'bian j', '0', '1', '1460346894');
INSERT INTO `hot_search` VALUES ('222', 'bian ju', '0', '1', '1460346895');
INSERT INTO `hot_search` VALUES ('223', '编剧', '0', '2', '1460346895');
INSERT INTO `hot_search` VALUES ('224', 'z h', '0', '1', '1460347184');
INSERT INTO `hot_search` VALUES ('225', 'z ho', '0', '1', '1460347184');
INSERT INTO `hot_search` VALUES ('226', 'z h o', '0', '1', '1460347184');
INSERT INTO `hot_search` VALUES ('227', 'z h ou', '0', '1', '1460347184');
INSERT INTO `hot_search` VALUES ('228', 'zhou', '0', '1', '1460347184');
INSERT INTO `hot_search` VALUES ('229', '周', '0', '2', '1460347185');
INSERT INTO `hot_search` VALUES ('230', '周', '0', '1', '1460347185');
INSERT INTO `hot_search` VALUES ('231', '周x', '0', '1', '1460347186');
INSERT INTO `hot_search` VALUES ('232', '周xi', '0', '1', '1460347186');
INSERT INTO `hot_search` VALUES ('233', '周xin', '0', '1', '1460347186');
INSERT INTO `hot_search` VALUES ('234', '周xing', '0', '1', '1460347186');
INSERT INTO `hot_search` VALUES ('235', '周星', '0', '2', '1460347187');
INSERT INTO `hot_search` VALUES ('236', 'h h', '0', '7', '1460347231');
INSERT INTO `hot_search` VALUES ('237', 'h h h', '0', '4', '1460347231');
INSERT INTO `hot_search` VALUES ('238', 'hhh', '0', '2', '1460347236');
INSERT INTO `hot_search` VALUES ('239', 'hh', '0', '1', '1460347238');
INSERT INTO `hot_search` VALUES ('240', 'g', '0', '2', '1460356700');
INSERT INTO `hot_search` VALUES ('241', 'g h', '0', '3', '1460356700');
INSERT INTO `hot_search` VALUES ('242', 'w a', '0', '2', '1460363743');
INSERT INTO `hot_search` VALUES ('243', 'w an', '0', '2', '1460363744');
INSERT INTO `hot_search` VALUES ('244', '王x', '0', '1', '1460363746');
INSERT INTO `hot_search` VALUES ('245', '王xi', '0', '1', '1460363746');
INSERT INTO `hot_search` VALUES ('246', '王xia', '0', '1', '1460363746');
INSERT INTO `hot_search` VALUES ('247', '王xiao', '0', '1', '1460363746');
INSERT INTO `hot_search` VALUES ('248', '王霄', '0', '1', '1460363750');
INSERT INTO `hot_search` VALUES ('249', '王霄', '0', '1', '1460363750');
INSERT INTO `hot_search` VALUES ('250', 'h h h h', '0', '1', '1460375690');
INSERT INTO `hot_search` VALUES ('251', 'h h j', '0', '2', '1460375701');
INSERT INTO `hot_search` VALUES ('252', 'h h j j', '0', '2', '1460375701');
INSERT INTO `hot_search` VALUES ('253', 'h h j j j', '0', '2', '1460375702');
INSERT INTO `hot_search` VALUES ('254', 'h h j j j j', '0', '2', '1460375702');
INSERT INTO `hot_search` VALUES ('255', 'h h j j j j g', '0', '2', '1460375702');
INSERT INTO `hot_search` VALUES ('256', 'h h j j j j g f', '0', '2', '1460375702');
INSERT INTO `hot_search` VALUES ('257', 'h h j j j j g f', '0', '1', '1460375702');
INSERT INTO `hot_search` VALUES ('258', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('259', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('260', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('261', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('262', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('263', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('264', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('265', 'h h j j j j g f', '0', '1', '1460375703');
INSERT INTO `hot_search` VALUES ('266', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('267', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('268', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('269', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('270', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('271', 'h h j j j j g f', '0', '1', '1460375704');
INSERT INTO `hot_search` VALUES ('272', 'h h j j j j g f', '0', '1', '1460375705');
INSERT INTO `hot_search` VALUES ('273', 'h h j j j j g f', '0', '1', '1460375705');
INSERT INTO `hot_search` VALUES ('274', 'h h j j j j g f', '0', '1', '1460375705');
INSERT INTO `hot_search` VALUES ('275', 'h h j j j j g f', '0', '1', '1460375705');
INSERT INTO `hot_search` VALUES ('276', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('277', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('278', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('279', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('280', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('281', 'h h j j j j g f', '0', '1', '1460375706');
INSERT INTO `hot_search` VALUES ('282', 'h h j j j j g f', '0', '1', '1460375707');
INSERT INTO `hot_search` VALUES ('283', 'h h j j j j g f', '0', '1', '1460375707');
INSERT INTO `hot_search` VALUES ('284', 'h h j j j j g f', '0', '1', '1460375707');
INSERT INTO `hot_search` VALUES ('285', 'h h j j j j g f', '0', '1', '1460375707');
INSERT INTO `hot_search` VALUES ('286', 'h h j j j j g f', '0', '1', '1460375708');
INSERT INTO `hot_search` VALUES ('287', 'h h j j j j g f', '0', '1', '1460375708');
INSERT INTO `hot_search` VALUES ('288', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('289', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('290', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('291', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('292', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('293', 'h h j j j j g f', '0', '1', '1460375709');
INSERT INTO `hot_search` VALUES ('294', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('295', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('296', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('297', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('298', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('299', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('300', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('301', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('302', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('303', 'h h j j j j g f', '0', '1', '1460375710');
INSERT INTO `hot_search` VALUES ('304', 'h h j j j j g f', '0', '1', '1460375711');
INSERT INTO `hot_search` VALUES ('305', 'b b', '0', '1', '1460375713');
INSERT INTO `hot_search` VALUES ('306', 'jia', '0', '24', '1460388929');
INSERT INTO `hot_search` VALUES ('307', '嘉', '0', '46', '1460388937');
INSERT INTO `hot_search` VALUES ('308', 'v', '0', '3', '1460424947');
INSERT INTO `hot_search` VALUES ('309', 'v g', '0', '1', '1460424948');
INSERT INTO `hot_search` VALUES ('310', '花千', '0', '2', '1460424953');
INSERT INTO `hot_search` VALUES ('311', 'dao y', '0', '7', '1460424959');
INSERT INTO `hot_search` VALUES ('312', '导演', '0', '22', '1460424960');
INSERT INTO `hot_search` VALUES ('313', 'ho', '0', '2', '1460429786');
INSERT INTO `hot_search` VALUES ('314', 'hon', '0', '1', '1460429786');
INSERT INTO `hot_search` VALUES ('315', 'hong', '0', '1', '1460429786');
INSERT INTO `hot_search` VALUES ('316', '红', '0', '2', '1460429787');
INSERT INTO `hot_search` VALUES ('317', '红x', '0', '1', '1460429790');
INSERT INTO `hot_search` VALUES ('318', '红xi', '0', '1', '1460429790');
INSERT INTO `hot_search` VALUES ('319', '红xin', '0', '1', '1460429790');
INSERT INTO `hot_search` VALUES ('320', '红xing', '0', '1', '1460429790');
INSERT INTO `hot_search` VALUES ('321', '红xing z', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('322', '红xing zi', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('323', '红xing zin', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('324', '红xing zi n', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('325', '红xing zi n g', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('326', '红xing zing', '0', '1', '1460429791');
INSERT INTO `hot_search` VALUES ('327', '红猩猩', '0', '2', '1460429792');
INSERT INTO `hot_search` VALUES ('328', 'd q', '0', '1', '1460431076');
INSERT INTO `hot_search` VALUES ('329', '丁庆', '0', '3', '1460431077');
INSERT INTO `hot_search` VALUES ('330', '丁庆', '0', '1', '1460431077');
INSERT INTO `hot_search` VALUES ('331', 'qi', '0', '3', '1460431106');
INSERT INTO `hot_search` VALUES ('332', 'qin', '0', '2', '1460431106');
INSERT INTO `hot_search` VALUES ('333', 'qing', '0', '2', '1460431106');
INSERT INTO `hot_search` VALUES ('334', '庆', '0', '4', '1460431107');
INSERT INTO `hot_search` VALUES ('335', 'ca', '0', '3', '1460431672');
INSERT INTO `hot_search` VALUES ('336', 'can', '0', '3', '1460431672');
INSERT INTO `hot_search` VALUES ('337', 'cang', '0', '2', '1460431673');
INSERT INTO `hot_search` VALUES ('338', 'cang j', '0', '2', '1460431678');
INSERT INTO `hot_search` VALUES ('339', 'cang j k', '0', '1', '1460431678');
INSERT INTO `hot_search` VALUES ('340', '仓jk', '0', '1', '1460431680');
INSERT INTO `hot_search` VALUES ('341', '仓j k', '0', '1', '1460431680');
INSERT INTO `hot_search` VALUES ('342', 'cangjk', '0', '1', '1460431684');
INSERT INTO `hot_search` VALUES ('343', 'cang jk', '0', '1', '1460431684');
INSERT INTO `hot_search` VALUES ('344', 'cang ji', '0', '1', '1460431685');
INSERT INTO `hot_search` VALUES ('345', 'cang jin', '0', '1', '1460431686');
INSERT INTO `hot_search` VALUES ('346', 'cang jing', '0', '1', '1460431686');
INSERT INTO `hot_search` VALUES ('347', 'cang jing k', '0', '1', '1460431686');
INSERT INTO `hot_search` VALUES ('348', '苍井空', '0', '6', '1460431686');
INSERT INTO `hot_search` VALUES ('349', 'c j', '0', '2', '1460431696');
INSERT INTO `hot_search` VALUES ('350', 'c j k', '0', '2', '1460431696');
INSERT INTO `hot_search` VALUES ('351', 'xiao', '0', '2', '1460432033');
INSERT INTO `hot_search` VALUES ('352', '小', '0', '5', '1460432034');
INSERT INTO `hot_search` VALUES ('353', '小', '0', '1', '1460432034');
INSERT INTO `hot_search` VALUES ('354', 'mi k', '0', '1', '1460470252');
INSERT INTO `hot_search` VALUES ('355', 'mi mi', '0', '2', '1460470254');
INSERT INTO `hot_search` VALUES ('356', 'tan', '0', '10', '1460470261');
INSERT INTO `hot_search` VALUES ('357', '谭', '0', '1', '1460470262');
INSERT INTO `hot_search` VALUES ('358', '谭', '0', '1', '1460470262');
INSERT INTO `hot_search` VALUES ('359', 'la', '0', '3', '1460470328');
INSERT INTO `hot_search` VALUES ('360', 'lao', '0', '2', '1460470328');
INSERT INTO `hot_search` VALUES ('361', '老', '0', '6', '1460470329');
INSERT INTO `hot_search` VALUES ('362', 'dao t', '0', '1', '1460528984');
INSERT INTO `hot_search` VALUES ('363', 'dao ta', '0', '1', '1460528984');
INSERT INTO `hot_search` VALUES ('364', 'dao ta b', '0', '1', '1460528984');
INSERT INTO `hot_search` VALUES ('365', 'dao tab', '0', '1', '1460528984');
INSERT INTO `hot_search` VALUES ('366', 'he', '0', '1', '1460533077');
INSERT INTO `hot_search` VALUES ('367', 'he l', '0', '1', '1460533078');
INSERT INTO `hot_search` VALUES ('368', 'he l l', '0', '1', '1460533078');
INSERT INTO `hot_search` VALUES ('369', 'hell', '0', '1', '1460533078');
INSERT INTO `hot_search` VALUES ('370', 'hello', '0', '3', '1460533079');
INSERT INTO `hot_search` VALUES ('371', 'cha', '0', '7', '1460533104');
INSERT INTO `hot_search` VALUES ('372', 'chan', '0', '8', '1460533104');
INSERT INTO `hot_search` VALUES ('373', 'chang', '0', '9', '1460533105');
INSERT INTO `hot_search` VALUES ('374', 'chang j', '0', '7', '1460533105');
INSERT INTO `hot_search` VALUES ('375', 'chang ji', '0', '6', '1460533105');
INSERT INTO `hot_search` VALUES ('376', '唱机', '0', '3', '1460533106');
INSERT INTO `hot_search` VALUES ('377', '唱机', '0', '1', '1460533106');
INSERT INTO `hot_search` VALUES ('378', '唱', '0', '2', '1460533106');
INSERT INTO `hot_search` VALUES ('379', '场', '0', '5', '1460533110');
INSERT INTO `hot_search` VALUES ('380', '场', '0', '1', '1460533110');
INSERT INTO `hot_search` VALUES ('381', '场j', '0', '2', '1460533111');
INSERT INTO `hot_search` VALUES ('382', '场ji', '0', '3', '1460533111');
INSERT INTO `hot_search` VALUES ('383', '场ji b', '0', '1', '1460533115');
INSERT INTO `hot_search` VALUES ('384', '场记', '0', '11', '1460533117');
INSERT INTO `hot_search` VALUES ('385', '场记', '0', '1', '1460533117');
INSERT INTO `hot_search` VALUES ('386', 'jia h', '0', '4', '1460533398');
INSERT INTO `hot_search` VALUES ('387', 'jia hu', '0', '4', '1460533398');
INSERT INTO `hot_search` VALUES ('388', 'jia hua', '0', '3', '1460533398');
INSERT INTO `hot_search` VALUES ('389', '嘉h', '0', '3', '1460533427');
INSERT INTO `hot_search` VALUES ('390', '嘉hu', '0', '3', '1460533427');
INSERT INTO `hot_search` VALUES ('391', '嘉hua', '0', '2', '1460533428');
INSERT INTO `hot_search` VALUES ('392', '嘉桦', '0', '4', '1460533429');
INSERT INTO `hot_search` VALUES ('393', '嘉华', '0', '3', '1460534094');
INSERT INTO `hot_search` VALUES ('394', '嘉华', '0', '1', '1460534094');
INSERT INTO `hot_search` VALUES ('395', 'nv z', '0', '2', '1460534438');
INSERT INTO `hot_search` VALUES ('396', '女主', '0', '4', '1460534439');
INSERT INTO `hot_search` VALUES ('397', '第', '0', '4', '1460534755');
INSERT INTO `hot_search` VALUES ('398', '第g', '0', '1', '1460534755');
INSERT INTO `hot_search` VALUES ('399', 'ding q', '0', '1', '1460534758');
INSERT INTO `hot_search` VALUES ('400', 'ding qi', '0', '1', '1460534758');
INSERT INTO `hot_search` VALUES ('401', 'ding qin', '0', '1', '1460534759');
INSERT INTO `hot_search` VALUES ('402', 'ding qing', '0', '1', '1460534759');
INSERT INTO `hot_search` VALUES ('403', '丁qing', '0', '1', '1460534760');
INSERT INTO `hot_search` VALUES ('404', 'ti', '0', '4', '1460534802');
INSERT INTO `hot_search` VALUES ('405', 'tie', '0', '5', '1460534802');
INSERT INTO `hot_search` VALUES ('406', '铁', '0', '4', '1460534803');
INSERT INTO `hot_search` VALUES ('407', 'be', '0', '2', '1460534813');
INSERT INTO `hot_search` VALUES ('408', 'ben', '0', '2', '1460534813');
INSERT INTO `hot_search` VALUES ('409', 'ben b', '0', '1', '1460534813');
INSERT INTO `hot_search` VALUES ('410', 'ben be', '0', '1', '1460534813');
INSERT INTO `hot_search` VALUES ('411', 'ben ben', '0', '1', '1460534813');
INSERT INTO `hot_search` VALUES ('412', '笨笨', '0', '2', '1460534814');
INSERT INTO `hot_search` VALUES ('413', 'd s', '0', '4', '1460536182');
INSERT INTO `hot_search` VALUES ('414', 'd so', '0', '1', '1460536182');
INSERT INTO `hot_search` VALUES ('415', 'dso', '0', '1', '1460536182');
INSERT INTO `hot_search` VALUES ('416', 'dso y', '0', '1', '1460536182');
INSERT INTO `hot_search` VALUES ('417', 'yi d', '0', '1', '1460536966');
INSERT INTO `hot_search` VALUES ('418', '易丁', '0', '2', '1460536967');
INSERT INTO `hot_search` VALUES ('419', '易', '0', '3', '1460537053');
INSERT INTO `hot_search` VALUES ('420', 'liu d', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('421', 'liu', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('422', 'liu di', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('423', 'liu di n', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('424', 'liu din', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('425', 'liu ding', '0', '2', '1460537054');
INSERT INTO `hot_search` VALUES ('426', '柳丁', '0', '4', '1460537055');
INSERT INTO `hot_search` VALUES ('427', 'me', '0', '2', '1460542565');
INSERT INTO `hot_search` VALUES ('428', 'mei', '0', '1', '1460542565');
INSERT INTO `hot_search` VALUES ('429', 'mei s', '0', '1', '1460542565');
INSERT INTO `hot_search` VALUES ('430', 'mei sh', '0', '2', '1460542566');
INSERT INTO `hot_search` VALUES ('431', 'mei shu', '0', '2', '1460542567');
INSERT INTO `hot_search` VALUES ('432', 'mei shu sh', '0', '1', '1460542568');
INSERT INTO `hot_search` VALUES ('433', 'mei shu s', '0', '1', '1460542568');
INSERT INTO `hot_search` VALUES ('434', '美术师', '0', '2', '1460542569');
INSERT INTO `hot_search` VALUES ('435', 'mei shu shi', '0', '1', '1460542569');
INSERT INTO `hot_search` VALUES ('436', 'd y', '0', '3', '1460545262');
INSERT INTO `hot_search` VALUES ('437', 'd ya', '0', '2', '1460545263');
INSERT INTO `hot_search` VALUES ('438', 'd yan', '0', '2', '1460545263');
INSERT INTO `hot_search` VALUES ('439', 'Dj', '0', '2', '1460547297');
INSERT INTO `hot_search` VALUES ('440', 'ye', '0', '2', '1460554612');
INSERT INTO `hot_search` VALUES ('441', '叶', '0', '4', '1460554613');
INSERT INTO `hot_search` VALUES ('442', '青', '0', '2', '1460554676');
INSERT INTO `hot_search` VALUES ('443', 'wu', '0', '4', '1460554683');
INSERT INTO `hot_search` VALUES ('444', 'wu x', '0', '2', '1460554683');
INSERT INTO `hot_search` VALUES ('445', 'wu xu', '0', '1', '1460554684');
INSERT INTO `hot_search` VALUES ('446', 'wu xi', '0', '1', '1460554685');
INSERT INTO `hot_search` VALUES ('447', 'wu xia', '0', '1', '1460554685');
INSERT INTO `hot_search` VALUES ('448', '武侠', '0', '1', '1460554686');
INSERT INTO `hot_search` VALUES ('449', '武侠', '0', '1', '1460554686');
INSERT INTO `hot_search` VALUES ('450', 'do', '0', '1', '1460554693');
INSERT INTO `hot_search` VALUES ('451', 'don', '0', '1', '1460554693');
INSERT INTO `hot_search` VALUES ('452', 'dong', '0', '1', '1460554693');
INSERT INTO `hot_search` VALUES ('453', 'dong m', '0', '1', '1460554694');
INSERT INTO `hot_search` VALUES ('454', 'dong ma', '0', '1', '1460554694');
INSERT INTO `hot_search` VALUES ('455', 'dong man', '0', '1', '1460554694');
INSERT INTO `hot_search` VALUES ('456', '动漫', '0', '1', '1460554694');
INSERT INTO `hot_search` VALUES ('457', '动漫', '0', '1', '1460554694');
INSERT INTO `hot_search` VALUES ('458', 'd s j', '0', '3', '1460554714');
INSERT INTO `hot_search` VALUES ('459', '大数据', '0', '1', '1460554715');
INSERT INTO `hot_search` VALUES ('460', '大数据', '0', '1', '1460554715');
INSERT INTO `hot_search` VALUES ('461', '大数', '0', '1', '1460554715');
INSERT INTO `hot_search` VALUES ('462', '电视剧', '0', '3', '1460554717');
INSERT INTO `hot_search` VALUES ('463', '电视剧', '0', '1', '1460554717');
INSERT INTO `hot_search` VALUES ('464', 'tang', '0', '9', '1460554745');
INSERT INTO `hot_search` VALUES ('465', 'tang b', '0', '1', '1460554746');
INSERT INTO `hot_search` VALUES ('466', 'tang ba', '0', '1', '1460554746');
INSERT INTO `hot_search` VALUES ('467', 'tang bao', '0', '1', '1460554746');
INSERT INTO `hot_search` VALUES ('468', '糖bao', '0', '1', '1460554748');
INSERT INTO `hot_search` VALUES ('469', '糖宝', '0', '1', '1460554748');
INSERT INTO `hot_search` VALUES ('470', '糖宝', '0', '1', '1460554748');
INSERT INTO `hot_search` VALUES ('471', 'jie', '0', '1', '1460554769');
INSERT INTO `hot_search` VALUES ('472', '姐', '0', '1', '1460554771');
INSERT INTO `hot_search` VALUES ('473', '姐', '0', '1', '1460554771');
INSERT INTO `hot_search` VALUES ('474', 'm n', '0', '4', '1460554781');
INSERT INTO `hot_search` VALUES ('475', '美女', '0', '7', '1460554782');
INSERT INTO `hot_search` VALUES ('476', '美女', '0', '1', '1460554782');
INSERT INTO `hot_search` VALUES ('477', 'bin', '0', '1', '1460554813');
INSERT INTO `hot_search` VALUES ('478', 'bing', '0', '1', '1460554813');
INSERT INTO `hot_search` VALUES ('479', '冰', '0', '1', '1460554814');
INSERT INTO `hot_search` VALUES ('480', '冰', '0', '1', '1460554814');
INSERT INTO `hot_search` VALUES ('481', 'fa', '0', '1', '1460554819');
INSERT INTO `hot_search` VALUES ('482', 'fan', '0', '1', '1460554819');
INSERT INTO `hot_search` VALUES ('483', 'fan b', '0', '1', '1460554819');
INSERT INTO `hot_search` VALUES ('484', 'fan b b', '0', '1', '1460554819');
INSERT INTO `hot_search` VALUES ('485', '范冰冰', '0', '2', '1460554820');
INSERT INTO `hot_search` VALUES ('486', '汤', '0', '19', '1460554833');
INSERT INTO `hot_search` VALUES ('487', '汤', '0', '1', '1460554833');
INSERT INTO `hot_search` VALUES ('488', 'qia', '0', '1', '1460554841');
INSERT INTO `hot_search` VALUES ('489', 'qiao', '0', '1', '1460554841');
INSERT INTO `hot_search` VALUES ('490', '乔', '0', '1', '1460554842');
INSERT INTO `hot_search` VALUES ('491', '乔', '0', '1', '1460554842');
INSERT INTO `hot_search` VALUES ('492', 'wo', '0', '1', '1460554852');
INSERT INTO `hot_search` VALUES ('493', 'wo h', '0', '1', '1460554852');
INSERT INTO `hot_search` VALUES ('494', 'wo h c', '0', '1', '1460554853');
INSERT INTO `hot_search` VALUES ('495', 'wo h c l', '0', '1', '1460554853');
INSERT INTO `hot_search` VALUES ('496', '卧虎藏龙', '0', '1', '1460554854');
INSERT INTO `hot_search` VALUES ('497', '卧虎藏龙', '0', '1', '1460554854');
INSERT INTO `hot_search` VALUES ('498', 'men', '0', '1', '1460554866');
INSERT INTO `hot_search` VALUES ('499', 'meng', '0', '1', '1460554866');
INSERT INTO `hot_search` VALUES ('500', '梦', '0', '1', '1460554866');
INSERT INTO `hot_search` VALUES ('501', '梦', '0', '1', '1460554866');
INSERT INTO `hot_search` VALUES ('502', '电影', '0', '2', '1460561329');
INSERT INTO `hot_search` VALUES ('503', 'a', '0', '5', '1460597682');
INSERT INTO `hot_search` VALUES ('504', 'a t', '0', '4', '1460597682');
INSERT INTO `hot_search` VALUES ('505', 'a to', '0', '4', '1460597683');
INSERT INTO `hot_search` VALUES ('506', 'a to m', '0', '4', '1460597683');
INSERT INTO `hot_search` VALUES ('507', 'atom', '0', '6', '1460597683');
INSERT INTO `hot_search` VALUES ('508', 'jia j', '0', '1', '1460597696');
INSERT INTO `hot_search` VALUES ('509', 'wu z', '0', '3', '1460623469');
INSERT INTO `hot_search` VALUES ('510', 'wu zh', '0', '2', '1460623470');
INSERT INTO `hot_search` VALUES ('511', 'wu zhe', '0', '2', '1460623470');
INSERT INTO `hot_search` VALUES ('512', '舞者', '0', '6', '1460623470');
INSERT INTO `hot_search` VALUES ('513', 'da s', '0', '2', '1460627985');
INSERT INTO `hot_search` VALUES ('514', 'da sh', '0', '1', '1460627985');
INSERT INTO `hot_search` VALUES ('515', '大s', '0', '2', '1460627990');
INSERT INTO `hot_search` VALUES ('516', '大sh', '0', '2', '1460627990');
INSERT INTO `hot_search` VALUES ('517', '大shu', '0', '2', '1460627990');
INSERT INTO `hot_search` VALUES ('518', '大shua', '0', '2', '1460627990');
INSERT INTO `hot_search` VALUES ('519', '大shuai', '0', '2', '1460627990');
INSERT INTO `hot_search` VALUES ('520', '大帅', '0', '3', '1460627991');
INSERT INTO `hot_search` VALUES ('521', '大帅', '0', '1', '1460627991');
INSERT INTO `hot_search` VALUES ('522', '大帅l', '0', '1', '1460628001');
INSERT INTO `hot_search` VALUES ('523', '大帅le', '0', '1', '1460628001');
INSERT INTO `hot_search` VALUES ('524', '大帅了', '0', '2', '1460628001');
INSERT INTO `hot_search` VALUES ('525', 'v h', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('526', 'v ha', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('527', 'vha', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('528', 'vhan', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('529', 'vhang', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('530', 'vhang j', '0', '1', '1460628013');
INSERT INTO `hot_search` VALUES ('531', 'vhang ji', '0', '1', '1460628014');
INSERT INTO `hot_search` VALUES ('532', 'b r', '0', '2', '1460719130');
INSERT INTO `hot_search` VALUES ('533', 'b r n', '0', '2', '1460719130');
INSERT INTO `hot_search` VALUES ('534', 'b r n b', '0', '2', '1460719130');
INSERT INTO `hot_search` VALUES ('535', 'brn b', '0', '2', '1460719130');
INSERT INTO `hot_search` VALUES ('536', 'b r n b r n', '0', '1', '1460719131');
INSERT INTO `hot_search` VALUES ('537', 'b r n b r', '0', '2', '1460719131');
INSERT INTO `hot_search` VALUES ('538', 'brn b r', '0', '1', '1460719131');
INSERT INTO `hot_search` VALUES ('539', 'brn', '0', '1', '1460719132');
INSERT INTO `hot_search` VALUES ('540', '笨', '0', '2', '1460719133');
INSERT INTO `hot_search` VALUES ('541', 'g h z', '0', '1', '1460774272');
INSERT INTO `hot_search` VALUES ('542', '古惑仔', '0', '2', '1460774272');
INSERT INTO `hot_search` VALUES ('543', 'b p', '0', '2', '1460775266');
INSERT INTO `hot_search` VALUES ('544', 'b p l', '0', '1', '1460775268');
INSERT INTO `hot_search` VALUES ('545', 'bai p', '0', '1', '1460775270');
INSERT INTO `hot_search` VALUES ('546', 'bao', '0', '1', '1460775271');
INSERT INTO `hot_search` VALUES ('547', 'bao p', '0', '1', '1460775272');
INSERT INTO `hot_search` VALUES ('548', '爆破', '0', '2', '1460775273');
INSERT INTO `hot_search` VALUES ('549', 'h z', '0', '3', '1460775412');
INSERT INTO `hot_search` VALUES ('550', 'h z s', '0', '2', '1460775413');
INSERT INTO `hot_search` VALUES ('551', '化妆水', '0', '4', '1460775414');
INSERT INTO `hot_search` VALUES ('552', '化妆水l', '0', '1', '1460775414');
INSERT INTO `hot_search` VALUES ('553', '化妆水l s', '0', '1', '1460775416');
INSERT INTO `hot_search` VALUES ('554', '化妆水l s h', '0', '1', '1460775416');
INSERT INTO `hot_search` VALUES ('555', '化妆水l sh', '0', '1', '1460775416');
INSERT INTO `hot_search` VALUES ('556', '化妆水l shi', '0', '1', '1460775416');
INSERT INTO `hot_search` VALUES ('557', '化妆水老师', '0', '1', '1460775417');
INSERT INTO `hot_search` VALUES ('558', '化妆水老师', '0', '1', '1460775417');
INSERT INTO `hot_search` VALUES ('559', '化妆水老', '0', '1', '1460775417');
INSERT INTO `hot_search` VALUES ('560', '化妆水s', '0', '1', '1460775418');
INSERT INTO `hot_search` VALUES ('561', '化妆水sh', '0', '1', '1460775419');
INSERT INTO `hot_search` VALUES ('562', '化妆水shi', '0', '1', '1460775419');
INSERT INTO `hot_search` VALUES ('563', '化妆水师', '0', '1', '1460775425');
INSERT INTO `hot_search` VALUES ('564', '化妆水师', '0', '1', '1460775425');
INSERT INTO `hot_search` VALUES ('565', '化妆', '0', '1', '1460775429');
INSERT INTO `hot_search` VALUES ('566', '化妆s', '0', '1', '1460775430');
INSERT INTO `hot_search` VALUES ('567', '化妆师', '0', '4', '1460775431');
INSERT INTO `hot_search` VALUES ('568', 'hou', '0', '1', '1460775448');
INSERT INTO `hot_search` VALUES ('569', 'hou q', '0', '1', '1460775448');
INSERT INTO `hot_search` VALUES ('570', '后期', '0', '1', '1460775449');
INSERT INTO `hot_search` VALUES ('571', '后期', '0', '1', '1460775449');
INSERT INTO `hot_search` VALUES ('572', 'q b', '0', '1', '1460879044');
INSERT INTO `hot_search` VALUES ('573', 'q b s', '0', '1', '1460879044');
INSERT INTO `hot_search` VALUES ('574', '乔布斯', '0', '2', '1460879045');
INSERT INTO `hot_search` VALUES ('575', 'w l', '0', '1', '1460883598');
INSERT INTO `hot_search` VALUES ('576', 'w l j', '0', '1', '1460883599');
INSERT INTO `hot_search` VALUES ('577', 'w l ju', '0', '1', '1460883600');
INSERT INTO `hot_search` VALUES ('578', '网络剧', '0', '2', '1460883601');
INSERT INTO `hot_search` VALUES ('579', 'nv zh', '0', '1', '1460944602');
INSERT INTO `hot_search` VALUES ('580', 'nv zhu', '0', '1', '1460944602');
INSERT INTO `hot_search` VALUES ('581', 'ya', '0', '2', '1460944613');
INSERT INTO `hot_search` VALUES ('582', 'yan', '0', '2', '1460944614');
INSERT INTO `hot_search` VALUES ('583', 'yan y', '0', '2', '1460944614');
INSERT INTO `hot_search` VALUES ('584', 'yan yu', '0', '2', '1460944614');
INSERT INTO `hot_search` VALUES ('585', 'yan yu a', '0', '2', '1460944614');
INSERT INTO `hot_search` VALUES ('586', 'yan yu an', '0', '2', '1460944615');
INSERT INTO `hot_search` VALUES ('587', 'yan yuan', '0', '2', '1460944615');
INSERT INTO `hot_search` VALUES ('588', '演员', '0', '4', '1460944615');
INSERT INTO `hot_search` VALUES ('589', '演', '0', '1', '1460944623');
INSERT INTO `hot_search` VALUES ('590', 'qu', '0', '1', '1460944624');
INSERT INTO `hot_search` VALUES ('591', 'qun', '0', '1', '1460944624');
INSERT INTO `hot_search` VALUES ('592', 'qun y', '0', '1', '1460944624');
INSERT INTO `hot_search` VALUES ('593', 'qun ya', '0', '1', '1460944625');
INSERT INTO `hot_search` VALUES ('594', 'qun y a', '0', '1', '1460944625');
INSERT INTO `hot_search` VALUES ('595', 'qun y an', '0', '1', '1460944625');
INSERT INTO `hot_search` VALUES ('596', 'qun yan', '0', '1', '1460944625');
INSERT INTO `hot_search` VALUES ('597', '群演', '0', '2', '1460944625');
INSERT INTO `hot_search` VALUES ('598', '群', '0', '1', '1460944650');
INSERT INTO `hot_search` VALUES ('599', 'yu', '0', '2', '1460944651');
INSERT INTO `hot_search` VALUES ('600', 'yu a', '0', '2', '1460944651');
INSERT INTO `hot_search` VALUES ('601', 'yu an', '0', '1', '1460944651');
INSERT INTO `hot_search` VALUES ('602', 'yuan', '0', '3', '1460944651');
INSERT INTO `hot_search` VALUES ('603', 'yuan y', '0', '1', '1460944652');
INSERT INTO `hot_search` VALUES ('604', 'yuan l', '0', '2', '1460944652');
INSERT INTO `hot_search` VALUES ('605', 'yuan l l', '0', '1', '1460944652');
INSERT INTO `hot_search` VALUES ('606', 'yua', '0', '1', '1460944653');
INSERT INTO `hot_search` VALUES ('607', 'ao', '0', '1', '1460959101');
INSERT INTO `hot_search` VALUES ('608', 'tang s', '0', '1', '1460959176');
INSERT INTO `hot_search` VALUES ('609', 'tang sh', '0', '1', '1460959176');
INSERT INTO `hot_search` VALUES ('610', 'tang she', '0', '1', '1460959176');
INSERT INTO `hot_search` VALUES ('611', 'tang shen', '0', '1', '1460959176');
INSERT INTO `hot_search` VALUES ('612', '汤神', '0', '4', '1460959177');
INSERT INTO `hot_search` VALUES ('613', '汤she', '0', '1', '1460959826');
INSERT INTO `hot_search` VALUES ('614', '汤s', '0', '1', '1460959827');
INSERT INTO `hot_search` VALUES ('615', '汤sh', '0', '1', '1460959827');
INSERT INTO `hot_search` VALUES ('616', '汤shen', '0', '1', '1460959827');
INSERT INTO `hot_search` VALUES ('617', '男p', '0', '1', '1460973410');
INSERT INTO `hot_search` VALUES ('618', '男pe', '0', '1', '1460973410');
INSERT INTO `hot_search` VALUES ('619', '男pei', '0', '1', '1460973410');
INSERT INTO `hot_search` VALUES ('620', '李', '0', '2', '1460995586');
INSERT INTO `hot_search` VALUES ('621', 'h z s h', '0', '1', '1460995887');
INSERT INTO `hot_search` VALUES ('622', 'h z sh', '0', '1', '1460995887');
INSERT INTO `hot_search` VALUES ('623', 'h z shi', '0', '1', '1460995887');
INSERT INTO `hot_search` VALUES ('624', 'h z g', '0', '1', '1460995916');
INSERT INTO `hot_search` VALUES ('625', 'h z g g', '0', '1', '1460995916');
INSERT INTO `hot_search` VALUES ('626', '还珠格格', '0', '2', '1460995917');
INSERT INTO `hot_search` VALUES ('627', 'h d', '0', '2', '1461035170');
INSERT INTO `hot_search` VALUES ('628', 'h d h', '0', '2', '1461035170');
INSERT INTO `hot_search` VALUES ('629', 'h d h h', '0', '2', '1461035170');
INSERT INTO `hot_search` VALUES ('630', 'h d h h d', '0', '1', '1461035170');
INSERT INTO `hot_search` VALUES ('631', 'p', '0', '1', '1461035175');
INSERT INTO `hot_search` VALUES ('632', 'pe', '0', '1', '1461035175');
INSERT INTO `hot_search` VALUES ('633', 'pei', '0', '1', '1461035175');
INSERT INTO `hot_search` VALUES ('634', 'pei j', '0', '1', '1461035176');
INSERT INTO `hot_search` VALUES ('635', 'pei ju', '0', '1', '1461035176');
INSERT INTO `hot_search` VALUES ('636', 'pei jue', '0', '1', '1461035176');
INSERT INTO `hot_search` VALUES ('637', '配角', '0', '2', '1461035177');
INSERT INTO `hot_search` VALUES ('638', '配', '0', '1', '1461035180');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `operaId` int(11) NOT NULL COMMENT '剧目ID',
  `actorType` char(8) NOT NULL DEFAULT '' COMMENT '演员类型，actor/other',
  `nameC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '职位(code)',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '职位(label)',
  `salaryC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '薪资',
  `salary` char(20) NOT NULL DEFAULT '',
  `salaryUnitC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '薪资单位',
  `salaryUnit` char(20) NOT NULL DEFAULT '',
  `descrip` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位说明',
  `role` char(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `styleC1` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '演艺风格，可选三个',
  `style1` char(20) NOT NULL DEFAULT '',
  `styleC2` smallint(4) unsigned NOT NULL DEFAULT '0',
  `style2` char(20) NOT NULL DEFAULT '',
  `styleC3` smallint(4) unsigned NOT NULL DEFAULT '0',
  `style3` char(20) NOT NULL DEFAULT '',
  `height` char(15) NOT NULL DEFAULT '' COMMENT '身高',
  `age` char(15) NOT NULL DEFAULT '' COMMENT '年龄',
  `weight` char(15) NOT NULL DEFAULT '' COMMENT '体重',
  `roleDescrip` varchar(255) NOT NULL DEFAULT '' COMMENT '角色说明',
  `likeNum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '被收藏次数',
  `viewNum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '被查看次数',
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000' COMMENT '更新时间-毫秒级时间戳',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `job_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('250', '52', '126', 'actor', '45', 'DJ', '500', '不限', '550', '集', '', '加拿大', '376', '谐星', '375', '含蓄', '374', '泼辣', '不限', '不限', '不限', '', '0', '0', '1460096536995');
INSERT INTO `jobs` VALUES ('294', '30', '165', 'other', '0', '导演', '500', '不限', '550', '集', '我', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460453008204');
INSERT INTO `jobs` VALUES ('245', '2', '121', 'actor', '45', 'DJ', '500', '不限', '550', '集', '', '呃呃呃', '355', '性感', '0', '', '0', '', '55', '555', '85', '', '0', '0', '1460012754819');
INSERT INTO `jobs` VALUES ('239', '25', '121', 'other', '2', '导演', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '1', '1', '1460010555992');
INSERT INTO `jobs` VALUES ('5', '4', '6', 'actor', '49', '儿童', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '幽默', '356', '大叔', '0', '刚毅', '175', '28', '135', '角色说明', '0', '1', '1455965543169');
INSERT INTO `jobs` VALUES ('6', '5', '2', 'actor', '39', '制片人', '503', '5k-10k', '0', '部', '岗位说明', '糖宝', '350', '偶像', '356', '小清新', '357', '暖男', '175', '28', '135', '角色说明', '0', '0', '1455965570871');
INSERT INTO `jobs` VALUES ('7', '4', '3', 'actor', '54', '男配', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '反派', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '1', '1', '1456116331652');
INSERT INTO `jobs` VALUES ('9', '2', '4', 'actor', '55', '导演', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '性感', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '1', '1456117025964');
INSERT INTO `jobs` VALUES ('10', '4', '6', 'other', '0', '灯光师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0001453362573');
INSERT INTO `jobs` VALUES ('11', '9', '7', 'actor', '0', '群演', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('12', '9', '7', 'other', '0', '美术师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('13', '5', '2', '', '0', '男配', '0', '', '0', '', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('293', '37', '157', 'other', '100', '字幕对白', '501', '面议', '551', '部', '加加加', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460448996271');
INSERT INTO `jobs` VALUES ('295', '63', '166', 'other', '0', '编导', '506', '10k-15k', '550', '集', '哈喽', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460470385859');
INSERT INTO `jobs` VALUES ('296', '55', '167', 'other', '5', '场记', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '1', '1460511365417');
INSERT INTO `jobs` VALUES ('297', '55', '168', 'other', '9', '现场副导', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460516484989');
INSERT INTO `jobs` VALUES ('308', '21', '75', 'other', '17', '制片人', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460614341841');
INSERT INTO `jobs` VALUES ('16', '2', '4', 'other', '0', '嘉宾', '504', '500k以上', '0', '部', '岗位说明', 'test', '350', '幽默', '356', '大叔', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1459323461466');
INSERT INTO `jobs` VALUES ('17', '5', '2', 'actor', '39', '制片人', '503', '5k-10k', '0', '部', '岗位说明', '糖宝', '350', '偶像', '356', '小清新', '357', '暖男', '175', '28', '135', '角色说明', '0', '0', '1455965570871');
INSERT INTO `jobs` VALUES ('18', '4', '3', 'actor', '54', '男配2', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '反派', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456116331652');
INSERT INTO `jobs` VALUES ('19', '2', '4', 'other', '0', '场记', '504', '3k-6k', '0', '部', '岗位说明', '网络', '350', '性感', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1459323147843');
INSERT INTO `jobs` VALUES ('20', '2', '4', 'other', '0', '灯光师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('21', '5', '2', 'actor', '0', '群演', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('22', '9', '7', 'other', '0', '美术师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('23', '9', '7', '', '0', '男配', '0', '', '0', '', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('246', '45', '88', 'other', '91', '录音师', '500', '不限', '550', '集', '哈哈', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460080129141');
INSERT INTO `jobs` VALUES ('237', '25', '121', 'other', '2', '导演', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '1', '11', '1460010544558');
INSERT INTO `jobs` VALUES ('238', '25', '121', 'other', '3', '执行导演', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460010554354');
INSERT INTO `jobs` VALUES ('196', '23', '92', 'actor', '40', '网络主播', '504', '3k-6k', '550', '集', '', '你说了', '0', '怪咖', '0', '', '0', '', '185', '22', '52', '我们要学会珍惜', '0', '0', '1459847345460');
INSERT INTO `jobs` VALUES ('278', '45', '173', 'other', '100', '后期制作指导', '502', '0-1k', '553', '日', 'qq', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460339260721');
INSERT INTO `jobs` VALUES ('26', '9', '1', 'actor', '49', '儿童', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '幽默', '356', '大叔', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1455965543169');
INSERT INTO `jobs` VALUES ('28', '4', '3', 'actor', '54', '导演', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '反派', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '1', '1', '1456116331652');
INSERT INTO `jobs` VALUES ('29', '5', '2', 'actor', '55', '男主', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '性感', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456117025964');
INSERT INTO `jobs` VALUES ('30', '8', '5', 'other', '0', '策划', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('31', '8', '5', 'actor', '0', '群演', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('32', '9', '1', 'other', '0', '美术师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('205', '47', '79', 'actor', '33', '女配', '0', '50k-75k-(null)', '0', '部', '', '笨蛋', '0', '御姐', '0', '', '0', '', '174', '36', '59', '哈哈哈哈', '0', '0', '1459906880607');
INSERT INTO `jobs` VALUES ('290', '28', '149', 'other', '2', '导演', '502', '0-1k', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460429737529');
INSERT INTO `jobs` VALUES ('170', '23', '92', 'actor', '36', '嘉宾', '504', '3k-6k', '550', '集', '', '演员哥哥', '0', '打星', '0', '', '0', '', '125', '25', '55', '666666', '0', '0', '1459759376033');
INSERT INTO `jobs` VALUES ('168', '23', '92', 'actor', '27', '男配', '504', '3k-6k', '550', '集', '', '演员人气排名', '0', '打星 反派 御姐', '0', '', '0', '', '258', '15', '55', '粑粑', '0', '0', '1459757516790');
INSERT INTO `jobs` VALUES ('204', '37', '104', 'other', '25', '男主', '501', '面议', '550', '集', '', '扶苏', '0', '刚毅', '0', '粗犷', '0', '', '187', '33', '75', '1111', '0', '0', '1459906754567');
INSERT INTO `jobs` VALUES ('36', '9', '1', 'actor', '49', '导演', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '幽默', '356', '大叔', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1455965543169');
INSERT INTO `jobs` VALUES ('38', '4', '3', 'actor', '54', '男配3', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '反派', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456116331652');
INSERT INTO `jobs` VALUES ('39', '2', '4', 'actor', '55', '男主', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '性感', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456117025964');
INSERT INTO `jobs` VALUES ('40', '2', '4', 'other', '0', '灯光师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('41', '4', '6', 'actor', '0', '群演', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('42', '9', '1', 'other', '0', '美术师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('309', '21', '75', 'other', '6', '编导', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460614356200');
INSERT INTO `jobs` VALUES ('166', '23', '92', 'other', '1', '执行导演', '504', '3k-6k', '550', '集', '666', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459757323524');
INSERT INTO `jobs` VALUES ('203', '37', '104', 'other', '25', '男主', '501', '面议', '550', '集', '', '扶苏', '0', '刚毅', '0', '粗犷', '0', '', '187', '33', '75', '1111', '0', '0', '1459906754372');
INSERT INTO `jobs` VALUES ('273', '29', '133', 'other', '4', '副导演', '501', '面议', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460335228541');
INSERT INTO `jobs` VALUES ('46', '9', '1', 'actor', '49', '儿童', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '幽默', '356', '大叔', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1455965543169');
INSERT INTO `jobs` VALUES ('47', '4', '3', 'actor', '39', '制片人', '503', '5k-10k', '0', '部', '岗位说明', '糖宝', '350', '偶像', '356', '小清新', '357', '暖男', '175', '28', '135', '角色说明', '0', '0', '1455965570871');
INSERT INTO `jobs` VALUES ('48', '2', '4', 'actor', '54', '策划', '504', '200k-500k', '0', '部', '岗位说明', '糖宝', '350', '反派', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456116331652');
INSERT INTO `jobs` VALUES ('49', '4', '6', 'actor', '55', '男主', '504', '3k-6k', '0', '部', '岗位说明', '糖宝', '350', '性感', '356', '刚毅', '0', '刚毅', '175', '28', '135', '角色说明', '0', '0', '1456117025964');
INSERT INTO `jobs` VALUES ('50', '4', '6', 'other', '0', '策划', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('51', '4', '6', 'actor', '0', '群演', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('52', '5', '2', 'other', '0', '美术师', '0', '3k-6k', '0', '部', '岗位说明', '糖宝', '0', '反派', '0', '小清新', '0', '刚毅', '', '', '', '角色说明', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('53', '4', '3', '', '0', '男配', '0', '', '0', '', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '0000000000000');
INSERT INTO `jobs` VALUES ('307', '21', '75', 'other', '8', '演员副导', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '1', '1', '1460614308440');
INSERT INTO `jobs` VALUES ('372', '71', '233', 'actor', '38', '舞者', '502', '0-1k', '552', '场', '', 'ygg', '371', '斯文', '0', '', '0', '', '1m以下', '10-15岁', '60-70kg', 'vv h', '0', '0', '1461049515286');
INSERT INTO `jobs` VALUES ('169', '23', '92', 'actor', '34', '群演', '505', '6k-10k', '550', '集', '', '神奇', '0', '幽默', '0', '', '0', '', '258', '25', '258', '666', '0', '0', '1459758127880');
INSERT INTO `jobs` VALUES ('202', '37', '104', 'other', '25', '男主', '501', '面议', '550', '集', '', '扶苏', '0', '刚毅', '0', '粗犷', '0', '', '187', '33', '75', '1111', '0', '0', '1459906754037');
INSERT INTO `jobs` VALUES ('201', '37', '104', 'other', '25', '男主', '501', '面议', '550', '集', '', '扶苏', '0', '刚毅', '0', '粗犷', '0', '', '187', '33', '75', '1111', '0', '0', '1459906744605');
INSERT INTO `jobs` VALUES ('337', '37', '219', 'other', '0', '导演', '501', '面议', '551', '部', '赶紧来应聘', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460878773400');
INSERT INTO `jobs` VALUES ('200', '37', '104', 'other', '25', '男主', '501', '面议', '550', '集', '', '扶苏', '0', '刚毅', '0', '粗犷', '0', '', '187', '33', '75', '1111', '0', '0', '1459906736437');
INSERT INTO `jobs` VALUES ('306', '21', '75', 'other', '3', '执行导演', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460614276878');
INSERT INTO `jobs` VALUES ('188', '23', '92', 'actor', '32', '替身', '504', '3k-6k', '550', '集', '', '1345789', '0', '幽默', '0', '聪慧', '0', '萝莉', '185', '22', '55', '我们要做什么呢', '0', '0', '1459845576754');
INSERT INTO `jobs` VALUES ('371', '71', '233', 'actor', '38', '舞者', '502', '0-1k', '552', '场', '', 'ygg', '371', '斯文', '0', '', '0', '', '1m以下', '10-15岁', '60-70kg', 'vv h', '0', '0', '1461049510550');
INSERT INTO `jobs` VALUES ('206', '45', '88', 'other', '25', '男主', '501', '面议', '550', '集', '', '哈哈', '0', '偶像', '0', '本色', '0', '打星', '190', '26', '75', '哈哈', '0', '0', '1459908131006');
INSERT INTO `jobs` VALUES ('377', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049660038');
INSERT INTO `jobs` VALUES ('195', '23', '92', 'actor', '42', '主持人', '507', '15k-20k', '550', '集', '', '神奇效果', '0', '两面', '0', '知性', '0', '', '185', '22', '55', '这种事儿', '0', '0', '1459848141802');
INSERT INTO `jobs` VALUES ('323', '51', '187', 'other', '9', '现场副导', '501', '面议', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460701996637');
INSERT INTO `jobs` VALUES ('279', '45', '173', 'actor', '35', '客串', '503', '1k-3k', '550', '集', '', 'qq', '0', '小清新', '0', '', '0', '', '186', '35', '220', '钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱', '0', '0', '1460339518438');
INSERT INTO `jobs` VALUES ('380', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049661024');
INSERT INTO `jobs` VALUES ('291', '37', '136', 'other', '0', '导演', '501', '面议', '551', '部', '你行你来啊', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460432913432');
INSERT INTO `jobs` VALUES ('292', '37', '136', 'other', '80', '威压', '501', '面议', '552', '场', '23556', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460433025760');
INSERT INTO `jobs` VALUES ('185', '23', '92', 'actor', '33', '特约', '503', '1k-3k', '550', '集', '', '666666', '0', '萝莉', '0', '纯情', '0', '性感', '185', '22', '55', '我们都要好好照顾自己', '0', '0', '1459844479402');
INSERT INTO `jobs` VALUES ('173', '23', '173', 'actor', '33', '特约', '503', '1k-3k', '550', '集', '', '大顺', '0', '打星', '0', '', '0', '', '185', '22', '55', '我们要学会一首好像也门政府的工作了！', '0', '0', '1459840395690');
INSERT INTO `jobs` VALUES ('208', '45', '106', 'actor', '26', '女主', '500', '不限', '550', '集', '', 'zz', '0', '幽默', '0', '苦情', '0', '知性', '168', '25', '45', 'zz', '0', '0', '1459909771188');
INSERT INTO `jobs` VALUES ('212', '21', '44', 'other', '7', '导演助理', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459929592719');
INSERT INTO `jobs` VALUES ('211', '45', '107', 'actor', '28', '女配', '505', '6k-10k', '550', '集', '', 'bb', '0', '偶像', '0', '', '0', '', '160', '25', '45', 'a a', '0', '0', '1459913349368');
INSERT INTO `jobs` VALUES ('198', '3', '102', 'other', '91', '音乐指导', '507', '15k-20k', '553', '日', '说明', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459904961524');
INSERT INTO `jobs` VALUES ('143', '35', '69', 'actor', '32', '男配', '0', '3k-4k', '0', '集', '', '你说了：', '0', '性感', '0', '', '0', '', '258', '25', '258', '你的心', '0', '0', '1459308809510');
INSERT INTO `jobs` VALUES ('171', '27', '94', 'other', '8', '演员副导', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459817379220');
INSERT INTO `jobs` VALUES ('145', '8', '5', 'other', '0', '场记', '0', '不限', '0', '集', 'hdjdjkf', '', '0', '', '0', '', '0', '', '', '', '', '', '1', '1', '1459323420758');
INSERT INTO `jobs` VALUES ('249', '52', '126', 'actor', '26', '女主', '514', '500k以上', '550', '集', '', '镁铝', '355', '性感', '350', '偶像', '356', '小清新', '0-5', '5-10', '15-20', '漂亮流行', '0', '0', '1460081907345');
INSERT INTO `jobs` VALUES ('199', '3', '103', 'other', '67', '化妆师', '505', '6k-10k', '550', '集', '说明', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '1', '1459905291669');
INSERT INTO `jobs` VALUES ('150', '8', '5', 'other', '0', '女配', '0', '不限', '0', '集', '', '哈哈', '0', '打星', '0', '', '0', '', '255', '22', '555', 'j f j f n m f', '0', '0', '1459386892958');
INSERT INTO `jobs` VALUES ('161', '47', '79', 'other', '73', '副美术', '0', '3k-6k-(null)', '0', '集', '要懂得', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459559668957');
INSERT INTO `jobs` VALUES ('310', '21', '75', 'other', '20', '生活制片', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460614380201');
INSERT INTO `jobs` VALUES ('207', '45', '88', 'other', '126', '经纪人', '500', '不限', '550', '集', '哈哈', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459909565288');
INSERT INTO `jobs` VALUES ('209', '45', '107', 'other', '60', '服装师', '506', '10k-15k', '554', '月', 'aa', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459913231768');
INSERT INTO `jobs` VALUES ('210', '45', '107', 'other', '112', '公关', '508', '20k-30k', '550', '集', 'aa', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1459913252260');
INSERT INTO `jobs` VALUES ('274', '29', '133', 'other', '22', '现场制片', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460335241713');
INSERT INTO `jobs` VALUES ('275', '29', '133', 'other', '49', '跟焦员', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460335275437');
INSERT INTO `jobs` VALUES ('276', '29', '133', 'other', '56', '化妆师', '500', '不限', '550', '集', '需要两个人', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460335295488');
INSERT INTO `jobs` VALUES ('277', '29', '133', 'actor', '28', '女配', '500', '不限', '550', '集', '', '姜暮烟', '355', '知性', '0', '', '0', '', '不限', '不限', '不限', '', '0', '0', '1460335358995');
INSERT INTO `jobs` VALUES ('311', '21', '75', 'other', '20', '生活制片', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460614390201');
INSERT INTO `jobs` VALUES ('381', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049661587');
INSERT INTO `jobs` VALUES ('378', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049660854');
INSERT INTO `jobs` VALUES ('379', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049661012');
INSERT INTO `jobs` VALUES ('375', '71', '233', 'actor', '38', '舞者', '502', '0-1k', '552', '场', '', 'ygg', '371', '斯文', '0', '', '0', '', '1m以下', '10-15岁', '60-70kg', 'vv h', '0', '0', '1461049522315');
INSERT INTO `jobs` VALUES ('321', '55', '167', 'other', '5', '场记', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460625822167');
INSERT INTO `jobs` VALUES ('322', '55', '167', 'other', '5', '场记', '500', '不限', '550', '集', '', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460625835605');
INSERT INTO `jobs` VALUES ('324', '51', '132', 'actor', '25', '男主', '501', '面议', '550', '集', '', '卡卡', '363', '大叔', '0', '', '0', '', '1.7-1.8m', '20-30', '60-70kg', '', '0', '0', '1460702072274');
INSERT INTO `jobs` VALUES ('373', '71', '233', 'actor', '38', '舞者', '502', '0-1k', '552', '场', '', 'ygg', '371', '斯文', '0', '', '0', '', '1m以下', '10-15岁', '60-70kg', 'vv h', '0', '0', '1461049518126');
INSERT INTO `jobs` VALUES ('370', '29', '223', 'other', '9', '现场副导', '501', '面议', '550', '集', '哈哈', '', '0', '', '0', '', '0', '', '', '', '', '', '1', '2', '1461031617454');
INSERT INTO `jobs` VALUES ('374', '71', '233', 'actor', '38', '舞者', '502', '0-1k', '552', '场', '', 'ygg', '371', '斯文', '0', '', '0', '', '1m以下', '10-15岁', '60-70kg', 'vv h', '0', '0', '1461049520253');
INSERT INTO `jobs` VALUES ('338', '45', '220', 'other', '0', '现场副导', '500', '不限', '550', '集', 'aa', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460884890354');
INSERT INTO `jobs` VALUES ('339', '45', '220', 'actor', '32', '替身', '503', '1k-3k', '550', '集', '', 'zz', '0', '352', '0', '373', '0', '', '1.7-1.8m', '20-30岁', '50-6kg', 'zzzzzzzzzzzzzzzzzzzzzz', '0', '0', '1460942795748');
INSERT INTO `jobs` VALUES ('340', '45', '173', 'other', '80', '武行', '500', '不限', '550', '集', 'zz', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460943456341');
INSERT INTO `jobs` VALUES ('341', '45', '173', 'other', '0', '现场副导', '500', '不限', '550', '集', 'pp', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460943582963');
INSERT INTO `jobs` VALUES ('357', '23', '93', 'actor', '26', '女主', '503', '1k-3k', '550', '集', '', '123', '0', '小清新', '0', '粗犷', '0', '草根', '1', '22', '33', '007', '0', '0', '1460960178937');
INSERT INTO `jobs` VALUES ('365', '73', '196', 'other', '60', '发型师', '505', '6k-10k', '552', '场', '说明', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1460995758713');
INSERT INTO `jobs` VALUES ('376', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049659926');
INSERT INTO `jobs` VALUES ('366', '73', '196', 'actor', '45', 'DJ', '506', '10k-15k', '553', '日', '', '呵呵', '0', '368', '0', '369', '0', '370', '1m以下', '30-50岁', '60-70kg', '说明', '0', '1', '1461023712513');
INSERT INTO `jobs` VALUES ('364', '75', '226', 'actor', '30', '跟组', '504', '3k-6k', '550', '集', '', '我们', '352', '打星', '356', '刚毅', '361', '反派', '1.2-1.5m', '15-20岁', '50-60kg', '我们要好好学习', '0', '0', '1460979587696');
INSERT INTO `jobs` VALUES ('382', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049661703');
INSERT INTO `jobs` VALUES ('383', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049661834');
INSERT INTO `jobs` VALUES ('384', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049662019');
INSERT INTO `jobs` VALUES ('386', '71', '233', 'other', '0', '导演助理', '503', '1k-3k', '550', '集', '跟哥哥哥哥', '', '0', '', '0', '', '0', '', '', '', '', '', '0', '0', '1461049664697');
INSERT INTO `jobs` VALUES ('387', '71', '233', 'actor', '33', '特约', '509', '30k-50k', '550', '集', '', 'g g g g', '372', '性感', '0', '', '0', '', '1.2-1.5m', '10-15岁', '40-50kg', 'g g g y', '0', '0', '1461049710568');

-- ----------------------------
-- Table structure for jobs_like
-- ----------------------------
DROP TABLE IF EXISTS `jobs_like`;
CREATE TABLE `jobs_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetId` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jobs_like
-- ----------------------------
INSERT INTO `jobs_like` VALUES ('1', '362', '75');
INSERT INTO `jobs_like` VALUES ('3', '360', '23');
INSERT INTO `jobs_like` VALUES ('4', '333', '23');
INSERT INTO `jobs_like` VALUES ('5', '123', '49');
INSERT INTO `jobs_like` VALUES ('6', '156', '49');
INSERT INTO `jobs_like` VALUES ('7', '307', '49');
INSERT INTO `jobs_like` VALUES ('8', '145', '49');
INSERT INTO `jobs_like` VALUES ('11', '7', '73');
INSERT INTO `jobs_like` VALUES ('12', '237', '71');
INSERT INTO `jobs_like` VALUES ('13', '239', '71');
INSERT INTO `jobs_like` VALUES ('20', '28', '57');
INSERT INTO `jobs_like` VALUES ('22', '370', '57');

-- ----------------------------
-- Table structure for jobs_view
-- ----------------------------
DROP TABLE IF EXISTS `jobs_view`;
CREATE TABLE `jobs_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetId` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jobs_view
-- ----------------------------

-- ----------------------------
-- Table structure for jobs_want
-- ----------------------------
DROP TABLE IF EXISTS `jobs_want`;
CREATE TABLE `jobs_want` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `nameC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '职位',
  `name` char(10) NOT NULL DEFAULT '' COMMENT '职位(label)',
  `categoryC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `category` char(10) NOT NULL DEFAULT '' COMMENT '类型(label)',
  `topicC1` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '题材，可选三个',
  `topic1` char(10) NOT NULL DEFAULT '' COMMENT '题材(label)',
  `topicC2` smallint(4) unsigned NOT NULL DEFAULT '0',
  `topic2` char(10) NOT NULL DEFAULT '',
  `topicC3` smallint(4) unsigned NOT NULL DEFAULT '0',
  `topic3` char(10) NOT NULL DEFAULT '',
  `salaryC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '薪资',
  `salary` char(30) NOT NULL DEFAULT '' COMMENT '薪资(label)',
  `salaryUnitC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '薪资单位',
  `salaryUnit` char(20) NOT NULL DEFAULT '',
  `provinceC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `province` char(20) NOT NULL DEFAULT '',
  `siteC` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '期望地点',
  `site` char(15) NOT NULL DEFAULT '' COMMENT '期望地点(label)',
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000' COMMENT '更新时间-毫秒级时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jobs_want
-- ----------------------------
INSERT INTO `jobs_want` VALUES ('1', '1', '61', '男配', '310', '动漫', '0', '爱情', '0', '战争', '0', '喜剧', '0', '5k-10k', '0', '部', '0', '', '101020000', '上海', '1454922942342');
INSERT INTO `jobs_want` VALUES ('4', '3', '54', '群演', '304', '综艺', '0', '爱情', '0', '宫斗', '0', '古装', '0', '5k-10k', '0', '部', '0', '', '101210100', '杭州', '1455965178538');
INSERT INTO `jobs_want` VALUES ('5', '6', '45', '策划', '305', '广告', '0', '喜剧', '0', '生活', '0', '谍战', '0', '5k-10k', '0', '部', '0', '', '101270100', '成都', '1455965402032');
INSERT INTO `jobs_want` VALUES ('6', '7', '61', '摄影', '311', '其他', '0', '喜剧', '0', '剧情', '0', '恶搞', '0', '5k-10k', '0', '部', '0', '', '101190100', '南京', '0000000000000');
INSERT INTO `jobs_want` VALUES ('7', '9', '54', '群演', '306', '舞台剧', '0', '喜剧', '0', '家庭', '0', '', '0', '5k-10k', '0', '部', '0', '', '101200100', '武汉', '0000000000000');
INSERT INTO `jobs_want` VALUES ('8', '15', '45', '男主', '302', '电影', '0', '科幻', '0', '武侠', '0', '', '0', '5k-10k', '0', '部', '0', '', '101110100', '西安', '0000000000000');
INSERT INTO `jobs_want` VALUES ('9', '2', '1', '女配', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101230200', '厦门', '1457848852185');
INSERT INTO `jobs_want` VALUES ('10', '2', '61', '司机', '311', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101250100', '长沙', '1457849001895');
INSERT INTO `jobs_want` VALUES ('11', '1', '61', '男配', '310', '动漫', '0', '爱情', '0', '战争', '0', '喜剧', '0', '5k-10k', '0', '部', '0', '', '101190400', '苏州', '1454922942342');
INSERT INTO `jobs_want` VALUES ('12', '7', '54', '导演', '304', '综艺', '0', '爱情', '0', '宫斗', '0', '古装', '0', '5k-10k', '0', '部', '0', '', '101030000', '天津', '1455965178538');
INSERT INTO `jobs_want` VALUES ('13', '6', '45', '男主', '305', '广告', '0', '喜剧', '0', '生活', '0', '谍战', '0', '5k-10k', '0', '部', '0', '', '101010000', '北京', '1455965402032');
INSERT INTO `jobs_want` VALUES ('14', '12', '61', '摄影', '311', '其他', '0', '喜剧', '0', '剧情', '0', '恶搞', '0', '5k-10k', '0', '部', '0', '', '101020000', '上海', '0000000000000');
INSERT INTO `jobs_want` VALUES ('15', '4', '54', '群演', '306', '舞台剧', '0', '喜剧', '0', '家庭', '0', '', '0', '5k-10k', '0', '部', '0', '', '101280600', '深圳', '0000000000000');
INSERT INTO `jobs_want` VALUES ('16', '14', '45', '男主', '302', '电影', '0', '科幻', '0', '武侠', '0', '', '0', '5k-10k', '0', '部', '0', '', '101280100', '广州', '0000000000000');
INSERT INTO `jobs_want` VALUES ('17', '13', '1', '男配', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101210100', '杭州', '1457848852185');
INSERT INTO `jobs_want` VALUES ('18', '12', '61', '女配', '311', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101270100', '成都', '1457849001895');
INSERT INTO `jobs_want` VALUES ('19', '1', '61', '男配', '310', '动漫', '0', '爱情', '0', '战争', '0', '喜剧', '0', '5k-10k', '0', '部', '0', '', '101190100', '南京', '1454922942342');
INSERT INTO `jobs_want` VALUES ('20', '3', '54', '编剧', '304', '综艺', '0', '爱情', '0', '宫斗', '0', '古装', '0', '5k-10k', '0', '部', '0', '', '101200100', '武汉', '1455965178538');
INSERT INTO `jobs_want` VALUES ('21', '5', '45', '男主', '305', '广告', '0', '喜剧', '0', '生活', '0', '谍战', '0', '5k-10k', '0', '部', '0', '', '101110100', '西安', '1455965402032');
INSERT INTO `jobs_want` VALUES ('22', '5', '61', '摄影', '311', '其他', '0', '喜剧', '0', '剧情', '0', '恶搞', '0', '5k-10k', '0', '部', '0', '', '101230200', '厦门', '0000000000000');
INSERT INTO `jobs_want` VALUES ('23', '7', '54', '编剧', '306', '舞台剧', '0', '喜剧', '0', '家庭', '0', '', '0', '5k-10k', '0', '部', '0', '', '101250100', '长沙', '0000000000000');
INSERT INTO `jobs_want` VALUES ('24', '2', '45', 'DJ', '302', '电影', '0', '科幻', '0', '武侠', '0', '', '0', '5k-10k', '0', '部', '0', '', '101190400', '苏州', '0000000000000');
INSERT INTO `jobs_want` VALUES ('25', '3', '1', '男配', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101030000', '天津', '1457848852185');
INSERT INTO `jobs_want` VALUES ('26', '4', '61', '主持人', '311', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101010000', '北京', '1457849001895');
INSERT INTO `jobs_want` VALUES ('27', '5', '61', '男配', '310', '动漫', '0', '爱情', '0', '战争', '0', '喜剧', '0', '5k-10k', '0', '部', '0', '', '101020000', '上海', '1454922942342');
INSERT INTO `jobs_want` VALUES ('28', '9', '54', '群演', '304', '综艺', '0', '爱情', '0', '宫斗', '0', '古装', '0', '5k-10k', '0', '部', '0', '', '101280600', '深圳', '1455965178538');
INSERT INTO `jobs_want` VALUES ('29', '6', '45', '策划', '305', '广告', '0', '喜剧', '0', '生活', '0', '谍战', '0', '5k-10k', '0', '部', '0', '', '101280100', '广州', '1455965402032');
INSERT INTO `jobs_want` VALUES ('30', '11', '61', '摄影', '311', '其他', '0', '喜剧', '0', '剧情', '0', '恶搞', '0', '5k-10k', '0', '部', '0', '', '101210100', '杭州', '0000000000000');
INSERT INTO `jobs_want` VALUES ('31', '7', '54', '编剧', '306', '舞台剧', '0', '喜剧', '0', '家庭', '0', '', '0', '5k-10k', '0', '部', '0', '', '101270100', '成都', '0000000000000');
INSERT INTO `jobs_want` VALUES ('32', '6', '45', '宣传总监', '302', '电影', '0', '科幻', '0', '武侠', '0', '', '0', '5k-10k', '0', '部', '0', '', '101190100', '南京', '0000000000000');
INSERT INTO `jobs_want` VALUES ('33', '7', '1', '男配', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101200100', '武汉', '1457848852185');
INSERT INTO `jobs_want` VALUES ('34', '8', '61', '女配', '311', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101110100', '西安', '1457849001895');
INSERT INTO `jobs_want` VALUES ('35', '9', '61', '男配', '310', '动漫', '0', '爱情', '0', '战争', '0', '喜剧', '0', '5k-10k', '0', '部', '0', '', '101230200', '厦门', '1454922942342');
INSERT INTO `jobs_want` VALUES ('36', '2', '54', '导演', '304', '综艺', '0', '爱情', '0', '宫斗', '0', '古装', '0', '5k-10k', '0', '部', '0', '', '101250100', '长沙', '1455965178538');
INSERT INTO `jobs_want` VALUES ('37', '6', '45', '男主', '305', '广告', '0', '喜剧', '0', '生活', '0', '谍战', '0', '5k-10k', '0', '部', '0', '', '101190400', '苏州', '1455965402032');
INSERT INTO `jobs_want` VALUES ('38', '3', '61', '主持人', '311', '其他', '0', '喜剧', '0', '剧情', '0', '恶搞', '0', '5k-10k', '0', '部', '0', '', '101030000', '天津', '0000000000000');
INSERT INTO `jobs_want` VALUES ('39', '7', '54', '导演', '306', '舞台剧', '0', '喜剧', '0', '家庭', '0', '', '0', '5k-10k', '0', '部', '0', '', '101010000', '北京', '0000000000000');
INSERT INTO `jobs_want` VALUES ('40', '10', '45', '策划', '302', '电影', '0', '科幻', '0', '武侠', '0', '', '0', '5k-10k', '0', '部', '0', '', '101020000', '上海', '0000000000000');
INSERT INTO `jobs_want` VALUES ('41', '11', '1', '男配', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '101280600', '深圳', '1457848852185');
INSERT INTO `jobs_want` VALUES ('42', '1', '61', '女配', '311', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1457849001895');
INSERT INTO `jobs_want` VALUES ('74', '2', '1', '男配', '1', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1', '地点', '1458281159913');
INSERT INTO `jobs_want` VALUES ('75', '2', '2', '男配2', '1', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '12', '地点2', '1458281205779');
INSERT INTO `jobs_want` VALUES ('107', '23', '0', '特技导演', '7', '网络综艺', '0', '科幻', '0', '', '0', '', '0', '1k-2k', '0', '集', '0', '福建省', '0', '三明市', '1459214432612');
INSERT INTO `jobs_want` VALUES ('108', '29', '2', '导演', '304', '综艺栏目', '403', '家庭', '419', '儿童', '435', '真人秀', '500', '不限', '550', '集', '0', '', '101230200', '厦门', '1459391917452');
INSERT INTO `jobs_want` VALUES ('110', '30', '2', '宣传总监', '305', '广告/MV', '408', '惊悚', '0', '', '0', '', '503', '1k-3k', '550', '集', '0', '', '101110100', '西安', '1459324124022');
INSERT INTO `jobs_want` VALUES ('111', '30', '53', '灯光助理', '309', '网络综艺', '417', '犯罪', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '0', '全国', '1459325220170');
INSERT INTO `jobs_want` VALUES ('112', '30', '8', '演员副导', '311', '其他', '412', '历史', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '101210100', '杭州', '1459325265717');
INSERT INTO `jobs_want` VALUES ('113', '29', '2', '导演', '302', '电影', '435', '真人秀', '420', '宫斗', '411', '战争', '501', '面议', '553', '日', '0', '', '101010000', '北京', '1459392011530');
INSERT INTO `jobs_want` VALUES ('115', '47', '4', '编导', '7', '网络综艺', '0', '喜剧', '0', '', '0', '', '0', '不限', '0', '集', '0', '湖南省', '0', '湘潭市', '1459410914883');
INSERT INTO `jobs_want` VALUES ('116', '23', '2', '副导演', '7', '网络综艺', '0', '家庭', '0', '', '0', '', '0', '6k-10k', '0', '集', '0', '四川省', '0', '资阳市', '1459763992040');
INSERT INTO `jobs_want` VALUES ('117', '30', '6', '编导', '305', '广告/MV', '400', '爱情', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '0', '全国', '1459418238809');
INSERT INTO `jobs_want` VALUES ('119', '39', '6', '场记', '1', '电视剧', '0', '动作', '0', '', '0', '', '0', '500k以上', '0', '场', '0', '湖北省', '0', '神农架', '1459495891281');
INSERT INTO `jobs_want` VALUES ('120', '23', '52', '灯光师', '53', '网络综艺', '0', '家庭 古装', '0', '', '0', '', '2', '20k-30k', '38', '集', '0', '吉林省', '0', '白城市', '1459765741192');
INSERT INTO `jobs_want` VALUES ('121', '23', '59', '置景员', '307', '纪录片/专题片', '0', '家庭 战争', '0', '', '0', '', '504', '3k-6k', '550', '集', '0', '广东省', '0', '深圳市', '1459766494759');
INSERT INTO `jobs_want` VALUES ('122', '23', '99', '调色师', '310', '动漫', '402', '喜剧', '0', '', '0', '', '505', '6k-10k', '550', '集', '0', '江西省', '0', '上饶市', '1459766975630');
INSERT INTO `jobs_want` VALUES ('123', '23', '77', '3D蓝幕', '308', '网络电影', '403', '家庭', '0', '', '0', '', '503', '1k-3k', '550', '集', '0', '江西省', '0', '上饶市', '1459767329874');
INSERT INTO `jobs_want` VALUES ('124', '23', '82', '音乐指导', '309', '网络综艺', '400', '爱情', '0', '', '0', '', '502', '0-1k', '550', '集', '0', '江西省', '0', '上饶市', '1459767488627');
INSERT INTO `jobs_want` VALUES ('125', '23', '3', '执行导演', '49', '广告/MV', '403', '家庭', '0', '', '0', '', '3', '10k-15k', '38', '集', '0', '吉林省', '506', '白城市', '1460343003290');
INSERT INTO `jobs_want` VALUES ('126', '23', '68', '分镜原画', '309', '网络综艺', '403', '家庭', '0', '', '0', '', '503', '1k-3k', '550', '集', '0', '广东省', '0', '湛江市', '1459821465589');
INSERT INTO `jobs_want` VALUES ('128', '23', '66', '副美术', '306', '舞台剧', '407', '古装', '411', '战争', '415', '奇幻', '504', '3k-6k', '550', '集', '0', '福建省', '0', '三明市', '1459823056513');
INSERT INTO `jobs_want` VALUES ('129', '23', '79', '爆破', '52', '网络电影', '402', '喜剧', '406', '武侠', '410', '悬疑', '2', '3k-6k', '38', '集', '0', '台湾省', '504', '台湾省', '1460704421061');
INSERT INTO `jobs_want` VALUES ('134', '39', '8', '演员副导', '307', '纪录片/专题片', '0', '动作', '0', '', '0', '', '500', '不限', '550', '集', '32767', '黑龙江', '101050100', '哈尔滨', '1459850982490');
INSERT INTO `jobs_want` VALUES ('152', '25', '2', '导演', '307', '纪录片/专题片', '411', '战争', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '0', '全国', '1459932799522');
INSERT INTO `jobs_want` VALUES ('156', '51', '2', '导演', '308', '网络电影', '407', '古装', '0', '', '0', '', '514', '500k以上', '550', '集', '0', '', '101010000', '北京', '1459996854708');
INSERT INTO `jobs_want` VALUES ('157', '25', '8', '演员副导', '303', '电视剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997419804');
INSERT INTO `jobs_want` VALUES ('158', '25', '4', '副导演', '311', '其他', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997434589');
INSERT INTO `jobs_want` VALUES ('159', '25', '23', '制片助理', '309', '网络综艺', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997442229');
INSERT INTO `jobs_want` VALUES ('160', '25', '25', '男主', '306', '舞台剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997453784');
INSERT INTO `jobs_want` VALUES ('161', '25', '80', '舞台特效', '306', '舞台剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997462913');
INSERT INTO `jobs_want` VALUES ('162', '25', '91', '收音员', '301', '网络剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997481161');
INSERT INTO `jobs_want` VALUES ('163', '25', '111', '司机', '300', '不限', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997493387');
INSERT INTO `jobs_want` VALUES ('164', '25', '62', '发型师', '305', '广告/MV', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997501117');
INSERT INTO `jobs_want` VALUES ('165', '25', '120', '经纪人', '306', '舞台剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997510153');
INSERT INTO `jobs_want` VALUES ('166', '25', '6', '编导', '301', '网络剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997536048');
INSERT INTO `jobs_want` VALUES ('167', '25', '98', '字幕对白', '303', '电视剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997559344');
INSERT INTO `jobs_want` VALUES ('168', '25', '69', '舞美设计', '308', '网络电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997593343');
INSERT INTO `jobs_want` VALUES ('169', '25', '5', '场记', '300', '不限', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997603579');
INSERT INTO `jobs_want` VALUES ('170', '25', '42', '主持人', '310', '动漫', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997626523');
INSERT INTO `jobs_want` VALUES ('171', '25', '5', '场记', '305', '广告/MV', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1459997635695');
INSERT INTO `jobs_want` VALUES ('174', '52', '26', '女主', '302', '电影', '400', '爱情', '404', '音乐', '402', '喜剧', '514', '500k以上', '550', '集', '0', '', '0', '全国', '1460086596238');
INSERT INTO `jobs_want` VALUES ('175', '29', '23', '制片助理', '311', '现在活动', '415', '奇幻', '0', '', '0', '', '502', '0-1k', '550', '集', '0', '', '101280100', '广州', '1460090021561');
INSERT INTO `jobs_want` VALUES ('193', '25', '3', '执行导演', '308', '网络电影', '405', '动作', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '0', '', '1460103083122');
INSERT INTO `jobs_want` VALUES ('194', '52', '9', '现场副导', '308', '网络电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1460103198140');
INSERT INTO `jobs_want` VALUES ('195', '52', '35', '客串', '309', '网络综艺', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1460103222596');
INSERT INTO `jobs_want` VALUES ('204', '37', '26', '女主', '46', '电影', '400', '爱情', '406', '武侠', '417', '犯罪', '2', '面议', '39', '部', '0', '全国', '0', '全国', '1460347053794');
INSERT INTO `jobs_want` VALUES ('205', '25', '25', '男主', '300', '不限', '415', '奇幻', '0', '', '0', '', '503', '1k-3k', '550', '集', '0', '', '101010000', '北京', '1460345038196');
INSERT INTO `jobs_want` VALUES ('206', '25', '25', '男主', '300', '不限', '400', '爱情', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '101190100', '南京', '1460346062468');
INSERT INTO `jobs_want` VALUES ('207', '37', '87', '配音师', '54', '动漫', '0', '二次元', '0', '', '0', '', '3', '1k-3k', '38', '集', '0', '全国', '0', '全国', '1460347057907');
INSERT INTO `jobs_want` VALUES ('208', '28', '2', '导演', '302', '电影', '402', '喜剧', '403', '家庭', '404', '音乐', '502', '0-1k', '552', '场', '0', '', '101280100', '广州', '1460354598175');
INSERT INTO `jobs_want` VALUES ('213', '63', '27', '男配', '304', '综艺栏目', '409', '冒险', '408', '惊悚', '410', '悬疑', '514', '500k以上', '550', '集', '0', '', '101230200', '厦门', '1460425329184');
INSERT INTO `jobs_want` VALUES ('219', '21', '9', '现场副导', '301', '网络剧', '425', '选秀', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '101180200', '安阳', '1460431447439');
INSERT INTO `jobs_want` VALUES ('220', '66', '5', '司机', '307', '纪录片/专题片', '0', '动作', '0', '', '0', '', '502', '0-1k', '550', '集', '32767', '黑龙江', '101050100', '哈尔滨', '1460453702291');
INSERT INTO `jobs_want` VALUES ('221', '55', '6', '舞者', '311', '现在活动', '409', '冒险', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '101230200', '厦门', '1460527237359');
INSERT INTO `jobs_want` VALUES ('222', '57', '2', '导演', '302', '电影', '410', '悬疑', '424', '商战', '0', '', '514', '500k以上', '550', '集', '0', '', '101010000', '北京', '1460531477680');
INSERT INTO `jobs_want` VALUES ('223', '45', '2', '导演', '302', '电影', '0', '爱情', '0', '', '0', '', '501', '面议', '550', '集', '32767', '北京', '101010000', '北京', '1460531540259');
INSERT INTO `jobs_want` VALUES ('224', '45', '11', '监制', '303', '电视剧', '0', '新闻', '0', '', '0', '', '500', '不限', '550', '集', '0', '全国', '0', '全国', '1460531591728');
INSERT INTO `jobs_want` VALUES ('227', '29', '9', '现场副导', '311', '现场活动', '404', '音乐', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '1460682951535');
INSERT INTO `jobs_want` VALUES ('228', '28', '11', '监制', '309', '网络综艺', '0', '', '0', '', '0', '', '502', '0-1k', '550', '集', '0', '', '101210100', '杭州', '1460684096548');
INSERT INTO `jobs_want` VALUES ('229', '51', '9', '现场副导', '309', '网络综艺', '419', '儿童', '415', '奇幻', '0', '', '503', '1k-3k', '551', '部', '0', '', '0', '全国', '1460700176799');
INSERT INTO `jobs_want` VALUES ('230', '73', '29', '儿童', '46', '电影', '0', '古装', '0', '', '0', '', '3', '10k-15k', '41', '日', '80', '北京', '80', '北京', '1460742305883');
INSERT INTO `jobs_want` VALUES ('231', '73', '56', '化妆师', '310', '动漫', '423', '乡村', '424', '商战', '427', '新闻', '505', '6k-10k', '550', '集', '32767', '辽宁', '101070100', '沈阳', '1460742436799');
INSERT INTO `jobs_want` VALUES ('234', '45', '19', '制片主任', '302', '电影', '0', '爱情', '0', '', '0', '', '500', '不限', '550', '集', '0', '全国', '0', '全国', '1460945317216');
INSERT INTO `jobs_want` VALUES ('235', '21', '8', '演员副导', '308', '网络电影', '416', '励志', '0', '', '0', '', '500', '不限', '550', '集', '0', '', '0', '', '1460945669906');
INSERT INTO `jobs_want` VALUES ('237', '73', '62', '发型师', '304', '综艺栏目', '408', '惊悚', '409', '冒险', '414', '科幻', '504', '3k-6k', '552', '场', '65535', '浙江', '101210100', '杭州', '1460995818186');
INSERT INTO `jobs_want` VALUES ('239', '49', '8', '演员副导', '310', '动漫', '0', '冒险', '0', '', '0', '', '503', '1k-3k', '550', '集', '65535', '天津', '101030000', '天津', '1461033704652');

-- ----------------------------
-- Table structure for my_works
-- ----------------------------
DROP TABLE IF EXISTS `my_works`;
CREATE TABLE `my_works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '作品名称',
  `categoryC` smallint(4) NOT NULL DEFAULT '0' COMMENT '作品类型',
  `category` char(20) NOT NULL DEFAULT '',
  `role` char(20) NOT NULL DEFAULT '' COMMENT '角色',
  `time` char(20) NOT NULL DEFAULT '' COMMENT '时间',
  `link` varchar(30) NOT NULL DEFAULT '' COMMENT '相关链接',
  `avatar` varchar(40) NOT NULL DEFAULT '' COMMENT '封面',
  `uid` int(11) NOT NULL DEFAULT '0',
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of my_works
-- ----------------------------
INSERT INTO `my_works` VALUES ('1', '神雕侠侣', '0', '电视剧', '男主', '2006年', '', 'worksCover/shenDiaoXiaLv.jpg', '1', '0000000000000');
INSERT INTO `my_works` VALUES ('2', '苹果', '0', '电影', '女主', '2007年', '', 'worksCover/', '3', '0000000000000');
INSERT INTO `my_works` VALUES ('3', '喋血双雄', '0', '电影', '男主', '1989年', '', 'worksCover', '6', '0000000000000');
INSERT INTO `my_works` VALUES ('4', '你是我兄弟', '0', '电视剧', '男主', '2011年', '', 'worksCover', '7', '0000000000000');
INSERT INTO `my_works` VALUES ('5', '中国合伙人', '0', '电影', '男主', '', '', 'worksCover/heHuoRen.jpg', '1', '0000000000000');
INSERT INTO `my_works` VALUES ('6', '大汉天子', '0', '电视剧', '男主', '', '', 'worksCover/daHanTianZi.jpg', '1', '0000000000000');
INSERT INTO `my_works` VALUES ('7', '风声', '0', '电影', '男主', '', '', 'worksCover/fengSheng.jpg', '1', '0000000000000');
INSERT INTO `my_works` VALUES ('53', '换个名称Vol K', '0', '综艺栏目', '角色加个修改', '2015', 'www. lianjie. com', 'worksCover/201603250849032558.jpg', '25', '1458895785798');
INSERT INTO `my_works` VALUES ('66', '《这种事情怎么会有这么》', '9', '动漫', '演员', '2586年', '5697236', '', '23', '1458558006079');
INSERT INTO `my_works` VALUES ('67', '《童模》', '7', '网络综艺', '256966', '5536年', '566966', '', '23', '1458558321486');
INSERT INTO `my_works` VALUES ('68', '《但没人》', '4', '舞台剧', '演员', '2580年', '55555999666', '', '23', '1458558910749');
INSERT INTO `my_works` VALUES ('69', '《mo l l k l》', '3', '广告/MV', '演员', '2589年', '126669', '', '23', '1458559222493');
INSERT INTO `my_works` VALUES ('70', '《我们是有限》', '6', '网络电影', '演员', '1236年', '12336955', '', '23', '1458559447833');
INSERT INTO `my_works` VALUES ('71', '《我们就》', '6', '网络电影', '演员', '2259年', '558966666', '', '23', '1458559594475');
INSERT INTO `my_works` VALUES ('72', '《我们要在这个城市》', '5', '纪录片/专题片', '演员', '1236年', '5569855', '', '23', '1458560574988');
INSERT INTO `my_works` VALUES ('73', '《我们要去哪里》', '2', '综艺栏目', '演员', '2258年', '23655', '', '23', '1458560889126');
INSERT INTO `my_works` VALUES ('74', '《演员人气排名》', '2', '综艺栏目', '演员', '2222年', '44444444', '', '23', '1458561178429');
INSERT INTO `my_works` VALUES ('75', '《5566》', '6', '网络电影', '演员', '5569年', '5625589', '', '23', '1458561406084');
INSERT INTO `my_works` VALUES ('76', '《但》', '6', '网络电影', '演员', '5566年', 'o o o', '', '23', '1458561638668');
INSERT INTO `my_works` VALUES ('77', '《还要》', '6', '网络电影', '演员', '2695年', '2695', '', '23', '1458561795888');
INSERT INTO `my_works` VALUES ('78', '《bnlo》', '10', '不限', '演员', '6513年', '15669955588', '', '23', '1458561902620');
INSERT INTO `my_works` VALUES ('79', '《11111111》', '3', '广告/MV', '演员', '1233年', '596655555555', '', '23', '1458562039587');
INSERT INTO `my_works` VALUES ('80', '《我们在ba ba》', '2', '综艺栏目', '演员', '2222年', 'bbc de', '', '23', '1458562152941');
INSERT INTO `my_works` VALUES ('81', '《我们要做什么》', '5', '纪录片/专题片', '演员', '1236年', '1255855……', '', '23', '1458562892000');
INSERT INTO `my_works` VALUES ('82', '《25655552》', '5', '纪录片/专题片', '演员', '2236年', '555696', '', '23', '1458563074374');
INSERT INTO `my_works` VALUES ('83', '《我们在这里说》', '6', '网络电影', '演员', '5555年', '55698856', '', '5', '1458569057925');
INSERT INTO `my_works` VALUES ('84', '《我们就可以》', '5', '纪录片/专题片', '演员', '0007年', '5369712', '', '23', '1458571851631');
INSERT INTO `my_works` VALUES ('85', '《我们》', '8', '网络剧', '演员', '6666年', 'www.baidu.com', '', '23', '1458711040161');
INSERT INTO `my_works` VALUES ('86', 'HTML', '304', '综艺栏目', '女主', '2015', '', 'worksCover/201603250822032722.jpg', '27', '1458894136939');
INSERT INTO `my_works` VALUES ('87', '舞者', '310', '动漫', '旅进旅退因为我们可口可乐了看看', '2555', '55556555555', 'worksCover/201603250832032579.jpg', '25', '1458894741079');
INSERT INTO `my_works` VALUES ('88', '《今天》', '4', '舞台剧', '今天', '1345年', '124567', '', '23', '1459240941419');
INSERT INTO `my_works` VALUES ('89', '《Vghhgg》', '3', '广告/MV', 'Rtyy', '2345年', 'Wthhfd', '', '23', '1459242254581');
INSERT INTO `my_works` VALUES ('90', '《Wryhgfd》', '8', '网络剧', 'Gffghu', '1233年', 'Wethihf', '', '23', '1459242968566');
INSERT INTO `my_works` VALUES ('91', '《吊打小学生》', '5', '纪录片/专题片', '演员', '2015年', '533695', '', '23', '1459316112712');
INSERT INTO `my_works` VALUES ('92', '《999996》', '7', '网络综艺', '演员', '2016年', '2252222222', 'album/201603300521032357.jpg', '23', '1459327197689');
INSERT INTO `my_works` VALUES ('93', '《神话》', '6', '网络电影', '演员', '1236年', '2266985536', 'worksCover/20160330094903233.jpg', '23', '1459331381694');
INSERT INTO `my_works` VALUES ('94', '地方', '303', '电视剧', '看不到', '2015', '急急急', 'album/201603280743032545.jpg', '25', '1459411467482');
INSERT INTO `my_works` VALUES ('95', 'QQ', '301', '网络剧', '测试', '2015', '', '', '30', '1459417136384');
INSERT INTO `my_works` VALUES ('96', '《9527》', '2', '综艺栏目', '演员', '2015年', '1233698', '', '23', '1459507190461');
INSERT INTO `my_works` VALUES ('97', '《520》', '6', '网络电影', '演员', '1236年', '12365', '', '23', '1459507424398');
INSERT INTO `my_works` VALUES ('98', '《无语》', '2', '综艺栏目', '演员', '1236年', '1589636', 'album/201603300815032319.jpg', '23', '1459507918900');
INSERT INTO `my_works` VALUES ('99', '花千骨', '301', '网络剧', '导演', '2016', 'www.baidu.com/gffddscbniijgdcb', '', '29', '1459847740750');
INSERT INTO `my_works` VALUES ('100', '得到', '304', '综艺栏目', '得', '2045', '', '', '25', '1459993813659');
INSERT INTO `my_works` VALUES ('101', '花白骨', '309', '网络综艺', '必须是女主！', '1980', 'www.woaini.com', 'worksCover/201604071149045115.jpg', '51', '1460029766048');
INSERT INTO `my_works` VALUES ('102', '公交车好挤', '311', '现在活动', '我站着', '2018', '怎么可以这样子', 'worksCover/201604071151045191.jpg', '51', '1460029877776');
INSERT INTO `my_works` VALUES ('103', '《啦啦啦啦》', '7', '网络综艺', '啦啦', '2012年', 'errrrrrr', 'worksCover/201604080810042614.jpg', '26', '1460103045205');
INSERT INTO `my_works` VALUES ('104', '《出来了》', '7', '网络综艺', '啦啦啦', '2012年', 'ffhhgbjj', 'worksCover/201604080810042614.jpg', '26', '1460103435951');
INSERT INTO `my_works` VALUES ('106', '老咯', '303', '电视剧', '女主', '2044', 'lol', 'worksCover/20160408095004527.jpg', '52', '1460109053078');
INSERT INTO `my_works` VALUES ('107', '德', '302', '电影', '喔喔哦', '22', 'ooxxmm', 'worksCover/201604080954045241.jpg', '52', '1460109288715');
INSERT INTO `my_works` VALUES ('108', '《斯里兰卡了》', '7', '网络综艺', '主演', '2014年', 'https://m.douban.com/group/top', 'worksCover/201604110118044752.jpg', '47', '1460337580214');
INSERT INTO `my_works` VALUES ('109', '《斯里兰卡了》', '7', '网络综艺', '主演', '2014年', 'https://m.douban.com/group/top', 'worksCover/201604110118044752.jpg', '47', '1460337580214');
INSERT INTO `my_works` VALUES ('125', 'all', '307', '纪录片/专题片', '推荐', '55', '看看', 'worksCover/201604130705045776.jpg', '57', '1460531117820');
INSERT INTO `my_works` VALUES ('127', '哈哈', '302', '电影', '主演', '2015', '', 'worksCover/201604130841042914.jpg', '29', '1460536871536');
INSERT INTO `my_works` VALUES ('129', '《丁庆小朋友》', '3', '广告/MV', '演员', '2016年', '12583398', 'worksCover/201604140356047329.jpg', '73', '1460606217879');
INSERT INTO `my_works` VALUES ('130', '《在线》', '7', '网络综艺', '演员', '1236年', '1236955', 'worksCover/201604140400047322.jpg', '73', '1460606451000');
INSERT INTO `my_works` VALUES ('131', '《今天》', '10', '现场活动', '演员', '1259年', '666666', 'worksCover/201604140440047379.jpg', '73', '1460608832845');
INSERT INTO `my_works` VALUES ('132', '《Qqqqqq》', '6', '网络电影', 'Qwer', '1234年', '123445', 'album/201603290831032319.jpg', '23', '1460609210333');
INSERT INTO `my_works` VALUES ('133', '《丁庆兄弟》', '6', '网络电影', '演员', '1236年', '123654', 'worksCover/201604140503047383.jpg', '73', '1460610228931');
INSERT INTO `my_works` VALUES ('134', '《Qwqwqw》', '7', '网络综艺', '22222', '2222年', '2222222', 'album/201603290857032329.jpg', '23', '1460611997390');
INSERT INTO `my_works` VALUES ('135', '《大炮》', '8', '网络剧', '大炮女神', '1236年', '159966', 'album/201604140500047351.jpg', '73', '1460612174616');
INSERT INTO `my_works` VALUES ('136', '笨蛋', '308', '网络电影', '大葱', '2016', '', 'avatar/201604080302044973.jpg', '49', '1460616934787');
INSERT INTO `my_works` VALUES ('137', '笨笨', '308', '网络电影', '本号', '2048', '', 'album/20160412034904499.jpg', '49', '1460621372242');
INSERT INTO `my_works` VALUES ('138', '《秘密》', '1', '电视剧', '女主', '2016年', '暂无', 'worksCover/20160417072804373.jpg', '37', '1460878135162');
INSERT INTO `my_works` VALUES ('139', '《你好》', '6', '网络电影', '导演', '2016年', '暂无', 'worksCover/201604170735043729.jpg', '37', '1460878517792');
INSERT INTO `my_works` VALUES ('140', '《早安》', '0', '电影', '女主', '2014年', '暂无', 'worksCover/201604170735043729.jpg', '37', '1460878564670');
INSERT INTO `my_works` VALUES ('141', '《神话》', '6', '网络电影', '演员', '2016年', '134556', 'worksCover/201604180149042343.jpg', '23', '1460944194138');
INSERT INTO `my_works` VALUES ('142', '《a a》', '1', '电视剧', 'a a', '2015年', 'www.baidu.com', 'worksCover/201604180201044525.jpg', '45', '1460945100247');
INSERT INTO `my_works` VALUES ('143', '《z z》', '10', '现场活动', 'z z', '2015年', 'z z', 'operaCover/201604140301044549.jpg', '45', '1460945220396');
INSERT INTO `my_works` VALUES ('144', '《神话》', '7', '网络综艺', '演员', '1355年', '24577', 'worksCover/201604180207042369.jpg', '23', '1460945278616');
INSERT INTO `my_works` VALUES ('145', '《z z》', '5', '纪录片/专题片', 'z z', '2014年', 'z z', 'operaCover/201604170921044522.jpg', '45', '1460945379137');
INSERT INTO `my_works` VALUES ('146', '《11》', '7', '网络综艺', '11', '2105年', '11', 'album/201604180211044583.jpg', '45', '1460945534417');
INSERT INTO `my_works` VALUES ('147', '《a a》', '0', '电影', 'a w', '3333年', 'aw', 'album/201604180211044542.jpg', '45', '1460950848822');
INSERT INTO `my_works` VALUES ('148', '《没空间了》', '6', '网络电影', '来来来', '555年', '啦啦啦啦', 'worksCover/201604181201042655.jpg', '26', '1460952109781');
INSERT INTO `my_works` VALUES ('149', '《赵子龙》', '1', '电视剧', '演员', '2014年', '1234567', 'worksCover/201604191140047594.jpg', '75', '1461037247264');
INSERT INTO `my_works` VALUES ('150', '《赵子龙》', '1', '电视剧', '演员', '1345年', '2356778', 'worksCover/201604191156047573.jpg', '75', '1461038215248');
INSERT INTO `my_works` VALUES ('151', '后来', '304', '综艺栏目', '图', '2018', '', 'worksCover/201604190225045776.jpg', '57', '1461047117396');

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `updTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news_comment
-- ----------------------------
INSERT INTO `news_comment` VALUES ('23', '19', '好评', '8', '2016-03-25 01:05:52');
INSERT INTO `news_comment` VALUES ('42', '17', '原来是这样……', '29', '2016-03-25 01:05:52');
INSERT INTO `news_comment` VALUES ('46', '18', '这样啊', '29', '2016-03-25 01:05:52');
INSERT INTO `news_comment` VALUES ('50', '19', '所以是论明星发家史吗。哈哈', '29', '2016-03-29 10:32:50');
INSERT INTO `news_comment` VALUES ('58', '24', 'QQ', '30', '2016-03-30 03:56:09');
INSERT INTO `news_comment` VALUES ('61', '24', 'hello', '30', '2016-03-31 07:26:42');
INSERT INTO `news_comment` VALUES ('65', '19', '除非加肥加大几点结束经济上双卡苦中苦走开走开走开手机自己在家', '30', '2016-04-01 09:48:07');
INSERT INTO `news_comment` VALUES ('68', '17', '哈哈', '45', '2016-04-06 10:08:06');
INSERT INTO `news_comment` VALUES ('70', '18', '哈哈', '45', '2016-04-06 10:10:28');
INSERT INTO `news_comment` VALUES ('71', '20', '哈哈', '45', '2016-04-06 10:11:00');
INSERT INTO `news_comment` VALUES ('72', '24', '哈哈', '45', '2016-04-06 10:11:23');
INSERT INTO `news_comment` VALUES ('73', '25', '哈哈', '45', '2016-04-06 10:11:35');
INSERT INTO `news_comment` VALUES ('74', '26', '哈哈', '45', '2016-04-06 10:11:58');
INSERT INTO `news_comment` VALUES ('75', '27', '哈哈', '45', '2016-04-06 10:12:27');
INSERT INTO `news_comment` VALUES ('76', '28', '哈哈', '45', '2016-04-06 10:12:47');
INSERT INTO `news_comment` VALUES ('79', '28', '4哈哈', '51', '2016-04-07 10:42:43');
INSERT INTO `news_comment` VALUES ('80', '28', '哈哈', '29', '2016-04-07 11:06:18');
INSERT INTO `news_comment` VALUES ('82', '25', '啦啦操', '51', '2016-04-08 07:53:11');
INSERT INTO `news_comment` VALUES ('84', '24', '我', '50', '2016-04-08 08:18:25');
INSERT INTO `news_comment` VALUES ('85', '24', '哈喽', '50', '2016-04-08 08:18:39');
INSERT INTO `news_comment` VALUES ('86', '25', '在', '8', '2016-04-08 09:46:01');
INSERT INTO `news_comment` VALUES ('87', '29', '原来如此', '29', '2016-04-10 10:01:58');
INSERT INTO `news_comment` VALUES ('88', '29', '哈哈', '29', '2016-04-10 10:02:04');
INSERT INTO `news_comment` VALUES ('89', '25', '哈哈哈~', '51', '2016-04-11 08:11:46');
INSERT INTO `news_comment` VALUES ('90', '29', '哈哈', '51', '2016-04-11 08:28:19');
INSERT INTO `news_comment` VALUES ('91', '20', '小笨', '49', '2016-04-12 12:11:46');
INSERT INTO `news_comment` VALUES ('92', '17', '哦兔兔', '49', '2016-04-13 08:14:46');
INSERT INTO `news_comment` VALUES ('93', '20', '66', '23', '2016-04-12 08:23:46');
INSERT INTO `news_comment` VALUES ('94', '36', 'hh', '45', '2016-04-12 09:11:46');
INSERT INTO `news_comment` VALUES ('95', '35', '我', '63', '2016-04-13 11:18:45');
INSERT INTO `news_comment` VALUES ('96', '40', '一样一样咿呀咿呀哟', '28', '2016-04-18 01:31:33');
INSERT INTO `news_comment` VALUES ('97', '17', 'zz', '45', '2016-04-18 01:33:06');
INSERT INTO `news_comment` VALUES ('98', '17', 'test', '37', '2016-04-18 02:00:08');
INSERT INTO `news_comment` VALUES ('99', '40', '期待', '29', '2016-04-18 02:07:07');
INSERT INTO `news_comment` VALUES ('100', '43', '测试', '49', '2016-04-18 02:12:26');
INSERT INTO `news_comment` VALUES ('101', '27', '测试', '49', '2016-04-18 02:13:06');
INSERT INTO `news_comment` VALUES ('102', '43', '测试', '49', '2016-04-18 02:14:31');
INSERT INTO `news_comment` VALUES ('103', '43', '我们', '23', '2016-04-18 02:25:37');
INSERT INTO `news_comment` VALUES ('104', '18', '啊噢', '23', '2016-04-18 12:35:25');
INSERT INTO `news_comment` VALUES ('105', '18', '啊噢', '23', '2016-04-18 12:35:28');
INSERT INTO `news_comment` VALUES ('106', '27', '呵呵', '73', '2016-04-19 07:49:40');
INSERT INTO `news_comment` VALUES ('107', '43', 'fff', '73', '2016-04-20 10:51:40');
INSERT INTO `news_comment` VALUES ('108', '43', 'ddd', '73', '2016-04-20 10:56:09');
INSERT INTO `news_comment` VALUES ('109', '43', 'sssssss', '73', '2016-04-20 10:56:46');
INSERT INTO `news_comment` VALUES ('110', '43', 'fff', '73', '2016-04-20 11:04:30');
INSERT INTO `news_comment` VALUES ('111', '43', 'ffff', '73', '2016-04-20 11:05:36');
INSERT INTO `news_comment` VALUES ('112', '43', 'fgggggfg', '73', '2016-04-20 11:13:47');

-- ----------------------------
-- Table structure for news_like
-- ----------------------------
DROP TABLE IF EXISTS `news_like`;
CREATE TABLE `news_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `updTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news_like
-- ----------------------------
INSERT INTO `news_like` VALUES ('134', '18', '30', '1459473864');
INSERT INTO `news_like` VALUES ('135', '26', '30', '1459473871');
INSERT INTO `news_like` VALUES ('137', '17', '30', '1459475832');
INSERT INTO `news_like` VALUES ('163', '43', '29', '1461050422');

-- ----------------------------
-- Table structure for notify_set
-- ----------------------------
DROP TABLE IF EXISTS `notify_set`;
CREATE TABLE `notify_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(15) NOT NULL DEFAULT '' COMMENT 'likeMe/viewedMe/newPub',
  `val` char(15) NOT NULL DEFAULT '' COMMENT 'now/day/week',
  `uid` int(11) NOT NULL,
  `updTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notify_set
-- ----------------------------
INSERT INTO `notify_set` VALUES ('1', 'likeMe', 'now', '2', '1458035244');
INSERT INTO `notify_set` VALUES ('2', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('3', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('4', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('5', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('6', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('7', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('8', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('9', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('10', 'viewedMe', 'day', '47', '1459423728');
INSERT INTO `notify_set` VALUES ('11', 'newPub', 'week', '39', '1460110627');
INSERT INTO `notify_set` VALUES ('12', 'likeMe', 'now', '35', '1460030946');
INSERT INTO `notify_set` VALUES ('13', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('14', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('15', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('16', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('17', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('18', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('19', 'newPub', 'week', '26', '1460105477');
INSERT INTO `notify_set` VALUES ('20', 'likeMe', 'now', '26', '1460105480');
INSERT INTO `notify_set` VALUES ('21', 'viewedMe', 'day', '26', '1460105482');
INSERT INTO `notify_set` VALUES ('22', 'newPub', 'week', '39', '1460110627');
INSERT INTO `notify_set` VALUES ('23', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('24', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('25', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('26', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('27', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('28', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('29', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('30', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('31', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('32', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('33', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('34', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('35', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('36', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('37', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('38', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('39', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('40', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('41', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('42', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('43', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('44', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('45', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('46', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('47', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('48', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('49', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('50', 'viewedMe', 'day', '23', '1460690183');
INSERT INTO `notify_set` VALUES ('51', 'likeMe', 'now', '37', '1460878255');

-- ----------------------------
-- Table structure for operas
-- ----------------------------
DROP TABLE IF EXISTS `operas`;
CREATE TABLE `operas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) NOT NULL COMMENT '用户ID',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '剧目名称',
  `invest` char(20) NOT NULL DEFAULT '' COMMENT '总投资',
  `categoryC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型(code,后续可类比)',
  `category` char(20) NOT NULL DEFAULT '' COMMENT '类型(label)',
  `topicC1` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '题材，可选三个',
  `topic1` char(20) NOT NULL DEFAULT '',
  `topicC2` smallint(4) unsigned NOT NULL DEFAULT '0',
  `topic2` char(20) NOT NULL DEFAULT '',
  `topicC3` smallint(4) unsigned NOT NULL DEFAULT '0',
  `topic3` char(20) NOT NULL DEFAULT '',
  `provinceC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '省',
  `province` char(20) NOT NULL DEFAULT '',
  `siteC` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '地点',
  `site` char(20) NOT NULL DEFAULT '',
  `startTimeC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '开机时间',
  `startTime` char(20) NOT NULL DEFAULT '',
  `periodC` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '拍摄周期',
  `period` char(20) NOT NULL DEFAULT '',
  `runTime` char(20) NOT NULL DEFAULT '' COMMENT '片长',
  `outline` varchar(200) NOT NULL DEFAULT '' COMMENT '大纲',
  `producer` char(20) NOT NULL DEFAULT '' COMMENT '制片方',
  `creator` varchar(30) NOT NULL DEFAULT '' COMMENT '主创',
  `platform` char(20) NOT NULL DEFAULT '' COMMENT '播放平台',
  `cover` varchar(40) NOT NULL DEFAULT '' COMMENT '封面文件路径',
  `jobsNum` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '职位数',
  `completeDegree` float NOT NULL DEFAULT '0' COMMENT '资料完成度',
  `pubStatus` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `nameL` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of operas
-- ----------------------------
INSERT INTO `operas` VALUES ('1', '9', '花千骨', '40万', '301', '电视剧', '0', '爱情', '400', '仙侠', '0', '动作', '0', '', '101020000', '上海', '650', '1个月内开机', '702', '1个月', '40min*30', '花千骨，出生时命格诡异、坚强善良的孤女，被长留上仙白子画花千骨花千骨下山历练所救，对他暗生情愫；白子画，身负重任，一心想保护天下苍生的长留掌门，明知花千骨是自己生死劫，非但不忍杀生反救花千骨一命。', '出品方', '主创', '爱奇艺', 'operaCover/huaQianGu.jpg', '5', '0.17', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('2', '5', '剑雨', '100万', '311', '电影', '0', '励志', '416', '励志', '0', '动作', '0', '', '101280600', '深圳', '651', '1-3个月开机', '702', '1个月', '40min*30', '大纲', '出品方', '主创', '爱奇艺', '', '3', '0.8', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('3', '4', '卧虎藏龙', '1.5亿', '310', '动漫', '0', '动作', '405', '动作', '0', '动作', '0', '', '101280100', '广州', '652', '3-6个月开机', '704', '3-6个月', '40min*30', '大纲', '出品方', '主创', '优酷', '封面路径', '2', '0.8', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('4', '2', '老炮儿', '1亿', '303', '电影', '0', '冒险', '409', '冒险', '0', '动作', '0', '', '101210100', '杭州', '653', '6个月以内', '702', '1个月', '40min*30', '大纲', '出品方', '主创', '爱奇艺', 'operaCover/huaQianGu.jpg', '1', '0.7', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('5', '8', '美人鱼', '8000万', '302', '电影', '0', '魔幻', '417', '魔幻', '0', '动作', '0', '', '101270100', '成都', '654', '6个月以上', '705', '6个月以上', '40min*30', '大纲', '出品方', '主创', '快播', '封面路径', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('219', '37', '海浪', '2000万', '302', '电影', '408', '惊悚', '0', '', '0', '', '32767', '云南', '101290100', '昆明', '0', '3-6个月内', '0', '6个月以上', '120mins', '北欧第一部灾难片', '北欧', '北欧', 'B站', 'operaCover/201604170738043787.jpg', '1', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('166', '63', '印囧', '100万', '302', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('167', '55', '好莱坞', '588', '303', '电视剧', '0', '', '0', '', '0', '', '0', '', '0', '厦门', '0', '', '0', '', '', '', '', '', '', '', '3', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('168', '55', '明', '664', '303', '电视剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('196', '73', '我的爱情不刹车', '700万', '302', '电影', '400', '爱情', '402', '喜剧', '409', '冒险', '32767', '内蒙古', '101080700', '呼伦贝尔', '0', '3-6个月内', '0', '一个月', '115mins', '大纲', '国州影视', '运合工作室', '优酷', 'operaCover/201604160252047393.jpg', '2', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('6', '4', '太子妃', '1.5亿', '310', '动漫', '0', '动作', '405', '动作', '0', '动作', '0', '', '101010000', '北京', '652', '3-6个月开机', '704', '3-6个月', '40min*30', '大纲', '出品方', '主创', '优酷', '封面路径', '2', '0.2', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('7', '9', '芈月传', '40万', '301', '电视剧', '0', '爱情', '400', '仙侠', '0', '动作', '0', '', '101280100', '广州', '650', '1个月内开机', '702', '1个月', '40min*30', '花千骨，出生时命格诡异、坚强善良的孤女，被长留上仙白子画花千骨花千骨下山历练所救，对他暗生情愫；白子画，身负重任，一心想保护天下苍生的长留掌门，明知花千骨是自己生死劫，非但不忍杀生反救花千骨一命。', '出品方', '主创', '爱奇艺', 'operaCover/huaQianGu.jpg', '2', '0.1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('187', '51', '红拉拉', '560', '311', '现场活动', '399', '不限', '0', '', '0', '', '0', '', '101110100', '西安', '222', '1-3个月内', '0', '', '半个月', '托雷斯没关系啦具体呢poop肉咯', '太可怜了', '听力录取', '爱奇艺', 'operaCover/201604111215045119.jpg', '1', '0.94', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('121', '2', '呃呃呃', '88', '304', '综艺栏目', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '4', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('124', '23', '演员人气', '66666万', '0', '综艺节目', '403', '家庭', '407', '古装', '411', '战争', '0', '吉林省', '0', '白城市', '0', '一个月内', '0', '一周', '46mins', '演员', '我们', '你', '爱奇艺', 'album/201604011039042357.jpg', '0', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('125', '23', '无名', '6666万', '310', '动漫', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('126', '52', '大镁铝第一步', '1111', '302', '电影', '399', '不限', '404', '音乐', '405', '动作', '0', '', '0', '全国', '0', '3-6个月以上', '0', '1-3个月内', '100秒', '这是大镁铝企业第一步电影…谢谢大家！', '大镁铝有限影视企业公司', '大镁铝', 'www. ni.c', 'avatar/201604080214045212.jpg', '2', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('44', '21', '考虑咯', '52', '311', '其他', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('235', '28', '更丰富', '555', '311', '现场活动', '403', '家庭', '402', '喜剧', '401', '剧情', '0', '', '101210100', '杭州', '222', '1-3个月内', '0', '', '20*', '', '', '', '', '', '0', '0.75', '1', '2016-04-19 13:54:34', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('243', '49', '哈哈哈', '20000', '303', '电视剧', '413', '军旅', '417', '犯罪', '426', '晚会', '65535', '北京', '101010000', '北京', '0', '3-6个月内', '0', '半个月', '885', '刚刚好', '发广告', '高规格', 'ggg', 'operaCover/201604190258044965.jpg', '0', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('50', '2', '回家', '222', '304', '综艺栏目', '405', '动作', '404', '音乐', '403', '家庭', '0', '', '0', '', '0', '1-3个月内', '0', '一个月内', '66', '很好吃付好方法热乎出发腹黑攻聚聚uv人方法舅妈有一次v没波克比想他衣服~不太你不要发发汗v金币有差别不急不急出差G8你那就挺喜欢复古vuvi比好复读机你糖醋鱼干瞪眼G8和你暴雨vt苦逼男游戏厅旭哥hi就就不你套餐vu就不必几句悲剧v不酒吧金币比吧又粗出去补补笔记本你年纪你鸡巴别鸡巴', '呵呵v宝贝', '车友会vvuvU币', '百度', 'operaCover/20160324030803288.jpg', '0', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('51', '2', '来咯哦哦', '380', '304', '综艺栏目', '404', '音乐', '410', '悬疑', '418', '偶像', '0', '', '101210100', '杭州', '0', '3-6个月以上', '0', '1-3个月内', '60', '婆媳地膜哦耶牧民哦哦YYor磨破松蘑而磨破民心石婆婆7米嘻嘻嘻QQ先下手为强无线上网哦婆婆婆婆婆肉末top哦婆婆OPPO木木木木VPN欧诺欧诺空间里考虑考虑了兔兔季姬击鸡记兔兔季姬击鸡记土坷垃宫馆何玲珑兔兔季姬击鸡记了V5即将开始去那边', '', '', '', '', '0', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('102', '3', '疯狂动物城', '1000万万万', '302', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('103', '3', '大闹天竺', '1万万', '302', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('104', '37', '半夏', '1000万', '302', '电影', '400', '爱情', '0', '', '0', '', '32767', '北京', '101010000', '北京', '0', '一个月内', '0', '3-6个月', '120mins', '', '', '', '爱奇艺', 'operaCover/201604060137043746.jpg', '5', '0.94', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('157', '37', '顾系的戏', '1000万万', '307', '纪录片/专题片', '403', '家庭', '0', '', '0', '', '32767', '新疆', '101130100', '乌鲁木齐', '0', '一个月内', '0', '一个月', '100mins', '', '', '', 'cctv', 'operaCover/201604120352043717.jpg', '1', '0.94', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('173', '45', 'z z', '100万', '0', '现场活动', '426', '生活', '0', '', '0', '', '32767', '北京', '101010000', '北京', '0', '1-3个月内', '0', '半个月', '39mins', 'zz', 'zz', 'zz', '爱奇艺', 'operaCover/201604140301044549.jpg', '2', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('201', '53', '10alllllll', '200万', '306', '舞台剧', '408', '惊悚', '407', '古装', '412', '历史', '32767', '上海', '101020000', '上海', '0', '6-12个月内', '0', '3-6个月', '200mins', '444444444444', '444444', '333333', 'Deeeee', 'operaCover/20160417050404535.jpg', '0', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('148', '28', '多少分', '2333', '307', '纪录片/专题片', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('239', '57', '年代', '111', '302', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 14:05:36', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('242', '26', '老两口来了', '100', '303', '电视剧', '416', '励志', '407', '古装', '408', '惊悚', '65535', '重庆', '101020000', '重庆', '0', '6-12个月内', '0', '一个月', '', '固沙聚会', '刚刚风风光光', '哥哥哥哥', 'vhhh', 'operaCover/201604190249042699.jpg', '0', '0.94', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('132', '51', '美女上班记', '50000', '307', '纪录片/专题片', '401', '剧情', '416', '励志', '433', '社会', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '乐视视频', 'operaCover/201604111220045120.jpg', '1', '0.69', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('133', '29', '月亮的后裔', '3000', '303', '电视剧', '400', '爱情', '405', '动作', '409', '冒险', '0', '', '101190100', '南京', '223', '3-6个月内', '0', '', '1个月', '医生和军人', '', '', '爱奇艺', 'operaCover/201604150750042937.jpg', '5', '0.94', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('176', '23', '烦人', '800万', '304', '网络电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('69', '35', '你猜', '1000万', '0', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('94', '27', '小笨', '2000', '308', '网络电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('149', '28', '11111', '111', '307', '纪录片/专题片', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('75', '21', '199', '31', '308', '网络电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '6', '0.5', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('136', '37', '青黛', '500万', '308', '网络电影', '406', '武侠', '0', '', '0', '', '32767', '上海', '101020000', '上海', '0', '1-3个月内', '0', '3-6个月', '220mins', '', '', '', '腾讯视频', 'operaCover/201604110359043762.jpg', '2', '0.94', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('79', '47', '在家', '258万', '0', '电影', '0', '战争', '0', '真人秀', '0', '', '0', '云南省', '0', '楚雄彝族自治州', '0', '3-6个月以上', '0', '一周内', '20mins', '健健康康。你', '', '', '，的黑', '', '2', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('92', '23', '汤神', '66666万', '0', '综艺节目', '403', '家庭', '407', '古装', '411', '战争', '0', '福建省', '0', '厦门市', '0', '一个月内', '0', '一周', '66mins', '这种事情', '你说我', '你说了什么', '爱奇艺', 'operaCover/201604010244042350.jpg', '10', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('93', '23', '汤神哥哥', '66666万', '0', '综艺节目', '403', '家庭', '0', '', '0', '', '0', '吉林省', '0', '白城市', '0', '一个月内', '0', '一周', '25mins', '这些东西了……', '你说', '你说了', '爱奇艺', 'operaCover/201604010308042377.jpg', '1', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('88', '45', '哈哈', '10000万', '302', '电影', '400', '爱情', '0', '', '0', '', '0', '湖南省', '0', '湘潭市', '0', '一个月内开机', '0', '一周内', '160mins', '哈哈', '哈哈', '哈哈', '哈哈', 'operaCover/201604060230044585.jpg', '2', '1', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('236', '28', '发发发', '522', '302', '电影', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 13:57:02', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('237', '28', '语音', '222', '305', '广告/MV', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 13:57:24', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('230', '49', '测试', '500', '0', '综艺节目', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 09:56:40', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('231', '29', '哈哈', '100', '301', '网络剧', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 10:08:14', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('185', '2', '剧目', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('186', '2', '寂寞春庭', '', '305', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0', '1', '2016-04-12 11:52:05', '2016-04-12 11:52:05');
INSERT INTO `operas` VALUES ('220', '45', 'vv', '10000万', '302', '电影', '417', '犯罪', '0', '', '0', '', '65535', '北京', '101010000', '北京', '0', '3-6个月内', '0', '1-3个月', '60mins', 'aa', 'bb', 'c c', '优酷', 'operaCover/201604170921044522.jpg', '2', '1', '1', '2016-04-17 17:21:09', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('233', '71', '四月19', '88455', '0', '综艺节目', '415', '奇幻', '416', '励志', '414', '科幻', '0', '全国', '0', '全国', '0', '1-3个月内', '0', '半个月', '588888', 'ghh', 'vbb', 'g g h', 'h h h', 'operaCover/201604190301047144.jpg', '16', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('228', '2', '124', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0', '0', '2016-04-19 09:27:31', '2016-04-19 09:27:31');
INSERT INTO `operas` VALUES ('232', '49', '测试', '2000', '311', '现场活动', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 10:26:22', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('227', '2', '剧目', '1000', '306', '', '425', '', '0', '', '0', '', '0', '', '0', '深圳、厦门', '654', '', '705', '', '100', '可以', '', '', '', '', '0', '0', '0', '2016-04-19 09:13:31', '2016-04-19 09:13:31');
INSERT INTO `operas` VALUES ('223', '29', '视恒影视', '0', '304', '综艺栏目', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '1', '0.5', '1', '2016-04-18 15:22:41', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('234', '28', '刚刚方法', '2222', '307', '纪录片/专题片', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0.5', '1', '2016-04-19 13:53:35', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('226', '75', '呵呵一笑', '6666', '0', '综艺节目', '402', '喜剧', '406', '武侠', '411', '战争', '65535', '上海', '101020000', '上海', '0', '一个月内', '0', '一周', '25', '演员', '你', '我们', '爱奇艺', 'operaCover/201604180739047582.jpg', '1', '1', '1', '2016-04-18 19:39:06', '0000-00-00 00:00:00');
INSERT INTO `operas` VALUES ('244', '1', 'sss', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '0', '', '', '', '', '', '', '', '0', '0', '0', '2016-04-20 09:57:33', '2016-04-20 09:57:33');

-- ----------------------------
-- Table structure for persons
-- ----------------------------
DROP TABLE IF EXISTS `persons`;
CREATE TABLE `persons` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `sex` char(4) NOT NULL DEFAULT '' COMMENT '性别',
  `graduate` char(20) NOT NULL DEFAULT '' COMMENT '毕业学院',
  `age` char(5) NOT NULL DEFAULT '' COMMENT '年龄',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '身高',
  `weight` char(8) NOT NULL DEFAULT '' COMMENT '体重',
  `company` char(20) NOT NULL DEFAULT '' COMMENT '公司或剧组(招募方)',
  `position` char(20) NOT NULL DEFAULT '' COMMENT '职务(招募方)',
  `avatar` varchar(40) NOT NULL DEFAULT '' COMMENT '头像文件路径',
  `likeNum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '被收藏次数',
  `viewNum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '被查看次数',
  `statusC` smallint(4) NOT NULL DEFAULT '0' COMMENT '当前状态(code)',
  `status` char(20) NOT NULL DEFAULT '即刻进组' COMMENT '当前状态',
  `lastReply` int(11) unsigned NOT NULL COMMENT '最近回复',
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000' COMMENT '毫秒级时间戳',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `email` (`email`),
  FULLTEXT KEY `username` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persons
-- ----------------------------
INSERT INTO `persons` VALUES ('1', '黄晓明', '11111111111', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '上海戏剧学院', '32', '165cm', '55kg', '', '165cm', 'avatar/huangXiaoming1.jpg', '0', '0', '1', '222', '0', '1457677226118');
INSERT INTO `persons` VALUES ('28', '乔布斯', '18350653860', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '龙岩学院', '23', '168', '60', '5455', '555', 'avatar/201604120645042864.jpg', '0', '0', '205', '6个月以上', '0', '1460459866848');
INSERT INTO `persons` VALUES ('8', '高林豹', '88888888888', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', '梦工厂影视公司', '导演', 'avatar/gaoLinBao.jpg', '0', '0', '0', '即刻进组', '0', '0000000000000');
INSERT INTO `persons` VALUES ('2', '范冰冰', '22222222222', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '北京电影学院', '30', '165cm', '55kg', '', '', 'avatar/20160406011904324.jpg', '0', '0', '0', '即刻进组', '0', '1459905565755');
INSERT INTO `persons` VALUES ('3', '李安', '33333333333', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '北京电影学院', '50', '172cm', '68kg', '梦工厂影视公司', '导演', '', '0', '0', '0', '即刻进组', '0', '0000000000000');
INSERT INTO `persons` VALUES ('4', '吴宇森', '44444444444', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '北京电影学院', '51', '175cm', '68kg', '梦工厂影视公司', '导演', '', '0', '0', '0', '即刻进组', '0', '0000000000000');
INSERT INTO `persons` VALUES ('5', '周润发', '55555555555', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '北京电影学院', '55', '180cm', '68kg', '', '', '', '0', '0', '0', '即刻进组', '0', '0000000000000');
INSERT INTO `persons` VALUES ('6', '邓超', '66666666666', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '北京电影学院', '0-5', '175cm', '68kg', '', '', '', '0', '0', '0', '即刻进组', '0', '0000000000000');
INSERT INTO `persons` VALUES ('7', '周星驰', '77777777777', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', 'xx学院', '42', '175cm', '68kg', '梦工厂影视公司', '导演', 'avatar/20160408014704829.jpg', '0', '0', '0', '即刻进组', '0', '1460123276132');
INSERT INTO `persons` VALUES ('9', '叶伟信', '99999999999', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', '', '', '', '0', '0', '0', '即刻进组', '0', '1457839935932');
INSERT INTO `persons` VALUES ('10', '冯小刚', '18757595823', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '北京电影学院', '24', '', '', '梦工厂影视公司', '导演', 'avatar/fengXiaoGang.jpg', '0', '0', '0', '即刻进组', '0', '1456190920336');
INSERT INTO `persons` VALUES ('21', 'z', '15960190119', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', 'x', '7', '7', '7', '分开了', '唐总', 'avatar/head_3.png', '0', '1', '202', '一个月内进组', '1460963789', '1460519550553');
INSERT INTO `persons` VALUES ('57', '太帅了o', '13328876981', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '莫', '18', '178', '66', '大公司', '老板', 'avatar/201604190223045711.jpg', '0', '0', '0', '即刻进组', '0', '1461046981449');
INSERT INTO `persons` VALUES ('23', '汤神大大', '18365267927', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '清华大学', '22', '185', '55', '', '', 'avatar/201603310810032325.jpg', '0', '2', '204', '6个月内进组', '0', '1460945425147');
INSERT INTO `persons` VALUES ('26', '嘉桦', '18695690933', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', 'boss', 'ui', 'avatar/201604110649042693.jpg', '0', '0', '204', '6个月内进组', '1460963789', '1460357381032');
INSERT INTO `persons` VALUES ('29', '柳丁', '13696903607', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '浙江传媒学院', '23', '170', '61', '红咖工场', '艺人助理', 'avatar/201603241257032982.jpg', '0', '1', '200', '即刻进组', '0', '1459392393308');
INSERT INTO `persons` VALUES ('30', '  ', '13625062505', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '集美大学', '999', '999', '999', '', '', '', '0', '0', '200', '即刻进组', '0', '1460453188048');
INSERT INTO `persons` VALUES ('35', '小yu', '13600963218', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', '视恒科技', '咖姐', 'avatar/201603291118033527.jpg', '0', '0', '0', '即刻进组', '0', '1459310880729');
INSERT INTO `persons` VALUES ('47', '老谭', '13801061193', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '南京大学', '35', '175', '60', '去城南', '你是', 'avatar/201603311009034710.jpg', '0', '0', '200', '即刻进组', '0', '1460338335788');
INSERT INTO `persons` VALUES ('37', 'joki', '15980771721', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '上戏', '21', '164cm', '47', 'JK', '导演', 'avatar/201604150613043754.jpg', '0', '0', '204', '6个月内进组', '0', '1460878239409');
INSERT INTO `persons` VALUES ('44', '宝宝', '15710625492', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', '请填写公司或剧组名称', '请填写职务名称', 'avatar/201604110309044432.jpg', '0', '0', '0', '即刻进组', '0', '1460344249168');
INSERT INTO `persons` VALUES ('45', '易丁', '13666002114', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', 'aa', 'aa', 'aa', 'aa', '视恒', '运营', 'avatar/201604011030044547.jpg', '0', '0', '200', '即刻进组', '0', '1460345965520');
INSERT INTO `persons` VALUES ('49', '秘密', '15985848591', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', 'ing魔图', '25', '163', '55', '冰工厂', '哈哈', 'avatar/head_1.png', '1', '1', '201', '一周内进组', '0', '1461033246219');
INSERT INTO `persons` VALUES ('55', '美女', '18759593875', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '泉州', '11', '18', '58', '梦', '幻', 'avatar/201604110255045559.jpg', '0', '1', '0', '即刻进组', '0', '1460453281736');
INSERT INTO `persons` VALUES ('51', '池秀秀', '18020822819', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '大连大学', '23', '158', '49', '丁丁影视公司', '导演', 'avatar/201604070234045183.jpg', '0', '0', '201', '一周内进组', '0', '1460333466541');
INSERT INTO `persons` VALUES ('52', '大镁铝', '13600969701', 'e3d66c3f388ccdad8907f4f3509a898c', '', '女', '看看', '18', '174', '66', '大镁铝有限影视公司', 'CEO', 'avatar/201604080214045212.jpg', '0', '0', '204', '6个月内进组', '0', '1460094489382');
INSERT INTO `persons` VALUES ('65', 'haihua', '15013818605', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '传媒大学', '38', '168', '65', '', '', 'avatar/20160412061604652.jpg', '0', '0', '0', '即刻进组', '0', '1460441771197');
INSERT INTO `persons` VALUES ('73', '牛虻', '15711553913', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '家里蹲', '22', '185', '55', '', '', 'avatar/201604160309047323.jpg', '0', '2', '0', '即刻进组', '1460945232', '1461023404613');
INSERT INTO `persons` VALUES ('71', 'atom', '18459271321', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '', '', '', '', 'shiheng', 'iOS', 'avatar/201604130434047139.jpg', '0', '0', '0', '即刻进组', '1461046967', '1460634893148');
INSERT INTO `persons` VALUES ('75', '明文', '18638851638', 'e3d66c3f388ccdad8907f4f3509a898c', '', '男', '清华大学', '22', '179', '55', '', '', 'avatar/201604180545047539.jpg', '0', '0', '0', '即刻进组', '0', '1460972762054');

-- ----------------------------
-- Table structure for persons_like
-- ----------------------------
DROP TABLE IF EXISTS `persons_like`;
CREATE TABLE `persons_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetId` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of persons_like
-- ----------------------------
INSERT INTO `persons_like` VALUES ('1', '239', '71');

-- ----------------------------
-- Table structure for persons_view
-- ----------------------------
DROP TABLE IF EXISTS `persons_view`;
CREATE TABLE `persons_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetId` int(10) NOT NULL DEFAULT '0' COMMENT '看了谁的uid',
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of persons_view
-- ----------------------------
INSERT INTO `persons_view` VALUES ('1', '123', '49');
INSERT INTO `persons_view` VALUES ('2', '235', '49');
INSERT INTO `persons_view` VALUES ('3', '129', '49');
INSERT INTO `persons_view` VALUES ('4', '230', '49');
INSERT INTO `persons_view` VALUES ('5', '227', '49');
INSERT INTO `persons_view` VALUES ('6', '221', '49');
INSERT INTO `persons_view` VALUES ('7', '239', '71');
INSERT INTO `persons_view` VALUES ('8', '365', '23');

-- ----------------------------
-- Table structure for pushmsg_history
-- ----------------------------
DROP TABLE IF EXISTS `pushmsg_history`;
CREATE TABLE `pushmsg_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetUid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `time` int(11) NOT NULL COMMENT '最后推送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pushmsg_history
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `targetId` int(11) NOT NULL COMMENT '目标用户ID',
  `type` char(20) NOT NULL DEFAULT '' COMMENT '举报类型',
  `updTime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '毫秒级时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '2', '13', 'ad', '1458009569');
INSERT INTO `report` VALUES ('2', '39', '26', 'attack', '1460110509');
INSERT INTO `report` VALUES ('3', '21', '0', 'porn', '1460356556');
INSERT INTO `report` VALUES ('4', '28', '0', 'porn', '1460359604');
INSERT INTO `report` VALUES ('5', '49', '0', 'privacy', '1460449049');
INSERT INTO `report` VALUES ('6', '29', '0', 'fake', '1460941141');

-- ----------------------------
-- Table structure for resumes
-- ----------------------------
DROP TABLE IF EXISTS `resumes`;
CREATE TABLE `resumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strength` varchar(280) NOT NULL DEFAULT '' COMMENT '我的优势',
  `homepage` char(30) NOT NULL DEFAULT '' COMMENT '主页',
  `album` varchar(350) NOT NULL DEFAULT '' COMMENT '影集',
  `uid` int(10) NOT NULL,
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000' COMMENT '毫秒级时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of resumes
-- ----------------------------
INSERT INTO `resumes` VALUES ('1', '黄晓明的优势', 'www.xxx.com', 'album/huangXiaoming1.jpg,album/huangXiaoming2.jpg,album/huangXiaoming3.jpg', '1', '1455788335051');
INSERT INTO `resumes` VALUES ('2', '范冰冰的优势', 'www.xxx.com', '', '3', '0000000000000');
INSERT INTO `resumes` VALUES ('3', '周润发的优势', 'www.xxx.com', '', '6', '0000000000000');
INSERT INTO `resumes` VALUES ('4', '邓超的优势', 'www.xxx.com', '', '7', '0000000000000');
INSERT INTO `resumes` VALUES ('5', '烦人不', '24567', 'album/201604180208042313.jpg,album/201604180208042353.jpg,worksCover/201604180207042369.jpg,album/201604180208042365.jpg,album/20160418020804232.jpg', '23', '1461037036681');
INSERT INTO `resumes` VALUES ('6', '这是我的优势…', 'wodezhuye. com', 'album/201603310957032569.jpg,,album/201603310957032569.jpg,operaCover/201603220925032560.jpg,album/201603280314032564.jpg,,album/201603180845032591.jpg,album/201603180845032567.jpg,avatar/201603180826032537.jpg,album/201603180845032532.jpg,album/201604010232042596.jpg', '25', '1459477963383');
INSERT INTO `resumes` VALUES ('7', '', '', 'album/201603250938032792.jpg,album/201603250829032747.jpg,album/20160325093803278.jpg,worksCover/201603250822032722.jpg,album/201603250826032775.jpg,album/201603250827032778.jpg,album/201603250827032752.jpg,album/201603250938032788.jpg,album/2016032509380', '27', '1458898725859');
INSERT INTO `resumes` VALUES ('9', '', '', 'album/201603310957033082.jpg,album/201603310957033082.jpg,,album/201603310957033082.jpg', '30', '1459418430173');
INSERT INTO `resumes` VALUES ('10', '心地善良，宇宙最美~', '', ',album/201604071153045123.jpg,album/201604071153045113.jpg,album/20160407115304512.jpg', '51', '1460030039978');
INSERT INTO `resumes` VALUES ('11', '啦啦啦啦啦啦啦啦啦x', 'ggffhhji', 'album/201604080811042648.jpg,worksCover/201604080810042614.jpg', '26', '1460612395570');
INSERT INTO `resumes` VALUES ('12', '', '', ',album/201604080951045254.jpg,worksCover/20160408095004527.jpg,album/201604080951045292.jpg,album/201604080952045271.jpg,album/201604080952045237.jpg,album/201604080952045274.jpg', '52', '1460109169010');
INSERT INTO `resumes` VALUES ('13', '还行', '', 'album/201604130850042957.jpg,operaCover/201604150750042937.jpg', '29', '1460944731390');
INSERT INTO `resumes` VALUES ('14', '来看看', 'https://m.douban.com/group/top', 'album/201604110118044790.jpg,album/201604110118044733.jpg,album/201604110118044790.jpg,album/201604110118044733.jpg,album/201604110118044790.jpg,album/201604110118044733.jpg', '47', '1460337624657');
INSERT INTO `resumes` VALUES ('16', '', '', 'album/20160412034904499.jpg,,album/201604130903044926.jpg,avatar/201604080302044973.jpg,album/201604130903044977.jpg,album/201604130903044973.jpg', '49', '1461045072861');
INSERT INTO `resumes` VALUES ('17', 'all', '尽可能', ',album/201604110818045770.jpg', '57', '1461035211938');
INSERT INTO `resumes` VALUES ('18', 'aa', 'aa', 'album/201604180211044527.jpg,album/201604180211044556.jpg,operaCover/201604170921044522.jpg', '45', '1460950870329');
INSERT INTO `resumes` VALUES ('19', '大炮', '333', 'album/201604140500047351.jpg,album/201604140500047399.jpg', '73', '1460612212783');
INSERT INTO `resumes` VALUES ('20', '我们要好好学习', '123456', 'album/201604191157047519.jpg,album/201604190144047526.jpg,album/201604190144047534.jpg', '75', '1461045076597');

-- ----------------------------
-- Table structure for sao_login_list
-- ----------------------------
DROP TABLE IF EXISTS `sao_login_list`;
CREATE TABLE `sao_login_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL DEFAULT '' COMMENT 'web端唯一字符',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `uType` tinyint(1) NOT NULL DEFAULT '0',
  `updTime` bigint(13) unsigned zerofill NOT NULL DEFAULT '0000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sao_login_list
-- ----------------------------
INSERT INTO `sao_login_list` VALUES ('13', 'd20f34451bc6ad26a87d4d2a31718306', '23', '1', '1458462666932');
INSERT INTO `sao_login_list` VALUES ('14', 'f1059b10527fcfcc070513266ba12efe', '23', '1', '1458462722370');
INSERT INTO `sao_login_list` VALUES ('15', 'f915a336d80b50bd8b4663c1543ac7ae', '23', '2', '1458801242510');
INSERT INTO `sao_login_list` VALUES ('16', '再说我喜欢你 实在对不起自己!', '2', '1', '1458802896009');
INSERT INTO `sao_login_list` VALUES ('17', '再说我喜欢你 实在对不起自己!', '2', '1', '1458803967416');
INSERT INTO `sao_login_list` VALUES ('18', '4adf37076f81ffe5af7fbf73e90e57bb', '23', '2', '1458804824938');
INSERT INTO `sao_login_list` VALUES ('19', '516ce758f13adee344f83bcecf5bf1f2', '23', '2', '1458804944522');
INSERT INTO `sao_login_list` VALUES ('20', 'http://itunes.apple.com/cn/app/j', '28', '1', '1460690004016');

-- ----------------------------
-- Table structure for sph_counter
-- ----------------------------
DROP TABLE IF EXISTS `sph_counter`;
CREATE TABLE `sph_counter` (
  `counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `max_doc_id` int(11) NOT NULL,
  `type` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sph_counter
-- ----------------------------
INSERT INTO `sph_counter` VALUES ('1', '626', 'hot_search');
INSERT INTO `sph_counter` VALUES ('2', '226', 'operas');
INSERT INTO `sph_counter` VALUES ('3', '365', 'jobs');
INSERT INTO `sph_counter` VALUES ('4', '237', 'jobs_want');
INSERT INTO `sph_counter` VALUES ('5', '75', 'persons');

-- ----------------------------
-- Table structure for tree_category
-- ----------------------------
DROP TABLE IF EXISTS `tree_category`;
CREATE TABLE `tree_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` char(25) NOT NULL DEFAULT '' COMMENT '显示文字',
  `category` char(20) NOT NULL DEFAULT '',
  `index` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentId`)
) ENGINE=MyISAM AUTO_INCREMENT=706 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tree_category
-- ----------------------------
INSERT INTO `tree_category` VALUES ('1', '0', '导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('21', '1', '导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('2', '0', '编剧策划', 'jobType', '');
INSERT INTO `tree_category` VALUES ('23', '1', '辅导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('3', '0', '制片', 'jobType', '');
INSERT INTO `tree_category` VALUES ('4', '0', '演员', 'jobType', '');
INSERT INTO `tree_category` VALUES ('5', '0', '剧务', 'jobType', '');
INSERT INTO `tree_category` VALUES ('6', '0', '灯光摄影', 'jobType', '');
INSERT INTO `tree_category` VALUES ('7', '0', '服化道', 'jobType', '');
INSERT INTO `tree_category` VALUES ('8', '0', '美术', 'jobType', '');
INSERT INTO `tree_category` VALUES ('9', '0', '3D&动作', 'jobType', '');
INSERT INTO `tree_category` VALUES ('10', '0', '声音&音乐', 'jobType', '');
INSERT INTO `tree_category` VALUES ('11', '0', '剪辑&后期', 'jobType', '');
INSERT INTO `tree_category` VALUES ('12', '0', '宣发', 'jobType', '');
INSERT INTO `tree_category` VALUES ('13', '0', '其他', 'jobType', '');
INSERT INTO `tree_category` VALUES ('22', '1', '执行导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('24', '1', '后期导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('25', '1', '场记', 'jobType', '');
INSERT INTO `tree_category` VALUES ('26', '1', '编导', 'jobType', '');
INSERT INTO `tree_category` VALUES ('27', '1', '监制', 'jobType', '');
INSERT INTO `tree_category` VALUES ('28', '1', '艺术指导', 'jobType', '');
INSERT INTO `tree_category` VALUES ('29', '1', '演员副导', 'jobType', '');
INSERT INTO `tree_category` VALUES ('30', '1', '现场副导', 'jobType', '');
INSERT INTO `tree_category` VALUES ('31', '1', '特技导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('32', '1', '动作导演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('33', '2', '编剧', 'jobType', '');
INSERT INTO `tree_category` VALUES ('34', '2', '策划', 'jobType', '');
INSERT INTO `tree_category` VALUES ('35', '2', '统稿', 'jobType', '');
INSERT INTO `tree_category` VALUES ('36', '2', '文案', 'jobType', '');
INSERT INTO `tree_category` VALUES ('37', '3', '统筹', 'jobType', '');
INSERT INTO `tree_category` VALUES ('38', '3', '制片主任', 'jobType', '');
INSERT INTO `tree_category` VALUES ('39', '3', '制片人', 'jobType', '');
INSERT INTO `tree_category` VALUES ('40', '3', '现场制片', 'jobType', '');
INSERT INTO `tree_category` VALUES ('41', '3', '生活制片', 'jobType', '');
INSERT INTO `tree_category` VALUES ('42', '3', '外联制片', 'jobType', '');
INSERT INTO `tree_category` VALUES ('43', '3', '制片助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('44', '3', '执行制片人', 'jobType', '');
INSERT INTO `tree_category` VALUES ('45', '4', '男主', 'jobType', '');
INSERT INTO `tree_category` VALUES ('46', '4', '女主', 'jobType', '');
INSERT INTO `tree_category` VALUES ('47', '4', '男配', 'jobType', '');
INSERT INTO `tree_category` VALUES ('48', '4', '女配', 'jobType', '');
INSERT INTO `tree_category` VALUES ('49', '4', '儿童', 'jobType', '');
INSERT INTO `tree_category` VALUES ('50', '4', '跟组', 'jobType', '');
INSERT INTO `tree_category` VALUES ('51', '4', '特型', 'jobType', '');
INSERT INTO `tree_category` VALUES ('52', '4', '替身', 'jobType', '');
INSERT INTO `tree_category` VALUES ('53', '4', '嘉宾', 'jobType', '');
INSERT INTO `tree_category` VALUES ('54', '4', '群演', 'jobType', '');
INSERT INTO `tree_category` VALUES ('55', '4', '主持人', 'jobType', '');
INSERT INTO `tree_category` VALUES ('56', '4', '模特', 'jobType', '');
INSERT INTO `tree_category` VALUES ('57', '4', '特约', 'jobType', '');
INSERT INTO `tree_category` VALUES ('58', '5', '场务', 'jobType', '');
INSERT INTO `tree_category` VALUES ('59', '5', '司机', 'jobType', '');
INSERT INTO `tree_category` VALUES ('60', '5', '剧务主任', 'jobType', '');
INSERT INTO `tree_category` VALUES ('61', '6', '摄影', 'jobType', '');
INSERT INTO `tree_category` VALUES ('62', '6', '副摄影', 'jobType', '');
INSERT INTO `tree_category` VALUES ('63', '6', '机械员', 'jobType', '');
INSERT INTO `tree_category` VALUES ('64', '6', '灯光师', 'jobType', '');
INSERT INTO `tree_category` VALUES ('65', '6', '灯光助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('66', '6', '摄影助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('67', '7', '服装', 'jobType', '');
INSERT INTO `tree_category` VALUES ('68', '7', '化妆', 'jobType', '');
INSERT INTO `tree_category` VALUES ('69', '7', '道具', 'jobType', '');
INSERT INTO `tree_category` VALUES ('70', '7', '枪械', 'jobType', '');
INSERT INTO `tree_category` VALUES ('71', '7', '造型', 'jobType', '');
INSERT INTO `tree_category` VALUES ('72', '7', '置景', 'jobType', '');
INSERT INTO `tree_category` VALUES ('73', '7', '烟花', 'jobType', '');
INSERT INTO `tree_category` VALUES ('74', '7', '服装品', 'jobType', '');
INSERT INTO `tree_category` VALUES ('75', '7', '发型师', 'jobType', '');
INSERT INTO `tree_category` VALUES ('76', '7', '道具员', 'jobType', '');
INSERT INTO `tree_category` VALUES ('77', '7', '化妆助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('78', '7', '置景技工', 'jobType', '');
INSERT INTO `tree_category` VALUES ('79', '8', '画师', 'jobType', '');
INSERT INTO `tree_category` VALUES ('80', '8', '美术师', 'jobType', '');
INSERT INTO `tree_category` VALUES ('81', '8', '副美术', 'jobType', '');
INSERT INTO `tree_category` VALUES ('82', '8', '美术助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('83', '9', '3D', 'jobType', '');
INSERT INTO `tree_category` VALUES ('84', '9', '爆破', 'jobType', '');
INSERT INTO `tree_category` VALUES ('85', '9', '武行', 'jobType', '');
INSERT INTO `tree_category` VALUES ('86', '9', '武术指导', 'jobType', '');
INSERT INTO `tree_category` VALUES ('87', '9', '特技', 'jobType', '');
INSERT INTO `tree_category` VALUES ('88', '10', '录音', 'jobType', '');
INSERT INTO `tree_category` VALUES ('89', '10', '混音', 'jobType', '');
INSERT INTO `tree_category` VALUES ('90', '10', '配音', 'jobType', '');
INSERT INTO `tree_category` VALUES ('91', '10', '音乐', 'jobType', '');
INSERT INTO `tree_category` VALUES ('92', '10', '作曲', 'jobType', '');
INSERT INTO `tree_category` VALUES ('93', '10', '作词', 'jobType', '');
INSERT INTO `tree_category` VALUES ('94', '10', '解说', 'jobType', '');
INSERT INTO `tree_category` VALUES ('95', '10', '演唱', 'jobType', '');
INSERT INTO `tree_category` VALUES ('96', '10', '伴奏', 'jobType', '');
INSERT INTO `tree_category` VALUES ('97', '10', '录音员', 'jobType', '');
INSERT INTO `tree_category` VALUES ('98', '11', '剪辑', 'jobType', '');
INSERT INTO `tree_category` VALUES ('99', '11', '特效', 'jobType', '');
INSERT INTO `tree_category` VALUES ('100', '11', '包装', 'jobType', '');
INSERT INTO `tree_category` VALUES ('101', '11', '调色', 'jobType', '');
INSERT INTO `tree_category` VALUES ('102', '11', '字幕', 'jobType', '');
INSERT INTO `tree_category` VALUES ('103', '11', '片头片尾', 'jobType', '');
INSERT INTO `tree_category` VALUES ('104', '12', '宣传', 'jobType', '');
INSERT INTO `tree_category` VALUES ('105', '12', '发行', 'jobType', '');
INSERT INTO `tree_category` VALUES ('106', '12', '剧照', 'jobType', '');
INSERT INTO `tree_category` VALUES ('107', '12', '片花', 'jobType', '');
INSERT INTO `tree_category` VALUES ('108', '12', '预告片', 'jobType', '');
INSERT INTO `tree_category` VALUES ('109', '12', '花絮', 'jobType', '');
INSERT INTO `tree_category` VALUES ('110', '12', '海报', 'jobType', '');
INSERT INTO `tree_category` VALUES ('111', '12', '广告植入', 'jobType', '');
INSERT INTO `tree_category` VALUES ('112', '12', 'IP衍生品', 'jobType', '');
INSERT INTO `tree_category` VALUES ('113', '12', '公关', 'jobType', '');
INSERT INTO `tree_category` VALUES ('114', '12', '娱记', 'jobType', '');
INSERT INTO `tree_category` VALUES ('116', '13', '法务', 'jobType', '');
INSERT INTO `tree_category` VALUES ('117', '13', '财务', 'jobType', '');
INSERT INTO `tree_category` VALUES ('118', '13', '顾问', 'jobType', '');
INSERT INTO `tree_category` VALUES ('119', '13', '其他', 'jobType', '');
INSERT INTO `tree_category` VALUES ('120', '13', '群头', 'jobType', '');
INSERT INTO `tree_category` VALUES ('121', '13', '文员', 'jobType', '');
INSERT INTO `tree_category` VALUES ('122', '13', '经纪人', 'jobType', '');
INSERT INTO `tree_category` VALUES ('123', '13', '实习生', 'jobType', '');
INSERT INTO `tree_category` VALUES ('124', '13', '艺人助理', 'jobType', '');
INSERT INTO `tree_category` VALUES ('356', '0', '小清新', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('355', '0', '性感', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('354', '0', '苦情', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('353', '0', '幽默', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('352', '0', '打星', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('351', '0', '本色', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('350', '0', '偶像', 'jobStyle', '');
INSERT INTO `tree_category` VALUES ('406', '0', '武侠', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('306', '0', '舞台剧', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('305', '0', '广告/MV', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('304', '0', '综艺栏目', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('303', '0', '电视剧', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('302', '0', '电影', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('405', '0', '动作', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('404', '0', '音乐', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('403', '0', '家庭', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('402', '0', '喜剧', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('401', '0', '剧情', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('407', '0', '古装', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('400', '0', '爱情', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('502', '0', '0-1k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('503', '0', '1k-3k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('504', '0', '3k-6k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('505', '0', '6k-10k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('506', '0', '10k-15k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('507', '0', '15k-20k', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('500', '0', '不限', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('205', '0', '6个月以上', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('203', '0', '3个月内进组', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('202', '0', '一个月内进组', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('201', '0', '一周内进组', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('204', '0', '6个月内进组', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('200', '0', '即刻进组', 'jobStatus', '');
INSERT INTO `tree_category` VALUES ('508', '0', '20k-30k', 'jobSalary', '0');
INSERT INTO `tree_category` VALUES ('509', '0', '30k-50k', 'jobSalary', '0');
INSERT INTO `tree_category` VALUES ('510', '0', '50k-75k', 'jobSalary', '0');
INSERT INTO `tree_category` VALUES ('511', '0', '75k-100k', 'jobSalary', '2');
INSERT INTO `tree_category` VALUES ('512', '0', '100k-200k', 'jobSalary', '1');
INSERT INTO `tree_category` VALUES ('513', '0', '200k-500k', 'jobSalary', '1');
INSERT INTO `tree_category` VALUES ('514', '0', '500k以上', 'jobSalary', '1');
INSERT INTO `tree_category` VALUES ('550', '0', '集', 'jobSalaryUnit', '1');
INSERT INTO `tree_category` VALUES ('551', '0', '部', 'jobSalaryUnit', '0');
INSERT INTO `tree_category` VALUES ('552', '0', '场', 'jobSalaryUnit', '0');
INSERT INTO `tree_category` VALUES ('553', '0', '日', 'jobSalaryUnit', '0');
INSERT INTO `tree_category` VALUES ('554', '0', '月', 'jobSalaryUnit', '0');
INSERT INTO `tree_category` VALUES ('501', '0', '面议', 'jobSalary', '');
INSERT INTO `tree_category` VALUES ('600', '0', '不限', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('601', '0', '5万以下', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('602', '0', '5-50万', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('603', '0', '50-200万', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('604', '0', '200-500万', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('605', '0', '500-2000万', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('606', '0', '2000-5000万', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('607', '0', '5000万以上', 'projectInvest', '');
INSERT INTO `tree_category` VALUES ('307', '0', '纪录片/专题片', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('308', '0', '网络电影', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('309', '0', '网络综艺', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('301', '0', '网络剧', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('310', '0', '动漫', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('311', '0', '其他', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('300', '0', '不限', 'jobCategory', '');
INSERT INTO `tree_category` VALUES ('408', '0', '惊悚', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('409', '0', '冒险', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('410', '0', '悬疑', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('411', '0', '战争', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('412', '0', '历史', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('413', '0', '军旅', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('414', '0', '科幻', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('415', '0', '奇幻', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('416', '0', '励志', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('417', '0', '犯罪', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('418', '0', '偶像', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('419', '0', '儿童', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('420', '0', '宫斗', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('421', '0', '穿越', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('422', '0', '谍战', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('423', '0', '乡村', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('424', '0', '商战', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('425', '0', '选秀', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('426', '0', '晚会', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('427', '0', '新闻', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('428', '0', '生活', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('429', '0', '旅游', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('430', '0', '恶搞', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('431', '0', '科教', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('432', '0', '八卦', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('433', '0', '社会', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('434', '0', '财经', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('435', '0', '真人秀', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('436', '0', '二次元', 'jobTopic', '');
INSERT INTO `tree_category` VALUES ('115', '12', '新媒体', 'jobType', '');
INSERT INTO `tree_category` VALUES ('650', '0', '1个月内开机', 'startTime', '');
INSERT INTO `tree_category` VALUES ('651', '0', '1-3个月内开机', 'startTime', '');
INSERT INTO `tree_category` VALUES ('652', '0', '3-6个月内开机', 'startTime', '');
INSERT INTO `tree_category` VALUES ('653', '0', '6个月内开机', 'startTime', '');
INSERT INTO `tree_category` VALUES ('654', '0', '6个月以上', 'startTime', '');
INSERT INTO `tree_category` VALUES ('700', '0', '1周内', 'shootPeriod', '');
INSERT INTO `tree_category` VALUES ('701', '0', '半个月内', 'shootPeriod', '');
INSERT INTO `tree_category` VALUES ('702', '0', '1个月内', 'shootPeriod', '');
INSERT INTO `tree_category` VALUES ('703', '0', '1-3个月内', 'shootPeriod', '');
INSERT INTO `tree_category` VALUES ('704', '0', '3-6个月内', 'shootPeriod', '');
INSERT INTO `tree_category` VALUES ('705', '0', '6个月以上', 'shootPeriod', '');

-- ----------------------------
-- Table structure for watch_dog
-- ----------------------------
DROP TABLE IF EXISTS `watch_dog`;
CREATE TABLE `watch_dog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `val` varchar(255) NOT NULL DEFAULT '',
  `type` char(20) NOT NULL DEFAULT '',
  `updTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of watch_dog
-- ----------------------------
INSERT INTO `watch_dog` VALUES ('66', 'a:0:{}', 'upload-ww', '0000-00-00 00:00:00');
INSERT INTO `watch_dog` VALUES ('67', 'a:1:{s:5:\"files\";a:5:{s:4:\"name\";s:4:\".png\";s:4:\"type\";s:9:\"image/png\";s:8:\"tmp_name\";s:14:\"/tmp/phpX1t2cE\";s:5:\"error\";i:0;s:4:\"size\";i:762850;}}', 'upload-avatar-uid:23', '0000-00-00 00:00:00');
