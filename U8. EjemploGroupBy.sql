CREATE DATABASE GROUPBY

USE GROUPBY

CREATE TABLE PROVINCIA (
	id int,
	región varchar(20),
	ciudad varchar(20),
	oficina int,
	constraint pk_Provincia PRIMARY KEY(id)
)


insert into PROVINCIA values (1, 'norte', 'Madrid', 32), (2, 'norte', 'Madrid', 22), (3, 'norte', 'Bilbao', 12),
(4, 'sur', 'Sevilla', 61), (5, 'sur', 'Sevilla', 51), (6, 'sur', 'Huelva', 41),(7, 'sur', 'Huelva', 91), (8, 'sur', 'Huelva', 81)


select región
from PROVINCIA
group by región

select región, ciudad
from PROVINCIA
group by región, ciudad


select región, count(*)
from PROVINCIA
group by región


insert into PROVINCIA values (9, 'sur', 'Huelva', null)

-- cuenta los no nulos
select región, count(oficina)
from PROVINCIA
group by región

-- count distinct
select región, count(distinct región)
from PROVINCIA
group by región

select región, count(distinct ciudad)
from PROVINCIA
group by región

