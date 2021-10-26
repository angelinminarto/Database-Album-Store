--1. 
SELECT 
		CustomerName,
		CustomerPhone,
		CustomerEmail
FROM Customer
WHERE CustomerName NOT LIKE '% %'

--2. 
SELECT 
		CustomerName,
		EmployeeName,
		HeaderSalesTransactionDate
FROM Customer c
JOIN HeaderSalesTransaction hs
ON hs.CustomerID = c.CustomerID
JOIN Employee e
ON e.EmployeeID = hs.EmployeeID
WHERE DATENAME(WEEKDAY,HeaderSalesTransactionDate) IN('Tuesday')

--3. 
SELECT 
		'AlbumName' = a.AlbumName,
		'Album Price' = 'Rp' + CAST((AlbumPrice) AS VARCHAR),
		'Total Album Purchased' = CAST(SUM(Quantity) AS DECIMAL(15,0))
FROM Album a
JOIN DetailSalesTransaction d
ON d.AlbumID = a.AlbumID
WHERE LEN(AlbumName) > 5
GROUP BY a.AlbumName, a.AlbumPrice

--4. 
SELECT 'Customer Name' = 'Mr.' + CustomerName,
		'Total of Album Type ' = 
FROM Customer

--5. 
SELECT 
		CustomerID = c.CustomerID, 
		CustomerName, 
		CustomerGender, 
		CustomerAddress, 
		CustomerPhone, 
		CustomerEmail
FROM Customer c
JOIN HeaderSalesTransaction hs
ON c.CustomerID = hs.CustomerID
JOIN DetailSalesTransaction d
ON d.HeaderSalesTransactionID = hs.HeaderSalesTransactionID
JOIN Album a
ON a.AlbumID = d.AlbumID
WHERE DATEPART(DAY,HeaderSalesTransactionDate) %2 = 0 AND AlbumName LIKE '%CALM%'

--6. 

--7. 
GO
CREATE VIEW UpdatedCustomerData
AS
SELECT 
		CustomerID = c.CustomerID, 
		CustomerName, 
		CustomerGender, 
		CustomerAddress, 
		CustomerPhone, 
		CustomerEmail = REPLACE(CustomerEmail,'.co.id', '.com')
FROM Customer c
WHERE CustomerEmail LIKE '%yahoo%'

--8. 

--9. 

--10. 
DELETE FROM Album 
WHERE AlbumPrice < 350000 AND
AlbumName LIKE 'Notes on a Conditional Form'
AND AlbumName LIKE 'One More Night'
AND AlbumName LIKE 'Up All Night'