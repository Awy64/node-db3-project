-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select 
    p.productName, c.CategoryName
    from Category as c
    join
    Product as p on p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id as [Order id],
      s.CompanyName
  FROM [Order] AS o
      JOIN
      Shipper AS s ON o.ShipVia = s.Id and 
                      o.Orderdate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, od.Quantity
    from OrderDetail as od
    join Product as p on od.ProductId = p.Id and od.OrderId = '10251'
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id as [OrderId], c.CompanyName as [Customer's Company Name], e.LastName as [Employee's LastName]
    from [Order] as o
    join Customer as c on o.CustomerId = c.Id
    join Employee as e on o.EmployeeId = e.Id

-- stretch queries
-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

select c.CategoryName, count(p.ProductName) as Count
	from Categories as c 
    join products as p on c.CategoryID = p.CategoryID
    group by c.CategoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

    select o.orderID, count(p.productid) as ItemCount
	from orderDetails as o
    join products as p on o.productID = p.productid
    group by o.orderID