--all the Zones where there are less than 100000 trips
--group by and having

SELECT loc.zone,
    count(a.*) as trips
FROM {{ ref('mart__fact_all_taxi_trips') }} a
    left join {{ ref('mart__dim_locations') }} loc on a.PUlocationID = loc.LocationID
GROUP BY zone
HAVING trips < 100000