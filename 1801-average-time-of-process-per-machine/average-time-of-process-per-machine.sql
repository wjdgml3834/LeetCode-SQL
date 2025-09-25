SELECT st.machine_id
     , ROUND(AVG(et.timestamp - st.timestamp),3) AS processing_time
FROM (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
) AS st
INNER JOIN 
    (SELECT *
    FROM Activity
    WHERE activity_type = 'end') AS et
ON st.machine_id = et.machine_id AND st.process_id = et.process_id
GROUP BY st.machine_id
