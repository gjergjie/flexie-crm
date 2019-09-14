/*
  CONCAT example - allows you to combine strings
*/
SELECT 
  first_name, 
  last_name, 
  email, 
  CONCAT(first_name, " ", last_name) AS "Owner full name" 
FROM 
  leads