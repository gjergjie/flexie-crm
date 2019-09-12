-- Calculate idle time from one call to another

SELECT 
  CONCAT(u.first_name, ' ', u.last_name) AS `User Full Name`, 
  SEC_TO_TIME(
    IFNULL(total_idle_seconds, 0)
  ) AS `Total idle time`, 
  SEC_TO_TIME(
    IF(
      call_count IS NOT NULL 
      AND call_count > 0, 
      ROUND(
        IFNULL(total_idle_seconds, 0)/ call_count
      ), 
      0
    )
  ) AS `Average idle time` 
FROM 
  users u 
  LEFT JOIN (
    SELECT 
      user_id, 
      SUM(
        IF(
          next_call_start IS NOT NULL, 
          TIMESTAMPDIFF(
            SECOND, call_completed, next_call_start
          ), 
          0
        )
      ) AS total_idle_seconds, 
      COUNT(*) AS call_count 
    FROM 
      (
        SELECT 
          stat.user_id, 
          stat.answer_time, 
          IF(
            stat.call_duration IS NOT NULL, 
            DATE_ADD(
              stat.answer_time, INTERVAL stat.call_duration SECOND
            ), 
            stat.answer_time
          ) AS call_completed, 
          LEAD(answer_time, 1) OVER (
            PARTITION BY user_id 
            ORDER BY 
              answer_time
          ) next_call_start 
        FROM 
          dialer_stats stat 
        WHERE 
          DATE(date_added) = CURRENT_DATE
      ) user_call_info 
    GROUP BY 
      user_id
  ) user_idle_sencods ON user_idle_sencods.user_id = u.id 
WHERE 
  u.id <> 1 
  AND u.voip_number IS NOT NULL
