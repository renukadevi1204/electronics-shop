--Grundläggande queries

--Hämta alla produkter sorterade efter namn
SELECT * FROM products
 ORDER BY name; 
 --Getting all the columns from products table 
 --and sorting by name

--Hämta alla produkter som kostar mer än 500 kr
select * from products
 WHERE price > 500;
 --Getting all the columns from products table
 --where price is greater than 500

--Hämta alla beställningar från 2024
select * FROM orders
 WHERE order_date >= '2024-01-01';
 --Retriving all the columns from
 --orders table where order_date is from 2024

--Hämta alla pending beställningar
SELECT * FROM orders
WHERE status = 'Pending';
--Getting all the columns from orders table
-- where the condition is satisfied.

--JOIN-queries
--Visa alla produkter med deras tillverkares namn
SELECT products.name as product_name,
brands.name as manufacturer_name FROM products 
join brands
ON products.brand_id = brands.id;
--Each product from product table is get paired with the brands table
--by using the Foreign Key brand_id.

--Visa alla beställningar med kundens namn och totalt belopp
SELECT customers.first_name ||' '||customers.last_name as customer_name,
 orders.total_amount  FROM orders 
join customers on orders.customer_id= customers.id;
--First we concatenated the first name and last name
--after we took total_amount from orders table and 
--we joined based on customer_id foreign key in orders table.

--Visa vilka produkter varje kund har köpt
select customers.first_name, string_agg(products.name,',' )
from customers
join orders ON customers.id = orders.customer_id 
join orders_items on orders.id = orders_items.order_id
join products on  orders_items.product_id = products.id 
group by customers.first_name
ORDER BY customers.first_name;
--By using postgres we created an array with stores
--all the products names in an array and display all
--in one column.

--Aggregering och analys
--Räkna antal produkter per tillverkare
 SELECT brands.name,count(*) as number_of_products 
 from products join brands
 on products.brand_id = brands.id  group by brand_id,brands.name
 ORDER BY name;
 --I took the brand_id from products table and join with table brands
 --to get the brand names and after that i grouped and 
 --counted to get the no. of products.

--Hitta kunder som har spenderat mest totalt
select customers.first_name ||' '||last_name from customers
join orders on customers.id = orders.customer_id
where orders.total_amount =  (select max(total_amount) from orders);
--First getting maximum amount by using the max aggregate function
--after that concatenate first name and last name
--getting customer names by joining two tables 
--when total_amount is equal to selected maximum amount.


--Visa produkter med genomsnittligt betyg från recensioner
select products.name from products JOIN
reviews on products.id = reviews.product_id
where reviews.rating = (select round(avg(rating)) from reviews )
--First i select the average rating from reviews TABLE
--by using where condition retrived the product name 
--by joining the two tables using product_id foreign key. 

