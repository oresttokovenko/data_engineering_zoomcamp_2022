SELECT COUNT(*)
FROM b_cust_table
WHERE ACTIVE = 'N';
# 574

SELECT COUNT(*)
FROM b_cust_table
WHERE ACTIVE = 'Y';
# 10691

SELECT FIRST_NAME, LAST_NAME, b_cust_sharing.ACTIVE
FROM b_cust_sharing
JOIN b_cust_table bct on b_cust_sharing.C_ID = bct.CUST_ID
WHERE b_cust_sharing.ACTIVE = 'N';

SELECT DISTINCT M_STATUS
FROM b_cust_table;

SELECT *
FROM b_cust_table
WHERE EMPLOYER IS NULL;