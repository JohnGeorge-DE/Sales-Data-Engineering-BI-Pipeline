create database SalesDB ;
USE SalesDB;
GO


CREATE TABLE Dim_Products (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    Product_Name NVARCHAR(255) UNIQUE,
    Category NVARCHAR(100),
    Price DECIMAL(18, 2)
);


CREATE TABLE Dim_Customers (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Name NVARCHAR(255),
    City NVARCHAR(100)
);


alter TABLE Fact_Sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Product_ID INT, 
    Customer_ID INT, 
    Price DECIMAL(18, 2),
    Quantity INT,
    Total_Amount DECIMAL(18, 2),
    Payment_Method NVARCHAR(50),
    Order_Status NVARCHAR(50),
    
    CONSTRAINT FK_Product FOREIGN KEY (Product_ID) REFERENCES Dim_Products(Product_ID),
    CONSTRAINT FK_Customer FOREIGN KEY (Customer_ID) REFERENCES Dim_Customers(Customer_ID)
);
GO


select* from Fact_Sales
select* from Dim_Products
select* from Dim_Customers




GO

CREATE VIEW v_Master_Sales_Report AS
SELECT 
    F.Order_ID,
    F.Order_Date,
    P.Product_Name,
    P.Category,
    P.Price AS Product_List_Price,
    C.Customer_Name,
    C.City,
    F.Quantity,
    F.Total_Amount,
    F.Payment_Method,
    F.Order_Status,
FROM Fact_Sales F
JOIN Dim_Products P ON F.Product_ID = P.Product_ID
JOIN Dim_Customers C ON F.Customer_ID = C.Customer_ID;
Go
select sum (total_amount)AS total from v_Master_Sales_Report 



CREATE VIEW v_KPI_Product_Performance AS
SELECT 
    P.Category,
    P.Product_Name,
    SUM(F.Quantity) AS Total_Units_Sold,
    SUM(F.Total_Amount) AS Total_Revenue,
    COUNT(DISTINCT F.Order_ID) AS Number_of_Orders
    
FROM Fact_Sales F
JOIN Dim_Products P ON F.Product_ID = P.Product_ID
GROUP BY P.Category, P.Product_Name;
GO

select * from v_KPI_Product_Performance order by Total_Units_Sold desc



CREATE VIEW v_KPI_Regional_Sales AS
SELECT 
    C.City,
    SUM(F.Total_Amount) AS Total_Revenue,
    COUNT(F.Order_ID) AS Orders_Count,
    AVG(F.Total_Amount) AS Average_Order_Value
FROM Fact_Sales F
JOIN Dim_Customers C ON F.Customer_ID = C.Customer_ID
GROUP BY C.City;
GO

select * from v_KPI_Regional_Sales order by Total_Revenue desc

CREATE VIEW v_KPI_Operational_Status AS
SELECT 
    Order_Status,
    Payment_Method,
    COUNT(*) AS Count,
    SUM(Total_Amount) AS Revenue
FROM Fact_Sales
GROUP BY Order_Status, Payment_Method;
GO

select * from v_KPI_Operational_Status order by Revenue desc