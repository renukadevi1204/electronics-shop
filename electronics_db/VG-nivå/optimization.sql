select p.name ,p.id ,p.sku,p.price,
row_number() over(PARTITION BY brands.name order by price DESC)
as rank_per_manufacturer
 from products p join brands on  p.brand_id =brands.id;

--Started executing query at Line 1
--(12 row(s) affected)
--Total execution time: 00:00:00.008

--optimize product query
--supports join on brand_id and ordering by price
create index idx_products_brand_price_desc
    on products (brand_id, price desc);

--Started executing query at Line 1
--(12 row(s) affected)
--Total execution time: 00:00:00.004
--can see the difference of execution time drops
--from .008 to .004

select customer_id , first_name as name,
count(*) as order_count,sum(total_amount) as total_spending,
rank() over (ORDER BY sum(total_amount) desc) from orders as o
join customers as c
on o.customer_id = c.id
group by customer_id ,first_name;

--Started executing query at Line 19
--(6 row(s) affected)
--Total execution time: 00:00:00.012

--Optimize orders query
--Speeds up join and group by customer_id
create index idx_orders_customer_id
    on orders (customer_id);

--Started executing query at Line 19
--(6 row(s) affected)
--Total execution time: 00:00:00.004

--can see the difference in execution time
--drops from 12 to 4