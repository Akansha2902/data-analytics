use RetailMartDB;
-- 1. Display all customers whose city is not between Delhi and Pune (use alphabetical logic on city).
select * from customers
where city not between
"Delhi" and "Pune";
-- 2. Display all orders whose order_date is not between 2026-01-05 and 2026-01-20.
select * from customer_orders
where order_date not between
"2026-01-05" and "2026-01-20";
-- 3. Display all products whose unit_price is not between 500 and 2000.
select * from products
where unit_price not between
500 and 2000;
-- 4. Display all customers whose customer_id is in (101, 104, 108, 110).
select * from customers 
where customer_id in (101,104,108,110);
-- 5. Display all products whose category is in ('Electronics','Fitness','Stationery').
select * from products 
where category in ("Electronics","Fitness","Stationery");
-- 6. Display all orders whose order_status is in ('PLACED','DELIVERED').
select * from customer_orders
where order_status in ("Order Placed","Delivered");
-- 7. Display all customers whose city is not in ('Pune','Mumbai').
select * from customers 
where city not in ("Pune","Mumbai");
-- 8. Display all products whose brand is not in ('Sony','Nike','Boat').
select * from products 
where brand not in ("Sony","Nike","Boat");
-- 9. Display all orders whose channel is not in ('ONLINE').
rename table customer_orders to orders;
select * from orders 
where order_channel not in ("Online");
-- 10. Insert 5 new customers where email is NULL for at least 2 customers.
insert into customers values
(111,"Madhura Deshmukh",2567189026,null,"Delhi","2026-02-26"),
(112,"Pooja Koli",6729801267,"pooja@gmail.com","Delhi","2026-01-11"),
(113,"Akshy sharma",6719023567,null,"Pune","2025-12-31"),
(114,"Sakshi Nikam",5612789230,null,"Nagpur","2026-02-22"),
(115,"Kunal kumar",8924561789,null,"Delhi","2025-12-22");
-- 11. Display all customers where email is null.
select * from customers
where email is null ;
-- 12. Display all customers where email is not null.
select * from customers 
where email is not null;
-- 13. Insert 6 new products where brand is NULL for at least 2 products.
insert into products values
(513,"Book","Stationery",null,350,600),
(514,"Pen","Stationery","Natraj",5,1200),
(515,"Dumble","Fitness",null,800,1000),
(516,"Yoga mat","Fitness",null,450,670),
(517,"Pen pencile","Stationery","Pentonic",20,600),
(518,"Eraser","Stationery",null,10,1200);
-- 14. Display all products where brand is null.
select * from products
where brand is null;
-- 15. Display all products where brand is not null.
select * from products 
where brand is not null;
-- 16. Display the first 5 customers based on created_at (oldest first).
select * from customers 
order by created_at asc
limit 5 ;
-- 17. Display the next 5 customers after skipping the first 5 customers based on created_at (oldest first).
select * from customers 
order by created_at asc
limit 5
offset 5;
select * from customers 
order by created_at asc;
-- 18. Display the top 3 most expensive products.
select * from products
order by unit_price desc
limit 3;
-- 19. Display 5 products starting from the 6th most expensive product.
select * from products 
order by unit_price desc
limit 5 offset 6;
-- 20. Display 7 orders starting from the 4th most recent order (latest orders first).
select * from orders 
order by order_date asc
limit 7 offset 4;
