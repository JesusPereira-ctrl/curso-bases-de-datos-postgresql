

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

insert into language (name)
select distinct language from countryLanguage order by language asc;

select * from language;


-- Empezar con el select para confirmar lo que vamos a actualizar
select language, (select code from language b where a.language = b.name) from countryLanguage a;

-- Actualizar todos los registros
update countryLanguage a set languageCode = (select code from language b where a.language = b.name)

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countryLanguage
alter column languageCode type int4
using languageCode::integer;

-- Crear el forening key y constraints de no nulo el language_code
alter table countryLanguage add constraint fk_countryLanguage_language foreign key (languageCode) references language(code);

alter table countryLanguage alter column languageCode set not null;

-- Revisar lo creado
select * from countryLanguage;