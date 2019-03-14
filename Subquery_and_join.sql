Select * 
From W3schoolsDB.Products
Where Price Between 10 And 19 ; -- inclusive

Select *
From W3schoolsDB.Customers
Where Country In ("UK", "Canada") ;

-- Old fashion Join
Select c.CustomerID, o.CustomerID, c.Country, o.OrderDate
From W3schoolsDB.Customers As c, W3schoolsDB.Orders As o
Where c.CustomerID = o.CustomerID ;

-- Newer Join
Select c.CustomerID, o.CustomerID, c.Country, o.OrderDate
From W3schoolsDB.Customers As c
Right Join W3schoolsDB.Orders As o
On c.CustomerID = o.CustomerID 
Where c.Country = "UK";

Select *
From W3schoolsDB.Employees As e
Inner Join W3schoolsDB.Orders As o
On e.EmployeeID = o.EmployeeID
Inner Join W3schoolsDB.Customers As c
On o.CustomerID = c.CustomerID
Where e.FirstName="Andrew" and e.LastName="Fuller" ;

-- Subquery
Select *
From W3schoolsDB.Orders
Where CustomerID In
(
	Select CustomerID
	From W3schoolsDB.Customers
	Where Country = "UK"
) ;
