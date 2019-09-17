/* 
Report on data based on an interval of time
  - In this case notes to leads added in the last 180 days
    - To see a result on this report you will need to add a note to a lead 
 */
SELECT 
  first_name, 
  last_name, 
  email, 
  leads.last_note_date AS 'Date Note Added' 
FROM 
  leads 
WHERE 
  leads.last_note_date BETWEEN DATE_SUB(NOW(), INTERVAL 90 DAY) 
  and NOW()