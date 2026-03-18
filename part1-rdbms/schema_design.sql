-- Part 1.2: Schema Design
-- Normalizing orders_flat.csv into 3NF

-- 1. Create Customers Table
CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Customer_Email VARCHAR(100) NOT NULL,
    Customer_Address VARCHAR(255) NOT NULL
);

-- 2. Create Products Table
CREATE TABLE Products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Product_Price DECIMAL(10, 2) NOT NULL
);

-- 3. Create Sales_Representatives Table
CREATE TABLE Sales_Representatives (
    Sales_Rep_ID VARCHAR(10) PRIMARY KEY,
    Sales_Rep_Name VARCHAR(100) NOT NULL,
    Sales_Rep_Email VARCHAR(100) NOT NULL
);

-- 4. Create Orders Table (Links everything together)
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID VARCHAR(10) NOT NULL,
    Product_ID VARCHAR(10) NOT NULL,
    Sales_Rep_ID VARCHAR(10) NOT NULL,
    Order_Date DATE NOT NULL,
    Quantity INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Sales_Rep_ID) REFERENCES Sales_Representatives(Sales_Rep_ID)
);

-- INSERT STATEMENTS (5 rows per table)

INSERT INTO Customers VALUES 
('C001', 'Aarav Sharma', 'aarav@email.com', '123 Marine Drive, Mumbai'),
('C002', 'Ananya Iyer', 'ananya@email.com', '45 Jayanagar, Bangalore'),
('C003', 'Ishaan Gupta', 'ishaan@email.com', '78 Rohini, Delhi'),
('C004', 'Sana Khan', 'sana@email.com', '12 Park Street, Kolkata'),
('C005', 'Jinesh Jain', 'jinesh@email.com', '99 Residency Rd, Bangalore');

INSERT INTO Products VALUES 
('P001', 'Laptop', 'Electronics', 75000.00),
('P002', 'Smartphone', 'Electronics', 25000.00),
('P003', 'Coffee Maker', 'Appliances', 5000.00),
('P004', 'Office Chair', 'Furniture', 8000.00),
('P005', 'Desk Lamp', 'Furniture', 1500.00);

INSERT INTO Sales_Representatives VALUES 
('S001', 'Rajesh Kumar', 'rajesh@retail.com'),
('S002', 'Priya Singh', 'priya@retail.com'),
('S003', 'Vikram Mehta', 'vikram@retail.com'),
('S004', 'Aditi Rao', 'aditi@retail.com'),
('S005', 'Arjun Verma', 'arjun@retail.com');

INSERT INTO Orders VALUES 
(1001, 'C001', 'P001', 'S001', '2026-01-10', 1, 75000.00),
(1002, 'C002', 'P002', 'S002', '2026-01-11', 2, 50000.00),
(1003, 'C003', 'P003', 'S003', '2026-01-12', 1, 5000.00),
(1004, 'C004', 'P004', 'S004', '2026-01-13', 3, 24000.00),
(1005, 'C005', 'P005', 'S005', '2026-01-14', 1, 1500.00);
