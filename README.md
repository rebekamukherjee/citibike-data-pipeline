# Citi Bike Trip Data Pipeline

This is my submission for [Data Engineering Zoomcamp 2024](https://github.com/DataTalksClub/data-engineering-zoomcamp) final project.

## Problem Description

Citi Bike is a public bicycle sharing system serving  New York City. In this project I have created a pipeline for Citi Bike trip data between `Jan 2022` and `Dec 2023` to answer the following questions:

- Where do Citi Bikers ride?
- When do they ride?
- How far do they go?
- Which stations are most popular?
- What days of the week are most rides taken on?

## Data

This data used in this project is extracted from [Citi Bike Trip Data](https://citibikenyc.com/system-data).

The data includes the following fields:
- Ride ID
- Rideable type
- Started at
- Ended at
- Start station name
- Start station ID
- End station name
- End station ID
- Start latitude
- Start longitude
- End latitude
- End Longitude
- Member or casual ride

## Technologies Used

- **Terraform** (infrastructure as code)
- **Mage** (workflow orchestration)
- **Google Cloud Storage** (data lake)
- **BigQuery** (data warehouse)
- **dbt** (data transformation)
- **Looker Studio** (data visualization)

## Data Pipeline

![](docs/res/data-flow-diagram.png)

## Data Visualization


## Reproduce Project

To reproduce the project and test the code yourself, follow these [instructions](docs/reproduce.md).