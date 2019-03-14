
Select Country, Count(*) As Count
From W3schoolsDB.Customers 
Group By Country 
Having Count > 2
Order By Count Desc;

Select p.CategoryID, Avg(p.Price), Min(p.Price), Max(p.Price)
From w3schoolsdb.products As p
Group By p.CategoryID ;

Select c.CategoryName, Avg(p.Price)
From w3schoolsdb.products As p
Inner Join w3schoolsdb.categories As c
On p.CategoryID = c.CategoryID
Group By c.CategoryName ;
