
-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `guid` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `lasttimeonline` timestamp NULL DEFAULT NULL,
  `apikey` varchar(32) NOT NULL,
  `ipaddress` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `name` (`name`),
  KEY `lasttimeonline` (`lasttimeonline`),
  KEY `ipaddress` (`ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `devices` (`guid`, `name`, `lasttimeonline`, `apikey`, `ipaddress`) VALUES
('2798e7d9b1448628ba5cb6b12ac04991',	'shagginator3',	'2015-09-05 21:21:55',	'd10ec7c16cbe9de8fbb1c42787c3ec26',	'127.0.0.1'),
('5b4237eb37d06e189f049592efb69ab3',	'shagginator2',	'2015-09-05 14:11:04',	'05311655a15b75fab86956663e1819cd',	'127.0.0.1'),
('b977d0488fe60ba27f01392cfc686299',	'shagginator',	'2015-09-05 14:11:04',	'e48e13207341b6bffb7fb1622282247b',	'127.0.0.1');

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keyword` varchar(32) DEFAULT NULL,
  `mempeak` bigint(20) DEFAULT NULL,
  `data` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `timestamp` (`timestamp`),
  KEY `keyword` (`keyword`),
  KEY `mempeak` (`mempeak`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`guid`) REFERENCES `devices` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `logs` (`id`, `guid`, `timestamp`, `keyword`, `mempeak`, `data`) VALUES
(1,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:04:24',	'general',	NULL,	'\"ping\"'),
(2,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:04:25',	'general',	NULL,	'\"ping\"'),
(3,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:05:57',	'general',	NULL,	'\"ping\"'),
(4,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:05:58',	'general',	NULL,	'\"ping\"'),
(5,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:32',	'general',	NULL,	'\"ping\"'),
(6,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:36',	'general',	NULL,	'\"ping\"'),
(7,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:37',	'general',	NULL,	'\"ping\"'),
(8,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:38',	'general',	NULL,	'\"ping\"'),
(9,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:39',	'general',	NULL,	'\"ping\"'),
(10,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:09:39',	'general',	NULL,	'\"ping\"'),
(11,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:10:59',	'general',	NULL,	'\"ping\"'),
(12,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:10:59',	'general',	NULL,	'\"ping\"'),
(13,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:00',	'general',	NULL,	'\"ping\"'),
(14,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:01',	'general',	NULL,	'\"ping\"'),
(15,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:01',	'general',	NULL,	'\"ping\"'),
(16,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:02',	'general',	NULL,	'\"ping\"'),
(17,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:02',	'general',	NULL,	'\"ping\"'),
(18,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:03',	'general',	NULL,	'\"ping\"'),
(19,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:03',	'general',	NULL,	'\"ping\"'),
(20,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:11:04',	'general',	NULL,	'\"ping\"'),
(21,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:15:28',	'general',	NULL,	'\"ping\"'),
(22,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:22',	'general',	NULL,	'\"ping\"'),
(23,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:23',	'general',	NULL,	'\"ping\"'),
(24,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:25',	'general',	NULL,	'\"ping\"'),
(25,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:25',	'general',	NULL,	'\"ping\"'),
(26,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:26',	'general',	NULL,	'\"ping\"'),
(27,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:23:27',	'general',	NULL,	'\"ping\"'),
(28,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:26:21',	'general',	NULL,	'\"ping\"'),
(29,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:27:42',	'general',	NULL,	'\"ping\"'),
(30,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:28:44',	'general',	NULL,	'\"ping\"'),
(31,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:14',	'general',	NULL,	'\"ping\"'),
(32,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:14',	'general',	NULL,	'\"ping\"'),
(33,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:14',	'general',	NULL,	'\"ping\"'),
(34,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:14',	'general',	NULL,	'\"ping\"'),
(35,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:14',	'general',	NULL,	'\"ping\"'),
(36,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(37,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(38,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(39,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(40,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(41,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(42,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:15',	'general',	NULL,	'\"ping\"'),
(43,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:22',	'general',	NULL,	'\"ping\"'),
(44,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:32',	'general',	NULL,	'\"ping\"'),
(45,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:42',	'general',	NULL,	'\"ping\"'),
(46,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:29:52',	'general',	NULL,	'\"ping\"'),
(47,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:02',	'general',	NULL,	'\"ping\"'),
(48,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:12',	'general',	NULL,	'\"ping\"'),
(49,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:23',	'general',	NULL,	'\"ping\"'),
(50,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:33',	'general',	NULL,	'\"ping\"'),
(51,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:43',	'general',	NULL,	'\"ping\"'),
(52,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:30:53',	'general',	NULL,	'\"ping\"'),
(53,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:03',	'general',	NULL,	'\"ping\"'),
(54,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:14',	'general',	NULL,	'\"ping\"'),
(55,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:24',	'general',	NULL,	'\"ping\"'),
(56,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:34',	'general',	NULL,	'\"ping\"'),
(57,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:44',	'general',	NULL,	'\"ping\"'),
(58,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:31:54',	'general',	NULL,	'\"ping\"'),
(59,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:04',	'general',	NULL,	'\"ping\"'),
(60,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:16',	'general',	NULL,	'\"ping\"'),
(61,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:26',	'general',	NULL,	'\"ping\"'),
(62,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:36',	'general',	NULL,	'\"ping\"'),
(63,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:46',	'general',	NULL,	'\"ping\"'),
(64,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:32:57',	'general',	NULL,	'\"ping\"'),
(65,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:07',	'general',	NULL,	'\"ping\"'),
(66,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:17',	'general',	NULL,	'\"ping\"'),
(67,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:27',	'general',	NULL,	'\"ping\"'),
(68,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:37',	'general',	NULL,	'\"ping\"'),
(69,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:47',	'general',	NULL,	'\"ping\"'),
(70,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:33:57',	'general',	NULL,	'\"ping\"'),
(71,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:08',	'general',	NULL,	'\"ping\"'),
(72,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:18',	'general',	NULL,	'\"ping\"'),
(73,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:28',	'general',	NULL,	'\"ping\"'),
(74,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:38',	'general',	NULL,	'\"ping\"'),
(75,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:48',	'general',	NULL,	'\"ping\"'),
(76,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:34:58',	'general',	NULL,	'\"ping\"'),
(77,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:08',	'general',	NULL,	'\"ping\"'),
(78,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:18',	'general',	NULL,	'\"ping\"'),
(79,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:29',	'general',	NULL,	'\"ping\"'),
(80,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:39',	'general',	NULL,	'\"ping\"'),
(81,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:49',	'general',	NULL,	'\"ping\"'),
(82,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:35:59',	'general',	NULL,	'\"ping\"'),
(83,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:36:09',	'general',	NULL,	'\"ping\"'),
(84,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:36:19',	'general',	NULL,	'\"ping\"'),
(85,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:36:29',	'general',	NULL,	'\"ping\"'),
(86,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:37:20',	'general',	NULL,	'\"ping\"'),
(87,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:37:30',	'general',	NULL,	'\"ping\"'),
(88,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:37:40',	'general',	NULL,	'\"ping\"'),
(89,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:37:50',	'general',	NULL,	'\"ping\"'),
(90,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:00',	'general',	NULL,	'\"ping\"'),
(91,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:10',	'general',	NULL,	'\"ping\"'),
(92,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:20',	'general',	NULL,	'\"ping\"'),
(93,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:30',	'general',	NULL,	'\"ping\"'),
(94,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:41',	'general',	NULL,	'\"ping\"'),
(95,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:38:51',	'general',	NULL,	'\"ping\"'),
(96,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:01',	'general',	NULL,	'\"ping\"'),
(97,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:11',	'general',	NULL,	'\"ping\"'),
(98,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:21',	'general',	NULL,	'\"ping\"'),
(99,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:31',	'general',	NULL,	'\"ping\"'),
(100,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:41',	'general',	NULL,	'\"ping\"'),
(101,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:39:52',	'general',	NULL,	'\"ping\"'),
(102,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:02',	'general',	NULL,	'\"ping\"'),
(103,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:12',	'general',	NULL,	'\"ping\"'),
(104,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:22',	'general',	NULL,	'\"ping\"'),
(105,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:32',	'general',	NULL,	'\"ping\"'),
(106,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:42',	'general',	NULL,	'\"ping\"'),
(107,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:40:52',	'general',	NULL,	'\"ping\"'),
(108,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:02',	'general',	NULL,	'\"ping\"'),
(109,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:13',	'general',	NULL,	'\"ping\"'),
(110,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:23',	'general',	NULL,	'\"ping\"'),
(111,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:33',	'general',	NULL,	'\"ping\"'),
(112,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:43',	'general',	NULL,	'\"ping\"'),
(113,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:41:53',	'general',	NULL,	'\"ping\"'),
(114,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:03',	'general',	NULL,	'\"ping\"'),
(115,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:13',	'general',	NULL,	'\"ping\"'),
(116,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:23',	'general',	NULL,	'\"ping\"'),
(117,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:33',	'general',	NULL,	'\"ping\"'),
(118,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:44',	'general',	NULL,	'\"ping\"'),
(119,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:42:54',	'general',	NULL,	'\"ping\"'),
(120,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:04',	'general',	NULL,	'\"ping\"'),
(121,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:14',	'general',	NULL,	'\"ping\"'),
(122,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:24',	'general',	NULL,	'\"ping\"'),
(123,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:34',	'general',	NULL,	'\"ping\"'),
(124,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:44',	'general',	NULL,	'\"ping\"'),
(125,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:43:55',	'general',	NULL,	'\"ping\"'),
(126,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:05',	'general',	NULL,	'\"ping\"'),
(127,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:15',	'general',	NULL,	'\"ping\"'),
(128,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:25',	'general',	NULL,	'\"ping\"'),
(129,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:35',	'general',	NULL,	'\"ping\"'),
(130,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:45',	'general',	NULL,	'\"ping\"'),
(131,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:44:55',	'general',	NULL,	'\"ping\"'),
(132,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:05',	'general',	NULL,	'\"ping\"'),
(133,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:16',	'general',	NULL,	'\"ping\"'),
(134,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:26',	'general',	NULL,	'\"ping\"'),
(135,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:36',	'general',	NULL,	'\"ping\"'),
(136,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:46',	'general',	NULL,	'\"ping\"'),
(137,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:45:56',	'general',	NULL,	'\"ping\"'),
(138,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 14:46:06',	'general',	NULL,	'\"ping\"'),
(139,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 15:24:15',	'general',	NULL,	'\"ping\"'),
(140,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:08',	'general',	NULL,	'\"ping\"'),
(141,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:18',	'keyword',	NULL,	'\"ping\"'),
(142,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:51',	'keyword',	NULL,	'\"ping\"'),
(143,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:53',	'keyword',	NULL,	'\"ping\"'),
(144,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:55',	'keyword',	NULL,	'\"ping\"'),
(145,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:06:57',	'keyword',	NULL,	'\"ping\"'),
(146,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:07:00',	'keyword',	NULL,	'\"ping\"'),
(147,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:07:02',	'keyword',	NULL,	'\"ping\"'),
(148,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:07:04',	'keyword',	NULL,	'\"ping\"'),
(149,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:14:49',	'keyword',	NULL,	'\"ping\"'),
(150,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:21:31',	'keyword',	NULL,	'\"ping\"'),
(151,	'2798e7d9b1448628ba5cb6b12ac04991',	'2015-09-05 21:21:55',	'keyword',	NULL,	'\"ping\"');

-- 2015-09-05 22:29:22
