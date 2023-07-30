--pivot the results by borough

PIVOT  "main"."main"."mart__fact_trips_by_borough"  ON borough USING sum(trips);