CREATE DATABASE GROUPBY

USE GROUPBY

CREATE TABLE PROVINCIA (
	id int,
	regi�n varchar(20),
	ciudad varchar(20),
	oficina int,
	constraint pk_Provincia PRIMARY KEY(id)
)


insert into PROVINCIA values (1, 'norte', 'Madrid', 32), (2, 'norte', 'Madrid', 22), (3, 'norte', 'Bilbao', 12),
(4, 'sur', 'Sevilla', 61), (5, 'sur', 'Sevilla', 51), (6, 'sur', 'Huelva', 41),(7, 'sur', 'Huelva', 91), (8, 'sur', 'Huelva', 81)


select regi�n
from PROVINCIA
group by regi�n

select regi�n, ciudad
from PROVINCIA
group by regi�n, ciudad


select regi�n, count(*)
from PROVINCIA
group by regi�n


insert into PROVINCIA values (9, 'sur', 'Huelva', null)

-- cuenta los no nulos
select regi�n, count(oficina)
from PROVINCIA
group by regi�n

-- count distinct
select regi�n, count(distinct regi�n)
from PROVINCIA
group by regi�n

select regi�n, count(distinct ciudad)
from PROVINCIA
group by regi�n

