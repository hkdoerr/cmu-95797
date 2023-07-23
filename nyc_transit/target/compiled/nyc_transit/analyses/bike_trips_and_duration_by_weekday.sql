--count and total time of bike trips by weekday
select 
    weekday(started_at_ts) as weekday,
    count(*) as total_trips,
    sum(duration_min) as total_trip_duration_min,
    sum(duration_sec) as total_trip_duration_sec
from "main"."main"."mart__fact_all_bike_trips"
group by all
