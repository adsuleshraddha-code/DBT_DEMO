WITH CTE AS (
    SELECT
        STARTED_AT,
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT1,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS date_timestamp,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS hour_started_at,
        {{ get_season("STARTED_AT") }} AS SEASON_OF_YEAR,
        {{ day_type("STARTED_AT") }} AS DAY_TYPE
    FROM {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)

SELECT * FROM CTE
