-- compare an individual fare to the zone, borough and overall average fare using the fare_amount in yellow taxi trip data.


SELECT yellow.fare_amount,
    AVG(yellow.fare_amount) OVER (PARTITION BY loc.borough) as avg_fare_borough,
    AVG(yellow.fare_amount) OVER (PARTITION BY loc.zone) as avg_fare_zone,
    AVG(yellow.fare_amount) OVER () as ave_fare_overall

FROM  (select * from "main"."staging"."stg__yellow_tripdata" limit 10000  --limiting to 10k records due to memory constriants
    ) yellow
    LEFT JOIN  "main"."main"."mart__dim_locations" loc on yellow.PUlocationID = loc.LocationID