with bike as (

    select distinct
    START_STATION_ID,
    start_station_name,
    --start_last,
    start_lat,
    start_lng

    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'

   
)

select * from bike