import io
import pandas as pd
import requests
from zipfile import ZipFile
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):

    # define data types of the fields in the data
    citibike_dtypes = {
        'ride_id':str,
        'rideable_type':str,
        'start_station_name':str,
        'start_station_id':str,
        'end_station_name':str,
        'end_station_id':str,
        'start_lat':float,
        'start_lng':float,
        'end_lat':float,
        'end_lng':float,
        'member_casual':str,
    }

    # identify fields that are dates
    parse_dates = ['started_at', 'ended_at']

    # configure the URL using year and month
    year = kwargs['execution_date'].year
    month = kwargs['execution_date'].month
    if month < 10:
        month = '0' + str(month)
    else:
        month = str(month)
    url = f'https://s3.amazonaws.com/tripdata/JC-{year}{month}-citibike-tripdata.csv.zip'
    
    # read the ZIP file from the URL
    response = requests.get(url)
    if response.status_code != 200:
        raise Exception(f"Failed to download ZIP file from {url}")

    with ZipFile(io.BytesIO(response.content)) as zip_file:
        # get the list of files inside the ZIP archive
        file_list = zip_file.namelist()
        
        # filter out the desired CSV files
        csv_files = [file_name for file_name in file_list if file_name.endswith('.csv') and '/' not in file_name]
        if len(csv_files) == 0:
            raise ValueError("Expected one CSV file inside the ZIP archive.")
        
        # read the CSV files and concatenate multiple files
        data = []
        for csv_file in csv_files:
            with zip_file.open(csv_file) as file:
                data.append(pd.read_csv(file, sep=',', dtype=citibike_dtypes, parse_dates=parse_dates))
        data = pd.concat(data)
        print (f'Shape of the data: {data.shape}')

        return data


@test
def test_output(output, *args) -> None:

    assert output is not None, 'The output is undefined'
