-- create external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `citi-bike-trip-data-pipeline.citibike_dataset.external_citibike_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://citibike_bucket_rebekam/citibike_tripdata/started_at_date=*/6fc6de18e20e49b885909902912ba6a8-0.parquet']
);

-- create a partition and cluster table from external table
CREATE OR REPLACE TABLE `citi-bike-trip-data-pipeline.citibike_dataset.citibike_tripdata_partitoned_clustered`
PARTITION BY started_at_date
CLUSTER BY start_station_name AS
SELECT *,
DATE(TIMESTAMP_MICROS(CAST (started_at/1000 AS INT64))) AS started_at_date
FROM `citi-bike-trip-data-pipeline.citibike_dataset.external_citibike_tripdata`;