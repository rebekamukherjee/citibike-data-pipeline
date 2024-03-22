{{ config(materialized='table') }}

select *
from {{ ref('citibike_stations') }}