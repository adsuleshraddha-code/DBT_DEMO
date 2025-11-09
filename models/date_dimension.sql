WITH CTE AS (
    SELECT
    STARTED_AT,
    to_timestamp(STARTED_AT) as STARTED_AT1,
    date(to_timestamp(STARTED_AT)) as date_timestamp,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    {{get_season('STARTED_AT')}} as STATION_OF_YEAR,
    {{day_type('STARTED_AT')}} as DAY_TYPE
    

    FROM 
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

SELECT * FROM CTE