use Northwind
go



--1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país.

SELECT Country, COUNT (*) AS Customers  FROM CUSTOMERS GROUP BY Country;

--2. ID de producto y número de unidades vendidas de cada producto (El número de unidades las obtenemos del campo Quantity de Order Detail.

SELECT ProductID, COUNT(*) AS Sales FROM [Order Details] GROUP BY ProductID 

--3. ID del cliente y número de pedidos que nos ha hecho.

SELECT CustomerID, COUNT(*) AS OrderQuantity FROM Orders GROUP BY CustomerID 

--4. ID del cliente, año y número de pedidos que nos ha hecho cada año.

SELECT  year(OrderDate) AS Year, CustomerID, COUNT(*) AS NumberOfOrders FROM Orders GROUP BY year(OrderDate), CustomerID ORDER BY year(OrderDate), CustomerID

--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.

SELECT ProductID, max(unitPrice) AS UnitPrice, sum((unitprice * Quantity) - (1 - Discount)) AS TotalFactured FROM [Order Details] GROUP BY ProductID Order by TotalFactured DESC

--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.

SELECT SupplierID, SUM(UnitsInStock * UnitPrice) AS StockAcumulado FROM Products GROUP BY SupplierID

--7. Número de pedidos registrados mes a mes de cada año.

SELECT month(OrderDate) AS month, year(OrderDate) AS year, COUNT(*) AS TotalByMonth FROM Orders GROUP BY month(OrderDate), year(OrderDate) ORDER BY year(OrderDate), month(OrderDate)

--8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en días para cada año.

SELECT YEAR(OrderDate) AS year, AVG(DATEDIFF (day,OrderDate, ShippedDate)) AS Media FROM Orders GROUP BY year(OrderDate) ORDER BY YEAR(OrderDate)

--9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.

SELECT ShipVia, COUNT(*) AS Pedidods FROM Orders GROUP BY ShipVia

--10. ID de cada proveedor y número de productos distintos que nos suministra.

SELECT SupplierID, COUNT(*) AS cantidad FROM Products GROUP BY SupplierID