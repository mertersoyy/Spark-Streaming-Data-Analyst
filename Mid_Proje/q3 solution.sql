
SELECT Shipping_Type,COUNT(*) AS TOTAL_ORDER,sum(Purchase_Amount) AS PURCHASE_AMOUNT,avg(Review_Rating) AS REVIEW 
FROM `skilled-module-406113.mid_proje.shopping_behavior` 
GROUP BY Shipping_Type
ORDER BY PURCHASE_AMOUNT DESC



SELECT avg(Review_Rating) AS AVG_Review,Shipping_Type,Frequency_Purchases,COUNT(*) AS Total_Sales FROM `skilled-module-406113.mid_proje.shopping_behavior` 
GROUP BY Shipping_Type, Frequency_Purchases
ORDER BY avg(Review_Rating) ASC
