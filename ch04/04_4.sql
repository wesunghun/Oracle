SELECT cust_main_phone_number,
TRANSLATE(cust_main_phone_number,
          '0123456789',
          'abcdefghij') AS encrypted_phone
FROM customers
WHERE ROWNUM <= 10;