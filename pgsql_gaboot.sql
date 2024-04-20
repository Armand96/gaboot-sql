-- Table structure for carts
DROP TABLE IF EXISTS carts;
CREATE TABLE carts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id uuid NOT NULL,
  product_id uuid NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  quantity INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

-- Table structure for categories
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  image_path VARCHAR(255),
  thumbnail_path VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

-- Records of categories
INSERT INTO categories (id, name, description, image_path, thumbnail_path, created_at, updated_at) VALUES
('cf994b06-4b97-41bd-884e-365a805ce36c', 'GPU Nvidia', 'ya GPU Nvidia', 'storage/category/pictures/GPU_Nvidia1700895189447.jpg', 'storage/category/pictures/thumb/GPU_Nvidia1700895189447_thumb.jpg', '2023-11-25 06:53:09', '2023-11-25 06:53:09'),
('cf994b06-4b97-41bd-884e-365a805ce36d', 'GPU AMD', 'GPU AMD RADEON', 'storage/category/pictures/GPU_AMD1700895263018.png', 'storage/category/pictures/thumb/GPU_AMD1700895263018_thumb.png', '2023-11-25 06:54:23', '2023-11-25 06:54:23');

-- Table structure for master_customers
DROP TABLE IF EXISTS master_customers;

CREATE TABLE master_customers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  address_detail TEXT NOT NULL,
  latitude DOUBLE PRECISION DEFAULT 0,
  longitude DOUBLE PRECISION DEFAULT 0,
  password VARCHAR(255) NOT NULL,
  token VARCHAR(255),
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  image_path VARCHAR(255),
  thumbnail_path VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of master_customers
INSERT INTO master_customers (firstname, lastname, username, email, phone_number, address_detail, latitude, longitude, password, token, is_active, image_path, thumbnail_path, created_at, updated_at) VALUES
('Armand', 'Iskandar', 'armand', 'nigga@nigga.com', '', '', 0, 0, '$2b$10$szqhvAE8dU29ShiRAOiPyumW4OeJ3dpPoXo716p68SlBGNMnzrtOq', NULL, TRUE, 'uploads\\customers\\pictures\\armand.jpg', 'uploads\\customers\\pictures\\thumbnail\\armand.jpg', '2023-11-25 12:52:17', '2023-11-25 13:27:30'),
('Elaina', 'Celesteria', 'elaina023', 'elaina023@example.com', '', '', 0, 0, '$2b$10$FYCKzXIA4OCEeAJ3Z2UKhuh85EV3FYV/lhXOXCiprTCxut7vpALh.', NULL, TRUE, 'uploads\\customers\\pictures\\elaina023.jpg', 'uploads\\customers\\pictures\\thumbnail\\elaina023.jpg', '2023-11-23 13:47:27', '2024-02-07 15:59:46'),
('Admin', 'Pusat', 'admin', 'adminexample.com', '', '', 0, 0, '$2b$10$tBzawPcZK43h/TAIddCdmeHogsPWKrQnvnL3MkJM4uoD/J1hBIKNC', '7c68a64d4c8a88175bcbb959c7ffc1e724747c20bd66e06deaa6c95836a1a9fd', TRUE, 'uploads\\customers\\pictures\\elaina023.jpg', 'uploads\\customers\\pictures\\thumbnail\\elaina023.jpg', '2023-11-23 13:47:27', '2024-02-20 01:42:45');

-- Table structure for master_menus
DROP TABLE IF EXISTS master_menus;

CREATE TABLE master_menus (
  id uuid PRIMARY KEY default gen_random_uuid(),
  menu_name VARCHAR(100) NOT NULL,
  menu_icon VARCHAR(100) NOT NULL,
  backend_url VARCHAR(255),
  frontend_url VARCHAR(255),
  menu_have_child BOOLEAN NOT NULL DEFAULT FALSE,
  menu_is_active BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO master_menus (id, menu_name, menu_icon, backend_url, frontend_url, menu_have_child, menu_is_active, created_at, updated_at) VALUES
('fa8ddb53-4f5f-48ac-a15a-47308417fc63', 'User', 'fas fa-user', NULL, NULL, TRUE, TRUE, '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('fa8ddb53-4f5f-48ac-a15a-47308417fc64', 'Product', 'fas fa-cubes', NULL, NULL, TRUE, TRUE, '2023-11-21 07:23:26', '2023-11-21 07:36:58');

-- Table structure for master_products
DROP TABLE IF EXISTS master_products;
CREATE TABLE master_products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(150) NOT NULL,
  description TEXT NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  stock INT DEFAULT 0,
  dimension VARCHAR(255) NOT NULL,
  weight DOUBLE PRECISION NOT NULL,
  weight_unit VARCHAR(20) NOT NULL,
  category_id uuid NOT NULL,
  total_sales INT NOT NULL DEFAULT 0,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of master_products
INSERT INTO master_products (id, name, description, price, stock, dimension, weight, weight_unit, category_id, total_sales, is_active, created_at, updated_at) VALUES 
('fe8ddb53-4f5f-48ac-a15a-47308417fc60', 'RTX 3060 ASUS', 'RTX ASUS Dual', 5000000, 4, '240mm', 2, 'Kilogram', 'cf994b06-4b97-41bd-884e-365a805ce36c', 0, TRUE, '2023-11-25 08:48:18', '2023-11-25 09:38:21'),
('fe8ddb53-4f5f-48ac-a15a-47308417fc61', 'RTX 4090 MSI', 'Nvidia RTX 4090 MSI Gaming X Trio', 35000000, 12, '360mm', 5, 'Kilogram', 'cf994b06-4b97-41bd-884e-365a805ce36c', 0, TRUE, '2023-11-25 08:48:18', '2023-11-25 09:38:21'),
('fe8ddb53-4f5f-48ac-a15a-47308417fc62', 'RTX 4070 ASUS', 'Nvidia RTX 4070 ASUS ROG STRIX', 15000000, 5, '360mm', 5, 'Kilogram', 'cf994b06-4b97-41bd-884e-365a805ce36c', 0, TRUE, '2023-11-25 08:48:18', '2023-11-25 09:38:21');

-- Table structure for master_roles
DROP TABLE IF EXISTS master_roles;
CREATE TABLE master_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  role_name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of master_roles
INSERT INTO master_roles (id, role_name, created_at, updated_at) VALUES 
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', 'Admin', '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc64', 'Sub Admin', '2023-11-03 17:40:18', '2023-11-15 14:40:20'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'Tezt', '2023-11-21 07:24:45', '2023-11-21 09:32:57');

-- Table structure for master_submenus
DROP TABLE IF EXISTS master_submenus;
CREATE TABLE master_submenus (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  menu_id uuid NOT NULL,
  submenu_name VARCHAR(50) NOT NULL,
  submenu_icon VARCHAR(50) NOT NULL,
  backend_url VARCHAR(255),
  frontend_url VARCHAR(255),
  submenu_is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of master_submenus
INSERT INTO master_submenus (id, menu_id, submenu_name, submenu_icon, backend_url, frontend_url, submenu_is_active, created_at, updated_at) VALUES 
('2f8ddb53-4f5f-48ac-a15a-47308417fc63', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', 'User', 'fas fa-user', '/user', '/user', TRUE, '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('2f8ddb53-4f5f-48ac-a15a-47308417fc64', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', 'Role', 'fas fa-user-gear', '/role', '/role', TRUE, '2023-11-04 00:35:44', '2023-11-04 00:40:01'),
('2f8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', 'Menu', 'fas fa-minus', '/menu', '/menu', TRUE, '2023-11-04 00:35:44', '2023-11-04 00:40:02'),
('2f8ddb53-4f5f-48ac-a15a-47308417fc66', 'fa8ddb53-4f5f-48ac-a15a-47308417fc64','Category', 'fas fa-cubes', '/categories', '/categories', TRUE, '2023-11-21 07:23:53', '2023-11-21 07:36:50'),
('2f8ddb53-4f5f-48ac-a15a-47308417fc67', 'fa8ddb53-4f5f-48ac-a15a-47308417fc64','Product', 'fas fa-cube', '/products', '/products', TRUE, '2023-11-21 09:32:46', '2023-11-21 09:32:46');

-- Table structure for master_users
DROP TABLE IF EXISTS master_users;
CREATE TABLE master_users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  token VARCHAR(255),
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  image_path VARCHAR(255),
  thumbnail_path VARCHAR(255),
  role_id uuid NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of master_users
INSERT INTO master_users (userName, email, firstName, lastName, password, token, is_active, image_path, thumbnail_path, role_id, created_at, updated_at) VALUES 
('admin', 'admin@example.com', 'admin', 'admin', '$2b$10$VinhbaHFCPGyLXfxKKhtKOoAolmnvpzvOsxgYV2zGV4SPn4pkbvBO', NULL, TRUE, 'storage/user/pictures/admin.png', 'storage/user/pictures/thumb/admin_thumb.png', 'ef8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-03 17:35:49', '2023-11-03 17:36:09'),
('mand', 'mand@mail.com', 'mand', 'kandar', '$2b$10$qpVaUjzAjGbhkiiX2xJDBOdj2t59j3ajfLXeWwMpuz1CRcGySydeu', NULL, TRUE, 'storage/user/pictures/mand.png', 'storage/user/pictures/thumb/mand_thumb.png', 'ef8ddb53-4f5f-48ac-a15a-47308417fc65', '2023-11-03 17:41:58', '2023-11-21 07:32:57');

-- Table structure for order_details
DROP TABLE IF EXISTS order_details;
CREATE TABLE order_details (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id uuid NOT NULL,
  product_id uuid NOT NULL,
  price DOUBLE PRECISION NOT NULL DEFAULT 0,
  discount DOUBLE PRECISION NOT NULL DEFAULT 0,
  quantity INT NOT NULL DEFAULT 0,
  total DOUBLE PRECISION NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255),
  customer_id uuid NOT NULL,
  total_price DOUBLE PRECISION,
  discount DOUBLE PRECISION DEFAULT 0,
  grand_total DOUBLE PRECISION DEFAULT 0,
  total_item INT DEFAULT 0,
  status VARCHAR(255),
  expired VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for payments
DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id uuid NOT NULL,
  gross_amount DOUBLE PRECISION DEFAULT 0,
  name VARCHAR(255),
  transaction_id VARCHAR(255),
  merchant_id VARCHAR(255),
  payment_type VARCHAR(255),
  description VARCHAR(255),
  transaction_time VARCHAR(255),
  transaction_status VARCHAR(255),
  fraud_status VARCHAR(255),
  bank VARCHAR(255),
  va_number VARCHAR(255),
  currency VARCHAR(255),
  expiry_time VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of payments
INSERT INTO payments (name, transaction_id, merchant_id, payment_type, description, transaction_time, transaction_status, fraud_status, bank, va_number, currency, expiry_time, created_at, updated_at) VALUES 
('Beli RTX 4060', '21374f33-5321-4333-ad42-d688f95d2f9a', 'G097954025', 'bank_transfer', 'Beli RTX 4060 MSI', '2024-02-19 21:05:30', 'settlement', 'accept', 'bca', '54025294087', 'IDR', '2024-02-20 21:05:27', '2024-02-19 21:05:33', '2024-02-19 21:05:33');

-- Table structure for product_images
DROP TABLE IF EXISTS product_images;
CREATE TABLE product_images (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  image_path VARCHAR(255) NOT NULL,
  thumbnail_path VARCHAR(255) NOT NULL,
  product_id uuid NOT NULL,
  is_cover BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL
);

-- Records of product_images
INSERT INTO product_images (image_path, thumbnail_path, product_id, is_cover, created_at, updated_at) VALUES 
('storage/product/pictures/RTX_3060_1701694263421.png', 'storage/product/pictures/thumb/RTX_3060_1701694263421_thumb.png', 'fe8ddb53-4f5f-48ac-a15a-47308417fc60', FALSE, '2023-12-04 19:51:03', '2023-12-04 19:51:03'),
('storage/product/pictures/RTX_4090_1701694263426.png', 'storage/product/pictures/thumb/RTX_4090_1701694263426_thumb.png', 'fe8ddb53-4f5f-48ac-a15a-47308417fc61', FALSE, '2023-12-04 19:51:03', '2023-12-04 19:51:03'),
('storage/product/pictures/RTX_4070_1701694263426.png', 'storage/product/pictures/thumb/RTX_4070_1701694263426_thumb.png', 'fe8ddb53-4f5f-48ac-a15a-47308417fc62', FALSE, '2023-12-04 19:51:03', '2023-12-04 19:51:03');

-- Table structure for role_accesses
DROP TABLE IF EXISTS role_accesses;
CREATE TABLE role_accesses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  role_id uuid NOT NULL,
  menu_id uuid NOT NULL,
  submenu_id uuid NOT NULL,
  frontend_url VARCHAR(255),
  backend_url VARCHAR(255),
  create_access BOOLEAN NOT NULL,
  read_access BOOLEAN NOT NULL,
  update_access BOOLEAN NOT NULL,
  delete_access BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of role_accesses
INSERT INTO role_accesses (role_id, menu_id, submenu_id, frontend_url, backend_url, create_access, read_access, update_access, delete_access, created_at, updated_at) VALUES 
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '/user', '/user', TRUE, TRUE, TRUE, TRUE, '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc64', '/role', '/role', TRUE, TRUE, TRUE, TRUE, '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc65', '/menu', '/menu', TRUE, TRUE, TRUE, TRUE, '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc64', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '/user', '/user', FALSE, FALSE, FALSE, FALSE, '2023-11-15 14:40:20', '2023-11-15 14:40:20'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc65', '/menu', '/menu', TRUE, TRUE, TRUE, TRUE, '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc64', '/role', '/role', TRUE, TRUE, TRUE, TRUE, '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63',  '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '/user', '/user', TRUE, TRUE, TRUE, TRUE, '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc64', '2f8ddb53-4f5f-48ac-a15a-47308417fc67', '/products', '/products', TRUE, TRUE, TRUE, TRUE, '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc64', '2f8ddb53-4f5f-48ac-a15a-47308417fc66', '/categories', '/categories', TRUE, TRUE, TRUE, TRUE, '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- Table structure for role_menus
DROP TABLE IF EXISTS role_menus;
CREATE TABLE role_menus (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  role_id uuid NOT NULL,
  menu_id uuid NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of role_menus
INSERT INTO role_menus (id, role_id, menu_id, created_at, updated_at) VALUES 
('888ddb53-4f5f-48ac-a15a-47308417fc60', 'ef8ddb53-4f5f-48ac-a15a-47308417fc63', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('888ddb53-4f5f-48ac-a15a-47308417fc61', 'ef8ddb53-4f5f-48ac-a15a-47308417fc64', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-15 14:40:20', '2023-11-15 14:40:20'),
('888ddb53-4f5f-48ac-a15a-47308417fc62', 'ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('888ddb53-4f5f-48ac-a15a-47308417fc63', 'ef8ddb53-4f5f-48ac-a15a-47308417fc65', 'fa8ddb53-4f5f-48ac-a15a-47308417fc64', '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- Table structure for role_submenus
DROP TABLE IF EXISTS role_submenus;
CREATE TABLE role_submenus (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  role_id uuid NOT NULL,
  rolemenu_id uuid NOT NULL,
  submenu_id uuid NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Records of role_submenus
INSERT INTO role_submenus (role_id, rolemenu_id, submenu_id, created_at, updated_at) VALUES 
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', '888ddb53-4f5f-48ac-a15a-47308417fc60', '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', '888ddb53-4f5f-48ac-a15a-47308417fc60', '2f8ddb53-4f5f-48ac-a15a-47308417fc64', '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc63', '888ddb53-4f5f-48ac-a15a-47308417fc60', '2f8ddb53-4f5f-48ac-a15a-47308417fc65', '2023-11-04 00:35:44', '2023-11-04 00:35:44'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc64', '888ddb53-4f5f-48ac-a15a-47308417fc61', '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-15 14:40:20', '2023-11-15 14:40:20'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', '888ddb53-4f5f-48ac-a15a-47308417fc62', '2f8ddb53-4f5f-48ac-a15a-47308417fc65', '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', '888ddb53-4f5f-48ac-a15a-47308417fc62', '2f8ddb53-4f5f-48ac-a15a-47308417fc64', '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', '888ddb53-4f5f-48ac-a15a-47308417fc62', '2f8ddb53-4f5f-48ac-a15a-47308417fc63', '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', '888ddb53-4f5f-48ac-a15a-47308417fc63', '2f8ddb53-4f5f-48ac-a15a-47308417fc67', '2023-11-21 09:32:57', '2023-11-21 09:32:57'),
('ef8ddb53-4f5f-48ac-a15a-47308417fc65', '888ddb53-4f5f-48ac-a15a-47308417fc63', '2f8ddb53-4f5f-48ac-a15a-47308417fc66', '2023-11-21 09:32:57', '2023-11-21 09:32:57');

-- Table structure for wishlists
DROP TABLE IF EXISTS wishlists;
CREATE TABLE wishlists (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id uuid NOT NULL,
  category VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
