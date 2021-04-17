
/*############
### 1. Report:
###    How many items were sold by the company "Chatterbridge" so far?
###    -> up to now 3 orders -> sum of all items = 11 */

SELECT CONCAT(comp_name ,": ", SUM(amount), " items")
AS "Amount sold by .."
FROM company
    INNER JOIN product
    ON comp_id = fk_comp_id
    INNER JOIN website
    ON product_id = fk_product_id
WHERE comp_name = "Chatterbridge";

/*############
### 2. Report:
###    Who purchased products on 19.04.2020?
###    -> 2 people bought on this day */

SELECT CONCAT(last_name, ", ", first_name)
AS "Customers who bought on 19.04.2020 .."
FROM customer
    INNER JOIN login
    ON user_id = fk_user_id
    INNER JOIN website
    ON login_id = fk_login_id
    INNER JOIN purchase
    ON cart_id = fk_cart_id
WHERE order_date = "2020-04-19";