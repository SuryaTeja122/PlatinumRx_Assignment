1. Find the revenue we got from each sales channel in a given year 
A
SELECT sales_channel,
       SUM(amount) AS revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;

2. Find top 10 the most valuable customers for a given year 
A
SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

3. Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year 
A
SELECT 
    r.month,
    r.revenue,
    IFNULL(e.expense, 0) AS expense,
    (r.revenue - IFNULL(e.expense, 0)) AS profit,
    CASE 
        WHEN (r.revenue - IFNULL(e.expense, 0)) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS revenue
    FROM clinic_sales
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY strftime('%m', datetime)
) r
LEFT JOIN (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS expense
    FROM expenses
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY strftime('%m', datetime)
) e
ON r.month = e.month;

4. For each city find the most profitable clinic for a given month 
A
SELECT *
FROM (
    SELECT 
        c.city,
        cs.cid,
        SUM(cs.amount) - IFNULL(SUM(e.amount), 0) AS profit,
        RANK() OVER (
            PARTITION BY c.city
            ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount), 0)) DESC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e 
        ON cs.cid = e.cid 
        AND strftime('%m', cs.datetime) = strftime('%m', e.datetime)
    WHERE strftime('%m', cs.datetime) = '09'
      AND strftime('%Y', cs.datetime) = '2021'
    GROUP BY c.city, cs.cid
) t
WHERE rnk = 1;

5. For each state find the second least profitable clinic for a given month
A
SELECT *
FROM (
    SELECT 
        c.state,
        cs.cid,
        SUM(cs.amount) - IFNULL(SUM(e.amount), 0) AS profit,
        DENSE_RANK() OVER (
            PARTITION BY c.state
            ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount), 0)) ASC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e 
        ON cs.cid = e.cid 
        AND strftime('%m', cs.datetime) = strftime('%m', e.datetime)
    WHERE strftime('%m', cs.datetime) = '09'
      AND strftime('%Y', cs.datetime) = '2021'
    GROUP BY c.state, cs.cid
) t
WHERE rnk = 2;
