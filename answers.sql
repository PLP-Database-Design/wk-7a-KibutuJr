-- Question 1: Achieving 1NF
-- Step 1: Create initial unnormalized table
CREATE TABLE ProductDetail (
OrderID INT,
CustomerName VARCHAR(100),
Products VARCHAR(255)
);

INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 2: Create normalized 1NF table
CREATE TABLE ProductDetail_1NF (
OrderID INT,
CustomerName VARCHAR(100),
Product VARCHAR(100)
);

 -- Step 3: Transform to 1NF (splitting by comma)
 INSERT INTO ProductDetail_1NF VALUES
 (101, 'John Doe', 'Laptop'),
 (101, 'John Doe', 'Mouse'),
 (102, 'Jane Smith', 'Tablet'),
 (102, 'Jane Smith', 'Keyboard'),
 (102, 'Jane Smith', 'Mouse'),
 (103, 'Emily Clark', 'Phone');
 
 -- Now each row is atomic. 1NF achieved.
 
 
 -- Question 2: Achieving 2NF
 -- Step 1: Create original 1NF table
 CREATE TABLE OrderDetails (
 OrderID INT,
 CustomerName VARCHAR (100),
 Product VARCHAR (100),
 Quantity INT
 );
 
 INSERT INTO OrderDetails VALUES
 (101, 'John Doe', 'Laptop', 2),
 (101, 'John Doe', 'Mouse', 1),
 (102, 'Jane Smith', 'Tablet', 3),
 (102, 'Jane Smith', 'Keyboard', 1),
 (102, 'Jane Smith', 'Mouse', 2),
 (103, 'Emily Clark', 'Phone', 1);
 
 -- Step 2: Create normalized Orders table (2NF)
 CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerName VARCHAR(100)
 );
 
 -- Step 3: Create OrderItems table (foreign key to Orders)
 CREATE TABLE OrderItems (
 OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
 OrderID INT,
 Product VARCHAR(100),
 Quantity INT,
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
 );
 
 -- Step 4: Insert data
 INSERT INTO Orders VALUES
 (101, 'John Doe'),
 (102, 'Jane Smith'),
 (103, 'Emily Clark');
 
 INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
 (101, 'Laptop', 2),
 (101, 'Mouse', 1),
 (102, 'Tablet', 3),
 (102, 'Keyboard', 1),
 (102, 'Mouse', 2),
 (103, 'Phone', 1);
 
 
 -- notes:
 -- 1. Always use surrogate primary keys (like OrderItemID) where needed.
 -- 2. Ensure all non-key attributes are fully functionally dependent on the whole primary key (2NF).
