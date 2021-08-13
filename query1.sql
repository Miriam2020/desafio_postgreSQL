-- Query 1:
-- -------
-- Create a PostgreSQL query that calculates,  for each of last week’s:
-- 		* top 100 purchasers,
-- 		* the average buy quantity in $
-- 		* and count of searches each one of them made. 

WITH days AS (
		SELECT
			"EVENT_DATE",
			(SELECT EXTRACT(DAY FROM "EVENT_DATE") AS "day")
		FROM
			app_db.events_logs),
	weeks AS (
		SELECT "EVENT_DATE", "day",
			CASE 
				WHEN day <= (SELECT EXTRACT(DAY FROM CURRENT_DATE)) AND day > (SELECT EXTRACT(DAY FROM CURRENT_DATE))- 7 THEN 1
				WHEN day <= (SELECT EXTRACT(DAY FROM CURRENT_DATE))-7 AND day > (SELECT EXTRACT(DAY FROM CURRENT_DATE))- 14 THEN 2
				WHEN day <= (SELECT EXTRACT(DAY FROM CURRENT_DATE))-14 AND day > (SELECT EXTRACT(DAY FROM CURRENT_DATE))- 21 THEN 3
				WHEN day <= (SELECT EXTRACT(DAY FROM CURRENT_DATE))-21 AND day > (SELECT EXTRACT(DAY FROM CURRENT_DATE))- 31 THEN 4
				ELSE 5
			END AS "week"
		FROM days)

SELECT "USER_ID", 
		COUNT("EVENT_ID") AS "QTY_PO", 
		(SELECT AVG("EVENT_VALUE") FROM app_db.events_logs WHERE "EVENT_VALUE" IS NOT NULL) AS "AVG_VALUE",
		(SELECT COUNT("EVENT_ID") FROM app_db.events_logs WHERE "EVENT_ID" = 2) AS "SEARCHES",
		RANK() OVER (PARTITION BY "week" ORDER BY "week")
FROM app_db.events_logs
	 INNER JOIN weeks ON "EVENT_VALUE" = "EVENT_VALUE"
GROUP BY "week", "USER_ID"
LIMIT 100;
	