-- Hours segment when your emails are opened most

SELECT 
  COUNT(*) AS `Email Count`, 
  CONCAT(
    'Between ', 
    IF(
      HOUR(
        CONVERT_TZ(date_read, "UTC", "{timezone}")
      ) < 10, 
      '0', 
      ''
    ), 
    HOUR(
      CONVERT_TZ(date_read, "UTC", "{timezone}")
    ), 
    ':00 and ', 
    IF(
      HOUR(
        CONVERT_TZ(date_read, "UTC", "{timezone}")
      )+ 1 < 10, 
      '0', 
      ''
    ), 
    HOUR(
      CONVERT_TZ(date_read, "UTC", "{timezone}")
    )+ 1, 
    ':00'
  ) AS `Time Read` 
FROM 
  mailboxes 
WHERE 
  is_read = 1 
  AND flexie_hash IS NOT NULL 
GROUP BY 
  HOUR(
    CONVERT_TZ(date_read, "UTC", "{timezone}")
  );
