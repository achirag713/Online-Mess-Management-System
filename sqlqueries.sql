/* View Users with Active Subscriptions */

SELECT u.name, s.subscription_start_date, s.subscription_end_date
FROM Users u
JOIN Subscriptions s ON u.user_id = s.user_id
WHERE s.subscription_end_date >= CURDATE();




/* Attendance Report for a Specific Dates */

SELECT u.name, a.status
FROM Attendance a
JOIN Users u ON a.user_id = u.user_id
WHERE a.date = '2024-09-10' AND a.meal_id = 1;  -- For Breakfast on a specific date





/* Calculate Total Payments */

SELECT SUM(amount) AS total_revenue
FROM Payments;






/* View Menu for a Specific Date */

SELECT m.item_name
FROM Menu m
JOIN Meals me ON m.meal_id = me.meal_id
WHERE m.date = '2024-09-10';






/* Find Users Who Haven't Paid Yets */

SELECT u.name, u.email
FROM Users u
LEFT JOIN Payments p ON u.user_id = p.user_id
WHERE p.user_id IS NULL;



/* Update Menu for a Meal */

UPDATE Menu
SET item_name = 'Aloo Paratha'
WHERE meal_id = 1 AND date = '2024-09-11';
