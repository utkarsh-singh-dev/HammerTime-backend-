-- Create Database
CREATE DATABASE IF NOT EXISTS online_bidding_system;
USE online_bidding_system;

-- Create Address Table
CREATE TABLE IF NOT EXISTS address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    pincode INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create User Table
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email_id VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    phone_no VARCHAR(15),
    role VARCHAR(50),
    address_id INT,
    seller_id INT,
    wallet_amount DECIMAL(10, 2) DEFAULT 0.00,
    status VARCHAR(50),
    FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE SET NULL,
    FOREIGN KEY (seller_id) REFERENCES user(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Category Table
CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    status VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Product Table
CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT,
    quantity INT,
    status VARCHAR(50),
    end_date VARCHAR(255),
    seller_user_id INT,
    buyer_user_id INT,
    image1 LONGTEXT,
    image2 LONGTEXT,
    image3 LONGTEXT,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL,
    FOREIGN KEY (seller_user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (buyer_user_id) REFERENCES user(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create ProductOffer Table
CREATE TABLE IF NOT EXISTS product_offer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    amount DECIMAL(10, 2),
    date_time VARCHAR(255),
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Orders Table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(255),
    user_id INT,
    product_id INT,
    quantity INT,
    order_time VARCHAR(255),
    status VARCHAR(50),
    delivery_person_id INT,
    delivery_time VARCHAR(50),
    delivery_date VARCHAR(255),
    delivery_status VARCHAR(50),
    product_offer_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (delivery_person_id) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY (product_offer_id) REFERENCES product_offer(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Indexes for better performance
CREATE INDEX idx_user_email ON user(email_id);
CREATE INDEX idx_product_seller ON product(seller_user_id);
CREATE INDEX idx_product_category ON product(category_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_product_offer_user ON product_offer(user_id);
CREATE INDEX idx_product_offer_product ON product_offer(product_id);

-- Insert sample data
INSERT INTO address (street, city, pincode) VALUES
('123 Main Street', 'New York', 10001),
('456 Oak Avenue', 'Los Angeles', 90001),
('789 Pine Road', 'Chicago', 60601);

INSERT INTO user (first_name, last_name, email_id, password, phone_no, role, address_id, wallet_amount, status) VALUES
('John', 'Doe', 'john@example.com', '$2a$10$gvbaPXHxyK9U3Bp3qMTRKOp/QxZZPFvjgZXgVFb0FKWyHEu3Jq5Dq', '1234567890', 'BUYER', 1, 5000.00, 'ACTIVE'),
('Jane', 'Smith', 'jane@example.com', '$2a$10$gvbaPXHxyK9U3Bp3qMTRKOp/QxZZPFvjgZXgVFb0FKWyHEu3Jq5Dq', '0987654321', 'SELLER', 2, 10000.00, 'ACTIVE'),
('Admin', 'User', 'admin@example.com', '$2a$10$gvbaPXHxyK9U3Bp3qMTRKOp/QxZZPFvjgZXgVFb0FKWyHEu3Jq5Dq', '5555555555', 'ADMIN', 3, 0.00, 'ACTIVE');

INSERT INTO category (name, description, status) VALUES
('Electronics', 'Electronic devices and gadgets', 'ACTIVE'),
('Books', 'Books and educational materials', 'ACTIVE'),
('Furniture', 'Home furniture and decor', 'ACTIVE'),
('Clothing', 'Apparel and accessories', 'ACTIVE'),
('Sports', 'Sports equipment and gear', 'ACTIVE');

INSERT INTO product (name, description, price, category_id, quantity, status, end_date, seller_user_id) VALUES
('Laptop', 'High-performance laptop with 16GB RAM', 999.99, 1, 5, 'ACTIVE', '2026-12-31', 2),
('Desk Chair', 'Ergonomic office chair', 299.99, 3, 10, 'ACTIVE', '2026-12-31', 2),
('Programming Book', 'Advanced Java Programming Guide', 49.99, 2, 20, 'ACTIVE', '2026-12-31', 2),
('Running Shoes', 'Professional athletic running shoes', 129.99, 4, 15, 'ACTIVE', '2026-12-31', 2),
('Sports Ball', 'Professional basketball', 69.99, 5, 8, 'ACTIVE', '2026-12-31', 2);
