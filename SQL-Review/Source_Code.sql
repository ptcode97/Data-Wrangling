-- count the number of sales of each items.

SELECT COUNT(*), category
FROM dsv1069.items
GROUP BY category


-- email address for non deleted users

SELECT email_address
FROM dsv1069.users
WHERE id IN (SELECT id
            FROM dsv1069.users
            WHERE deleted_at IS NOT NULL)
            

-- INNER JOIN users to items table

SELECT * 
FROM dsv1069.users INNER JOIN dsv1069.orders 
ON dsv1069.users.id = dsv1069.orders.user_id

-- count number of viewed items

SELECT
COUNT(DISTINCT event_id) AS events
FROM dsv1069.events
WHERE event_name = 'view_item'

-- finding number of items which have been ordered

SELECT Count(DISTINCT(item_id)) AS item_count
FROM dsv1069.orders INNER JOIN dsv1069.items 
ON dsv1069.orders.item_id = dsv1069.items.id 


-- finding 1st purchase date of user

SELECT dsv1069.users.id, MIN(dsv1069.orders.paid_at)
FROM dsv1069.users LEFT JOIN dsv1069.orders 
ON dsv1069.users.id = dsv1069.orders.user_id
GROUP BY dsv1069.users.id
