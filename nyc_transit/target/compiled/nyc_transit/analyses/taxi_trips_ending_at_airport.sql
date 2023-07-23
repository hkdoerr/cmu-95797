--total number of trips ending in service zones 'Airport' and 'EWR'

select count(*) as total_trips_ending_at_airport 
from "main"."main"."mart__fact_all_taxi_trips" a
    inner join "main"."main"."mart__dim_locations" b on a.DOlocationID = b.LocationID
        and service_zone in ('EWR', 'Airports')