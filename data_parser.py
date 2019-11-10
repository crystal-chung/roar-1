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


def select_by_status(dat, status, user_id=None):
    """
    Return number of tips by status and (optionally) by user.
    Inputs:
        status (str): one of the three status
        user_id (str, optional): user id. if None, incidents from all users are included.
    Returns:
        int: count of incidents by status and (optionally) user
    """
    dat_status = dat[dat['status'] == status]
    if not user_id:
        return len(dat_status['incident'].tolist())
    else:
        return len(dat_status['incident']['user'==user_id].tolist())


