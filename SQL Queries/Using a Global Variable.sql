/* 
  You can use a built in or your own user global variables
   - see "SQL for Flexie Introduction" for list of built in globals
   - user_id is a built in global
   - This usees a user global of COUNTRY_NAME, which I set to China (no quotes)
      - you can then change the global variable and the query will change without editing
*/
SELECT 
  first_name, 
  last_name, 
  {{user_id}}, 
  email, 
  country 
FROM 
  leads 
WHERE 
  country = '{{COUNTRY_NAME}}'