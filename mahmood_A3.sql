/*
  FILE : mahmood_A3.sql
* PROJECT :  Assignment 3#
* PROGRAMMER : Mahmood Al-Zubaidi
* FIRST VERSION : 24/11/2021
* DESCRIPTION : The purpose of this file is to demonstrate the ability to retrieve and edit and remove
data from the sql database.
*/

-- 1. Display the CustomerID, ContactName, Country and City (in that order) in the Customers table
select CustomerID, ContactName, Country, City from customers;
-- 2.Display the countries that are in the Customers table in alphabetical order. Display each countryname only once.
select distinct Country from customers order by Country;
-- 3. What are the CompanyName and City of all customers in Germany?
select CompanyName, City from customers where Country = 'Germany';
-- 4. Display the CustomerID and ContactName for each customer that does not have a Fax number.
select CustomerID, ContactName from customers where Fax is null;
-- 5. How many products are in the Products tables?
select COUNT(ProductID) from products;
-- 6. Display the ProductID, ProductName and UnitPrice for each product in the Products table.
select ProductID, ProductName, UnitPrice from products;
-- 7. Display the ProductName, UnitsInStock and UnitPrice (in that order) for all the products that
-- cost most than $20 (assuming the unit price is in dollars). Make sure that the list is in UnitPrice
-- descending order (most expensive at the top of the list).
select ProductName, UnitsInStock, UnitPrice from products  where UnitPrice > 20 order by UnitPrice desc;
-- 8. How many products are discontinued? (Discontinued products are indicated by a value of -1).
 select COUNT(Discontinued) from products where Discontinued = -1;
--  9. Display the CategoryName and ProductName (in that order) for each product.
 select CategoryName, ProductName from categories,products where categories.CategoryID = products.CategoryID;
-- 10. From the Employees table, combine the Title, FirstName and LastName to display a column
-- called Salutation
 select CONCAT(Title , " " , FirstName, " ", LastName ) as Salutation from employees;
-- 11. Display a list of TerritoryDescriptions with their corresponding RegionDescriptions.
select TerritoryDescription, RegionDescription from territories, region where territories.RegionID = region.RegionID;
-- 12. For each order detail line, display the OrderID, CustomerID, ProductID and Quantity.
select orderdetails.OrderID, CustomerID, ProductID, Quantity from orderdetails, orders where orderdetails.OrderID = orders.OrderID;
-- For each order detail line, display the OrderID, CustomerID, ProductID and Extended 
-- Price. (The extended price is the product of UnitPrice and Quantity. Make sure the 
-- column is called “Extended Price”.)
select orderdetails.OrderID, CustomerID, ProductID, UnitPrice*Quantity as ExtendedPrice from orderdetails, orders where orderdetails.OrderID = orders.OrderID;
-- 14. For each order, display the OrderID, OrderDate, CompanyName (Customers) 
-- and EmployeeName (combination of first name and last name from Employees).
select orderdetails.OrderID, orders.OrderDate, customers.CompanyName, CONCAT(FirstName, " " , LastName ) AS EmployeeName from orderdetails, orders, customers, employees ;
-- 15. Display the CustomerID and CustomerName of all Customers that have ever had an order.
select orders.CustomerID, customers.ContactName from orders, customers where ShippedDate is not null;
-- 16. Display the CustomerID and CustomerName of all Customers that have never had an order.
select orders.CustomerID, customers.ContactName from orders, customers where ShippedDate is null;
-- 17. Add a new region, called ‘Europe’, to the Region table.
 insert into region (RegionDescription) values ('Europe');
--  18. Remove the region called ‘Europe’ from the Region table.
delete from region where RegionDescription = 'Europe';
-- 19. For the company called ‘Ernst Handel’, change the name of the contact person to Hans Schmidt.
update customers set customers.ContactName = 'Hans Schmidt' where customers.CompanyName = 'Ernst Handel';
-- 20. Increase each UnitPrice in the Products table by $1 (assuming the unit price is in $’s).
update products SET UnitPrice = UnitPrice + 1;
-- 21. Create a new category of products called “Discontinued”.
insert into categories (CategoryName) values ('Discontinued');
-- 22. For each discontinued product, change its category to “Discontinued”.
update products,categories set products.CategoryID = categories.CategoryID where products.Discontinued = -1 and categories.CategoryName = 'Discontinued';

