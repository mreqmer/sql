use pubs
go

--1. T�tulo, precio y notas de los libros (titles) que tratan de cocina, ordenados de mayor a menor precio.
SELECT title, price, notes FROM titles WHERE type='trad_cook' ORDER BY price DESC;

--ID, descripci�n y nivel m�ximo y m�nimo de los puestos de trabajo (jobs) que pueden tener un nivel 110.
SELECT job_id, job_desc, max_lvl, min_lvl FROM jobs WHERE min_lvl>=110;

--3. T�tulo, ID y tema de los libros que contengan la palabra "and� en las notas
SELECT title, title_id, type  FROM titles WHERE notes LIKE '%and%';

--4. Nombre y ciudad de las editoriales (publishers) de los Estados Unidos que no est�n en California ni en Texas
SELECT pub_name, city FROM publishers WHERE state NOT IN ('California', 'Texas');

--5. T�tulo, precio, ID de los libros que traten sobre psicolog�a o negocios y cuesten entre diez y 20 d�lares.
SELECT title, price, title_id FROM titles WHERE type IN ('psychology', 'business') AND price BETWEEN 10 AND 20;

--6. Nombre completo (nombre y apellido) y direcci�n completa de todos los autores que no viven en California ni en Oreg�n.
SELECT au_lname, au_fname, address FROM authors WHERE state NOT IN ('California', 'Oregon');

--7. Nombre completo y direcci�n completa de todos los autores cuyo apellido empieza por D, G o S.
SELECT au_fname, au_lname FROM authors WHERE au_lname NOT LIKE 'D%' OR au_lname NOT LIKE 'G%' OR au_lname NOT LIKE 'S%';

--8. ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfab�ticamente
SELECT emp_id, job_lvl, fname, lname FROM employee WHERE job_lvl>100 ORDER BY fname ASC 

--MODIFICACIONES DE DATOS

--1. Inserta un nuevo autor.
INSERT  INTO authors VALUES ('341-22-1111', 'Jimenez', 'Juan', '954789874',
   '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0)

--2. Inserta dos libros, escritos por el autor que has insertado antes y publicados por la editorial "Ramona publishers�.

INSERT INTO titles VALUES ('PS2345', 'El libro de Juanito', 'psychology', '1756', $21.59, $7000.00, 10, 375,
'Un libro muy bonito', '1998-12-1')

--3. Modifica la tabla jobs para que el nivel m�nimo sea 90.


--4.Crea una nueva editorial (publihers) con ID 9908, nombre Mostachon Books y sede en Utrera.
INSERT INTO publishers VALUES (9908, 'Mostachon Books', 'Utrera', null, 'Spain');

--5. Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen W�cher" y traslasde su sede a Stuttgart

UPDATE publishers SET pub_name='Machen W�cher', city='Stuttgart'  WHERE country='Germany';

SELECT * FROM publishers;