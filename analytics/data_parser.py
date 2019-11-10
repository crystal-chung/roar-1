"""
This parser assumes the incoming dataframe has the following columns:
incident (int): incident id
user (str): user id
loc_lat (float): latitude of the incident report
loc_long (float): longitude of the incident report
species (str): species identifier
action (str): action being reported
status (str): status of the report
timestamp (str): timestamp of the report
"""
import json

import fiona
import pandas as pd
from shapely.geometry import Point, shape

FOLDER_WITH_US_MAP = ''


def filter_by_status(dat, status, user_id=None):
    """
    Return number of tips by status and (optionally) by user.
    Inputs:
        dat (pd.DataFrame): dataframe with incidents
        status (str): one of the three status
        user_id (str, optional): user id. if None, incidents from all users are included.
    Returns:
        list: list of incident identifiers that are selected
    """
    dat_status = dat[dat['status'] == status]
    if not user_id:
        list_of_incidents = dat_status['incident'].tolist()
    else:
        list_of_incidents = dat_status['incident'][dat['user']==user_id].tolist()
    return list_of_incidents


def filter_by_severity(dat, severity, user_id=None):
    """
    Return number of tips by severity and (optionally) by user.
    Inputs:
        dat (pd.DataFrame): dataframe with incidents
        severity (str): severity of incident
        user_id (str, optional): user id. if None, incidents from all users are included.
    Returns:
        list: list of incident identifiers that are selected
    """
    dat_status = dat[dat['severity'] == severity]
    if not user_id:
        list_of_incidents = dat_status['incident'].tolist()
    else:
        list_of_incidents = dat_status['incident'][dat['user']==user_id].tolist()
    return list_of_incidents


def filter_by_species(dat, species, user_id=None):
    """
    Return number of tips by species and (optionally) by user.
    Inputs:
        dat (pd.DataFrame): dataframe with incidents
        species (str): name of the species
        user_id (str, optional): user id. if None, incidents from all users are included.
    Returns:
        list: list of incident identifiers that are selected
    """
    dat_status = dat[dat['species'] == species]
    if not user_id:
        list_of_incidents = dat_status['incident'].tolist()
    else:
        list_of_incidents = dat_status['incident'][dat['user']==user_id].tolist()
    return list_of_incidents


def filter_by_state(dat, state_name, user_id=None):
    """
    Return number of tips by state and (optionally) by user.
    Inputs:
        dat (pd.DataFrame): dataframe with incidents
        state_name (str): full name of state
        user_id (str, optional): user id. if None, incidents from all users are included.
    Returns:
        list: list of incident identifiers that are selected
    """
    target_state = None
    states = fiona.open('./gadm36_USA_shp/gadm36_USA_1.shp')
    for state in states:
        if state['properties']['NAME_1'] == state_name:
            target_state = state
            break
    if not target_state:
        print('Error: state name is incorrect!')
        return

    state_shape = shape(target_state['geometry'])
    if user_id:
        dat = dat[dat['user'] == user_id]

    filter_list = []
    for i in range(len(dat['loc_lat'].tolist())):
        lat_i = dat['loc_lat'].tolist()[i]
        long_i = dat['loc_long'].tolist()[i]
        point_i = Point(long_i, lat_i)
        if point_i.within(state_shape):
            filter_list.append(i)
    out_incidents = [dat['incident'].tolist()[i] for i in filter_list]
    return out_incidents


def top_users_by_state(dat, state_name=None):
    """
    Return the top user(s) with most reported incidents given a state.
    """
    if state_name:
        state_incidents = filter_by_state(dat, state_name)
        dat = dat[dat['incident'].isin(state_incidents)]
    count_by_user = dat['user'].value_counts().to_dict()
    max_count = max(count_by_user.values())
    max_users = []
    for user in count_by_user.keys():
        if count_by_user[user] == max_count:
            max_users.append(user)
    return max_users


if __name__ == '__main__':
    dat = pd.read_csv('mock_data.csv')
    # filter by species
    spec_dict = {}
    for species in ["tiger", "elephant", "gorilla", "pangolin", "rhino", "parrot", "sea turtle", "other"]:
        spec_dict[species] = str(len(filter_by_species(dat, species)))
    with open('species.json', 'w') as file:
        file.write(json.dumps(spec_dict))

    # filter by severity
    severity_dict = {}
    for severity in ["P0", "P1", "P2", "P3"]:
        severity_dict[severity] = str(len(filter_by_severity(dat, severity)))
    with open('severity.json', 'w') as file:
        file.write(json.dumps(severity_dict))
        