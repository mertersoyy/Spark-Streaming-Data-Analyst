/*

select * from (
select *, row_number() over (partition by subscription_status order by total_sales desc) as sales_rank from (
SELECT avg(Review_Rating) as Avg_Review,Category, count(customer_id) as Total_Sales,Subscription_Status 
FROM skilled-module-406113.mid_proje.shopping_behavior
GROUP BY Category,Subscription_Status
ORDER BY Total_Sales DESC ))
WHERE sales_rank <3

*/