/* This type can be a single line */

/* 
Or it can cross mutiple lines,
like this example
 */
SELECT 
  first_name, 
  -- This type of comment is a single line
  last_name, 
  email, 
  country 
FROM 
  leads -- It can be inline as well
WHERE 
  country = 'China'