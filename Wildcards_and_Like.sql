Select *
From W3SchoolsDB.Customers
Where Country = "Brazil";     

Select Distinct CustomerName As Name, City, Country . 
From W3SchoolsDB.Customers As c
Where Country = "Brazil";

Select Distinct CustomerName As Name, City, Country
From W3SchoolsDB.Customers As c
Where Country = "Brazil" And City Like "Rio%"; # _ 

Select Distinct Country
From W3SchoolsDB.Customers As c
Where Country <> "Brazil";

Select Distinct Country
From W3SchoolsDB.Customers As c
Where Country <> "Brazil"
Order By Country Desc;

Select Distinct Country
From W3SchoolsDB.Customers As c
Where Country <> "Brazil"
Order By City;

Select Distinct City, Country
From W3SchoolsDB.Customers As c
Order By Country Desc, City;

Select Distinct City, Country
From W3SchoolsDB.Customers As c
Where Country In ("Brazil", "Germany", "UK", "France")
Order By Country, City;

Select *
From W3SchoolsDB.Products;

Select Distinct ProductId, ProductName
From W3SchoolsDB.Products
Where CategoryID In (1, 4);

Select ProductID
From W3SchoolsDB.Products
Where ProductName Like "Sir%";
