SELECT user_id, room_no
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY booking_date DESC
           ) AS rn
    FROM bookings
) t
WHERE rn = 1
ORDER BY user_id ASC;

//
SELECT 
    bc.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_billing_amount
FROM booking_commercials bc
JOIN items i
    ON bc.item_id = i.item_id
WHERE strftime('%Y', bc.bill_date) = '2021'
AND strftime('%m', bc.bill_date) = '11'
GROUP BY bc.booking_id;

//
SELECT
  bc.bill_id,
  SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM
  booking_commercials bc
  JOIN items i ON bc.item_id = i.item_id
WHERE
  strftime('%Y', bc.bill_date) = '2021'
  AND strftime('%m', bc.bill_date) = '10'
GROUP BY
  bc.bill_id
HAVING
  SUM(bc.item_quantity * i.item_rate) > 1000;

//
SELECT
    strftime('%m', bc.bill_date) AS month_no,
    i.item_name,
    SUM(bc.item_quantity) AS total_quantity
FROM booking_commercials bc
JOIN items i
    ON bc.item_id = i.item_id
WHERE strftime('%Y', bc.bill_date) = '2021'
GROUP BY month_no, i.item_name
HAVING total_quantity = (
        SELECT MAX(total_qty)
        FROM (
            SELECT SUM(item_quantity) AS total_qty
            FROM booking_commercials
            WHERE strftime('%m', bill_date) = month_no
            GROUP BY item_id
        )
    )
    OR total_quantity = (
        SELECT MIN(total_qty)
        FROM (
            SELECT SUM(item_quantity) AS total_qty
            FROM booking_commercials
            WHERE strftime('%m', bill_date) = month_no
            GROUP BY item_id
        )
    );
