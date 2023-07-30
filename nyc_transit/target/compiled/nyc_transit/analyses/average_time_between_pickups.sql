--the average time between taxi pick ups per zone

SELECT zone,
    AVG(DATE_DIFF('minute', pickup_datetime, lead_pickup)) AS avg_min_btwn_pickups
FROM (
SELECT loc.zone, 
    pickup_datetime,
    LEAD(a.pickup_datetime) OVER (PARTITION BY loc.zone ORDER BY pickup_datetime) AS lead_pickup
FROM (select * from "main"."main"."mart__fact_all_taxi_trips" limit 10000 --limiting to 10k records due to memory constriants
    ) a
    left join "main"."main"."mart__dim_locations" loc on a.PUlocationID = loc.LocationID
) x
GROUP BY zone