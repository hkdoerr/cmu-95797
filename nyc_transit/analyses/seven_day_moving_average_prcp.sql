--calculate the 7 day moving average precipitation for every day in the weather data.



SELECT date,
    avg(prcp) OVER seven_days as prcp_7_day_moving_avg
FROM {{ ref('stg__central_park_weather') }}
WINDOW seven_days AS (
    ORDER BY date ASC
    RANGE BETWEEN INTERVAL 3 DAYS PRECEDING AND
    INTERVAL 3 DAYS FOLLOWING)