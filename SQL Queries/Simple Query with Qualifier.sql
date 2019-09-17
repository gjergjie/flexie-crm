/* 
Add a qualifier on the query
   - WHERE limits the report based on the limits identified
 */
SELECT 
  first_name, 
  last_name, 
  email, 
  country 
FROM 
  leads 
WHERE 
  country = 'China'