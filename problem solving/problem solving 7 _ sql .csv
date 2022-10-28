select *  from  Customer ;
select *  from  orders ;
-- Q.1: selects the "Customer Name" and "City" columns from the "Customers" table.
select CUST_NAME , CUST_CITY  from  Customer ;
-- Q.2: What is the number of different (distinct) customer countries? = 5 
select  CUST_COUNTRY,count(CUST_COUNTRY)   from  Customer group by CUST_COUNTRY;
-- Q.3: selects all the customers from the city "London", in the "Customers" table:
select *  from  Customer where CUST_CITY = "London" ;
-- Q.4: Show the Customer information with code C00015.
select *  from  Customer where CUST_CODE = 'C00015';
-- Q.5: selects all fields from "Customers" where country is " USA" or " India".
select *  from  Customer where CUST_COUNTRY in ("USA" , "India" );
-- Q.6: selects all fields from "Customers" where city is NOT " Bangalore"
select *  from  Customer where CUST_CITY <> "Bangalore";
-- Q.7: selects all customers from the "Customers" table, sorted DESCENDING by the "city" column.
select *  from  Customer order by CUST_CITY desc;
-- Q.8: finds the biggest amount of order:
select  max(ORD_AMOUNT)from orders;
-- Q.9: finds the number of orders.
select count(ORD_NUM) number_of_orders from orders ;
-- Q.10: finds the average amount of all orders.
select avg(ORD_AMOUNT)  average_amount from orders ;
-- Q.11: selects all customers with a Customer Name starting with "m".
select *  from  Customer where CUST_NAME like 'm%' ;
-- Q.12: selects all customers with a Customer Name starting with "s".
select *  from  Customer where CUST_NAME like 's%' ;
-- Q.13: selects all customers that are in " Australia", " USA" or "UK".
select *  from  Customer where CUST_COUNTRY in ("Australia" , 'USA', 'UK') ;
-- Q.14: selects orders in January.
select *  from  orders where ORD_DATE between '2008-01-01' and '2008-01-31' ;
-- Q.15: selects the customers with amount payment between 1000 and 4000.
select *  from  customer  join orders on customer.CUST_CODE = orders.CUST_CODE where ORD_AMOUNT between 1000 and 4000;
-- Q.16: selects all orders with customer information.
select *  from  customer right join orders on customer.CUST_CODE = orders.CUST_CODE ;
-- Q.17: select all customers, and any orders information they might have.
select *  from  customer left join orders on customer.CUST_CODE = orders.CUST_CODE ;
-- Q.18: lists the number of customers in each country.
select  CUST_COUNTRY country,count(CUST_COUNTRY) number_of_customers  from  Customer group by CUST_COUNTRY;
-- Q.19: lists the number of orders sent by each agent.
select AGENT_CODE agent , count(AGENT_CODE) number_of_orders from  orders group by AGENT_CODE ;
-- Q.20:  lists the number of customers in each country. Only include countries with more than 5 customers.
select  CUST_COUNTRY country,count(CUST_COUNTRY) number_of_customers  from  Customer group by CUST_COUNTRY having number_of_customers >5 ;




