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

def filter_time(timeinterval, df):
    timeinterval = timeinterval.lower()
    currenttime = datetime.now()

    if timeinterval == 'hour':
        curr_hour = currenttime.hour
        less = currenttime.replace(hour = curr_hour-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)]
    elif timeinterval == 'day':
        curr_day = currenttime.day
        less = currenttime.replace(day = curr_day-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)]
    elif timeinterval == 'week':
        less = list(currenttime.isocalendar())
        less[1] = less[1]-1
        less = pd.Timestamp(iso_to_gregorian(*tuple(less)) )
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)]
    elif timeinterval == 'month':
        curr_month = currenttime.month
        less = currenttime.replace(month = curr_month-1)
        fil =  df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)]
    elif timeinterval == 'year':
        curr_year = currenttime.year
        less = currenttime.replace(year = curr_year-1)
        fil = df[(df['dt_obj'] >= less) & (df['dt_obj'] <= currenttime)]
    else:
        print("not a valid time interval")
    if fil.empty:
        fil = "no reports within this time interval"
    return fil

def number_submitted(timeinterval, df):
	fil_df = filter_time(timeinterval, df)

	if isinstance(fil_df, str):
		num_submitted = 0.0
	else:
		num_submitted = fil_df.shape[0]
	return num_submitted

