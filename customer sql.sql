select * from customer limit 20

--1.Total spending by gender?
SELECT gender,
       SUM(total_spend) AS total_revenue
FROM customer
GROUP BY gender;

--2. Which age group generates the highest revenue?
SELECT age_group,
       SUM(total_spend) AS revenue
FROM customer
GROUP BY age_group
ORDER BY revenue DESC
LIMIT 1;

--3.Top 10 customers by total spending
SELECT customer_id,
       total_spend
FROM customer
ORDER BY total_spend DESC
LIMIT 10;

--4.Which city generates the highest revenue?
SELECT city,
       SUM(total_spend) AS revenue
FROM customer
GROUP BY city
ORDER BY revenue DESC
LIMIT 1;

--5.Which age group makes the most purchases?
SELECT age_group,
       SUM(items_purchased) AS total_items
FROM customer
GROUP BY age_group
ORDER BY total_items DESC
LIMIT 1;

--6.Customers who spent more than the average spending?
SELECT customer_id,
       total_spend
FROM customer
WHERE total_spend >
      (SELECT AVG(total_spend)
       FROM customer);
	   
--7.Total revenue by city?
SELECT city,
       SUM(total_spend) AS revenue
FROM customer
GROUP BY city
ORDER BY revenue DESC;

--8.Average days since last purchase by membership type?
SELECT membership_type,
       ROUND(AVG(days_since_last_purchase),2) AS avg_days
FROM customer
GROUP BY membership_type;

--9.Customers who received discounts and spent above average?
SELECT customer_id,
       total_spend
FROM customer
WHERE discount_applied = TRUE
  AND total_spend >
      (SELECT AVG(total_spend)
       FROM customer);
	   
--10.Top 5 cities by number of customers?
SELECT city,
       COUNT(*) AS customer_count
FROM customer
GROUP BY city
ORDER BY customer_count DESC
LIMIT 5;

