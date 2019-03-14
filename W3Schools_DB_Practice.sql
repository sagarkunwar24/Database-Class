Use w3schoolsdb;

Select *
From customers As c
Inner Join
(
	Select Country, Count(Country) As Count 
	From customers
	Group By Country
	Having Count >= 7
	Order By Count Desc
) As temp
On c.Country = temp.Country
; 

Select CustomerID, Count(CustomerID) As Count
From Orders
Group By CustomerID
Order By Count Desc;

Select c2.CustomerName, temp.TotalSales
From Customers As c2
Inner Join 
(
	Select c.CustomerID, Sum(p.Price * od.Quantity) As TotalSales
	From Customers As c
	Inner Join Orders As o
	On c.CustomerID = o.CustomerID
	Inner Join OrderDetails As od
	On o.OrderID = od.OrderID
	Inner Join Products As p
	On od.ProductID = p.ProductID
	Group By c.CustomerID
--	Order By TotalSales Desc
) 
As temp
On c2.CustomerID = temp.CustomerID
Order By temp.TotalSales Desc
;

-- Find products that are more expensive than the 
--   average prices in their categories
Select *
From Products As p
Inner Join
(
	Select CategoryID, Avg(Price) As AvgP
	From Products 
	Group By CategoryID
--	Order By AvgP
) 
As temp
On p.CategoryID = temp.CategoryID
Where p.Price > temp.AvgP
Order By p.CategoryID, p.ProductID
;

Select *
From 
(
	Select EmployeeID, Count(OrderID) As Performance
	From w3schoolsdb.orders
	Group By EmployeeID
	Order By Performance
	Limit 3
) As temp4
Where temp4.EmployeeID Not In
(
	Select Distinct o3.EmployeeID
	From w3schoolsdb.orders As o3
	Inner Join 
	(
		Select o2.CustomerID, Count(*) As Count
		From w3schoolsdb.orders As o2
		Inner Join 
		(
			Select Distinct o.CustomerID
			From w3schoolsdb.orders As o
			Inner Join 
			(
				Select EmployeeID, Count(OrderID) As Performance
				From w3schoolsdb.orders
				Group By EmployeeID
				Order By Performance
				Limit 3
			) As temp
			On o.EmployeeID = temp.EmployeeID
			Order By o.CustomerID
		) As temp2
		On o2.CustomerID = temp2.CustomerID
		Group By o2.CustomerID
		Having Count < 2
	) As temp3
	On o3.CustomerID = temp3.CustomerID
)
;
