/* 
Use AS to change the column name in the report
*/
SELECT 
  first_name AS 'First Name', 
  last_name, 
  email, 
  country AS Country 
FROM 
  leads 
WHERE 
  country = 'China'