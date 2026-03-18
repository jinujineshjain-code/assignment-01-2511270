-- ============================================================
-- Part 1.2 - Schema Design (3NF Normalization)
-- Based on orders_flat.csv
-- ============================================================

-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales_reps;

-- -----------------------------------------------
-- Table 1: sales_reps
-- Stores sales representative information
-- -----------------------------------------------
CREATE TABLE sales_reps (
    sales_rep_id   TEXT        NOT NULL PRIMARY KEY,
    sales_rep_name TEXT        NOT NULL,
    sales_rep_email TEXT       NOT NULL UNIQUE,
    office_address TEXT        NOT NULL
);

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai',  'anita@corp.com',  'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar',   'ravi@corp.com',   'South Zone, MG Road, Bangalore - 560001');

-- -----------------------------------------------
-- Table 2: customers
-- Stores customer information
-- -----------------------------------------------
CREATE TABLE customers (
    customer_id    TEXT  NOT NULL PRIMARY KEY,
    customer_name  TEXT  NOT NULL,
    customer_email TEXT  NOT NULL UNIQUE,
    customer_city  TEXT  NOT NULL
);

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta',  'rohan@gmail.com',  'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com',  'Delhi'),
('C003', 'Amit Verma',   'amit@gmail.com',   'Bangalore'),
('C004', 'Sneha Iyer',   'sneha@gmail.com',  'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta',   'neha@gmail.com',   'Delhi'),
('C007', 'Arjun Nair',   'arjun@gmail.com',  'Bangalore'),
('C008', 'Kavya Rao',    'kavya@gmail.com',  'Hyderabad');

-- -----------------------------------------------
-- Table 3: products
-- Stores product information
-- -----------------------------------------------
CREATE TABLE products (
    product_id    TEXT           NOT NULL PRIMARY KEY,
    product_name  TEXT           NOT NULL,
    category      TEXT           NOT NULL,
    unit_price    DECIMAL(10,2)  NOT NULL
);

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop',        'Electronics', 55000.00),
('P002', 'Mouse',         'Electronics',   800.00),
('P003', 'Desk Chair',    'Furniture',    8500.00),
('P004', 'Notebook',      'Stationery',    120.00),
('P005', 'Headphones',    'Electronics',  3200.00),
('P006', 'Standing Desk', 'Furniture',   22000.00),
('P007', 'Pen Set',       'Stationery',    250.00),
('P008', 'Webcam',        'Electronics',  2100.00);

-- -----------------------------------------------
-- Table 4: orders
-- Stores order transactions — references all 3 tables above
-- -----------------------------------------------
CREATE TABLE orders (
    order_id      TEXT          NOT NULL PRIMARY KEY,
    customer_id   TEXT          NOT NULL,
    product_id    TEXT          NOT NULL,
    quantity      INTEGER       NOT NULL,
    order_date    DATE          NOT NULL,
    sales_rep_id  TEXT          NOT NULL,
    FOREIGN KEY (customer_id)  REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)   REFERENCES products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date, sales_rep_id) VALUES
('ORD1000', 'C002', 'P001', 2, '2023-05-21', 'SR03'),
('ORD1001', 'C004', 'P002', 3, '2023-07-11', 'SR03'),
('ORD1002', 'C002', 'P005', 1, '2023-01-17', 'SR02'),
('ORD1003', 'C002', 'P002', 4, '2023-09-05', 'SR01'),
('ORD1004', 'C001', 'P005', 2, '2023-03-22', 'SR01'),
('ORD1005', 'C007', 'P002', 5, '2023-06-30', 'SR02'),
('ORD1006', 'C001', 'P007', 3, '2023-08-14', 'SR01'),
('ORD1007', 'C006', 'P003', 1, '2023-02-28', 'SR01'),
('ORD1008', 'C002', 'P001', 1, '2023-11-19', 'SR02'),
('ORD1009', 'C006', 'P005', 2, '2023-04-07', 'SR02');
