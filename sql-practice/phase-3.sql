-- 1. Add a new customer joined the loyalty program with 
--    the following customer info: (Rachel, 111-111-1111)
INSERT INTO customers (name, phone) VALUES ('Rachel', '111-111-1111');

-- 2. Rachel purchases a coffee. (When adding a coffee order, 
--    you must first check the current points of the customer, 
--    update the customer's points, then add the coffee order.

UPDATE customers
    SET points = points + 1
    WHERE name = 'Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Rachel');

-- 3. Two new customers joined the loyalty program 
--    with the following customer information:

INSERT INTO customers (name, email, phone) 
VALUES
  ('Monica', 'monica@friends.show', '222-222-2222'),
  ('Phoebe', 'phoebe@friends.show', '333-333-3333');

-- 4. Phoebe buys 3 coffees
UPDATE customers SET points = points + 1 WHERE name = 'Phoebe';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Phoebe');

UPDATE customers SET points = points + 1 WHERE name = 'Phoebe';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Phoebe');

UPDATE customers SET points = points + 1 WHERE name = 'Phoebe';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Phoebe');

-- 5. Rachel and Monica each purchase four coffees.


UPDATE customers SET points = points + 1 WHERE name = 'Monica';
UPDATE customers SET points = points + 1 WHERE name = 'Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Rachel');

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
UPDATE customers SET points = points + 1 WHERE name = 'Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Rachel');

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
UPDATE customers SET points = points + 1 WHERE name = 'Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Rachel');

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
UPDATE customers SET points = points + 1 WHERE name = 'Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Rachel');

-- 6. Monica wants to know her new point total

SELECT points FROM customers WHERE name = 'Monica';

-- 7. Rachel wants to check her total points. 
--    Redeem her points for a coffee if she has enough points. 
--    If she doesn't, she wants to purchase a coffee.

SELECT points FROM customers WHERE name='Rachel';

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('true', 'Rachel');

UPDATE customers SET points = points - 10 WHERE name = 'Rachel';

-- 8. 3 new customers

INSERT INTO customers (name, email ) 
VALUES
  ('Joey', 'joey@friends.show'),
  ('Chandler', 'chandler@friends.show'),
  ('Ross', 'ross@friends.show');

-- 9. Ross buys 6 cups of coffee

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

-- 10. Monica buys 3 cups

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');

UPDATE customers SET points = points + 1 WHERE name = 'Monica';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Monica');

-- 11. Phoeve wants to check her points. Redeem if 
--     enough else buy coffee without points

SELECT points FROM customers WHERE name = "Phoebe";

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Phoebe');

UPDATE customers SET points = points + 1 WHERE name = 'Phoebe';

-- 12. Ross demands a refund for the last two coffees that he ordered. 
--     (Make sure you delete Ross's coffee orders and not anyone else's.

SELECT * FROM coffee_orders WHERE customer_name = 'Ross';

-- 14|false|2024-12-05 12:04:27|Ross
-- 15|false|2024-12-05 12:04:27|Ross
-- 16|false|2024-12-05 12:04:27|Ross
-- 17|false|2024-12-05 12:04:27|Ross
-- 18|false|2024-12-05 12:04:27|Ross
-- 19|false|2024-12-05 12:04:27|Ross

DELETE FROM coffee_orders WHERE id = 19 OR id = 18;

UPDATE customers SET points = points - 2 WHERE name = 'Ross';


-- 13. Joey buys two coffees
UPDATE customers SET points = points + 1 WHERE name = 'Joey';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Joey');
UPDATE customers SET points = points + 1 WHERE name = 'Joey';
INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Joey');

-- 14. Monica wants to check her total points. Redeem her points for a coffee if 
-- she has enough points. If she doesn't, she wants to purchase a coffee.

SELECT points FROM customers WHERE name = "Monica";

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('true', 'Monica');

UPDATE customers SET points = points - 10 WHERE name = 'Monica';

-- 15. Chandler wants to delete his loyalty program account.

DELETE FROM customers WHERE name = 'Chandler';

-- 16. Ross wants to check his total points. Redeem his points for a coffee 
--     if he has enough points. If he doesn't, he wants to purchase a coffee.

SELECT points FROM customers WHERE name = "Ross";

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Ross');

UPDATE customers SET points = points + 1 WHERE name = 'Ross';

-- 17. Joey point coffee purchase

SELECT points FROM customers WHERE name = "Joey";

INSERT INTO coffee_orders (is_redeemed, customer_name) VALUES ('false', 'Joey');

UPDATE customers SET points = points + 1 WHERE name = 'Joey';

-- 18. Phoebe wants to change her email to 'p_as_in_phoebe@friends.show';

UPDATE customers SET email = 'p_as_in_phoebe@friends.show' WHERE name = "Phoebe";


SELECT * FROM customers;
SELECT * FROM coffee_orders;