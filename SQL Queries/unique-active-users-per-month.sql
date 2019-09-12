-- Active Users based on page hits from Contacts

SELECT 
  COUNT(DISTINCT page_hits.contact_id) AS Contacts, 
  MONTHNAME(page_hits.date_hit) AS 'Month', 
  MONTH(page_hits.date_hit) AS 'Month Number' 
FROM 
  page_hits 
GROUP BY 
  MONTHNAME(page_hits.date_hit)
