/* 1) Fetch all transaction data.
*/
SELECT * FROM banking.transactions;





/* 2) Fetch account_number and acc type from all accounts.
*/
SELECT ACCOUNT_NUMBER , ACC_TYPE FROM banking.accounts;






/* 3) Fetch customer id and name of all active customers.
*/
SELECT CUSTOMER_ID , CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME 
FROM banking.customers 
WHERE IS_ACTIVE = "true";






/*4) Fetch customer id and name of all active customers who were born after 2000.
*/
SELECT CUSTOMER_ID ,CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME ,DOB , IS_ACTIVE
FROM banking.customers 
WHERE IS_ACTIVE = "true"  AND YEAR(DOB) > 2000 ; 




/*5) Find employees whose salary ranges from 50k to 70k
*/
SELECT EMP_ID , CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME , SALARY 
FROM banking.employees 
WHERE SALARY BETWEEN 50000 AND 70000;




/*6) Find customers who have not provided basic information such as address or phone number.
*/
SELECT CUSTOMER_ID , CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME 
FROM banking.customers 
WHERE ADDRESS IS NULL OR PHONE_NO IS NULL; 





/*7) Find customers having "oo" in their name.
*/
SELECT CUSTOMER_ID , CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME 
FROM banking.customers
WHERE CONCAT(FIRST_NAME , " ", LAST_NAME)  LIKE "%oo%";




/*8) Identify the total no of wire transfer transactions.
*/
SELECT COUNT(1) 
FROM banking.transactions
WHERE TRNS_TYPE = "wire transfer";






/*9) Identify the unique transaction type.
*/
SELECT DISTINCT(TRNS_TYPE)
FROM banking.transactions;





/*10) Fetch the first 5 transactions
*/
SELECT TRNS_ID , TRNS_TYPE , TRNS_DATE
FROM banking.transactions
ORDER BY TRNS_DATE ASC
LIMIT 5;





/*11) Fetch the inactive customers name, phone no, address and dob. Display the the oldest customer first.
*/
SELECT  CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME , PHONE_NO, ADDRESS, DOB 
FROM banking.customers
WHERE IS_ACTIVE = "false"
ORDER BY CUSTOMER_ID DESC ;




/*12) Find the customers who are from either "77 Lien Park", "337 Westend Park" or "9 Troy Plaza".
*/
SELECT CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME 
FROM banking.customers
WHERE ADDRESS IN("77 Lien Park" ,"337 Westend Park" ,"9 Troy Plaza");




/*13) Fetch all customers who have "Park" or "Plaza" in their address.
*/
SELECT CONCAT(FIRST_NAME , " ", LAST_NAME) AS FULL_NAME 
FROM banking.customers
WHERE ADDRESS  LIKE "% Park%" OR ADDRESS  LIKE "% Plaza%";
