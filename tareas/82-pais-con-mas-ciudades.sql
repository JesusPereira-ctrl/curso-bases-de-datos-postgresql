-- Quiero que me muestren el pais con mas ciudades
-- Campos: total de ciudades y el nombre del pais
-- usar INNER JOIN

select count(*) as total, b.name as country from city a
inner join country b on a.countrycode = b.code
group by b.name
order by count(*) desc
limit 1;