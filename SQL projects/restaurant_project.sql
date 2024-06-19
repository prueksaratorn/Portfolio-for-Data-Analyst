CREATE TABLE customers (
  customer_id INT UNIQUE,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  age INT
);

CREATE TABLE orders (
  order_id INT UNIQUE,
  customer_id INT,
  order_date TEXT,
  total_amount REAL,
  order_status TEXT,
  payment_method TEXT
);

CREATE TABLE menus (
  menu_item_id INT UNIQUE,
  item_name TEXT,
  category TEXT,
  price REAL
);

CREATE TABLE order_items (
  order_item_id INT UNIQUE,
  order_id INT,
  menu_item_id INT,
  quantity INT,
  price REAL
);

CREATE TABLE reviews (
  review_id INT UNIQUE,
  customer_id INT,
  review_date TEXT,
  rating INT
);

CREATE TABLE reservations (
  reservation_id INT UNIQUE,
  customer_id INT,
  reservation_date TEXT,
  party_size INT
);

-- Insert data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email, age)
VALUES (1, 'John', 'Doe', 'john.doe@gmail.com', 30),
       (2, 'Jane', 'Smith', 'jane.smith@hotmail.com', 25),
       (3, 'Alice', 'Johnson', 'alice.johnson@gmail.com', 40),
       (4, 'Bob', 'Brown', 'bob.brown@yahoo.com', 35),
       (5, 'Eve', 'White', 'eve.white@gmail.com', 28),
       (6, 'Michael', 'Lee', 'michael.lee@gmail.com', 32),
       (7, 'Sarah', 'Clark', 'sarah.clark@hotmail.com', 45),
       (8, 'David', 'Martinez', 'david.martinez@gmail.com', 50),
       (9, 'Amy', 'Wong', 'amy.wong@yahoo.com', 38),
       (10, 'Kevin', 'Garcia', 'kevin.garcia@gmail.com', 27);

-- Insert data into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount, order_status, payment_method)
VALUES (1, 1, '2024-05-22', 50.25, 'completed', 'credit card'),
       (2, 2, '2024-05-23', 75.50, 'completed', 'cash'),
       (3, 3, '2024-05-24', 100.75, 'pending', 'credit card'),
       (4, 4, '2024-05-25', 45.00, 'completed', 'cash'),
       (5, 5, '2024-05-26', 62.30, 'completed', 'credit card'),
       (6, 6, '2024-05-27', 90.00, 'completed', 'credit card'),
       (7, 7, '2024-05-28', 55.75, 'completed', 'cash'),
       (8, 8, '2024-05-29', 120.50, 'pending', 'credit card'),
       (9, 9, '2024-05-30', 70.25, 'completed', 'cash'),
       (10, 10, '2024-05-31', 105.00, 'completed', 'credit card');

-- Insert data into the menus table
INSERT INTO menus (menu_item_id, item_name, category, price)
VALUES (1, 'Cheeseburger', 'Main Course', 10.99),
       (2, 'Caesar Salad', 'Appetizer', 8.50),
       (3, 'Chocolate Cake', 'Dessert', 6.75),
       (4, 'Iced Tea', 'Beverage', 2.99),
       (5, 'Pasta Carbonara', 'Main Course', 12.50),
       (6, 'Steak', 'Main Course', 24.99),
       (7, 'Shrimp Cocktail', 'Appetizer', 12.99),
       (8, 'Apple Pie', 'Dessert', 7.50),
       (9, 'Lemonade', 'Beverage', 3.50),
       (10, 'Chicken Alfredo', 'Main Course', 14.99);

-- Insert data into the order_items table
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity, price)
VALUES (1, 1, 1, 2, 21.98),
       (2, 1, 4, 1, 2.99),
       (3, 2, 2, 1, 8.50),
       (4, 3, 3, 1, 6.75),
       (5, 4, 1, 1, 10.99,
       (6, 6, 6, 1, 24.99),
       (7, 6, 9, 2, 7.00),
       (8, 7, 7, 1, 12.99),
       (9, 8, 8, 1, 7.50),
       (10, 9, 10, 1, 14.99);

-- Insert data into the reviews table
INSERT INTO reviews (review_id, customer_id, review_date, rating)
VALUES (1, 1, '2024-05-22', 5),
       (2, 2, '2024-05-23', 4),
       (3, 3, '2024-05-24', 3),
       (4, 4, '2024-05-25', 5),
       (5, 5, '2024-05-26', 4),
       (6, 6, '2024-05-27', 1),
       (7, 7, '2024-05-28', 5),
       (8, 8, '2024-05-29', 3),
       (9, 9, '2024-05-30', 2),
       (10, 10, '2024-05-31', 3);

-- Insert data into the reservations table
INSERT INTO reservations (reservation_id, customer_id, reservation_date, party_size)
VALUES (1, 1, '2024-06-01', 4),
       (2, 2, '2024-06-02', 2),
       (3, 3, '2024-06-03', 6),
       (4, 4, '2024-06-04', 3),
       (5, 5, '2024-06-05', 5),
       (6, 6, '2024-06-06', 3),
       (7, 7, '2024-06-07', 2),
       (8, 8, '2024-06-08', 5),
       (9, 9, '2024-06-09', 4),
       (10, 10, '2024-06-10', 6);

.mode box
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM menus;
SELECT * FROM order_items;
SELECT * FROM reviews;
SELECT * FROM reservations;

-- Where (Track completed orders)
SELECT * FROM orders
WHERE order_status = 'completed';

-- Sum total completed orders after 2024-05-25
SELECT COUNT(order_id) AS Total_Orders, SUM(total_amount) AS total
FROM orders
WHERE order_status LIKE 'completed' AND order_date >= '2024-05-25';

-- Case (Review rating)
SELECT
  review_id,
  customer_id,
  rating,
  CASE
    WHEN rating >= 4 THEN 'Excellent'
    WHEN rating >= 2 THEN 'Good'
    ELSE 'Bad'
  END AS review_category
FROM reviews
ORDER BY rating DESC;

-- Group By (Count payment method)
SELECT payment_method, COUNT(order_id) AS payment_type
FROM orders
GROUP BY payment_method;

-- Count rating by group by
SELECT review_category, COUNT(review_id) AS review_count
FROM (SELECT
    review_id,
    customer_id,
    rating,
    CASE
      WHEN rating >= 4 THEN 'Excellent'
      WHEN rating >= 2 THEN 'Good'
      ELSE 'Bad'
    END AS review_category
  FROM reviews
  ORDER BY rating DESC)
GROUP BY review_category
ORDER BY review_count DESC;

-- Inner Join (Total spend by customer)
SELECT o.order_id, o.total_amount, c.first_name || ' ' || last_name AS fullname
FROM orders o
INNER JOIN customers c 
ON o.customer_id = c.customer_id
ORDER BY total_amount DESC;

-- Left Join (To prepare ingredients for customers)
SELECT c.customer_id, c.first_name, c.last_name, r.reservation_date, r.party_size
FROM customers c
LEFT JOIN reservations r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY reservation_date;
