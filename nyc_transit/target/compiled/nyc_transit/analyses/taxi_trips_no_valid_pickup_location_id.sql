-- taxi trips which don’t have a pick up location_id in the locations table
--anti join 

SELECT count(a.*) as count_trips_no_pickup_ID
FROM "main"."main"."mart__fact_all_taxi_trips" a
    left join "main"."main"."mart__dim_locations" loc on a.PUlocationID = loc.LocationID
WHERE loc.LocationID is NULL