SELECT 
ProductID,
ProductName,
Category,
Price,
CASE WHEN Price < 50  THEN 'LOW'
WHEN Price > 200 THEN  'Hight'
ELSE 'Medium'
END AS PriceCategory
FROM dbo.products;