import json
import pandas as pd
import numpy as np
from datetime import datetime
from datetime import timedelta
from datetime import date

def readfile(fname):
    data = pd.read_csv(fname)
    data['dt_obj'] = pd.to_datetime(data['timestamp'], format='%b %d %Y %H:%M:%S')
    return data

# next two functions from https://stackoverflow.com/questions/304256/whats-the-best-way-to-find-the-inverse-of-datetime-isocalendar
def iso_year_start(iso_year):
    "The gregorian calendar date of the first day of the given ISO year"
    fourth_jan = date(iso_year, 1, 4)
    delta = timedelta(fourth_jan.isoweekday()-1)
    return fourth_jan - delta

def iso_to_gregorian(iso_year, iso_week, iso_day):
    "Gregorian calendar date for the given ISO year, week and day"
    year_start = iso_year_start(iso_year)
    return year_start + timedelta(days=iso_day-1, weeks=iso_week-1)

def filter_time(timeinterval, df, user_id = None):
    timeinterval = timeinterval.lower()
    currenttime = datetime.now()

    if timeinterval == 'hour':
        curr_hour = currenttime.hour
        less = currenttime.replace(hour = curr_hour-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1)
    elif timeinterval == 'day':
        curr_day = currenttime.day
        less = currenttime.replace(day = curr_day-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1)
    elif timeinterval == 'week':
        less = list(currenttime.isocalendar())
        less[1] = less[1]-1
        less = pd.Timestamp(iso_to_gregorian(*tuple(less)) )
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1)
    elif timeinterval == 'month':
        curr_month = currenttime.month
        less = currenttime.replace(month = curr_month-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1)
    elif timeinterval == 'year':
        curr_year = currenttime.year
        less = currenttime.replace(year = curr_year-1)
        fil = df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1)
    else:
        print("not a valid time interval")
    if fil.empty:
        fil = "no reports within this time interval"
    elif user_id is not None:
        fil = df[df['user'] == user_id].drop(['dt_obj'], axis=1)
    return fil

def number_submitted(timeinterval, df):
    fil_df = filter_time(timeinterval, df)

    if isinstance(fil_df, str):
        num_submitted = 0.0
    else:
        num_submitted = fil_df.shape[0]
    return num_submitted

def filter_two_months(df):
    """A hacky function that returns the count for the past two months"""
    currenttime = datetime.now()
    curr_month = currenttime.month
    df['dt_obj'] = pd.to_datetime(df['timestamp'], format='%b %d %Y %H:%M:%S')
    less = currenttime.replace(month=curr_month - 1)
    count_this_month = df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)].drop(['dt_obj'], axis=1).shape[0]

    one_more = currenttime.replace(month=curr_month - 2)
    count_last_month = df[(df['dt_obj'] >= one_more) & (df['dt_obj'] <= less)].drop(['dt_obj'], axis=1).shape[0]
    return {'this_month': str(count_this_month), 'last_month': str(count_last_month)}


if __name__ == '__main__':
    dat = pd.read_csv('mock_data.csv')
    month_count = filter_two_months(dat)
    with open('month_count.json', 'w') as file:
        file.write(json.dumps(month_count))
