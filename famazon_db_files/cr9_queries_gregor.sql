
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


/*############
### 3. Report:
###    What products were sent between 01.01.2021 and 31.03.2021?
###    -> 10 different products were shipped */

SELECT CONCAT(prod_name, ": ", amount, " items")
AS "These products were sent between 01.01.21 and 31.03.21:", ship_date
AS "shipped:"
FROM product
    INNER JOIN website
    ON product_id = fk_product_id
    INNER JOIN purchase
    ON cart_id = fk_cart_id
    INNER JOIN shipping
    ON order_id = fk_order_id
WHERE ship_date > "2020-12-31"
    AND ship_date < "2021-04-01"
ORDER BY ship_date;


/*############
### 4. Report:
###    How many products where sent to Yangba in China?
###    -> 3 orders with 3 different products */

SELECT CONCAT(COUNT(prod_name), " different products sent to ", city, ", ", country, ".")
AS "There were .."
FROM product
    INNER JOIN website
    ON product_id = fk_product_id
    INNER JOIN purchase
    ON cart_id = fk_cart_id
    INNER JOIN shipping
    ON order_id = fk_order_id
    INNER JOIN carrier
    ON carrier_id = fk_carrier_id
    INNER JOIN zip
    ON zip_code = fk_zip_code
WHERE city = "Yangba";