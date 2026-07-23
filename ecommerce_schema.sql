CREATE DATABASE Ecommerce;
USE Ecommerce;

CREATE TABLE Customors(Customer_ID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),Email VARCHAR(50),
Phone VARCHAR(50),Address VARCHAR(50),City VARCHAR(50),State VARCHAR(50),Pincode INT);
CREATE TABLE  Categories(Category_ID INT PRIMARY KEY ,CategoryName VARCHAR(50),Description VARCHAR(50));
CREATE TABLE Products(Product_ID INT PRIMARY KEY,ProductName VARCHAR(50),Description VARCHAR(50),Price INT,Stock INT,Brand VARCHAR(50),CategoryID INT);
CREATE TABLE Orders(Order_ID INT PRIMARY KEY,Customer_ID INT,Orderdate Date,TotalAmount INT,OrderStatus VARCHAR(50),ShippingAddress VARCHAR(50));
CREATE TABLE Order_Items(OrderItems_ID INT PRIMARY KEY,Order_ID INT,Product_ID INT,Quantity INT,UnitPrice INT,SubTotal INT);
CREATE TABLE Payments(Payment_ID INT PRIMARY KEY,Order_ID INT,Payment_Method VARCHAR(50),Payment_Status VARCHAR(50),Payment_date date,Amount INT,Transaction_ID INT);

INSERT INTO Customors VALUES
(1,"Megha","H","megha@gmail.com","9079307492","13 Mg Road","Bangalore","Karnataka",560001),
(2,"Rahul","Sharma","rahshar@gmail.com","9897968920","45 Bridge Road","Bangalore","Karnataka",560561),
(3,"Priya","Patel","patel@gmail.com","9143677492","18 Park Street","Bangalore","West Bengal",560001),
(4,"Arjun","Reddy","arjun@gmail.com","6802435618","22 Jubilee Hills","Kolkata","Telangana",500033),
(5,"Sneha","Verma","sneha@gmail.com","8795234167","67 FC Road","Pune","Maharashtra",411004);

INSERT INTO Categories  VALUES
(101, 'Electronics', 'Devices and electronic items'),
(102, 'Mobile Phones', 'Smartphones and accessories'),
(103, 'Laptops', 'Personal and professional laptops'),
(104, 'Gadgets', 'Latest tech gadgets and accessories'),
(105, 'Home Appliances', 'Appliances for home use');

INSERT INTO Products  VALUES
(1001, 'iPhone 13', 'Apple smartphone', 70000, 10, 'Apple', 102),
(1002, 'Samsung Galaxy S21', 'Android smartphone', 65000, 15, 'Samsung', 102),
(1003, 'Dell Inspiron 15', '15 inch laptop', 55000, 8, 'Dell', 103),
(1004, 'HP Pavilion', 'Gaming laptop', 75000, 5, 'HP', 103),
(1005, 'Smart Watch', 'Wearable gadget', 5000, 20, 'Noise', 104);

INSERT INTO Orders VALUES
(5001, 1, '2024-06-01', 70000, 'Delivered', '13 Mg Road, Bangalore'),
(5002, 2, '2024-06-03', 65000, 'Shipped', '45 Bridge Road, Bangalore'),
(5003, 3, '2024-06-05', 55000, 'Processing', '18 Park Street, Bangalore'),
(5004, 4, '2024-06-07', 75000, 'Delivered', '22 Jubilee Hills, Kolkata'),
(5005, 5, '2024-06-10', 5000, 'Cancelled', '67 FC Road, Pune');

INSERT INTO Order_Items VALUES
(1,5001,1001,1,70000,70000),
(2,5002,1002,1,65000,65000),
(3,5003,1003,1,55000,55000),
(4,5004,1004,1,75000,75000),
(5,5005,1005,1,5000,5000);

INSERT INTO Payments VALUES
(9001,5001,'Credit Card','Completed','2024-06-01',70000,111001),
(9002,5002,'UPI','Completed','2024-06-03',65000,111002),
(9003,5003,'Debit Card','Pending','2024-06-05',55000,111003),
(9004,5004,'Net Banking','Completed','2024-06-07',75000,111004),
(9005,5005,'Cash on Delivery','Failed','2024-06-10',5000,111005);

SELECT*FROM Customors AS c;
SELECT*FROM Products AS p;
SELECT*FROM Orders AS o;

SELECT c.FirstName, c.LastName, p.ProductName, o.Orderdate
FROM Customors c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
JOIN Products p ON oi.Product_ID = p.Product_ID;
