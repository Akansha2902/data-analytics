create database RetailMartDB;
use RetailMartDB;
create table customers(
customer_id int,
full_name varchar(250), 
phone int,
email varchar(250), 
city varchar(50), 
created_at varchar(255)
);
-- 3. Create a table products with: product_id, product_name, category, brand, unit_price, stock_qty.
create table products(
product_id int,
product_name varchar(50),
category varchar(100),
brand varchar(100),
unit_price double(10,5),
stock_qty int
);
desc products;
-- 4. Create a table orders with: order_id, customer_id, order_date, order_status, channel, city.
create table orders(
order_id int,
customer_id int,
order_date date,
order_status varchar(50),
order_channel varchar(100),
city varchar(100)
);
-- 5. Create a table order_items with: order_item_id, order_id, product_id, quantity, unit_price, discount_pct.
create table order_items(
order_item_id int,
order_id int,
product_id int,
quantity int,
unit_price float,
discount_pct float
);
-- 6. Add a new column gender to the customers table.
alter table customers add gender varchar(10);
-- 7. Rename the column phone in customers to mobile_no.
alter table customers rename column phone to mobile_no;
-- 8. Change the datatype of email in customers to allow longer email values.
alter table customers modify email varchar(255);
-- 9. Remove the column stock_qty from the products table.
alter table products drop column stock_qty;
-- 10. Rename the table orders to customer_orders.
rename table orders to customer_orders;
-- 11. Delete the table order_items.
drop table order_items;
-- 12. Delete the database RetailMartDB.
drop database RetailMartDB;
-- 13. Insert 10 sample rows into customers (use different cities and created dates).
create database RetailMartDB;
use RetailMartDB;
create table customers(
customer_id int,
full_name varchar(250), 
phone int,
email varchar(250), 
city varchar(50), 
created_at varchar(255)
);
create table products(
product_id int,
product_name varchar(50),
category varchar(100),
brand varchar(100),
unit_price double(10,5),
stock_qty int
);
create table orders(
order_id int,
customer_id int,
order_date date,
order_status varchar(50),
order_channel varchar(100),
city varchar(100)
);
create table order_items(
order_item_id int,
order_id int,
product_id int,
quantity int,
unit_price float,
discount_pct float
);
alter table customers modify phone varchar(15);
alter table customers drop column created_at;
truncate table customers;
alter table customers add created_at date;
INSERT INTO customers (customer_id,full_name,phone,email,city,created_at) VALUES 
(101,"Akansha karpe","7823561209","akansha@gmail.com","Aurangabad","2025-04-12"),
(102,"Pooja sharma","2789107823","pooja@gmail.com","Pune","2025-10-22"),
(103,"Komal garud","1289026782","komal@gmail.com","Pune","2026-01-11"),
(104,"Rahul kumar","6712906723","rahul@gmail.com","Mumbai","2025-02-25"),
(105,"Abhijit karpe","3617823498","abhijit@gmail.com","Aurangabad","2026-02-09"),
(106,"Sakshi jadhav","6723910728","sakshi@gmail.com","Pune","2025-12-19"),
(107,"Appa jadhav","9923185637","appa@gmail.com","Nashik","2025-10-03"),
(108,"Sangita arsul","8267346789","sangita@gmail.com","Nagpur","2026-02-22"),
(109,"Atharva malose","6712348902","atharva@gmail.com","Pune","2026-01-30"),
(110,"Sumit jadhav","7823901278","sumit@gmail.com","Aurangabad","2025-11-29");
select * from customers;
-- 14. Insert 12 sample rows into products (use at least 4 categories and 3 brands).
insert into products values
(501,"Mascara","Make-up","Mars",215.45,78),
(502,"Laptop","Electronics","Dell",25000,40),
(503,"Mobile","Electronics","Oppo",18000,67),
(504,"Lip gloss","Make-up","Mars",367,78),
(505,"Headphone","Electronics","Oppo",230,122),
(506,"T-shirt","Fashion","Zudio",199,90),
(507,"Shoes","Fashion","Zudio",399,30),
(508,"Eye linear","Make-up","Zudio",149,35),
(509,"Basic top","Fashion","Zudio",99,56),
(510,"Charger","Electronics","Dell",500,25),
(511,"Power bank","Electronics","Oppo",1200,30),
(512,"Speaker","Electronics","Dell",2500,45);
-- 15. Insert 15 sample rows into customer_orders (mix order status and channels).
rename table orders to customer_orders;
insert into customer_orders values 
(1011,109,"2025-09-23","Delivered","Mobile App","Aurangabad"),
(1012,101,"2026-02-11","Shipped","Brand website","Pune"),
(1013,104,"2025-12-29","Pending","Social media","Mumbai"),
(1014,102,"2025-11-10","Out of Delivery","Mobile App","Nagpur"),
(1015,108,"2026-01-12","Processing","Brand website","Pune"),
(1016,105,"2026-02-22","In transit","Delivery apps","Aurangabad"),
(1017,101,"2026-02-20","Order placed","Delivery apps","Pune"),
(1018,110,"2025-10-09","Delivered","Social media","Mumbai"),
(1019,103,"2025-11-10","Shipped","Brand website","Pune"),
(1020,106,"2026-01-19","Order confirmed","Mobile app","Aurangabad"),
(1021,107,"2026-02-12","Order confirmed","Brand website","Pune"),
(1022,110,"2025-12-28","Delivered","Delivery apps","Nagpur"),
(1023,101,"2026-02-17","Processing","Mobile app","Mumbai"),
(1024,107,"2025-10-23","Delivered","Brand website","Nagpur"),
(1025,105,"2026-02-23","Order placed","Social media","Pune");

-- 16. Insert 40 sample rows into order_items (ensure quantities and prices look realistic).
insert into order_items values
(1, 1001, 201, 2, 499.99, 5.00),
(2, 1001, 205, 1, 899.50, 10.00),
(3, 1002, 203, 3, 29.99, 0.00),
(4, 1002, 210, 5, 15.75, 2.50),
(5, 1003, 207, 1, 1200.00, 15.00),
(6, 1003, 202, 2, 75.00, 0.00),
(7, 1004, 206, 4, 45.99, 5.00),
(8, 1004, 208, 2, 250.00, 8.00),
(9, 1005, 201, 1, 499.99, 0.00),
(10, 1005, 204, 6, 9.99, 0.00),
(11, 1006, 209, 3, 150.00, 12.00),
(12, 1006, 203, 2, 29.99, 0.00),
(13, 1007, 202, 1, 75.00, 0.00),
(14, 1007, 205, 2, 899.50, 5.00),
(15, 1008, 210, 10, 15.75, 3.00),
(16, 1008, 204, 8, 9.99, 0.00),
(17, 1009, 208, 1, 250.00, 0.00),
(18, 1009, 207, 2, 1200.00, 10.00),
(19, 1010, 206, 3, 45.99, 5.00),
(20, 1010, 203, 4, 29.99, 0.00),
(21, 1011, 209, 1, 150.00, 0.00),
(22, 1011, 201, 2, 499.99, 7.50),
(23, 1012, 204, 12, 9.99, 0.00),
(24, 1012, 202, 5, 75.00, 5.00),
(25, 1013, 205, 1, 899.50, 0.00),
(26, 1013, 210, 6, 15.75, 2.00),
(27, 1014, 207, 1, 1200.00, 20.00),
(28, 1014, 206, 2, 45.99, 0.00),
(29, 1015, 203, 7, 29.99, 0.00),
(30, 1015, 208, 3, 250.00, 5.00),
(31, 1016, 201, 1, 499.99, 0.00),
(32, 1016, 209, 2, 150.00, 10.00),
(33, 1017, 204, 15, 9.99, 0.00),
(34, 1017, 210, 4, 15.75, 0.00),
(35, 1018, 205, 1, 899.50, 5.00),
(36, 1018, 202, 3, 75.00, 0.00),
(37, 1019, 208, 2, 250.00, 0.00),
(38, 1019, 206, 5, 45.99, 8.00),
(39, 1020, 203, 6, 29.99, 0.00),
(40, 1020, 207, 1, 1200.00, 12.00);
-- 17. Update the city of a specific customer using customer_id.
update customers 
set city="Mumbai"
where customer_id=105;
select * from customers;
-- 18. Increase unit_price by 8% for all products in a chosen category.
update products
set unit_price=unit_price+(0.08*unit_price)
where category="Make-up";
-- 19. Reduce stock_qty by 5 for a specific product using product_id.
update products
set stock_qty=stock_qty-5
where product_id=507;
-- 20. Delete all orders having order_status as CANCELLED.
delete from customer_orders
where order_status="Canceled";
-- 21. Delete a customer record using customer_id.
delete from customers
where customer_id=107;
-- 22. Display all customers from the city Pune.
select * from customers 
where city="Pune";
-- 23. Display all products where unit_price is greater than 2000.
select * from products 
where unit_price>2000;
-- 24. Display all orders placed using the ONLINE channel.
select * from customer_orders
where order_channel="Brand website" or order_channel="Mobile app";
-- 25. Display all orders placed between 2026-01-01 and 2026-01-31.
select * from customer_orders
where order_date between "2026-01-01" and "2026-01-31";
select * from customer_orders;
-- 26. Display all products with unit price between 500 and 1500.
select * from products
where unit_price between 500 and 1500;
-- 27. Display all order items where quantity is between 2 and 6.
select * from order_items 
where quantity between 2 and 6;
-- 28. Display the unique list of cities from customers.
select distinct city from customers;
-- 29. Display the unique list of categories from products.
select distinct category from products;
-- 30. Show all products sorted by unit_price from highest to lowest.
select * from products 
order by unit_price desc;
-- 31. Show all customers sorted by created_at from newest to oldest.
select * from customers 
order by created_at desc;
-- 32. Show all orders sorted by order_date (oldest first) and then by order_status.
select * from customer_orders
order by order_date,order_status;
-- 33. Show total number of orders per city.
select city,count(order_id)
from customer_orders
group by city;
-- 34. Show total number of customers per city.
select city,count(customer_id)
from customers
group by city;
-- 35. Show average product price per category.
select category,avg(unit_price)
from products
group by category;
-- 36. Show total revenue per order based on quantity * unit_price * (1 - discount_pct/100).
select quantity,sum(quantity * unit_price * (1 - discount_pct/100)) as total_revenue
from order_items
group by quantity;
-- 37. Show total revenue per category.

-- 38. Show total quantity sold per product.
select product_id, sum(quantity)
from order_items
group by product_id;
-- 39. Show cities where the total number of orders is more than 5.
select city,count(order_id)
from customer_orders
group by city
having count(order_id)>5;
-- 40. Show categories where average unit price is greater than 2500
select category, avg(unit_price)
from products
group by category
having avg(unit_price)>2500;