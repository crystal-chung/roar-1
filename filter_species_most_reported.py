import pandas as pd
import numpy as np
from datetime import datetime
from datetime import timedelta
from datetime import date

def readfile(fname):
    data = pd.read_csv(fname)
    data['dt_obj'] = pd.to_datetime(data['timestamp'], format='%b %d %Y %H:%M:%S')
    return data

def filter_species(timeinterval, df):
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
    else:
        return "not a valid time interval"
    if fil.empty:
        top_species = "no reports within this time interval"
    else:
        grouped_fil = fil.groupby(['species']).count()
        sorted_fil = grouped_fil.sort_values(by='incident', ascending=False)
        top_species = sorted_fil.index.values[0]
    return top_species

