--remove duplicate rows

select *
from "main"."main"."events"
QUALIFY row_number() OVER (PARTITION BY event_id ORDER BY insert_timestamp desc) = 1