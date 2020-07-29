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