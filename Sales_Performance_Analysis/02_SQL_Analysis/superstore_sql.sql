-- Write SQL queries for: --
# import data to SQL
use db_ecom;
select * from ecommerce;

# Top 10 profitable products
select product_name, sum(profit) as total_profit
from ecommerce
group by product_name
order by total_profit desc
limit 10
;

# Top 10 customers by sales
select ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Ranking,
customer_name, sum(sales) as total_sales
from ecommerce
group by customer_name
order by total_sales desc
limit 10
;

# Region-wise total sales
select region, sum(sales) as total_sales
from ecommerce
group by region
order by total_sales desc
;

# Category-wise average profit
select category, avg(profit) as avg_profit
from ecommerce
group by category
order by avg_profit DESC 
;

# Fungsi 'Round' Membulatkan hasil menjadi 2 angka desimal
# Highest discount category
select category, 
concat(round(AVG(Discount), 2), '%') AS Average_Discount
from ecommerce
group by category
order by Average_Discount desc
#limit 1
;

# Orders with negative profit
select order_id,customer_name, profit 
from ecommerce
order by profit asc 
limit 3;

# Kalau ingin menghitung jumlah order yang rugi
SELECT
    `order_id`,
    `order_date`,
    `customer_name`,
    category,
    sales,
    profit
FROM ecommerce
WHERE profit < 0
ORDER BY profit ASC;

# Monthly sales trend
SELECT month, year, SUM(sales) AS total_sales
FROM ecommerce
GROUP BY year, month
ORDER BY total_sales ASC;
select * from ecommerce;

# Market-wise revenue analysis
select market_clean, sum(sales) as revenue
from ecommerce
group by market_clean
order by revenue desc;


# Top-performing sub-categories
select sub_category, sum(sales) as total_sales
from ecommerce
group by sub_category
order by total_sales desc
limit 5;

SELECT
    ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS Ranking,
    `sub_category`,
    ROUND(SUM(sales), 2) AS Total_Sales
FROM ecommerce
GROUP BY `sub_category`
ORDER BY Total_Sales DESC
LIMIT 10;

# Ship mode usage analysis
select ship_mode, count(distinct order_id) 
as total_order
from ecommerce
group by ship_mode
order by total_order desc;


