/* 
Order the report records by the last name
  - ORDER BY requires a LIMIT qualifier in Flexie, you make it as large as you want
     - DESC sets the sort direction to descending, you can also use ASC to make the list ascending
 */
SELECT 
  first_name, 
  last_name, 
  email, 
  phone 
FROM 
  leads 
ORDER BY 
  last_name DESC 
LIMIT 
  1000000