/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : nro_dynamic

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 17/02/2025 20:43:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 1,
  `ban` tinyint NOT NULL DEFAULT 0,
  `vnd` int NOT NULL DEFAULT 0,
  `ip_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time_logout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'tuanbeo', 'tuanbeo', 0, 1, 0, 0, '127.0.0.1', '2024-12-26 19:20:42', '2025-02-17 20:33:32', '2024-12-26 19:20:42');
INSERT INTO `account` VALUES (2, '2', '2', 0, 1, 0, 0, '127.0.0.1', '2025-02-02 20:15:17', '2025-02-12 18:04:37', '2025-02-02 20:15:17');
INSERT INTO `account` VALUES (3, '3', '3', 0, 1, 0, 0, '127.0.0.1', '2025-02-12 18:06:58', '2025-02-17 20:33:24', '2025-02-12 18:06:58');

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `head` int NOT NULL,
  `gender` tinyint NOT NULL,
  `clan_id` int NOT NULL DEFAULT -1,
  `have_tennis_space_ship` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_account_player`(`account_id` ASC) USING BTREE,
  INDEX `idx_account_id`(`account_id` ASC) USING BTREE,
  CONSTRAINT `fk_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES (1, 1, 'arriety', 31, 0, -1, 0, '2025-02-16 22:39:21');
INSERT INTO `player` VALUES (2, 3, 'mew23', 9, 1, -1, 0, '2025-02-17 06:38:12');

-- ----------------------------
-- Table structure for player_currencies
-- ----------------------------
DROP TABLE IF EXISTS `player_currencies`;
CREATE TABLE `player_currencies`  (
  `player_id` int NOT NULL,
  `gold` bigint NOT NULL DEFAULT 0,
  `gem` int NOT NULL DEFAULT 0,
  `ruby` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `fk_player_inventory_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_currencies
-- ----------------------------
INSERT INTO `player_currencies` VALUES (1, 2000, 0, 50);
INSERT INTO `player_currencies` VALUES (2, 2000, 0, 50);

-- ----------------------------
-- Table structure for player_items_bag
-- ----------------------------
DROP TABLE IF EXISTS `player_items_bag`;
CREATE TABLE `player_items_bag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `temp_id` int NOT NULL DEFAULT -1,
  `quantity` int NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_player_id`(`player_id` ASC) USING BTREE,
  CONSTRAINT `fk_player_items_bag_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_items_bag
-- ----------------------------
INSERT INTO `player_items_bag` VALUES (1, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (2, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (3, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (4, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (5, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (6, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (7, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (8, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (9, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (10, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (11, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (12, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (13, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (14, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (15, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (16, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (17, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (18, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (19, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (20, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_bag` VALUES (21, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (22, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (23, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (24, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (25, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (26, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (27, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (28, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (29, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (30, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (31, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (32, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (33, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (34, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (35, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (36, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (37, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (38, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (39, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_bag` VALUES (40, 2, -1, 0, '2025-02-17 06:38:12', '[]');

-- ----------------------------
-- Table structure for player_items_body
-- ----------------------------
DROP TABLE IF EXISTS `player_items_body`;
CREATE TABLE `player_items_body`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `temp_id` int NOT NULL DEFAULT -1,
  `quantity` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_player_id`(`player_id` ASC) USING BTREE,
  CONSTRAINT `fk_player_items_body_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_items_body
-- ----------------------------
INSERT INTO `player_items_body` VALUES (1, 1, 0, 1, '2025-02-16 22:39:21', '[[47,2]]');
INSERT INTO `player_items_body` VALUES (2, 1, 6, 1, '2025-02-16 22:39:21', '[[47,3]]');
INSERT INTO `player_items_body` VALUES (3, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (4, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (5, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (6, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (7, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (8, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (9, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (10, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_body` VALUES (11, 2, 1, 1, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (12, 2, 7, 1, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (13, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (14, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (15, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (16, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (17, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (18, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (19, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_body` VALUES (20, 2, -1, 0, '2025-02-17 06:38:12', '[]');

-- ----------------------------
-- Table structure for player_items_box
-- ----------------------------
DROP TABLE IF EXISTS `player_items_box`;
CREATE TABLE `player_items_box`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `temp_id` int NOT NULL DEFAULT -1,
  `quantity` int NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_player_id`(`player_id` ASC) USING BTREE,
  CONSTRAINT `fk_player_items_box_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_items_box
-- ----------------------------
INSERT INTO `player_items_box` VALUES (1, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (2, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (3, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (4, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (5, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (6, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (7, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (8, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (9, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (10, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (11, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (12, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (13, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (14, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (15, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (16, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (17, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (18, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (19, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (20, 1, -1, 0, '2025-02-16 22:39:21', '[]');
INSERT INTO `player_items_box` VALUES (21, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (22, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (23, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (24, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (25, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (26, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (27, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (28, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (29, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (30, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (31, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (32, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (33, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (34, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (35, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (36, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (37, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (38, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (39, 2, -1, 0, '2025-02-17 06:38:12', '[]');
INSERT INTO `player_items_box` VALUES (40, 2, -1, 0, '2025-02-17 06:38:12', '[]');

-- ----------------------------
-- Table structure for player_location
-- ----------------------------
DROP TABLE IF EXISTS `player_location`;
CREATE TABLE `player_location`  (
  `player_id` int NOT NULL,
  `pos_x` int NOT NULL DEFAULT 0,
  `pos_y` int NOT NULL DEFAULT 0,
  `map_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `fk_player_location_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_location
-- ----------------------------
INSERT INTO `player_location` VALUES (1, 318, 432, 0);
INSERT INTO `player_location` VALUES (2, 431, 432, 0);

-- ----------------------------
-- Table structure for player_magic_tree
-- ----------------------------
DROP TABLE IF EXISTS `player_magic_tree`;
CREATE TABLE `player_magic_tree`  (
  `player_id` int NOT NULL,
  `is_upgrade` tinyint NOT NULL DEFAULT 0,
  `time_upgrade` bigint NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 1,
  `time_harvest` bigint NOT NULL DEFAULT 0,
  `curr_pea` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `fk_player_magic_tree_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_magic_tree
-- ----------------------------
INSERT INTO `player_magic_tree` VALUES (1, 0, 1739720361028, 1, 1739720361028, 0);
INSERT INTO `player_magic_tree` VALUES (2, 0, 1739749092288, 1, 1739749092288, 0);

-- ----------------------------
-- Table structure for player_point
-- ----------------------------
DROP TABLE IF EXISTS `player_point`;
CREATE TABLE `player_point`  (
  `player_id` int NOT NULL,
  `hp` bigint NOT NULL DEFAULT 0,
  `hp_default` bigint NOT NULL DEFAULT 0,
  `hp_max` bigint NOT NULL DEFAULT 0,
  `hp_current` bigint NOT NULL DEFAULT 0,
  `mp` bigint NOT NULL DEFAULT 0,
  `mp_default` bigint NOT NULL DEFAULT 0,
  `mp_max` bigint NOT NULL DEFAULT 0,
  `mp_current` bigint NOT NULL DEFAULT 0,
  `dame` bigint NOT NULL DEFAULT 0,
  `dame_max` bigint NOT NULL DEFAULT 0,
  `dame_default` bigint NOT NULL DEFAULT 0,
  `stamina` int NOT NULL DEFAULT 0,
  `max_stamina` int NOT NULL DEFAULT 0,
  `crit` tinyint NOT NULL DEFAULT 0,
  `crit_default` int NOT NULL DEFAULT 0,
  `defense` int NOT NULL DEFAULT 0,
  `def_default` bigint NOT NULL DEFAULT 0,
  `power` bigint NOT NULL DEFAULT 0,
  `limit_power` int NOT NULL DEFAULT 0,
  `tiem_nang` bigint NOT NULL DEFAULT 0,
  `nang_dong` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `fk_player_stats_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of player_point
-- ----------------------------
INSERT INTO `player_point` VALUES (1, 100, 100, 120, 120, 100, 100, 100, 100, 15, 15, 15, 1000, 1000, 0, 0, 0, 0, 2000, 100, 1200, 0);
INSERT INTO `player_point` VALUES (2, 100, 100, 120, 120, 100, 100, 100, 100, 15, 15, 15, 1000, 1000, 0, 0, 0, 0, 2000, 100, 1200, 0);

-- ----------------------------
-- Table structure for player_skills_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `player_skills_shortcut`;
CREATE TABLE `player_skills_shortcut`  (
  `player_id` int NOT NULL,
  `slot_1` smallint NULL DEFAULT NULL,
  `slot_2` smallint NULL DEFAULT NULL,
  `slot_3` smallint NULL DEFAULT NULL,
  `slot_4` smallint NULL DEFAULT NULL,
  `slot_5` smallint NULL DEFAULT NULL,
  `slot_6` smallint NULL DEFAULT NULL,
  `slot_7` smallint NULL DEFAULT NULL,
  `slot_8` smallint NULL DEFAULT NULL,
  `slot_9` smallint NULL DEFAULT NULL,
  `slot_10` smallint NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `player_skills_shortcut_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_skills_shortcut
-- ----------------------------
INSERT INTO `player_skills_shortcut` VALUES (1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `player_skills_shortcut` VALUES (2, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1);

-- ----------------------------
-- Table structure for player_task
-- ----------------------------
DROP TABLE IF EXISTS `player_task`;
CREATE TABLE `player_task`  (
  `player_id` int NOT NULL,
  `task_id` int NOT NULL,
  `task_index` int NOT NULL DEFAULT 0,
  `task_count` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`, `task_id`) USING BTREE,
  CONSTRAINT `player_task_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_task
-- ----------------------------
INSERT INTO `player_task` VALUES (1, 0, 0, 0);
INSERT INTO `player_task` VALUES (2, 0, 0, 0);

-- ----------------------------
-- Procedure structure for ClearPlayerData
-- ----------------------------
DROP PROCEDURE IF EXISTS `ClearPlayerData`;
delimiter ;;
CREATE PROCEDURE `ClearPlayerData`()
BEGIN
    SET FOREIGN_KEY_CHECKS = 0;
    TRUNCATE TABLE player_currencies;
    TRUNCATE TABLE player_items_bag;
    TRUNCATE TABLE player_items_body;
    TRUNCATE TABLE player_items_box;
    TRUNCATE TABLE player_location;
    TRUNCATE TABLE player_magic_tree;
    TRUNCATE TABLE player_point;
    TRUNCATE TABLE player_skills_shortcut;
    TRUNCATE TABLE player_task;
    TRUNCATE TABLE player;
    SET FOREIGN_KEY_CHECKS = 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CreatePlayerBase
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreatePlayerBase`;
delimiter ;;
CREATE PROCEDURE `CreatePlayerBase`(IN `accountId` INT, 
    IN `playerName` VARCHAR(50), 
    IN `playerGender` TINYINT, 
    IN playerHair int, 
    OUT `newPlayerId` INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET newPlayerId = NULL;
    END;

    INSERT INTO player (account_id, name, gender, head)
    VALUES (accountId, playerName, playerGender, playerHair);

    SET newPlayerId = LAST_INSERT_ID();
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
