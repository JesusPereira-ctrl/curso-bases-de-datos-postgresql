

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

(select count(*) as Total, b.name as Continent from country a inner join continent b on a.continent = b.code where b.name not like '%America%' group by b.name)
union
(select count(*) as Total, 'America' from country a inner join continent b on a.continent = b.code where b.name like '%America%')
order by Total asc;
