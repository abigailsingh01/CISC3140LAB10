--#1
/*
I used the select SQL command to show the name, continent and population of all countries.
*/
SELECT name, continent, population FROM world

--#2
/*
I used the WHERE clause to filter records. I show the name for the countries that have a population of at least 200 million. 
*/
SELECT name FROM world
WHERE population >= 200000000

--#3
/*
I selected the name and the per capita GDP for those countries with a population of at least 200 million. GDP= GDP/population
*/
SELECT name, gdp/population FROM world
WHERE population >= 200000000

--#4
/*
I showed the name and population in millions for the countries of the continent 'South America'. I divide the population by 1000000 to get the population in millions.
*/
SELECT name, population/1000000  FROM world 
WHERE continent = 'South America'

--#5
/*
I showed the name and population for France, Germany, Italy
*/
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

--#6
/*
I showed the countries which have a name that includes the word 'United' by using the WHERE clause
*/
SELECT name FROM world
WHERE name LIKE '%United%'

--#7
/*
I showed the countries that are big by area or big by population. Show name, population and area.
*/
SELECT name, population, area FROM world 
WHERE population > 250000000 OR area > 3000000

--#8
/*
I showed the countries that are big by area or big by population but not both. I showed the  name, population and area.
Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
The United Kingdom has a small population and a small area, it should be excluded.
*/
SELECT name, population, area FROM world 
WHERE (population > 250000000 AND area < 3000000)
   OR (population < 250000000 AND area > 3000000)

--#9
/*
I showed the name and population in millions and the GDP in billions for the countries of the continent 'South America'. I used the ROUND function to show the values to two decimal places.
For South America, I showed the  population in millions and GDP in billions both to 2 decimal places.
*/
SELECT name , ROUND(population/1000000,2 ), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America'

--#10
/*
I showed the name and per-capita GDP for those countries with a GDP of at least one trillion. I rounded this value to the nearest 1000.
I showed per-capita GDP for the trillion dollar countries to the nearest $1000.
*/
SELECT name, ROUND(gdp/population, -3) FROM world
WHERE gdp >= 1000000000000

--#11
/*
I showed the name and capital where the name and the capital have the same number of characters.
I used the LENGTH function to find the number of characters in a string
*/
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

--#12
/*
I showed the name and the capital where the first letters of each match. I didn't include countries where the name and the capital are the same word.
I used the function LEFT to isolate the first character.
I used <> as the NOT EQUALS operator.
*/
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital

--#13
/*
I found the country that has all the vowels and no spaces in its name.
I used the phrase name NOT LIKE '%a%' to exclude characters from my results.
The query shows missed countries like Bahamas and Belarus because they contain at least one 'a'
*/
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'
