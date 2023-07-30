--pivot the results by borough

PIVOT  {{ ref('mart__fact_trips_by_borough') }}  ON borough USING sum(trips);

