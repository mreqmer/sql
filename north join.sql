use Northwind
go

--Nombre de los proveedores y n�mero de productos que nos vende cada uno.

SELECT S.CompanyName AS Sup_Name, COUNT(*) AS Quantity FROM Suppliers AS S JOIN Products AS P ON  S.SupplierID = P.SupplierID GROUP BY s.CompanyName

--Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.

SELECT FirstName, LastName, HomePhone FROM Employees AS E JOIN EmployeeTerritories AS ET ON E.EmployeeID = ET.EmployeeID JOIN  Territories AS T ON ET.TerritoryID = T.TerritoryID WHERE TerritoryDescription IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')

--N�mero de productos de cada categor�a y nombre de la categor�a.

SELECT C.CategoryName, COUNT(*) AS QUANTITY FROM Categories AS C JOIN Products AS P ON C.CategoryID = P.CategoryID GROUP BY CategoryName

--Nombre de la compa��a de todos los clientes que hayan comprado queso de cabrales o tofu.

SELECT C.CompanyName FROM Customers AS C JOIN Orders AS O ON C.CustomerID = O.CustomerID JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID WHERE ProductID = 11 OR ProductID = 14 GROUP BY CompanyName

--Empleados (ID, nombre, apellidos y tel�fono) que han vendido algo a Bon app' o Frankenversand (nombre de la compa��a).

SELECT E.EmployeeID, FirstName, LastName, HomePhone FROM Employees AS E JOIN Orders AS O ON E.EmployeeID = O.EmployeeID WHERE CustomerID IN ('BONAP') OR CustomerID IN ('FRANK') group by E.EmployeeID, FirstName, LastName, HomePhone

--Empleados (ID, nombre, apellidos, mes y d�a de su cumplea�os) que no han vendido nunca nada a ning�n cliente de Portugal. 

SELECT E.EmployeeID, FirstName, LastName, BirthDate FROM Employees AS E JOIN Orders AS O ON  E.EmployeeID = O.EmployeeID WHERE O.ShipCountry = 'Portugal' GROUP BY E.EmployeeID, FirstName, LastName, BirthDate ORDER BY EmployeeID

--Total de ventas en US$ de productos de cada categor�a (nombre de la categor�a).

SELECT ProductName, SUM(OD.UnitPrice*OD.Quantity) AS Total FROM Products AS P JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID GROUP BY ProductName

--Total de ventas en US$ de cada empleado cada a�o (nombre, apellidos, direcci�n).

SELECT FirstName, LastName, Address, SUM(OD.UnitPrice*OD.Quantity) AS Total FROM Employees AS E JOIN Orders AS O ON E.EmployeeID = O.EmployeeID JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID GROUP BY FirstName, LastName, Address

--Ventas de cada producto en el a�o 97. Nombre del producto y unidades.

SELECT ProductName, COUNT(*) AS unidades FROM Products AS P JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID JOIN Orders AS O ON OD.OrderID = O.OrderID WHERE YEAR(O.OrderDate) = 1997 GROUP BY ProductName

--Empleados (nombre y apellidos) que trabajan a las �rdenes de Andrew Fuller.

SELECT FirstName, LastName FROM Employees WHERE ReportsTo=2

--N�mero de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.

SELECT E1.EmployeeID, E1.FirstName, E1.LastName, COUNT(E2.EmployeeID) AS NumSubordinates FROM Employees AS E1 LEFT JOIN Employees AS E2 ON E1.EmployeeID = E2.ReportsTo GROUP BY  E1.EmployeeID, E1.FirstName, E1.LastName

