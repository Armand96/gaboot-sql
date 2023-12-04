/*
 Navicat Premium Data Transfer

 Source Server         : MySQL - Local
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : gaboot

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 04/12/2023 21:06:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerId` int UNSIGNED NOT NULL,
  `productId` int UNSIGNED NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imgThumbPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'GPU Nvidia', 'ya GPU Nvidia', 'storage/category/pictures/GPU_Nvidia1700895189447.jpg', 'storage/category/pictures/thumb/GPU_Nvidia1700895189447_thumb.jpg', '2023-11-25 06:53:09', '2023-11-25 06:53:09');
INSERT INTO `categories` VALUES (2, 'GPU AMD', 'GPU AMD RADEON', 'storage/category/pictures/GPU_AMD1700895263018.png', 'storage/category/pictures/thumb/GPU_AMD1700895263018_thumb.png', '2023-11-25 06:54:23', '2023-11-25 06:54:23');

-- ----------------------------
-- Table structure for master_customers
-- ----------------------------
DROP TABLE IF EXISTS `master_customers`;
CREATE TABLE `master_customers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressDetail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NULL DEFAULT 0,
  `longitude` double NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `imgPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imgThumbPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_customers
-- ----------------------------
INSERT INTO `master_customers` VALUES (1, 'Armand', 'Iskandar', 'armand', 'nigga@nigga.com', '', '', 0, 0, '$2b$10$szqhvAE8dU29ShiRAOiPyumW4OeJ3dpPoXo716p68SlBGNMnzrtOq', NULL, 1, 'uploads\\customers\\pictures\\armand.jpg', 'uploads\\customers\\pictures\\thumbnail\\armand.jpg', '2023-11-25 12:52:17', '2023-11-25 13:27:30');

-- ----------------------------
-- Table structure for master_menus
-- ----------------------------
DROP TABLE IF EXISTS `master_menus`;
CREATE TABLE `master_menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `menuName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuIcon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `backendUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `frontendurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `menuHaveChild` tinyint(1) NOT NULL DEFAULT 0,
  `menuIsActive` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_menus
-- ----------------------------
INSERT INTO `master_menus` VALUES (1, 'User', 'fas fa-user', NULL, NULL, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `master_menus` VALUES (2, 'Product', 'fas fa-cubes', NULL, NULL, 1, 1, '2023-11-21 07:23:26', '2023-11-21 07:36:58');

-- ----------------------------
-- Table structure for master_products
-- ----------------------------
DROP TABLE IF EXISTS `master_products`;
CREATE TABLE `master_products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `stock` int UNSIGNED NOT NULL,
  `dimension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double UNSIGNED NOT NULL,
  `weightUnit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_products
-- ----------------------------
INSERT INTO `master_products` VALUES (3, 'RTX 3060', 'RTX 3060', 4000, 4, 'ajibb', 2, 'KG', 1, 1, '2023-11-25 08:48:18', '2023-11-25 09:38:21');

-- ----------------------------
-- Table structure for master_roles
-- ----------------------------
DROP TABLE IF EXISTS `master_roles`;
CREATE TABLE `master_roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_roles
-- ----------------------------
INSERT INTO `master_roles` VALUES (1, 'Admin', '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `master_roles` VALUES (2, 'Sub Admin', '2023-11-03 17:40:18', '2023-11-15 14:40:20');
INSERT INTO `master_roles` VALUES (3, 'Tezt', '2023-11-21 07:24:45', '2023-11-21 09:32:57');

-- ----------------------------
-- Table structure for master_submenus
-- ----------------------------
DROP TABLE IF EXISTS `master_submenus`;
CREATE TABLE `master_submenus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `menuId` int UNSIGNED NOT NULL,
  `submenuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submenuIcon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `backendUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `frontendurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `submenuIsActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_submenus
-- ----------------------------
INSERT INTO `master_submenus` VALUES (1, 1, 'User', 'fas fa-user', '/user', '/user', 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `master_submenus` VALUES (2, 1, 'Role', 'fas fa-user-gear', '/role', '/role', 1, '2023-11-04 00:35:44', '2023-11-04 00:40:01');
INSERT INTO `master_submenus` VALUES (3, 1, 'Menu', 'fas fa-minus', '/menu', '/menu', 1, '2023-11-04 00:35:44', '2023-11-04 00:40:02');
INSERT INTO `master_submenus` VALUES (4, 2, 'Category', 'fas fa-cubes', '/categories', '/categories', 1, '2023-11-21 07:23:53', '2023-11-21 07:36:50');
INSERT INTO `master_submenus` VALUES (5, 2, 'Product', 'fas fa-cube', '/products', '/products', 1, '2023-11-21 09:32:46', '2023-11-21 09:32:46');

-- ----------------------------
-- Table structure for master_users
-- ----------------------------
DROP TABLE IF EXISTS `master_users`;
CREATE TABLE `master_users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `imgPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imgThumbPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roleId` int UNSIGNED NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_users
-- ----------------------------
INSERT INTO `master_users` VALUES (1, 'admin', 'admin@example.com', 'admin', 'admin', '$2b$10$VinhbaHFCPGyLXfxKKhtKOoAolmnvpzvOsxgYV2zGV4SPn4pkbvBO', NULL, 1, 'storage/user/pictures/admin.png', 'storage/user/pictures/thumb/admin_thumb.png', 1, '2023-11-03 17:35:49', '2023-11-03 17:36:09');
INSERT INTO `master_users` VALUES (2, 'mand', 'mand@mail.com', 'mand', 'kandar', '$2b$10$qpVaUjzAjGbhkiiX2xJDBOdj2t59j3ajfLXeWwMpuz1CRcGySydeu', NULL, 1, 'storage/user/pictures/mand.png', 'storage/user/pictures/thumb/mand_thumb.png', 3, '2023-11-03 17:41:58', '2023-11-21 07:32:57');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2023_11_03_161057_create_master_users_table', 1);
INSERT INTO `migrations` VALUES (3, '2023_11_03_162300_create_master_roles_table', 1);
INSERT INTO `migrations` VALUES (4, '2023_11_03_162435_create_master_menus_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_11_03_162710_create_master_submenus_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_11_03_163732_create_master_customers_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_11_03_164305_create_master_products_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_11_03_164759_create_carts_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_11_03_164940_create_categories_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_11_03_165105_create_role_accesses_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_11_03_165315_create_role_menus_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_11_03_165517_create_role_submenus_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_11_03_165629_create_wishlists_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_11_05_103034_create_product_images_table', 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cartId` int NULL DEFAULT NULL,
  `customerId` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expired` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `transactionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchantId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paymentType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `transactionTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `transactionStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fraudStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vaNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expiry_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnailPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` int NOT NULL,
  `isCover` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp(0) NULL DEFAULT NULL,
  `updatedAt` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (22, 'storage/product/pictures/RTX_3060_1701694263421.png', 'storage/product/pictures/thumb/RTX_3060_1701694263421_thumb.png', 3, 0, '2023-12-04 19:51:03', '2023-12-04 19:51:03');
INSERT INTO `product_images` VALUES (23, 'storage/product/pictures/RTX_3060_1701694263426.png', 'storage/product/pictures/thumb/RTX_3060_1701694263426_thumb.png', 3, 0, '2023-12-04 19:51:03', '2023-12-04 19:51:03');

-- ----------------------------
-- Table structure for role_accesses
-- ----------------------------
DROP TABLE IF EXISTS `role_accesses`;
CREATE TABLE `role_accesses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleId` int UNSIGNED NOT NULL,
  `menuId` int UNSIGNED NOT NULL,
  `submenuId` int UNSIGNED NOT NULL,
  `frontendUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `backendUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createz` tinyint(1) NOT NULL,
  `readz` tinyint(1) NOT NULL,
  `updatez` tinyint(1) NOT NULL,
  `deletez` tinyint(1) NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_accesses
-- ----------------------------
INSERT INTO `role_accesses` VALUES (1, 1, 1, 1, '/user', '/user', 1, 1, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_accesses` VALUES (2, 1, 1, 2, '/role', '/role', 1, 1, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_accesses` VALUES (3, 1, 1, 3, '/menu', '/menu', 1, 1, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_accesses` VALUES (8, 2, 1, 1, '/user', '/user', 0, 0, 0, 0, '2023-11-15 14:40:20', '2023-11-15 14:40:20');
INSERT INTO `role_accesses` VALUES (13, 3, 1, 3, '/menu', '/menu', 1, 1, 1, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_accesses` VALUES (14, 3, 1, 2, '/role', '/role', 1, 1, 1, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_accesses` VALUES (15, 3, 1, 1, '/user', '/user', 1, 1, 1, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_accesses` VALUES (16, 3, 2, 5, '/products', '/products', 1, 1, 1, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_accesses` VALUES (17, 3, 2, 4, '/categories', '/categories', 1, 1, 1, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleId` int UNSIGNED NOT NULL,
  `menuId` int UNSIGNED NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (1, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_menus` VALUES (4, 2, 1, '2023-11-15 14:40:20', '2023-11-15 14:40:20');
INSERT INTO `role_menus` VALUES (7, 3, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_menus` VALUES (8, 3, 2, '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- ----------------------------
-- Table structure for role_submenus
-- ----------------------------
DROP TABLE IF EXISTS `role_submenus`;
CREATE TABLE `role_submenus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleId` int UNSIGNED NOT NULL,
  `roleMenuId` int UNSIGNED NOT NULL,
  `submenuId` int UNSIGNED NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_submenus
-- ----------------------------
INSERT INTO `role_submenus` VALUES (1, 1, 1, 1, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_submenus` VALUES (2, 1, 1, 2, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_submenus` VALUES (3, 1, 1, 3, '2023-11-04 00:35:44', '2023-11-04 00:35:44');
INSERT INTO `role_submenus` VALUES (8, 2, 4, 1, '2023-11-15 14:40:20', '2023-11-15 14:40:20');
INSERT INTO `role_submenus` VALUES (13, 3, 7, 3, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_submenus` VALUES (14, 3, 7, 2, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_submenus` VALUES (15, 3, 7, 1, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_submenus` VALUES (16, 3, 8, 5, '2023-11-21 09:32:57', '2023-11-21 09:32:57');
INSERT INTO `role_submenus` VALUES (17, 3, 8, 4, '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `productId` int UNSIGNED NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  `updatedAt` datetime(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlists
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
