/* 
This example shows a sub query (a SELECT within a SELECT)
  - This is a silly example to show symtax
  - Multiple levels of nesting can be used
*/
SELECT 
  first_name, 
  last_name, 
  
  /* Get a count of China leads */
  (
    SELECT 
      COUNT(*) 
    FROM 
      leads 
    WHERE 
      leads.country = 'China'
  ) AS 'China Count', 
  country 
FROM 
  leads 
WHERE 
  country = 'China'