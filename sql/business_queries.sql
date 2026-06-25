USE customer_db;

-- Q1: Total Revenue and Orders by Category
SELECT category,
       ROUND(SUM(purchase_amount_usd), 2) AS total_revenue,
       COUNT(*) AS total_orders
FROM customer_shopping_behavior
GROUP BY category
ORDER BY total_revenue DESC;

-- Q2: Top 5 Locations by Revenue
SELECT location,
       ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customer_shopping_behavior
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 5;

-- Q3: Average Purchase Amount by Gender
SELECT gender,
       ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase
FROM customer_shopping_behavior
GROUP BY gender;

-- Q4: Subscription vs Non-Subscription Behavior
SELECT subscription_status,
       COUNT(*) AS customers,
       ROUND(AVG(purchase_amount_usd), 2) AS avg_spend,
       ROUND(AVG(previous_purchases), 2) AS avg_past_purchases
FROM customer_shopping_behavior
GROUP BY subscription_status;

-- Q5: Most Used Payment Methods
SELECT payment_method,
       COUNT(*) AS usage_count,
       ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customer_shopping_behavior
GROUP BY payment_method
ORDER BY usage_count DESC;

-- Q6: Seasonal Revenue Trends
SELECT season,
       ROUND(SUM(purchase_amount_usd), 2) AS total_revenue,
       COUNT(*) AS total_orders
FROM customer_shopping_behavior
GROUP BY season
ORDER BY total_revenue DESC;

-- Q7: Impact of Promo Codes
SELECT promo_code_used,
       COUNT(*) AS orders,
       ROUND(AVG(purchase_amount_usd), 2) AS avg_order_value
FROM customer_shopping_behavior
GROUP BY promo_code_used;

-- Q8: Revenue by Age Group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS customers,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_spend
FROM customer_shopping_behavior
GROUP BY age_group
ORDER BY avg_spend DESC;

-- Q9: Top Rated Items
SELECT item_purchased,
       ROUND(AVG(review_rating), 2) AS avg_rating,
       COUNT(*) AS purchases
FROM customer_shopping_behavior
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 10;

-- Q10: Discount vs No Discount Spending
SELECT discount_applied,
       ROUND(AVG(purchase_amount_usd), 2) AS avg_spend,
       COUNT(*) AS total_orders
FROM customer_shopping_behavior
GROUP BY discount_applied;
