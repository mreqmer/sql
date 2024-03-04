use Northwind
go



--1. Nombre del pa�s y n�mero de clientes de cada pa�s, ordenados alfab�ticamente por el nombre del pa�s.

SELECT Country, COUNT (*) AS Customers  FROM CUSTOMERS GROUP BY Country;

--2. ID de producto y n�mero de unidades vendidas de cada producto (El n�mero de unidades las obtenemos del campo Quantity de Order Detail.

SELECT ProductID, COUNT(*) AS Sales FROM [Order Details] GROUP BY ProductID 

--3. ID del cliente y n�mero de pedidos que nos ha hecho.

SELECT CustomerID, COUNT(*) AS OrderQuantity FROM Orders GROUP BY CustomerID 

--4. ID del cliente, a�o y n�mero de pedidos que nos ha hecho cada a�o.

SELECT  year(OrderDate) AS Year, CustomerID, COUNT(*) AS NumberOfOrders FROM Orders GROUP BY year(OrderDate), CustomerID ORDER BY year(OrderDate), CustomerID

--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.

SELECT ProductID, max(unitPrice) AS UnitPrice, sum((unitprice * Quantity) - (1 - Discount)) AS TotalFactured FROM [Order Details] GROUP BY ProductID Order by TotalFactured DESC

--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.

SELECT SupplierID, SUM(UnitsInStock * UnitPrice) AS StockAcumulado FROM Products GROUP BY SupplierID

--7. N�mero de pedidos registrados mes a mes de cada a�o.

SELECT month(OrderDate) AS month, year(OrderDate) AS year, COUNT(*) AS TotalByMonth FROM Orders GROUP BY month(OrderDate), year(OrderDate) ORDER BY year(OrderDate), month(OrderDate)

--8. A�o y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en d�as para cada a�o.

SELECT YEAR(OrderDate) AS year, AVG(DATEDIFF (day,OrderDate, ShippedDate)) AS Media FROM Orders GROUP BY year(OrderDate) ORDER BY YEAR(OrderDate)

--9. ID del distribuidor y n�mero de pedidos enviados a trav�s de ese distribuidor.

SELECT ShipVia, COUNT(*) AS Pedidods FROM Orders GROUP BY ShipVia

--10. ID de cada proveedor y n�mero de productos distintos que nos suministra.

SELECT SupplierID, COUNT(*) AS cantidad FROM Products GROUP BY SupplierID