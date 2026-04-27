# Curso de Bases de Datos con PostgreSQL

<div align="center">
<img width="150" height="150" alt="Postgresql_elephant svg" src="https://gist.github.com/user-attachments/assets/991f037d-250e-45e1-abd1-fbc4ac6be412" />
</div>

## Pasos para levantar el proyecto

1. Tener docker Desktop o el demonio de Docker corriendo
2. Clonar el proyecto
3. Navegar a la carpeta del proyecto
4. crear volumenes

```zsh
  docker volume create pgadmin
  docker volume create postgres
```

5. Ejecutar `docker compose up -d`

6. Revisar el **archivo docker-compose.yml** para los usuarios y contraseñas

## Conceptos Generales y Terminologias SQL

DDL: Data Definition Language Ejemplos: Create, Alter, Drop, Truncate

DML: Data Manipulation Language Ejemplos: Insert, Delete, Update

TCL: Transaction Control Language Ejemplos: Commit, Rollback

DQL: Data Query Language Ejemplos: Select

DBA: Data Base Administrator

## Agregate Funtions

- Count
- Sum
- Max
- Min
- Group By
- Having
- Order By

## Filtering Functions

- Like
- In
- Is Null
- Is Not Null
- Where
- And
- Or
- Between

## Estructura De Un Select

```sql
select * || distinct, campos alias funciones
where condicion, condiciones and or in like
join
group by campo agrupador, All
having condicion
order by expresion asc, desc
limit valor, all
offset punto de inicio
```

## SubQueries

Son querys ejecutadas dentro de una query que se pueden colocar en cualquier parte donde se selecciona una columna

```sql
select * from tablaA where (subquery from tablaB)
```

tenemos que tener cuidado con esto ya que si la subquery hace una consulta grande puede ser limitante para el rendimiento

## Definicio de Constraints

Las constraints no son mas que restricciones para nuestra base de datos para asegurar de tener datos limpios y usables y no llenar nuestra base de datos de pura basura

## Relaciones

- Uno a Uno - One to One Ejemplo un estudiante tiene una informacion de contacto y una informacion de contacto le pertenece a un estudiante
- Uno a Muchos - One to Many Ejemplo un cliente tiene muchas ordenes y una orden pertenece a un cliente
- Relaciones a si mismas - Self Joining Relationships Ejemplo que usuario modifico a cierto usuario en una misma tabla
- Muchos a Muchos - Many to Many Ejemplo un estudiante tiene muchas clases y una clase tiene muchos estudiantes pueden haber tablas intermedias para hacer referencia a las 2 tablas

### Ejemplo

<div align="center">
<img width="1000" height="600" alt="diagrama-con-relaciones" svg" src="./assets/image.png" />
</div>

- Country ↔ City (1:N): Un país puede tener múltiples ciudades registradas, pero cada ciudad está asociada de forma única a un país mediante su countrycode.

- Country ↔ CountryLanguage (1:N): Un país puede poseer diversos idiomas oficiales o hablados, mientras que cada entrada de idioma se vincula específicamente a un código de país.

Las relaciones dependen del requerimiento del proyecto

## Llaves

- Primary Key
- Super Key
- Candidate Key
- Foreign Key
- Composite Key

Hay mas y todas las llaves sirven para identificar registros Entre otras: Alternate Key, Artificial Keys

### Primary Key

- Identifica un registro de forma unica
- Una tabla puede tener varios identificadores unicos
- La llave primaria es basada en los requerimientos

### Candidate Key

- Un atributo o conjunto de ellos que identifican de forma unica
- Menos la llave primaria los demas se consideran llaves candidatas

### Super Key

- Es un conjunto de atributos que puede identificar de forma unica
- Es un superconjunto de una clave candidata

### Foreign Key

- Llaves foraneas son usadas para apuntar a la llave primaria de otra tabla
- si hacemos referencia de la llave primaria en una tabla debe ser del mismo tipo de dato y longitud

### Composite Key

- Cuando una clave primaria consta de mas de un atributo, se conoce como clave compuesta

## Index - Indices

Imaginemos un libro, si el libro no tiene capitulos, para encontrar un tema en especifico tendriamos que leer el libro completo hasta encontrar lo que queremos, en cambio si el libro tiene capitulos marcados sera facil llegar a lo que queremos

Si asignamos un indice a una columna en nuestra base de datos por ejemplo en email, la base de datos crea una estructura separada (usualmente en B-Tree o Arbol Balanceado) esta estructura guarda los valores de los emails ordenados y un "puntero" (la direccion fisica) hacia donde esta el resto de la fila en el disco duro

proceso para recordar: internamente al crear un indice la base de datos guarda la posicion ordenada de cada dato de la columna indexada para acceder facilmente a ella
