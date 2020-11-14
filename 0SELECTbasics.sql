--#1
/*
Used the WHERE clause to modify it to show the population of Germany. The WHERE clause is used to filter records.The WHERE clause is used to extract only those records that fulfill a specified condition.
*/
SELECT population FROM world
  WHERE name = 'Germany'

--#2
/*
Used the WHERE clause to show the name and the population for 'Sweden', 'Norway' and 'Denmark'. The WHERE clause is used to filter records.The WHERE clause is used to extract only those records that fulfill a specified condition.
*/
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--#3
/*
Used the WHERE clause to modify it to show the country and the area for countries with an area between 200,000 and 250,000. The WHERE clause is used to filter records.The WHERE clause is used to extract only those records that fulfill a specified condition.
*/
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
