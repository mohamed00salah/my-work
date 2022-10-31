select * from customers ;
select * from orders ;
select * from order_details ;
select * from employees ;

-- 1. Select customer name together with each order the customer made
select cust.CustomerName , ord.OrderID from customers cust  join orders ord on cust.CustomerID = ord.CustomerID  ;

-- 2 Select order id together with name of employee who handled the order
select ord.OrderID , emp.FirstName , emp.LastName  from  orders ord join employees emp on  ord.EmployeeID = emp.EmployeeID ;

-- 3 Select customers who did not placed any order yet
select  cust.CustomerID,cust.CustomerName , ord.OrderID from customers cust 
left join orders ord on cust.CustomerID = ord.CustomerID where ord.CustomerID is null;

-- 4 Select order id together with the name of products
select od.OrderID , prod.ProductName from order_details od join products prod on od.ProductID = prod.ProductID ;

-- 5 Select products that no one bought
select prod.ProductName from products prod left join order_details od on prod.ProductID= od.ProductID where od.OrderID is null ;

-- 6 Select customer together with the products that he bought
select cust.CustomerName , prod.ProductName from customers cust 
join orders ord on cust.CustomerID = ord.CustomerID 
join order_details od on ord.OrderID = od.OrderID
join products prod on od.ProductID = prod.ProductID ;

-- 7 Select product names together with the name of corresponding category
select prod.ProductName , cat.CategoryName from products prod join categories cat on prod.CategoryID = cat.CategoryID ;

-- 8 Select orders together with the name of the shipping company 
select ord.* , ship.ShipperName from orders ord join shippers ship on ord.ShipperID = ship.ShipperID ;

-- 9 Select customers with id greater than 50 together with each order they made
select *from customers cust join orders ord on cust.CustomerID = ord.CustomerID where cust.CustomerID > 50 ;

-- 10 Select employees together with orders with order id greater than 10400
select * from employees emp join orders ord on emp.EmployeeID = ord.EmployeeID where ord.OrderID > 10400 ;

-- 11 Select the most expensive product
select * from products order by price desc limit 1 ;

-- 12 Select the second most expensive product
select * from products where Price < (select max(price) from products) order by price desc  limit 1 ;
-- or 
select * from products order by price desc limit 1 offset 1 ;
-- or
select * from products order by price desc limit 1,1  ;

-- 13 Select name and price of each product, sort the result by price in decreasing order
select ProductName , Price from products order by Price desc ;

-- 14 Select 5 most expensive products
select * from products order by price desc limit 5 ;

-- 15 Select 5 most expensive products without the most expensive (in final 4 products)
select * from products order by price desc limit 1,4  ;
-- or
select * from products where Price < (select max(price) from products) and  Price <> (select max(price) from products) order by price  desc limit 4 ;
-- or
select * from products order by price desc limit 4 offset 1 ;

-- 16 Select name of the cheapest product (only name) without using LIMIT and OFFSET
select ProductName from products where Price = (select min(price) from products) ;

-- 17 Select number of employees with LastName that starts with 'D'
select * from employees where LastName like 'D%' ;

-- 18 BONUS : same question for Customer this time
select * ,substring_index(CustomerName , ' ',-1) Last_Name from customers 
where substring_index(CustomerName , ' ',-1)like'D%';

/* 19 Select customer name together with the number of orders made by the corresponding customer 
sort the result by number of orders in decreasing order */
select cust.CustomerName , count(ord.OrderID) Number_of_Order from customers cust  
join orders ord on cust.CustomerID = ord.CustomerID
group by cust.CustomerName 
order by Number_of_Order desc;

-- 20 Add up the price of all products
select sum(Price) from products ;

/* 21 Select orderID together with the total price of  that Order,
 order the result by total price of order in increasing order */
 select od.OrderID ,  sum((od.Quantity * prod.Price )) Total_Price from order_details od 
 join products prod 
 on od.ProductID = prod.ProductID
 group by(od.OrderID) 
 order by Total_Price ;
 
 -- 22 Select customer who spend the most money
 select cust.CustomerID, cust.CustomerName , sum((od.Quantity * prod.Price )) Total_Price  from customers cust 
 join orders ord on cust.CustomerID = ord.CustomerID
 join order_details od on ord.OrderID = od.OrderID
 join products prod on od.ProductID = prod.ProductID
 group by(cust.CustomerID)
 order by Total_Price desc limit 1 ;
  
 -- 23 Select customer who spend the most money and lives in Canada
select cust.CustomerID, cust.CustomerName , sum((od.Quantity * prod.Price )) Total_Price  from customers cust 
join orders ord on cust.CustomerID = ord.CustomerID
join order_details od on ord.OrderID = od.OrderID
join products prod on od.ProductID = prod.ProductID
where Country like '%Canada%'
group by(cust.CustomerID)
order by Total_Price desc limit 1 ;

-- 24 Select customer who spend the second most money
select cust.CustomerID, cust.CustomerName , sum((od.Quantity * prod.Price )) Total_Price  from customers cust 
 join orders ord on cust.CustomerID = ord.CustomerID
 join order_details od on ord.OrderID = od.OrderID
 join products prod on od.ProductID = prod.ProductID
 group by(cust.CustomerID)
 order by Total_Price desc limit 1,1 ;
 
 -- 25 Select shipper together with the total price of proceed orders
select sh.* , sum((od.Quantity * prod.Price )) Total_Price  from shippers sh 
join orders ord on sh.ShipperID = ord.ShipperID
join order_details od on ord.OrderID = od.OrderID
join products prod on od.ProductID = prod.ProductID
group by(sh.ShipperID)
