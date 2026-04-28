

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


select count(*), b.languagecode, b.language from country a 
inner join countryLanguage b on a.code = b.countrycode
where a.continent = 5 and b.isofficial = true
group by b.languagecode, b.language
order by count(*) desc
limit 1;





-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
select * from country a
inner join countryLanguage b on a.code = b.countrycode
where a.continent = 5 and b.isofficial = true and b.languageCode = 135;


select languageCode from (
	select count(*), b.languagecode, b.language from country a 
	inner join countryLanguage b on a.code = b.countrycode
	where a.continent = 5 and b.isofficial = true
	group by b.languagecode, b.language
	order by count(*) desc
	limit 1
) as subquery;