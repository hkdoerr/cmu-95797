--Calculate the number of trips and average duration by borough and zone

SELECT loc.borough,
    loc.zone,
    count(a.*) as trips,
    avg(a.duration_min) as avg_duration_min

FROM "main"."main"."mart__fact_all_taxi_trips" a
    left join "main"."main"."mart__dim_locations" loc on a.PUlocationID = loc.LocationID

GROUP BY all