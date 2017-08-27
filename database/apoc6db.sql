-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2017 at 05:19 AM
-- Server version: 5.6.19
-- PHP Version: 5.5.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apoc6db`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE IF NOT EXISTS `abilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `ability_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`id`, `name`, `description`, `ability_type_id`) VALUES
(1, 'DREAMSIGHT', 'The spell lets a player see as if he/she is awake.', 2),
(2, 'ELECTRICITY', 'Electric attacks don''t hit you as hard', 4),
(3, 'DETECT_EVIL', 'Detect evil will allow the character affected by the spell to see if other characters (or mobiles) and objects are aligned evil.  If aligned evil, a red aura will be seen surrounding the evil target.', 2),
(4, 'DETECT_INVISIBLE', 'Can see invisibile stuff', 2),
(5, 'FIRE', '', 6),
(6, 'DETECT_GOOD', 'Detect good will allow the character affected by the spell to see if other characters (or mobiles) and objects are aligned good.  If aligned good, a blue aura will be seen surrounding the good target.', 2),
(7, 'PROTECT_EVIL', 'This is a shield against evil spell that may be cast upon self or others.', 3),
(8, 'PROTECT_GOOD', 'yep', 3);

-- --------------------------------------------------------

--
-- Table structure for table `abilities_items`
--

CREATE TABLE IF NOT EXISTS `abilities_items` (
  `ability_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `abilities_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `abilities_mobs`
--

CREATE TABLE IF NOT EXISTS `abilities_mobs` (
  `ability_id` int(11) NOT NULL,
  `mob_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `abilities_mobs`
--


-- --------------------------------------------------------

--
-- Table structure for table `ability_types`
--

CREATE TABLE IF NOT EXISTS `ability_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ability_types`
--

INSERT INTO `ability_types` (`id`, `name`) VALUES
(2, 'DETECTION'),
(3, 'PROTECTION'),
(4, 'RESISTENCE'),
(5, 'SKILL'),
(6, 'VULNERABILITY');

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `name`, `code`) VALUES
(1, 'north', 'goNorth'),
(2, 'south', 'goSouth'),
(3, 'east', 'goEast'),
(4, 'west', 'goWest'),
(5, 'up', 'goUp'),
(6, 'down', 'goDown'),
(7, 'look', 'look');

-- --------------------------------------------------------

--
-- Table structure for table `adjacent_zones`
--

CREATE TABLE IF NOT EXISTS `adjacent_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `adjacent_zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `adjacent_zones`
--


-- --------------------------------------------------------

--
-- Table structure for table `apply_mods`
--

CREATE TABLE IF NOT EXISTS `apply_mods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `apply_mods`
--


-- --------------------------------------------------------

--
-- Table structure for table `apply_mods_items`
--

CREATE TABLE IF NOT EXISTS `apply_mods_items` (
  `apply_mod_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apply_mods_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `apply_mods_mobs`
--

CREATE TABLE IF NOT EXISTS `apply_mods_mobs` (
  `apply_mod_id` int(11) NOT NULL,
  `mob_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apply_mods_mobs`
--


-- --------------------------------------------------------

--
-- Table structure for table `armors`
--

CREATE TABLE IF NOT EXISTS `armors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `armor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `armors`
--


-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `large_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `large_name`) VALUES
(1, 'str', 'Strength'),
(2, 'int', 'Intelligence'),
(3, 'wis', 'Wisdom'),
(4, 'dex', 'Dexterity'),
(5, 'con', 'Constitution'),
(6, 'cha', 'Charisma'),
(7, 'hitr', 'Hitroll'),
(8, 'damr', 'Damroll'),
(9, 'hit', 'Hitpoints'),
(10, 'move', 'Movepoints'),
(11, 'mana', 'Mana'),
(12, 'hitg', 'Hitgain'),
(13, 'moveg', 'MoveGain'),
(14, 'manag', 'ManaGain'),
(15, 'age', 'Age'),
(16, 'spell', 'Spell'),
(17, 'para', 'Para'),
(18, 'breath', 'Breath'),
(19, 'petri', 'Petri'),
(20, 'rod', 'Rod'),
(21, 'ap', 'ArmorPoints'),
(22, 'align', 'Alignment'),
(23, 'attack', 'Attack'),
(24, 'level', 'Level'),
(25, 'agr', 'Aggro');

-- --------------------------------------------------------

--
-- Table structure for table `attributes_items`
--

CREATE TABLE IF NOT EXISTS `attributes_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `attributes_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `attributes_mobs`
--

CREATE TABLE IF NOT EXISTS `attributes_mobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `mob_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `attributes_mobs`
--

INSERT INTO `attributes_mobs` (`id`, `attribute_id`, `mob_id`, `amount`) VALUES
(28, 1, 2, 12),
(29, 2, 2, 12),
(30, 3, 2, 12),
(31, 4, 2, 12),
(32, 5, 2, 12),
(33, 6, 2, 12),
(34, 7, 2, 1),
(35, 8, 2, 1),
(36, 9, 2, 80),
(37, 10, 2, 50),
(38, 11, 2, 50),
(39, 12, 2, 1),
(40, 13, 2, 1),
(41, 14, 2, 1),
(42, 15, 2, 1),
(43, 16, 2, 1),
(44, 17, 2, 1),
(45, 18, 2, 1),
(46, 19, 2, 1),
(47, 20, 2, 1),
(48, 21, 2, 1),
(49, 22, 2, 50),
(50, 23, 2, 1),
(51, 24, 2, 3),
(52, 25, 2, 10),
(53, 26, 2, 1),
(54, 20, 3, 1),
(81, 1, 1, 12),
(82, 2, 1, 12),
(83, 3, 1, 12),
(84, 4, 1, 12),
(85, 5, 1, 12),
(86, 6, 1, 12),
(87, 7, 1, 1),
(88, 8, 1, 1),
(89, 9, 1, 300),
(90, 10, 1, 100),
(91, 11, 1, 100),
(92, 12, 1, 1),
(93, 13, 1, 1),
(94, 14, 1, 1),
(95, 15, 1, 1),
(96, 16, 1, 1),
(97, 17, 1, 1),
(98, 18, 1, 1),
(99, 19, 1, 1),
(100, 20, 1, 1),
(101, 21, 1, 1),
(102, 22, 1, 50),
(103, 23, 1, 1),
(104, 24, 1, 1),
(105, 25, 1, 10),
(106, 26, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `character_class_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `characters`
--


-- --------------------------------------------------------

--
-- Table structure for table `character_classes`
--

CREATE TABLE IF NOT EXISTS `character_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `class_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `character_classes`
--

INSERT INTO `character_classes` (`id`, `name`, `description`, `class_group_id`) VALUES
(1, 'Fighter', 'The most common of all warriors, fighters believe in only what their flesh and blood can provide.  Having no magical abilities of their own, brute strength is their forte.  They can be found hacking it out face to face with \r\nfire-breathing dragons and most dangerous of demons.', 1),
(2, 'Ranger', 'The Ranger is a hunter and tracker who makes his way by not only his sword but also by his wits. Rangers cannot be evil.', 1),
(3, 'Paladin', 'This is the most difficult of the classes to be.  Paladins are the most holy and noble of warriors; truth and honor is the meat of their life.  Pursuing the highest of all ideals, many a powerful warrior has failed and died living up to their rigorous ideals.  Due to their holiness, they gain magic from the gods of purity at high levels.', 1),
(4, 'Anti-Paladin', 'The Anti-Paladin represents everything that is mean, low and despicable in the human race. No act of treachery is too base, no deed of violence too vile. Thoughtless cruelty, sheer depravity, and senseless bloodshed are their hallmarks. As the nemesis to Paladins, they gain magical abilities at high levels granted to them by dark and evil powers.', 1),
(5, 'Samurai', 'Samurai are WARRIORS of honor from the oriental world who follow the code of the bushido or warrior.  In terms of having high ideals, they are similar to Paladins.  But the ideals of a Samurai go beyond that.  Because of these ideals, a samurai may only be GOOD. With the code of honor that the Samurai follow, cowardice in battle is dishonorable.\r\n\r\n*  Samurai in combat attack as warriors, but gain more hit points and attacks per level.\r\n*  Samurai may not use the WIMPY command and may not be RESCUED.\r\n*  Have immunity to fear.', 1),
(6, 'Cleric', 'Clerics are known for being healers, and thus are quite the necessity throughout the world.  This class gives you the wisdom of peace and blessing, along with healing.  However, it is possible to learn more violent spells.', 3),
(7, 'Druid', 'Druids are priests of nature.  Like Rangers, they are attuned to nature and do all in their power to protect it.  Given their specific aim, druids have control over the elements, plants, and animals.  Thus, they are powerful in a sylvan setting while they lose power the farther away from their beloved forests they get.', 3),
(8, 'Monk', 'The Monk class is based on the oriental shao-lin priests, where in order to find your real power, you need to find the center of your being between your physical and mental self.  A monk finds this center of being by honing his physical body through the art of combat and his mental powers by meditation. Only by remaining good may a monk find the center of his/her being.  The Monk is a member of the PRIEST group.\r\n\r\n*  In combat, a Monk has the THAC0 and hit points of the ROGUE class.  \r\n*  Unarmed combat: damage 1d4 (per 8 levels) +1 (per 4 levels).\r\n*  For levels 1 to 10, the Monk''s Armor Points is improved by 5 a level;\r\n   For levels 11 to 20, 10 ap a level; For levels 21 to 30, 15 ap a level;\r\n   For levels 31 to 40, 20 ap a level.\r\n*  Monks may equip items usable only by WARRIORS, PRIESTS, or MONKS.\r\n*  Monks may only equip the following locations: \r\n   - Light, Finger, Neck, About, Waist, Wrist, Wield (lose half their attacks \r\n     a round), and Hold (Monks cannot hold weapons).\r\n* Monks gain 3 extra mana points extra mana points per level instead of 4 for other Priests.', 3),
(9, 'Magic User', 'Mages are the most general of spellcasters.  They study everything that magic has to offer, being able to produce powerful and violent magic.  However, due to the lack of oneness with the gods, they can deal little with healing and blessing.', 4),
(10, 'Necromancer', 'The Necromancer class is part of the WIZARD group.  They dwell on perverting the life forces of others for their own personal ends, even if it means bringing others to a state of the living dead to meet their whims.  They also enjoy the darkness, for they are by nature creatures of the night, and draw their powers from the negative magic fields. By their very nature, and by how they are viewed by others, Necromancers can only be EVIL.\r\n\r\n*  Necromancers are immune to charm, sleep and hold type spells.\r\n*  For every 5 levels gained, he/she loses 1 point of CHARISMA.  \r\n*  Dealing with charmies, a Necromancer score is reversed (subtracted from 25) to see how many they can control at once (up to 75 charmie levels).\r\n*  In combat, the Necromancer is identical to a Magic User.', 4),
(11, 'Thief', 'The seediest of all Rogues -- cunning, nimbleness, and stealth are their hallmarks. With their very special qualities that no other class offers, they have been known even to make the richest of merchants and lowest of peasants squirm. Many of these qualities can come in handy in many situations, such as picking locks. Spending all their time keeping their reflexes cat-like, thieves have little time to study magic.', 2),
(12, 'Bard', 'Though a rogue, the bard is very different from a thief.  They make their living by wooing audiences with their charisma, artistic ability, and magical pursuits of entertainment.  They have been known to help the audience to part with their money if they are not very charitable.  The Bard is known as a ''Jack-Of-All-Trades'' knowing a little bit of everything.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `character_classes_items`
--

CREATE TABLE IF NOT EXISTS `character_classes_items` (
  `character_class_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `character_classes_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
--

CREATE TABLE IF NOT EXISTS `class_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `class_groups`
--

INSERT INTO `class_groups` (`id`, `name`, `description`) VALUES
(1, 'Warrior', 'The warrior group encompasses all those individuals who make their way through the world by their skill in arms. They have a wide range of knowledge concerning armor and weapons, but are limited in magic use. The following \r\nwarrior classes exist:  Fighter, Ranger, Paladin, Anti-Paladin, Samurai.'),
(2, 'Rogue', 'The rogue group includes all those who feel that the world owes them their living.  They get through life by doing as little as possible -- the less trouble maintaining their life style...all the better.  Rogues are often on the shady side of the law. The following rogue classes exist: Thief, Bard.'),
(3, 'Priest', 'The Priest group are the most devote followers of the gods.  Receiving their powers from those they worship, they go throughout the realms spreading the following of their gods.  The following priest classes exist: Cleric, Druid, Monk.'),
(4, 'Wizard', 'The wizard group includes all those individuals who make learning and casting spells a way of life. Given to the massive times spent studying, they are usually weak of body and strength.  The Wizard classes are: Magic User and Necromancer.');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups_items`
--

CREATE TABLE IF NOT EXISTS `class_groups_items` (
  `class_group_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_groups_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE IF NOT EXISTS `commands` (
  `command` varchar(16) NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commands`
--

INSERT INTO `commands` (`command`, `action_id`) VALUES
('d', 6),
('down', 6),
('e', 3),
('east', 3),
('look', 7),
('n', 1),
('north', 1),
('s', 2),
('south', 2),
('u', 5),
('up', 5),
('w', 4),
('west', 4);

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE IF NOT EXISTS `directions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `long_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `directions`
--

INSERT INTO `directions` (`id`, `name`, `long_name`) VALUES
(1, 'n', 'North'),
(2, 's', 'South'),
(3, 'e', 'East'),
(4, 'w', 'West'),
(5, 'u', 'Up'),
(6, 'd', 'Down'),
(7, 'in', 'In'),
(8, 'out', 'Out');

-- --------------------------------------------------------

--
-- Table structure for table `exites`
--

CREATE TABLE IF NOT EXISTS `exites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `exit_type_id` int(11) NOT NULL,
  `direction_id` int(11) NOT NULL,
  `exit_room_id` int(11) NOT NULL,
  `key_id` int(11) DEFAULT NULL,
  `look_description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `exites`
--

INSERT INTO `exites` (`id`, `room_id`, `exit_type_id`, `direction_id`, `exit_room_id`, `key_id`, `look_description`) VALUES
(2, 1, 1, 1, 3, NULL, 'At the northern end of the temple hall is a statue and a huge altar.'),
(3, 3, 1, 2, 1, NULL, 'You see the southern end of the temple.'),
(4, 5, 1, 4, 1, NULL, 'To the west you see the Temple of Midgaard.'),
(5, 1, 1, 3, 5, NULL, 'You look east and see a small room used for posting social messages.'),
(6, 6, 1, 3, 1, NULL, 'To the east you see the temple of Midgaard.'),
(7, 1, 1, 4, 6, NULL, 'You look west and see a small room used for posting suggestion messages.'),
(8, 7, 1, 1, 1, NULL, 'The steps lead up to the Great Temple of Midgaard.'),
(9, 1, 1, 2, 7, NULL, 'You look down the huge stone steps at the temple square below.'),
(10, 8, 1, 1, 7, NULL, 'You see the temple gates.'),
(11, 1, 1, 6, 8, NULL, 'You see the temple square.'),
(12, 7, 1, 2, 8, NULL, 'The temple square can be seen from here.');

-- --------------------------------------------------------

--
-- Table structure for table `exit_types`
--

CREATE TABLE IF NOT EXISTS `exit_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exit_types`
--

INSERT INTO `exit_types` (`id`, `name`) VALUES
(1, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `extra_mods`
--

CREATE TABLE IF NOT EXISTS `extra_mods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `extra_mods`
--

INSERT INTO `extra_mods` (`id`, `name`) VALUES
(1, 'GLOW'),
(2, 'MAGIC'),
(3, 'RADIATE'),
(4, 'CURSED(Lesser)'),
(5, 'CURSED(Greater)'),
(6, 'NO-IDENT'),
(7, 'EVIL'),
(8, 'GOOD'),
(9, 'ANTI-GOOD'),
(10, 'ANTI-EVIL'),
(11, 'ANTI-NEUTRAL'),
(12, 'HUM'),
(13, 'INVISIBLE'),
(14, 'NO-RENT');

-- --------------------------------------------------------

--
-- Table structure for table `extra_mods_items`
--

CREATE TABLE IF NOT EXISTS `extra_mods_items` (
  `extra_mod_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extra_mods_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `game_vars`
--

CREATE TABLE IF NOT EXISTS `game_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(64) NOT NULL,
  `value` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `game_vars`
--

INSERT INTO `game_vars` (`id`, `var`, `value`) VALUES
(1, 'game_time', '788');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE IF NOT EXISTS `genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `min_lvl` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `item_type_id`, `size_id`, `material_id`, `limit`, `min_lvl`, `weight`, `rent`, `cost`, `zone_id`) VALUES
(1, 'polished wooden cane', 'asdf', 8, 3, 3, 10, 0, 2, 800, 4000, 1),
(2, 'long sword', 'You see nothing special..', 4, 4, 4, 1000, 0, 8, 102, 512, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items_mobs`
--

CREATE TABLE IF NOT EXISTS `items_mobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `mob_id` int(11) NOT NULL,
  `load_chance` int(11) NOT NULL DEFAULT '100',
  `position_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `items_mobs`
--


-- --------------------------------------------------------

--
-- Table structure for table `items_positions`
--

CREATE TABLE IF NOT EXISTS `items_positions` (
  `item_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_positions`
--

INSERT INTO `items_positions` (`item_id`, `position_id`) VALUES
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `items_rooms`
--

CREATE TABLE IF NOT EXISTS `items_rooms` (
  `item_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_rooms`
--


-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE IF NOT EXISTS `item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`id`, `name`) VALUES
(1, 'Container'),
(2, 'Junk'),
(3, 'Armor'),
(4, 'Weapon'),
(5, 'Food'),
(6, 'Treasure'),
(7, 'Potion'),
(8, 'Wand'),
(9, 'Staff'),
(10, 'Light');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `keys`
--


-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(64) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `keywords`
--


-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`) VALUES
(1, 'Iron'),
(2, 'Mithril'),
(3, 'Wood (Thin)'),
(4, 'Iron/Steel');

-- --------------------------------------------------------

--
-- Table structure for table `mobs`
--

CREATE TABLE IF NOT EXISTS `mobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `character_class_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL COMMENT 'Room the mob is currently in',
  `behavior` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mobs`
--

INSERT INTO `mobs` (`id`, `name`, `description`, `gender_id`, `size_id`, `race_id`, `character_class_id`, `zone_id`, `room_id`, `behavior`) VALUES
(1, 'Nodri', 'You see a tall man looking regally about the city.  From the look of pride on his face, he takes his job proud as he looks at you and says, ''Need a tour of Northern Midgaard?  Just follow me!''', 1, 4, 1, 1, 1, NULL, NULL),
(2, 'Temple Guard', 'A big, strong, helpful, trustworthy guard.', 1, 4, 7, 1, 1, NULL, NULL),
(3, 'asfd', 'asdf', 1, 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mobs_rooms`
--

CREATE TABLE IF NOT EXISTS `mobs_rooms` (
  `mob_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobs_rooms`
--


-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`) VALUES
(1, 'TAKE'),
(2, 'NECK'),
(3, 'ABOUT'),
(4, 'HOLD'),
(5, 'FINGER'),
(6, 'HANDS'),
(7, 'WIELD'),
(8, 'WRIST'),
(9, 'FEET'),
(10, 'LEGS'),
(11, 'HEAD'),
(12, 'ARMS');

-- --------------------------------------------------------

--
-- Table structure for table `races`
--

CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `races`
--

INSERT INTO `races` (`id`, `name`, `description`, `size_id`) VALUES
(1, 'Dwarf', 'Dwarves are short, stocky, and quite muscular compared to humans.  They have a fondness for beards, beer, and gold.  They tend to be dour and taciturn, and have little use for humor.\r\n\r\n      ==================\r\n      |  STR   |  +1   |       Note:\r\n      |  INT   |  --   |       ~~~~\r\n      |  WIS   |  -1   |    *  Regain twice the hitpoints per tick.\r\n      |  DEX   |  -1   |    *  Retain a high resistance to poison.\r\n      |  CON   |  +2   |       \r\n      |  CHA   |  -1   |\r\n      |  MOVES |  -20  |\r\n      |  SIZE  | SMALL |\r\n      ==================', 1),
(2, 'Elf', 'Elves are almost as tall as Humans, and are very slender. They have a great\r\nlove for nature, magic, and art.  Their features are delicate, and their\r\nears are pointed.\r\n\r\n      ==================\r\n      |  STR  |  -2    |      Note:\r\n      |  INT  |  +1    |      ~~~~\r\n      |  WIS  |  +1    |      Elves have a frailty towards\r\n      |  DEX  |  +2    |      poison.\r\n      |  CON  |  -2    |\r\n      |  CHA  |  --    |\r\n      |  MANA |  +5    | ---> (for every 5 levels)\r\n      |  SIZE | NORMAL |\r\n      ==================', 4),
(3, 'Gnome', 'Gnomes are kin to Dwarves but are not as powerfully built.  They do have \r\ndistinguished features; specifically, large noses.  Gnomes are lively and\r\nplayful with a keen sense of humor, especially for practical jokes.\r\n\r\n      ==================\r\n      |  STR   |  --   |     Note:\r\n      |  INT   |  +2   |     ~~~~\r\n      |  WIS   |  --   |  *  Have a -20% chance for staves/wands/scrolls\r\n      |  DEX   |  +1   |     to fail but get a bonus in saving throws vs.\r\n      |  CON   |  +1   |     staves/wands/spells based on CON.\r\n      |  CHA   |  -1   |  *  Heal 1.5 times faster than normal.\r\n      |  MOVES |  -25  |     \r\n      |  SIZE  | SMALL |\r\n      ==================', 1),
(4, 'Half-Elf', 'Half-elves are the result of a union between Humans and Elves.  They look \r\nlike elves, but are not as slim (gaining that from their Human heritage).\r\nHalf-elves are wanderers, not having a race of their own to exist with.\r\n\r\n      ==================\r\n      |  STR   |  --   |         Note:\r\n      |  INT   |  +1   |         ~~~~\r\n      |  WIS   |  --   |      *  Frailty towards poison.\r\n      |  DEX   |  +1   |     \r\n      |  CON   |  -1   |\r\n      |  CHA   |  --   |\r\n      |  MOVES |  +20  |\r\n      |  SIZE  | NORMAL|\r\n      ==================', 4),
(5, 'Half-Giant', 'Half-giants are the result of a union between Humans and Giants.  They are\r\nmuch taller than humans, and quite muscular (gaining such qualities from\r\ntheir Giant heritage).  However, they also gain the dimwittedness of Giants\r\nas well.\r\n\r\n      ==================\r\n      |  STR   |  +3   |         Note:\r\n      |  INT   |  -2   |         ~~~~\r\n      |  WIS   |  -2   |      *  Require 3 times as much food and drink. \r\n      |  DEX   |  -2   |      *  Receive -1 practice per level.\r\n      |  CON   |  +2   |     \r\n      |  CHA   |  -2   |\r\n      |  MOVES |  +30  |\r\n      |  SIZE  | LARGE |\r\n      ==================', 5),
(6, 'Halfling', 'Halflings are short plump people that look like small Humans, except for\r\nthe hair growing on the tops of their feet.  They are overly fond of food,\r\nand try to eat six meals a day normally.\r\n\r\n      ==================\r\n      |  STR   |  -1   |         Note:\r\n      |  INT   |  --   |         ~~~~\r\n      |  WIS   |  --   |      *  Ability for Infravision.\r\n      |  DEX   |  +3   |      *  Require twice as much food and drink.\r\n      |  CON   |  --   |      *  Automatic -40 Armor Points value.\r\n      |  CHA   |  +1   |     \r\n      |  MOVES |  -30  |\r\n      |  SIZE  | SMALL |\r\n      ==================', 1),
(7, 'Human', 'Because humans are the most numerous and the other races are compared to\r\nhumans, they get no modifiers to their ability scores, BUT they do receive\r\n+1 practice for every level. SIZE - NORMAL', 4),
(8, 'Minotaur', 'Minotaurs are large beasts.  A minotaur has the body of a human and the head  of a bull.         ================       Note:        | STR  | +2    |        ~~~~        | INT  | -1    |     *  Minotaurs cannot wear any equipment on          | WIS  | --    |        their heads.         | DEX  | -2    |     *  Eat only corpses (4 ticks per size -          | CON  | +2    |        TINY=4 hrs of food, NORMAL=12 hrs of food).        | CHA  | -3    |     *  10% bonus per practice on HUNT and BASH.        | MOVE | +40   |        | SIZE | LARGE |        ================  See Also:  RACES (or one of the other races), ABILITIES, MOBILES', 5),
(9, 'Pixie', 'Pixies are a small, winged kin of Elves.  They have a great love of  nature, along with a delight in torturing big folk with practical jokes.         =================        |  STR   |  --  |      Note:        |  INT   |  +1  |      ~~~~        |  WIS   |  +1  |   *  Ability for  Airwalk.        |  DEX   |  +2  |   *  Require half as much food and drink.        |  CON   |  -2  |   *  Can only wield a weapon with up to a max          |  CHA   |  -2  |      weight of 15 lb..        |  MOVE  |  -40 |        |  SIZE  | TINY |        =================', 2),
(10, 'Triton', 'Tritons are aquatic living humanoids.         =================        Note:        | STR  | +1     |        ~~~~        | INT  | --     |     *  Moves are doubled on land.        | WIS  | --     |     *  Moves are halved on or in water.        | DEX  | +1     |     *  Needs 4 times the water while on land.        | CON  | +1     |     *  Needs no water while on or in water.        | CHA  | --     |     *  Vulnerability to fire.        | SIZE | Normal |     *  Water walk/water breathing ability.        =================     * +1 hit and +1 dam every 10 levels when wielding                                 a piercing weapon.', 4),
(11, 'Uldra', 'Uldras are cousins to Dwarves and Gnomes, who live in the tundra and have a natural empathy for animals.         ================       Note:        | STR  | --    |       ~~~~        | INT  | --    |    *  Immune to frost(cold).        | WIS  | +2    |    *  Vulnerability to fire.        | DEX  | --    |    *  Ability to cast Animal Friendship.        | CON  | +1    |    *  Requires only half the food.        | CHA  | -1    |            | MOVE | -20   |        | SIZE | Small |        ================', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `name_secondary` varchar(64) DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  `short_description` varchar(256) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `zone_exit` tinyint(4) NOT NULL DEFAULT '0',
  `danger_level` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL,
  `sector_type_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `name_secondary`, `description`, `short_description`, `notes`, `zone_exit`, `danger_level`, `zone_id`, `sector_type_id`) VALUES
(1, 'The Temple Of Midgaard', NULL, 'You are in the southern end of the temple hall in the Temple of Midgaard. The temple has been constructed from giant marble blocks, eternal in appearance, and most of the walls are covered by ancient wall paintings of Gods, Giants, Warriors, and peasants.  Braziers of eternal flame are located in the corners of the temple, lighting up the room brighter than the strongest sunlight.\r\n   Large steps lead down to the grand temple gate, descending the huge\r\nmound upon which the temple is built.', NULL, '', 0, 0, 1, 1),
(3, 'By the Temple Altar', '', 'You are by the temple altar in the northern end of the Temple of Midgaard. A huge altar made from white polished marble is standing in front of you and behind it is a ten foot tall sitting statue of Odin, the King of the Gods.  Braziers of eternal flame are located in the corners of the temple, lighting up the room brighter than the strongest sunlight.  A small oak door is next to the altar.', NULL, '', 0, 0, 1, NULL),
(4, 'Outside the Altar', '', 'You have stepped just outside the Temple Altar at Midgaard.  A cool breeze caresses your face, and a peaceful calm aura surrounds you.  You look up, and notice a path of tiny brown cobblestones leading to the north.', NULL, '', 1, 0, 3, NULL),
(5, 'The Social Board Room', '', 'A huge bulletin board is erected here, against a wall of pastel hues. Various comfortable chairs and tables are bunched together, for this place is the center of mud society.', NULL, '', 0, 0, 1, NULL),
(6, 'The Suggestion Board Room', '', 'A huge bulletin board is erected here, against an old red brick wall. Various stone benches are scattered throughout, for this place is the center of much discussion.', NULL, '', 0, 0, 1, NULL),
(7, 'Grand Gates of the Temple of Midgaard', '', 'You stand at the base of the huge mound upon which the Temple of Midgaard is built within the Grand Gates of the Temple.  The gates are gargantuan in size and are made of solid gold with ancient designs of Gods, Giants, Warriors, and peasants.\r\n   Steps hewn from huge marble blocks lead the way up the mound to the actual temple itself while south beyond the gates is what is commonly known as the Temple Square.\r\n   Braziers of eternal flame built upon the posts of the foundation of the temple wall brightly light up the sky, even in the day.', NULL, '', 0, 0, 1, NULL),
(8, 'North Temple Square', '', '   You are standing at the northern end of the temple square.  Huge marble steps lead to the Great Gate of the Temple of Midgaard.  Pilgrims who make a yearly pilgrimage to the temple can be seen passing through the gates. Along the street can be found tall poles with magical lanterns, provided by the sorcerer''s guild, that glow with a bright light when it gets dark.\r\n   The entrance to the Clerics'' Guild is to the west and the old Grunting Boar Inn is to the east.', NULL, '', 0, 0, 1, NULL),
(14, 'asdf', '', 'asdf', NULL, '', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_coords`
--

CREATE TABLE IF NOT EXISTS `room_coords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `x_pos` int(11) NOT NULL,
  `y_pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `room_coords`
--

INSERT INTO `room_coords` (`id`, `room_id`, `x_pos`, `y_pos`) VALUES
(1, 1, 0, 0),
(5, 3, 0, -50),
(8, 5, 70, 0),
(9, 6, -70, 0),
(10, 7, 0, 50),
(11, 8, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `room_examines`
--

CREATE TABLE IF NOT EXISTS `room_examines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `room_examines`
--


-- --------------------------------------------------------

--
-- Table structure for table `room_mob_spawns`
--

CREATE TABLE IF NOT EXISTS `room_mob_spawns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mob_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `init_quantity` int(11) NOT NULL DEFAULT '1',
  `max_quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `room_mob_spawns`
--

INSERT INTO `room_mob_spawns` (`id`, `mob_id`, `room_id`, `init_quantity`, `max_quantity`) VALUES
(1, 2, 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE IF NOT EXISTS `room_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `description`) VALUES
(2, 'Normal', 'This is a normal room'),
(3, 'Pain', 'This causes pain every tic'),
(4, 'Peace', 'Can''t fight anyone here.'),
(5, 'No Magic', 'Can''t do any magic here'),
(6, 'No Recite', 'Can''t recite a scroll here'),
(7, 'No Potion', 'Can''t quaff a potion here');

-- --------------------------------------------------------

--
-- Table structure for table `room_types_rooms`
--

CREATE TABLE IF NOT EXISTS `room_types_rooms` (
  `room_type_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room_types_rooms`
--


-- --------------------------------------------------------

--
-- Table structure for table `sector_types`
--

CREATE TABLE IF NOT EXISTS `sector_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sector_types`
--

INSERT INTO `sector_types` (`id`, `name`, `description`) VALUES
(1, 'Something1', 'desc'),
(2, 'Something2', 'desc');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE IF NOT EXISTS `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
(1, 'small'),
(2, 'tiny'),
(3, 'special'),
(4, 'normal'),
(5, 'large');

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE IF NOT EXISTS `weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `damage_base` int(11) NOT NULL,
  `damage_roll` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`id`, `item_id`, `damage_base`, `damage_roll`) VALUES
(4, 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authors` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `zone_number` int(11) NOT NULL,
  `suggested_min_lvl` int(11) DEFAULT NULL,
  `suggested_max_lvl` int(11) DEFAULT NULL,
  `min_lvl` int(11) DEFAULT NULL,
  `max_lvl` int(11) DEFAULT NULL,
  `base_x_pos` int(11) NOT NULL,
  `base_y_pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `authors`, `name`, `description`, `zone_number`, `suggested_min_lvl`, `suggested_max_lvl`, `min_lvl`, `max_lvl`, `base_x_pos`, `base_y_pos`) VALUES
(1, 'Authors - Original DikuMUD authors Modifications by Pestilence ', 'Northern Midgaard Main City', 'The city of Midgaard is the center of activity.  Starting from here, you  are free to adventure far and wide.  Shops and various guilds line the streets to assist you in your adventuring needs.  Dogs, drunks, and other vermin wander about the city.', 10, NULL, NULL, NULL, NULL, 0, 0),
(2, '', 'New Southern Midgaard', 'To the south of Midgaard is the city park.  It is a nice place to go, to get away from the hustle and bustle of the main city.  This is an area constantly expanding.  New shops have moved in, as well as new citizens.', 11, NULL, NULL, NULL, NULL, 0, 0),
(3, 'ME', 'Other for Now', 'This is a place I can put rooms that I don''t care about at the moment.', -1, NULL, NULL, NULL, NULL, 0, 0);
