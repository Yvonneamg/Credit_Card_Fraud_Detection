**-- Early morning transactions (12 AM to 6 AM, time in seconds)**

SELECT time, Amount,Class FROM transactions WHERE CAST(strftime('%H',time,'unixepoch') as INT) BETWEEN 0 AND 6 ORDER BY time DESC;



**-- Frequent transactions (more than 5 transactions in 1 hour)**

SELECT time, Amount,class, COUNT(\*) AS transaction\_count FROM transactions GROUP by (time/3600) HAVING COUNT(\*) > 5 ORDER by transaction\_count DESC;



**-- High transaction customers Top 1% customers by Amount**

WITH Amount\_percentiles as (SELECT Amount FROM transactions ORDER by Amount DESC LIMIT(SELECT CAST(count(\*) \* 0.01 as INT) FROM transactions))

SELECT time, Amount,Class FROM transactions WHERE amount> (SELECT min(amount) FROM Amount\_percentiles) ORDER by Amount DESC;

