-- Visits from leads on your website
-- Note: Convert TZ method is converting UTC into your TimeZone
-- All dates in Flexie are saved in UTC

SELECT 
  CONVERT_TZ(
    page_hits.date_hit, '+00:00', '+01:00'
  ) AS 'Date', 
  CONCAT(
    '<a href="/s/leads/view/', 
    leads.id, 
    '" data-toggle="ajax">', 
    leads.first_name, 
    ' ', 
    COALESCE(leads.last_name, ''), 
    '</a>'
  ) AS 'Lead', 
  IF (
    page_hits.url_title IS NULL, 
    CONCAT(
      '<a href="', page_hits.url, '" target="_blank">', 
      page_hits.url, '</a>'
    ), 
    CONCAT(
      '<a href="', page_hits.url, '" target="_blank">', 
      page_hits.url_title, '</a>'
    )
  ) AS 'URL', 
  page_hits.country AS 'From Country', 
  page_hits.city AS 'From City', 
  page_hits.external_referer AS 'External Referer' 
FROM 
  page_hits 
  INNER JOIN leads ON page_hits.lead_id = leads.id 
WHERE 
  page_hits.lead_id IS NOT NULL 
  AND page_hits.source IS NULL
