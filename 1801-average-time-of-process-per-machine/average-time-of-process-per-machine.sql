-- with clauses
WITH st AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
),
et AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
),
joined AS (
    SELECT st.machine_id
         , st.timestamp AS start_time
         , et.timestamp AS end_time
    FROM st
        INNER JOIN et ON st.machine_id = et.machine_id AND st.process_id = et.process_id
)
SELECT machine_id
     , ROUND(AVG(end_time - start_time),3) AS processing_time
FROM joined
GROUP BY machine_id