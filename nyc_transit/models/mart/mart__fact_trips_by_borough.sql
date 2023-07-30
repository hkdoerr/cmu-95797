select loc.Borough, count(a.*) as trips
from {{ ref('mart__fact_all_taxi_trips') }} a
    left join {{ ref('mart__dim_locations') }} loc on a.PUlocationID = loc.LocationID
group by borough