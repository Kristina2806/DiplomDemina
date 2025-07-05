import requests
from configuration import URL_SERVICE, CREATE_ORDER_PATH, GET_ORDER_PATH

def create_order(order_body):
    url = URL_SERVICE + CREATE_ORDER_PATH
    response = requests.post(url, json=order_body)
    return response

def get_order_by_track(track_number):
    url = URL_SERVICE + GET_ORDER_PATH
    params = {'t': track_number}
    response = requests.get(url, params=params)
    return response