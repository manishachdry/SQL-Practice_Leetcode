--1)fatch all the small shipped orders from august 2003 till the end of the year 2003.
select * from sales_order
where deal_size = 'Small'
and order_date between to_date('01-08-2003','dd-mm-yyyy') and to_date('31-12-2003','dd-mm-yyyy');



--2)Find all the orders which do not belong to customers from USA and are still in process.
select * from customers c
join sales_order s on c.customer_id = s.customer
where c.country<>'USA'
and s.status = 'In Process';




--3)Find all orders for planes, ships and Trains which are neither shipped nor In Process Nor Resolved.
select * from sales_order s 
join products p 
on p.product_code = s.product 
where p.product_line in('Planes','Ships','Trains')
and s.status not in ('Shipped','Process','Resolved');






--4)Find customer whose Phone Number has either Paranthesis "()" or a plus sign "+".
select * from customers
where phone like '%+%' or phone like '%(%' or  phone like '%)%';





--5) Find customers whose phone number does not have any space.
select * from customers 
where phone not like '% %';





--6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
select * from sales_order 
where order_date between to_date('01-02-2003','dd-mm-yyyy') and to_date('01-05-2003','dd-mm-yyyy')
and mod (quantity_ordered ,2) = 0;





--7) Find orders which sold the product for price higher than its original price.
select p.price,s.price_each from sales_order s
join products p on p.product_code = s.product 
where p.price < s.price_each;



--8) Find the average sales order price
select avg(quantity_ordered*price_each) avg_sales_price from sales_order;




--9) Count total no of orders.
select count(order_number) from sales_order;



--10) Find the total quantity sold.
select sum(quantity_ordered) total_quantity from sales_order;



--11) Fetch the first order date and the last order date.
(select order_date from sales_order 
order by order_date asc limit 1)
union
(select order_date from sales_order 
order by order_date desc limit 1)
;


	
