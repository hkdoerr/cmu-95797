with stations as (
select 
    distinct
    trim(start_station_id) as station_id,
    trim(start_station_name) as station_name,
    start_lat as station_lat,
    start_lng as station_lng
from {{ ref('stg__bike_data')}}
union
select 
    distinct
    trim(end_station_id) as station_id,
    trim(end_station_name) as station_name,
    end_lat as station_lat,
    end_lng as station_lng
from {{ ref('stg__bike_data')}}
)

select 
    distinct 
    station_id,
    station_name,
    station_lat,
    station_lng
from stations