{{ config(materialized='view') }}

with tripdata as
(
    select *
    from {{ source('staging', 'citibike_tripdata_partitoned_clustered') }}
)
select
    -- identifiers
    ride_id,
    start_station_id,
    end_station_id,

    -- timestamps
    cast(timestamp_micros(cast (started_at/1000 as INT64)) as timestamp) as started_at,
    cast(timestamp_micros(cast (ended_at/1000 as INT64)) as timestamp) as ended_at,

    -- locations
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,

    -- trip info
    rideable_type,
    member_casual

from tripdata