-- 1. Give me the names of the vendors based in Ballard, Bellevue, and Redmond -- 

SELECT VendName
FROM Vendors
WHERE VendCity IN ('Ballard', 'Bellevue', 'Redmond');

-- 2. Which vendors do we work with that don't have a website --

SELECT VendName, VendWebPage
FROM Vendors
WHERE VendWebPage IS NULL;

-- 3. Show me an alphabetized list of products with a retail price of $125 or more -- 

SELECT ProductName, RetailPrice
FROM Products
WHERE RetailPrice >= 125
ORDER BY ProductName ASC;

-- 4. Show me all orders that occurred in January of 2013 --

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2013-01-01' AND '2013-01-31';

-- 5. List the customer and the dates they placed an order; sorted in order date sequence -- 

SELECT Cust.CustFirstName, Cust.CustLastName, Ord.OrderDate
FROM Customers Cust 
INNER JOIN Orders Ord ON Cust.CustomerID = Ord.CustomerID
ORDER BY Ord.OrderDate ASC;

-- 6. List employees and the customers for whom they booked an order -- 

SELECT Emp.EmployeeID, Emp.EmpFirstName, Emp.EmpLastName, Ord.OrderNumber, Cust.CustFirstName, Cust.CustLastName, Ord.CustomerID
FROM Employees Emp
INNER JOIN Orders Ord ON Emp.EmployeeID = Ord.EmployeeID
INNER JOIN Customers Cust ON Ord.CustomerID = Cust.CustomerID; 

-- 7. Show me the vendors and the products they supply to us for products that cost less than $100 --

SELECT Ven.VendName, Pro.ProductName, Pro.RetailPrice
FROM Vendors Ven
INNER JOIN Product_Vendors PVen ON Ven.VendorID = PVen.VendorID
INNER JOIN Products Pro ON PVen.ProductNumber = Pro.ProductNumber
WHERE Pro.RetailPrice < 100
ORDER BY Ven.VendName ASC;

-- 8. Display all orders, the products in each order, and the amount owed for each product, in order number sequence -- 

SELECT Ord.OrderNumber, Pro.ProductName, OrdD.QuotedPrice
FROM Orders Ord
INNER JOIN Order_Details OrdD ON Ord.OrderNumber = OrdD.OrderNumber
INNER JOIN Products Pro ON OrdD.ProductNumber = Pro.ProductNumber
ORDER BY Ord.OrderNumber ASC;

-- 9. Show me the customers and employees who live in the same state -- 

SELECT DISTINCT Cust.CustFirstName, Cust.CustLastName, Emp.EmpFirstName, Emp.EmpLastName, Emp.EmpState
FROM Customers Cust
INNER JOIN Orders Ord ON Cust.CustomerID = Ord.CustomerID
INNER JOIN Employees Emp ON Ord.EmployeeID = Emp.EmployeeID
WHERE Emp.EmpState = Cust.CustState
ORDER BY Cust.CustFirstName, Cust.CustLastName, Emp.EmpFirstName, Emp.EmpLastName;

-- 10. Show me customers who have never ordered a helmet --

SELECT Cust.CustomerID, Cust.CustFirstName, Helmet.CustomerID
FROM Customers Cust
LEFT OUTER JOIN
(
    SELECT Pro.ProductName, Ord.CustomerID
    FROM Products Pro
    INNER JOIN Order_Details OrdD ON Pro.ProductNumber = OrdD.ProductNumber
    INNER JOIN Orders Ord ON OrdD.OrderNumber = Ord.OrderNumber
    WHERE ProductName LIKE '%Helmet%'
) Helmet
ON Cust.CustomerID = Helmet.CustomerID
WHERE Helmet.CustomerID IS NULL;

-- 11. Display customers who have no sales rep(employee) in the same zip code --

SELECT DISTINCT CustFirstName, CustLastName, CustZipCode
FROM Customers
WHERE CustZipCode NOT IN 
(
    SELECT EmpZipCode
    FROM Employees
);
-- 12. List all products and the dates for any orders -- 

-- So basically the one below is what I got trying to use a left join. For some reason, it produces 3,975 rows instead of 3,973, which I think is because of some null values somewhere since Orders only has 3,973 rows. I wasn't sure if it was correct, so I wrote another one also.


SELECT Prod.ProductName, Orderss.OrderDate, Orderss.ProductNumber
FROM Products Prod
LEFT OUTER JOIN
(
    SELECT *
    FROM Orders Ord
    INNER JOIN Order_Details as OrdD ON Ord.OrderNumber = OrdD.OrderNumber
) Orderss
ON Prod.ProductNumber = Orderss.ProductNumber; 



SELECT Pro.ProductNumber, Ord.OrderDate, Pro.ProductName
FROM Orders Ord
INNER JOIN Order_Details OrdD ON Ord.OrderNumber = OrdD.OrderNumber
INNER JOIN Products Pro ON OrdD.ProductNumber = Pro.ProductNumber
ORDER BY Pro.ProductNumber;


