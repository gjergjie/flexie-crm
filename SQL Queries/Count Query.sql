/* 
Count items, in this case the number of leads from China
*/
SELECT 
  COUNT(country) AS 'China Lead Count' 
FROM 
  leads 
WHERE 
  country = 'China'