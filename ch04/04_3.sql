SELECT cust_id,
       cust_name,
       cust_main_phone_number,
       REPLACE(cust_main_phone_number, '-', '/') AS new_phone_number
FROM customers;