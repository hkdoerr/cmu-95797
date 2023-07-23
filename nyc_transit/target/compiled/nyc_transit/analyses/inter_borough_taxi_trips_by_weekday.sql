--count of total trips, trips that start and end in different borough and percentage with different start and end points, by weekday


select count(*) as total_trips, sum(trips_start_end_diff_borough_flag) as count_trips_start_end_diff_borough, sum(trips_start_end_diff_borough_flag)/count(*) percentage_trips_start_end_diff_borough
from (
select a.*, case when start_loc.Borough <> end_loc.Borough then 1 else 0 end as trips_start_end_diff_borough_flag
from "main"."main"."mart__fact_all_taxi_trips" a
    left join "main"."main"."mart__dim_locations" start_loc on a.PUlocationID = start_loc.LocationID
    left join "main"."main"."mart__dim_locations" end_loc on a.DOlocationID = end_loc.LocationID) x
group by all