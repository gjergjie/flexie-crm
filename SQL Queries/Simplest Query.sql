/* 
Simplest query form
   - SELECT identifies the data you want
      - the field names are the record alias names
      - see the custom fields from the entity to see the aliases
   - FROM iddentifies what table (entity) has the data
 */
SELECT 
  first_name, 
  last_name, 
  email, 
  phone 
FROM 
  leads