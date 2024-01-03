SELECT * FROM (
SELECT *, row_number() over (partition BY subscription_status ORDER BY total_sales DESC) AS sales_rank FROM (
SELECT avg(Review_Rating) AS Avg_Review,Category, COUNT(customer_id) AS Total_Sales,Subscription_Status 
FROM skilled-module-406113.mid_proje.shopping_behavior
GROUP BY Category,Subscription_Status
ORDER BY Total_Sales DESC ))
WHERE sales_rank <3
