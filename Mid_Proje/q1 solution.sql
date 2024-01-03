/*
SELECT Category,count(*) AS Total_Sales,Gender as Gender,
CASE WHEN Gender='Male' and Age BETWEEN 0 AND 24 THEN 'Ergen 0-24'
	  WHEN Gender='Male' and Age BETWEEN 25 AND 44 THEN 'Genç 25-44'
	  WHEN Gender='Male' and Age BETWEEN 45 AND 54 THEN 'Orta Yaşlı 45-54'
	  WHEN Gender='Male' and Age BETWEEN 55 AND 64 THEN 'Erken Yaşlı 55-64'
    WHEN Gender='Male'  and Age BETWEEN 65 AND 74 THEN 'Yaşlı 65-74'
		WHEN Gender='Female' and Age BETWEEN 0 AND 24 THEN 'Ergen 0-24'
	  WHEN Gender='Female' and Age BETWEEN 25 AND 44 THEN 'Genç 25-44'
	  WHEN Gender='Female' and Age BETWEEN 45 AND 54 THEN 'Orta Yaşlı 45-54'
	  WHEN Gender='Female' and Age BETWEEN 55 AND 64 THEN 'Erken Yaşlı 55-64'
    WHEN Gender='Female' and Age BETWEEN 65 AND 74 THEN 'Yaşlı 65-74'
	  ELSE '' END as Age
FROM `skilled-module-406113.mid_proje.shopping_behavior` 
GROUP BY Age,Category,Gender
ORDER BY Total_Sales DESC
LIMIT 10
*/
