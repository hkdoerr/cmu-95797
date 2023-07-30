-- calculate the 7 day moving min, max, avg, sum for precipitation and snow for every day in the weather data, defining the window only once.

SELECT date,
    min(prcp) OVER seven_days as prcp_7_day_moving_min,
    max(prcp) OVER seven_days as prcp_7_day_moving_max,
    avg(prcp) OVER seven_days as prcp_7_day_moving_avg,
    sum(prcp) OVER seven_days as prcp_7_day_moving_sum,
    min(snow) OVER seven_days as snow_7_day_moving_min,
    max(snow) OVER seven_days as snow_7_day_moving_max,
    avg(snow) OVER seven_days as snow_7_day_moving_avg,
    sum(snow) OVER seven_days as snow_7_day_moving_sum
FROM "main"."staging"."stg__central_park_weather"
WINDOW seven_days AS (
    ORDER BY date ASC
    RANGE BETWEEN INTERVAL 3 DAYS PRECEDING AND
    INTERVAL 3 DAYS FOLLOWING)