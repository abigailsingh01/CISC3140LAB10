--#1
/*
Used the WHERE clause to find the countries that start with "Y".
The % is a wild-card it can match any characters
The WHERE clause is used to filter records.The WHERE clause is used to extract only those records that fulfill a specified condition.
*/
SELECT name FROM world
  WHERE name LIKE 'Y%'

--#2
/*
I found the countries that end with y using WHERE clause and % symbol.
*/
SELECT name FROM world
  WHERE name LIKE '%y'

--#3
/*
I found the countries that contain the letter x by using the WHERE clause and % symbol. 
*/
SELECT name FROM world
  WHERE name LIKE '%x%'

--#4
/*
I found the countries that end with land. I used the WHERE clause and % symbol.
*/
SELECT name FROM world
  WHERE name LIKE '%land'

--#5
/*
I found the countries that start with C and end with ia by using the WHERE clause and % symbol.
*/
SELECT name FROM world
  WHERE name LIKE 'C%ia'

--#6
/*
I found the country that has oo in the name by using both the WHERE clause and % symbol. 
*/
SELECT name FROM world
  WHERE name LIKE '%oo%'

--#7
/*
I found the countries that have three or more a in the name by using the WHERE clause and % symbol. 
*/
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

--#8
/*
I used the underscore as a single character wildcard. I found the countries that have "t" as the second character by using the WHERE clause and % symbol. 
*/
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

--#9
/*
I found the countries that have two "o" characters separated by two others by using the WHERE clause and % symbol. 
*/
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--#10
/*
I found the countries that have exactly four characters by using the WHERE clause
*/
SELECT name FROM world
 WHERE name LIKE '____'

--#11
/*
I showed all the countries where the capital is the same as the name of the country. I found the country where the name is the capital city.
*/
SELECT name
  FROM world
 WHERE name LIKE capital

--#12
/*
I showed all the countries where the capital has the country together with the word "City".I found the country where the capital is the country plus "City".
*/
SELECT name 
  FROM world
 WHERE capital LIKE concat(name, ' City')

--#13
/*
I found the capital and the name where the capital includes the name of the country.
*/
SELECT capital, name 
  FROM world
 WHERE capital LIKE concat ('%' , name, '%')

--#14
/*
I found the capital and the name where the capital is an extension of name of the country. I included Mexico City as it is longer than Mexico. I did not include Luxembourg as the capital because it is the same as the country.
*/
SELECT capital, name 
  FROM world
 WHERE capital LIKE concat(name, '%') AND capital <> name

--#15
/*
I showed the name and the extension where the capital is an extension of the name of the country. I used the SQL function REPLACE.
*/
SELECT name, REPLACE(capital, name, '')
  FROM world
 WHERE capital LIKE concat(name, '%') AND capital <> name
