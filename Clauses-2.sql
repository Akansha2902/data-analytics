use RetailMartDB;
-- 1. Show the details of customers who registered in January 2026.
select * from customers 
where created_at >= "2026-01-01"
and created_at < "2026-02-01";
-- 2. Display the names of customers who belong to Mumbai or Delhi.
select * from customers
where city ="Mumbai" or city="Delhi";
-- 3. Show all products that cost more than ■2500.
select * from products
where unit_price > 2500;
-- 4. Display products whose price falls within the range ■700 to ■1800.
select * from products 
where unit_price between 700 and 1800;
-- 5. Show the list of products that do not fall in the category 'Electronics'.
select * from products 
where category not in ("Electronics");
-- 6. Display the orders that were placed after 10 January 2026.
select * from orders
where order_date > "2026-01-10";
-- 7. Show all customers whose city is either Pune, Hyderabad, or Chennai.
select * from customers 
where city in ("Pune","Hyderabad","Chennai");
-- 8. Display products whose brand is neither Sony nor Nike.
select * from products
where brand not in ("Sony","Nike");
-- 9. Show the orders that were placed through the ONLINE channel.
select * from orders
where order_channel="Brand website";
-- 10. Display orders that were not placed through the OFFLINE channel.
select * from orders 
where order_channel !="Mobile app";
-- 11. Display the list of products arranged alphabetically by product name.
select * from products
order by product_name asc;
-- 12. Show customers arranged by their registration date from newest to oldest.
select * from customers 
order by created_at desc;
-- 13. Display orders arranged by order date starting from the most recent.
select * from orders 
order by order_date desc;
-- 14. Show products arranged from the most expensive to the least expensive.
select * from products
order by unit_price desc;
-- 15. Display customers arranged first by city and then by name.
select * from customers
order by city asc , full_name asc;
-- 16. Show the number of customers living in each city.
select city, count(*)
from customers
group by city;
-- 17. Display the number of products available in each category.
select category,count(product_id)
from products
group by category;
-- 18. Show the average price of products for each brand.
select brand,avg(unit_price)
from products
group by brand;
-- 19. Display the highest priced product in each category.
select category , max(unit_price)
from products
group by category;
-- 20. Show the lowest priced product in each category.
select category , min(unit_price)
from products
group by category;
-- 21. Display how many orders were placed from each city.
select city , count(order_id)
from orders
where order_status ="Order Placed"
group by city;
-- 22. Show how many orders were placed using each channel.
select order_channel,count(order_id)
from orders
where order_status ="Order Placed"
group by order_channel;
-- 23. Display cities where more than 2 customers are registered.
select city , count(customer_id)
from customers
group by city 
having count(customer_id)>2;
-- 24. Show brands where the average price of products is greater than ■2000.
select brand,avg(unit_price)
from products
group by brand
having avg(unit_price)>2000;
-- 25. Display product categories where the most expensive product costs more than ■4000.
select category ,max(unit_price)
from products
group by category
having max(unit_price)>4000;
-- 26. Show order channels where more than 3 orders were placed.
select order_channel,count(*)
from orders
where order_status="Order Placed"
group by order_channel
having count(*)>3;
-- 27. Display customers whose email address is not available.
select * from customers
where email is null;
-- 28. Show products where the brand information is missing.
select * from products 
where brand is null;
-- 29. Display customers whose email address is available.
select * from customers 
where email is not null;
-- 30. Show products where the brand information is available.
select * from products
where brand is not null;
-- 31. Display the five most recently registered customers.
select * from customers 
order by created_at desc
limit 5;
-- 32. Show the three most expensive products available.
select * from products
order by unit_price desc
limit 3;
-- 33. Display the first seven orders based on order date.
select * from orders
order by order_date desc
limit 7;