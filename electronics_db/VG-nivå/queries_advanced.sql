--Hitta alla produkter vars pris är högre än genomsnittspriset
SELECT * from products 
where price > (select avg(price) from products);


--Hitta kunder som har beställt fler än genomsnittligt antal beställningar
select customer_id ,count(*) as order_count 
from orders group by customer_id having count(*) > 
(SELECT AVG(order_count) 
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
));
--FIRST i calculated the average no. of orders per customer and
--from orders i calculated the average of orders and finally, 
--using the having clause, i selected only those customers
 --whose total orders are greater than this average.
 

--Window functions (2 queries) - PostgreSQL-specifikt:
--Ranka produkter per tillverkare baserat på pris (ROW_NUMBER)
select p.name ,p.id ,p.sku,p.price,
row_number() over(PARTITION BY brands.name order by price DESC)
as rank_per_manufacturer
 from products p join brands on  p.brand_id =brands.id;
--I grouped the products by brands, so each brand is treated seperatly
--after that with each brand i ordered the products based on price desc
-- finally i applied row_number to assign the rank using for ecah products in that brand


--Visa varje kunds totala spending och deras rank bland alla kunder (RANK)
select customer_id , first_name as name,
count(*) as order_count,sum(total_amount) as total_spending,
rank() over (ORDER BY sum(total_amount) desc) from orders as o
join customers as c
on o.customer_id = c.id
group by customer_id ,first_name;
--first calcuated the total amount spend by each customer and
--after each customer is ordered by the rank based on total amount
--spent and joining with customers table to get the customers based
--on filtered customer_id


--CASE och villkorlig logik (2 queries):
--Kategorisera produkter som 'Budget' (<1000), 'Medium' (1000-5000), 'Premium' (>5000)
select p.id, p.name, p.price,
    case 
        WHEN p.price < 1000 THEN 'budget'
        WHEN p.price BETWEEN 1000 AND 5000 THEN 'medium'
        WHEN p.price >5000 THEN 'premium'
    end as price_catagory
from products p
--i seperated products based on price and by using 
--case i have separated the catagory as budget, medium and premium


--6. Visa kunder som 'VIP' (>3 beställningar), 'Regular' (2-3), 'New' (1)
select o.customer_id,c.first_name, count(*) as no_of_order,
    CASE
        WHEN count(o.id )> 3 THEN 'VIP'
        WHEN count(o.id) BETWEEN 2 AND 3 THEN 'regular'
        WHEN count(o.id) = 1 THEN 'new'
    end as customer_catogory
 from customers c join orders o on o.customer_id = c.id
 GROUP BY customer_id,c.first_name;
 --we have to separate the category of customers based on their orders
 --so using case to classify each customers as vip,new and regular
 --based on how many orders they have placed.