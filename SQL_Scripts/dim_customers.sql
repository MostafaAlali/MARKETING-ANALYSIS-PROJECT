SELECT 
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	c.GeographyID,
	g.City
FROM customers c
LEFT JOIN dbo.geography g
ON c.GeographyID = g.GeographyID