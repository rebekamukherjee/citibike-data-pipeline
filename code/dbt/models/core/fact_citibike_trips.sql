{{ config(materialized='table') }}

with citibike_tripdata as (
    select * 
    from {{ ref ('stg_citibike_tripdata')}}
),
dim_citibike_stations as (
    select *
    from {{ ref('dim_citibike_stations')}}
)
select
    citibike_tripdata.ride_id,
    citibike_tripdata.start_station_id,
    citibike_tripdata.end_station_id,
    citibike_tripdata.started_at,
    citibike_tripdata.ended_at,
    TIMESTAMP_DIFF(citibike_tripdata.ended_at, citibike_tripdata.started_at, MINUTE) as ride_duration,
    citibike_tripdata.start_station_name,
    citibike_tripdata.end_station_name,
    citibike_tripdata.start_lat,
    citibike_tripdata.start_lng,
    citibike_tripdata.end_lat,
    citibike_tripdata.end_lng,
    citibike_tripdata.rideable_type,
    citibike_tripdata.member_casual,    
    start_station.num_bikes_available as start_num_bikes_available,
    start_station.num_bikes_disabled as start_num_bikes_disabled,
    start_station.num_docks_available as start_num_docks_available,
    start_station.num_docks_disabled as start_num_docks_disabled,
    start_station.is_installed as start_is_installed,
    start_station.is_renting as start_is_renting,
    start_station.is_returning as start_is_returning,
    end_station.num_bikes_available as end_num_bikes_available,
    end_station.num_bikes_disabled as end_num_bikes_disabled,
    end_station.num_docks_available as end_num_docks_available,
    end_station.num_docks_disabled as end_num_docks_disabled,
    end_station.is_installed as end_is_installed,
    end_station.is_renting as end_is_renting,
    end_station.is_returning as end_is_returning
from citibike_tripdata
inner join dim_citibike_stations as start_station
on citibike_tripdata.start_station_name = start_station.name
inner join dim_citibike_stations as end_station
on citibike_tripdata.end_station_name = end_station.name