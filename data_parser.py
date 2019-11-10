"""
This parser assumes the incoming dataframe has the following columns:
incident (int): incident id
user (str): user id
loc_lat (float): latitude of the incident report
loc_long (flat): longitude of the incident report
species (str): species identifier
action (str): action being reported
status (str): status of the report
timestamp (str): timestamp of the report
"""
import pandas as pd


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
        list_of_incidents = dat_status['incident']['user'==user_id].tolist()
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
        list_of_incidents = dat_status['incident']['user'==user_id].tolist()
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
        list_of_incidents = dat_status['incident']['user'==user_id].tolist()
    return list_of_incidents
