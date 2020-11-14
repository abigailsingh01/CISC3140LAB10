
--#1
/*
I listed each country's name where the population is larger than that of 'Russia'.
*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--#2
/*
I showed the countries in Europe with a per capita GDP greater than 'United Kingdom.
*/
SELECT name FROM world
  WHERE continent = 'Europe'
  AND gdp/population > (SELECT gdp/population FROM world
      WHERE name='United Kingdom')

--#3
/*
I listed the name and continent of countries in the continents containing either Argentina or Australia. And ordered by name of the country.
*/
SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world 
                        WHERE name IN ('Argentina',
                                          'Australia'))
  ORDER BY name

--#4
/*
I showed the name and the population of the country that has population that is more than Canada but less than Poland
*/
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE 
                      name='Canada')
    AND population < (SELECT population FROM world WHERE 
                      name='POLAND')

--#5
/*
I showed the name and the population of each country in Europe. And showed the population as a percentage of the population of Germany.
*/
SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany'), 0), '%')
  FROM world
  WHERE continent = 'Europe'

--#6
/*
I showed which countries have a GDP greater than every country in Europe. I gave the name only. Some countries may have NULL gdp values. 
*/
SELECT name FROM world 
  WHERE gdp > ALL(SELECT gdp FROM world 
                     WHERE continent = 'Europe' AND gdp>0)

--#7
/*
I found the largest country (by area) in each continent and showed the continent, the name and the area:
*/
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area > 0)

--#8
/*
I listed each continent and the name of the country that comes first alphabetically.
*/
SELECT continent, name
  FROM world x
  WHERE name <= ALL(SELECT name FROM world y 
  	                WHERE y.continent = x.continent)


--#9
/*
I found the continents where all countries have a population <= 25000000. And found the names of the countries associated with these continents. I showed the name, continent and population.
*/
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y 
                      WHERE y.continent = x.continent
                      AND population > 0)  


--#10
/*
I gave the countries and continents that have populations more than three times that of any of their neighbours (in the same continent)
*/
SELECT name, continent 
  FROM world x
  WHERE population > ALL(SELECT population*3 FROM world y
                        WHERE y.continent = x.continent
                        AND population > 0
                        AND y.name != x.name)
