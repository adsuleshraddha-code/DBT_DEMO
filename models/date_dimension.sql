WITH CTE AS (
    SELECT
    STARTED_AT,
    to_timestamp(STARTED_AT) as STARTED_AT1,
    date(to_timestamp(STARTED_AT)) as date_timestamp,
    hour(to_timestamp(STARTED_AT)) as hour_started_at
    

    FROM 
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

SELECT * FROM CTE