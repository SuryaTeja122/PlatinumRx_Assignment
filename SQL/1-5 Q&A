1. For every user in the system, get the user_id and last booked room_no 
A 

SELECT user_id, room_no
FROM (
    SELECT user_id, room_no, booking_date,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) AS rn
    FROM bookings
) t
WHERE rn = 1;


2. Get booking_id and total billing amount of every booking created in November, 2021 
A 
SELECT b.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', b.booking_date) = '2021-11'
GROUP BY b.booking_id;


3. Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000 
A
SELECT bc.bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;


4. Determine the most ordered and least ordered item of each month of year 2021 
A 
SELECT *
FROM (
    SELECT 
        strftime('%m', bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty,
        RANK() OVER (
            PARTITION BY strftime('%m', bill_date) 
            ORDER BY SUM(item_quantity) DESC
        ) AS max_rank,
        RANK() OVER (
            PARTITION BY strftime('%m', bill_date) 
            ORDER BY SUM(item_quantity) ASC
        ) AS min_rank
    FROM booking_commercials
    WHERE bill_date >= '2021-01-01'
      AND bill_date < '2022-01-01'
    GROUP BY strftime('%m', bill_date), item_id
) t
WHERE max_rank = 1 OR min_rank = 1;


5. Find the customers with the second highest bill value of each month of year 2021
A 
SELECT *
FROM (
    SELECT 
        strftime('%m', bc.bill_date) AS month,
        b.user_id,
        SUM(bc.item_quantity * i.item_rate) AS total_bill,
        DENSE_RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date)
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    JOIN bookings b ON bc.booking_id = b.booking_id
    WHERE bc.bill_date >= '2021-01-01'
      AND bc.bill_date < '2022-01-01'
    GROUP BY strftime('%m', bc.bill_date), b.user_id
) t
WHERE rnk = 2;
