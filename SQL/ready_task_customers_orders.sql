Создание таблиц customers и orders
  CREATE TABLE Customers (
  CustomerID VARCHAR,
  CompanyName VARCHAR,
  Address VARCHAR,
  City VARCHAR,
  Country VARCHAR
  );
  
  CREATE TABLE Orders (
  OrderID INT,
  CustomerID VARCHAR,
  OrderDate DATE,
  OrderSum INT
  );

Добавление данных в таблицы 
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', 'Sweden');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France');
  INSERT into Customers(
  CustomerID, CompanyName, Address, City, Country)
  VALUES('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain');


  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10355, 'AROUT', '1996-11-15', 10000);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10365, 'ANTON', '1996-11-27', 15000);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10381, 'LILAS', '1996-12-12', 20000);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10436, 'BLONP', '1997-02-05', 17500);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10442, 'ERNSH', '1997-02-11', 20000);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10449, 'BLONP', '1997-02-18', 10000);
  INSERT into orders(
  OrderID, CustomerID, OrderDate, OrderSum)
  VALUES(10453, 'AROUT', '1997-02-21', 15000);

    1. Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
 

SELECT c.companyname
FROM customers AS c 
JOIN orders AS o ON c.customerid = o.customerid
WHERE NOT (o.orderdate BETWEEN '1996-11-15' AND '1997-02-18');

    2. Вывести названия компаний поставщиков, которые находятся в México D.F.;

SELECT companyname
FROM customers  
WHERE city = 'México D.F.' ;

    3. Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;

SELECT *
FROM orders 
WHERE OrderDate BETWEEN '1996-12-12' AND '1997-02-18';

    4. Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;

SELECT *
FROM customers 
WHERE companyname LIKE 'An%';

    5. Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.

SELECT c.CompanyName,
 o.OrderID,
 o.OrderSum
FROM 
  Customers AS c
JOIN 
    Orders AS o ON c.CustomerID = o.CustomerID
WHERE 
    o.OrderSum > 17000;

    6. Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания

SELECT c.CompanyName,
o.OrderSum
FROM 
Customers AS c
JOIN 
 Orders AS o ON c.CustomerID = o.CustomerID
ORDER BY c.companyname DESC

    7. Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

SELECT 
c.CompanyName,
o.orderdate
FROM 
Customers AS c
left JOIN 
 Orders AS o ON c.CustomerID = o.CustomerID

