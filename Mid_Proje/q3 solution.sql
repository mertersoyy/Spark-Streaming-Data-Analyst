/*
SELECT Shipping_Type,count(*) AS TOTAL_ORDER,sum(Purchase_Amount) AS PURCHASE_AMOUNT,avg(Review_Rating) as REVIEW 
FROM `skilled-module-406113.mid_proje.shopping_behavior` 
GROUP BY Shipping_Type
ORDER BY PURCHASE_AMOUNT DESC
*/

/*
SELECT avg(Review_Rating) as AVG_Review,Shipping_Type,Frequency_Purchases,count(*) as Total_Sales FROM `skilled-module-406113.mid_proje.shopping_behavior` 
GROUP BY Shipping_Type, Frequency_Purchases
Order By avg(Review_Rating) asc

*/