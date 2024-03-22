if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):

    # create a new column started_at_date by converting started_at to a date
    data['started_at_date'] = data['started_at'].dt.date

    # create a new column ended_at_date by converting ended_at to a date
    data['ended_at_date'] = data['ended_at'].dt.date

    return data


@test
def test_output(output, *args) -> None:

    assert output is not None, 'The output is undefined'
