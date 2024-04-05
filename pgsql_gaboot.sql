-- Drop tables if they exist
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS master_customers;
DROP TABLE IF EXISTS master_menus;
DROP TABLE IF EXISTS master_products;
DROP TABLE IF EXISTS master_roles;
DROP TABLE IF EXISTS master_submenus;
DROP TABLE IF EXISTS master_users;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS role_accesses;
DROP TABLE IF EXISTS role_menus;
DROP TABLE IF EXISTS role_submenus;
DROP TABLE IF EXISTS wishlists;

-- Table structure for carts
CREATE TABLE carts (
  id SERIAL PRIMARY KEY,
  customerId INT NOT NULL,
  productId INT NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  quantity INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  imgPath VARCHAR(255) DEFAULT NULL,
  imgThumbPath VARCHAR(255) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into categories
INSERT INTO categories (name, description, imgPath, imgThumbPath, createdAt, updatedAt) 
VALUES 
('GPU Nvidia', 'ya GPU Nvidia', 'storage/category/pictures/GPU_Nvidia1700895189447.jpg', 'storage/category/pictures/thumb/GPU_Nvidia1700895189447_thumb.jpg', '2023-11-25 06:53:09', '2023-11-25 06:53:09'),
('GPU AMD', 'GPU AMD RADEON', 'storage/category/pictures/GPU_AMD1700895263018.png', 'storage/category/pictures/thumb/GPU_AMD1700895263018_thumb.png', '2023-11-25 06:54:23', '2023-11-25 06:54:23');

-- Table structure for master_customers
CREATE TABLE master_customers (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phoneNumber VARCHAR(20) NOT NULL,
  addressDetail TEXT NOT NULL,
  latitude DOUBLE PRECISION DEFAULT 0,
  longitude DOUBLE PRECISION DEFAULT 0,
  password VARCHAR(255) NOT NULL,
  token VARCHAR(255) DEFAULT NULL,
  isActive BOOLEAN NOT NULL DEFAULT TRUE,
  imgPath VARCHAR(255) DEFAULT NULL,
  imgThumbPath VARCHAR(255) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into master_customers
INSERT INTO master_customers (firstname, lastname, username, email, phoneNumber, addressDetail, password, token, isActive, imgPath, imgThumbPath, createdAt, updatedAt) 
VALUES 
('Armand', 'Iskandar', 'armand', 'nigga@nigga.com', '', '', '$2b$10$szqhvAE8dU29ShiRAOiPyumW4OeJ3dpPoXo716p68SlBGNMnzrtOq', NULL, TRUE, 'uploads/customers/pictures/armand.jpg', 'uploads/customers/pictures/thumb/armand.jpg', '2023-11-25 12:52:17', '2023-11-25 13:27:30'),
('Elaina', 'Celesteria', 'elaina023', 'elaina023@example.com', '', '', '$2b$10$tBzawPcZK43h/TAIddCdmeHogsPWKrQnvnL3MkJM4uoD/J1hBIKNC', NULL, TRUE, 'uploads/customers/pictures/elaina023.jpg', 'uploads/customers/pictures/thumb/elaina023.jpg', '2023-11-23 13:47:27', '2023-11-23 13:47:27'),
('Admin', 'Pusat', 'admin', 'adminexample.com', '', '', '$2b$10$tBzawPcZK43h/TAIddCdmeHogsPWKrQnvnL3MkJM4uoD/J1hBIKNC', NULL, TRUE, 'uploads/customers/pictures/elaina023.jpg', 'uploads/customers/pictures/thumb/elaina023.jpg', '2023-11-23 13:47:27', '2023-11-23 13:47:27');

-- Table structure for master_menus
CREATE TABLE master_menus (
  id SERIAL PRIMARY KEY,
  menuName VARCHAR(100) NOT NULL,
  menuIcon VARCHAR(100) NOT NULL,
  backendUrl VARCHAR(100) NOT NULL,
  frontendUrl VARCHAR(100) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert records into master_menus
INSERT INTO master_menus (menuName, menuIcon, backendUrl, frontendUrl, createdAt, updatedAt) 
VALUES 
('Dashboard', 'ti-dashboard', '/dashboard', '/dashboard', '2023-11-20 07:02:35', '2023-11-20 07:02:35'),
('Products', 'ti-view-list-alt', '/products', '/products', '2023-11-20 07:03:02', '2023-11-20 07:03:02'),
('Category', 'ti-view-list-alt', '/category', '/category', '2023-11-20 07:03:02', '2023-11-20 07:03:02'),
('User', 'ti-user', '/user', '/user', '2023-11-20 07:03:02', '2023-11-20 07:03:02'),
('Role', 'ti-shield', '/role', '/role', '2023-11-20 07:03:02', '2023-11-20 07:03:02');

-- Table structure for master_products
CREATE TABLE master_products (
  id SERIAL PRIMARY KEY,
  categoryId INT NOT NULL,
  productName VARCHAR(100) NOT NULL,
  productDescription TEXT NOT NULL,
  stockQuantity INT NOT NULL DEFAULT 0,
  price DOUBLE PRECISION NOT NULL DEFAULT 0,
  imgPath VARCHAR(255) DEFAULT NULL,
  imgThumbPath VARCHAR(255) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for master_roles
CREATE TABLE master_roles (
  id SERIAL PRIMARY KEY,
  roleName VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for master_submenus
CREATE TABLE master_submenus (
  id SERIAL PRIMARY KEY,
  menuId INT NOT NULL,
  submenuName VARCHAR(100) NOT NULL,
  submenuIcon VARCHAR(100) NOT NULL,
  backendUrl VARCHAR(100) NOT NULL,
  frontendUrl VARCHAR(100) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for master_users
CREATE TABLE master_users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phoneNumber VARCHAR(20) NOT NULL,
  addressDetail TEXT NOT NULL,
  latitude DOUBLE PRECISION DEFAULT 0,
  longitude DOUBLE PRECISION DEFAULT 0,
  roleId INT NOT NULL,
  password VARCHAR(255) NOT NULL,
  token VARCHAR(255) DEFAULT NULL,
  isActive BOOLEAN NOT NULL DEFAULT TRUE,
  imgPath VARCHAR(255) DEFAULT NULL,
  imgThumbPath VARCHAR(255) DEFAULT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for order_details
CREATE TABLE order_details (
  id SERIAL PRIMARY KEY,
  orderId INT NOT NULL,
  productId INT NOT NULL,
  quantity INT NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customerId INT NOT NULL,
  orderStatus VARCHAR(50) NOT NULL,
  total DOUBLE PRECISION NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for payments
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  orderId INT NOT NULL,
  paymentStatus VARCHAR(50) NOT NULL,
  paymentMethod VARCHAR(50) NOT NULL,
  paymentAmount DOUBLE PRECISION NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for product_images
CREATE TABLE product_images (
  id SERIAL PRIMARY KEY,
  productId INT NOT NULL,
  imgPath VARCHAR(255) NOT NULL,
  imgThumbPath VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for role_accesses
CREATE TABLE role_accesses (
  id SERIAL PRIMARY KEY,
  roleId INT NOT NULL,
  menuId INT NOT NULL,
  submenuId INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for role_menus
CREATE TABLE role_menus (
  id SERIAL PRIMARY KEY,
  roleId INT NOT NULL,
  menuId INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for role_submenus
CREATE TABLE role_submenus (
  id SERIAL PRIMARY KEY,
  roleId INT NOT NULL,
  submenuId INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for wishlists
CREATE TABLE wishlists (
  id SERIAL PRIMARY KEY,
  customerId INT NOT NULL,
  productId INT NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
