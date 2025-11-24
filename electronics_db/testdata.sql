INSERT INTO brands 
(id, name, country, founded_year, description)
VALUES(1, 'NordicTech AB','Sweden',2008,'swedish company');
INSERT INTO brands 
(id, name, country, founded_year, description)
VALUES(2, 'EcoHome Solutions','Denmark',2015,'Danish company'),
(3, 'GlobalGear Ltd','Germany',1999,'German company'),
(4, 'Astra Appliances','Finland',2005,'Finnish company'),
(5, 'VoltEdge Electronics','USA',2012,'American company');

INSERT INTO products
 (id, name, brand_id, sku, release_year, price, warranty_months, catagory, stock_quantity) 
 VALUES
(1, 'SmartLamp X200', 1, 'NT-SLX200', 2022, 499.00, 24, 'Lighting', 120),
(2, 'ThermoSense Pro', 1, 'NT-TSPRO', 2023, 1299.00, 36, 'Home Electronics', 75),
(3, 'AirPurify Mini', 1, 'NT-APMINI', 2021, 899.00, 24, 'Air Quality', 60),
(4, 'EcoKettle 2.0', 2, 'EH-KET20', 2021, 649.00, 18, 'Kitchen Appliances', 90),
(5, 'SolarCharge Home', 2, 'EH-SCH01', 2024, 3499.00, 48, 'Energy Solutions', 25),
(6, 'SmartPlug Duo', 2, 'EH-SPD2', 2022, 299.00, 12, 'Home Automation', 200),
(7, 'GearMaster 500', 3, 'GG-GM500', 2019, 1999.00, 24, 'Power Tools', 40),
(8, 'DrillX Compact', 3, 'GG-DXC19', 2018, 1499.00, 24, 'Power Tools', 55),
(9, 'PowerSaw 10', 3, 'GG-PS10', 2024, 2599.00, 36, 'Power Tools', 30),
(10, 'AstraCook Pro', 4, 'AA-ACP01', 2023, 1599.00, 24, 'Kitchen Appliances', 80),
(11, 'VoltCam 360', 5, 'VE-VC360', 2023, 1399.00, 24, 'Home Security', 110),
(12, 'VoltSense Hub', 5, 'VE-VSH22', 2024, 1799.00, 36, 'Smart Home', 65);

INSERT INTO customers
(id, first_name, last_name, email, phone, city, registration_date)
 VALUES
(1, 'Anna', 'Johansson', 'anna.johansson@example.com',+46701234567, 'Stockholm', '2020-03-12'),
(2, 'Erik', 'Nilsson', 'erik.nilsson@example.com',+46722345678, 'Göteborg', '2021-06-22'),
(3, 'Sara', 'Berg', 'sara.berg@example.com', +46733456789, 'Malmö', '2019-11-08'),
(4, 'Lukas', 'Andersson', 'lukas.andersson@example.com', +46708765432, 'Uppsala', '2024-02-15'),
(5, 'Karin', 'Lind', 'karin.lind@example.com', +46769876543, 'Örebro', '2022-09-30'),
(6, 'Mikael', 'Svensson', 'mikael.svensson@example.com', +46792231145, 'Västerås', '2023-01-18');

INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_city) VALUES
(1, '2023-11-18', 1498.00, 'Completed', 'Stockholm'),   
(1, '2024-08-05', 499.00, 'Pending', 'Stockholm'),      
(2, '2024-01-05', 2599.00, 'Completed', 'Göteborg'),    
(2, '2025-02-14', 649.00, 'Pending', 'Göteborg'),       
(3, '2024-04-05', 649.00, 'Completed', 'Malmö'),        
(3, '2025-01-10', 2499.00, 'Completed', 'Malmö'),       
(4, '2024-10-12', 999.00, 'Pending', 'Uppsala'),        
(5, '2024-09-22', 1799.00, 'Completed', 'Örebro'),      
(6, '2023-07-30', 2199.00, 'Cancelled', 'Västerås'),    
(6, '2025-03-04', 1299.00, 'Completed', 'Västerås');  

INSERT INTO orders_items
(order_id, product_id, quantity, unit_price)
 VALUES
(1, 1, 2, 499.00),    
(1, 2, 1, 1299.00),   
(2, 3, 1, 649.00),    
(2, 4, 2, 299.00),    
(3, 5, 1, 1999.00),   
(3, 6, 1, 2599.00),   
(4, 3, 1, 649.00),    
(5, 3, 1, 649.00),    
(6, 10, 1, 1799.00),  
(7, 11, 1, 999.00),   
(8, 10, 1, 1799.00),  
(9, 1, 1, 2199.00),  
(9, 12, 1, 2799.00), 
(10, 2, 1, 1299.00);  

INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Absolutely love the SmartLamp X200! Bright and energy efficient.', '2023-11-20'),
(2, 1, 4, 'ThermoSense Pro works well, but a bit pricey.', '2024-01-15'),
(3, 2, 4, 'EcoKettle 2.0 heats water quickly, very convenient.', '2024-02-10'),
(4, 3, 3, 'SmartPlug Duo is okay, occasionally loses connection.', '2024-03-05'),
(5, 2, 5, 'GearMaster 500 is a powerhouse! Perfect for my workshop.', '2024-04-18'),
(6, 3, 4, 'PowerSaw 10 is strong and durable, satisfied with purchase.', '2024-05-22'),
(7, 4, 4, 'AstraCook Pro is sleek and easy to use.', '2024-06-10'),
(8, 5, 5, 'AstraBrew Coffee 5 makes perfect coffee every time!', '2024-07-12'),
(9, 6, 4, 'VoltCam 360 provides excellent security coverage.', '2024-08-01'),
(10, 5, 5, 'VoltSense Hub makes my home smarter. Excellent product!', '2024-09-05'),
(11, 4, 4, 'GreenPanel Solar 100W helped reduce my electricity bills.', '2024-10-01');

