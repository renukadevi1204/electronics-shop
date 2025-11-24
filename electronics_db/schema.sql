create database electronics_db;
drop table if EXISTS brands;
 CREATE TABLE brands (
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    founded_year INTEGER,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if EXISTS products;
CREATE TABLE products(
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL REFERENCES brands(id) on DELETE CASCADE,
    sku VARCHAR(100) UNIQUE,
    release_year INTEGER,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    warranty_months INTEGER,
    catagory VARCHAR(100),
    stock_quantity INTEGER DEFAULT 0 check (stock_quantity >=0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if EXISTS customers;
CREATE TABLE customers(
    id serial PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(100),
    registration_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if EXISTS orders;
CREATE TABLE orders(
    id serial PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers(id) on DELETE CASCADE,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10,2) check (total_amount>= 0),
    status VARCHAR(50) DEFAULT 'Pending' check (status in('Pending',
    'Completed','Cancelled')),
    shipping_city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if EXISTS orders_items;
CREATE TABLE orders_items (
    id serial PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id) on DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) on DELETE CASCADE,
    quantity INTEGER NOT NULL check (quantity >= 0),
    unit_price DECIMAL(10,2) NOT NULL check (unit_price >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table if EXISTS reviews;
CREATE TABLE reviews(
    id serial PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(id) on DELETE CASCADE,
    customer_id INTEGER NOT NULL REFERENCES customers(id) on DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


