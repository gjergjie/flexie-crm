-- Statistics on your unsubscribes

SELECT 
  IF(
    u.unsubscribed_by = 'entity', 'Recipient', 
    'Flexie User'
  ) AS 'Unsubscribed By', 
  u.email_address AS 'Recipient', 
  u.entity_type AS "Recipient Entity", 
  e.name AS 'Email Template', 
  e.subject AS 'Email Subject', 
  CASE 
    WHEN u.unsubscribe_reason = "flexie.email.unsubscribe.reason.1" THEN "I am not sure why I am receiving this, please don't send any more." 
    WHEN u.unsubscribe_reason = "flexie.email.unsubscribe.reason.2" THEN "This is not relevant to me - I dont want to receive this." 
    WHEN u.unsubscribe_reason = "flexie.email.unsubscribe.reason.3" THEN "This email appears misleading." 
    WHEN u.unsubscribe_reason = "flexie.email.unsubscribe.reason.4" THEN "This email is spam, and I'm reporting it." 
    WHEN u.unsubscribe_reason = "flexie.email.unsubscribe.reason.5" THEN "Just don't email me, no reason." 
    WHEN u.unsubscribe_reason IS NULL THEN "[No reason was provided]" 
    ELSE u.unsubscribe_reason END AS 'Unsubscribe Reason', 
  DATE_FORMAT(
    DATE(u.date_added), 
    '%b %c, %Y'
  ) AS 'Unsubscribed Date' 
FROM 
  unsubscribes u 
  LEFT JOIN emails e ON e.id = u.email_id 
ORDER BY 
  u.date_added DESC 
LIMIT 
  10000000000000
