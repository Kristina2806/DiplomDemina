# Кристина Демина, 31-я когорта - Финальный проект. Инженер по тестированию плюс.
import data
from sender_stend_request1 import create_order, get_order_by_track

def test_create_and_get_order():
    response_create = create_order(data.ORDER_BODY)
    assert response_create.status_code == 201

    track_number = response_create.json().get('track')
    assert track_number is not None

    response_get = get_order_by_track(track_number)
    assert response_get.status_code == 200