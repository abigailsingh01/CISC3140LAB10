--#1
/*
I changed the query shown so that it displays Nobel prizes for 1950.
*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--#2
/*
I showed who won the 1962 prize for Literature.
*/
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--#3
/*
I showed the year and subject that won 'Albert Einstein' his prize.
*/
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein'

--#4
/*
I gave the name of the 'Peace' winners since the year 2000, including 2000.
*/
SELECT winner FROM nobel
 WHERE yr >= 2000
AND subject = 'Peace'

--#5
/*
I showed all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
*/
SELECT * FROM nobel 
 WHERE yr >= 1980 
 AND yr <= 1989
 AND subject = 'Literature'

--#6
/*
I showed all details of the presidential winners:
Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
*/
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')	

--#7
/*
I showed the winners with first name John
*/
SELECT winner FROM nobel
 WHERE winner LIKE 'JOHN%'

--#8
/*
I showed the Physics winners for 1980 together with the Chemistry winners for 1984.
*/
SELECT * FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980)
 OR (subject = 'Chemistry' AND yr = 1984)

--#9
/*
I showed the winners for 1980 excluding the Chemistry and Medicine
*/
SELECT * FROM nobel 
 WHERE yr = 1980 
 AND subject NOT IN ('CHEMISTRY',
                     'MEDICINE')

--#10
/*
I showed who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
*/
SELECT * FROM nobel 
 WHERE (subject = 'Medicine' AND yr < 1910)
 OR (subject = 'Literature' AND yr >= 2004)

# 11
/*
I found all details of the prize won by PETER GRÜNBERG
*/
SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG'

--#12
/*
I found all details of the prize won by EUGENE O'NEILL
*/
SELECT * FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

--#13
/*
I list the winners, year and subject where the winner starts with Sir. I showed the most recent first, then by name order.
*/
SELECT winner, yr, subject FROM nobel 
 WHERE winner LIKE 'Sir%'
 ORDER BY yr DESC, winner 

--#14
/*
I showed the 1984 winners and subject ordered by subject and winner name; and listed Chemistry and Physics last.
*/
SELECT winner, subject 
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics','Chemistry'), subject,winner
