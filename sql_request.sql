ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDpWZpRAJfcWgr/TvFJ7jVVYmvqe+4TkQZNSu2pjSHlJkw9PrqV/iboY+8lE5As81DWX3mw46EUD++Ogr8cn9oxPE/NPz1gc1ZEc/XGN6OxcjXTsLqiauIGqxFgpMR7sqvHJ6STMXo2yeFVak4JtgMVncMaVF8732hU/0NO8mdbHBt3A2Q6OB4VAgiY1FIrze8UGtHcCjF+s39gukP9SOSF8h3JUMnTGqPz5GHjAaV9L0vWldcIHv91+VlJp+bYkE36H/2HsVX0C3Ae3VrYI7ts3AGk6TZEAzztLqc9OmaWJjJX+a+0n9F0bPjwS/cGiQHEnxi9KGiSLOVQJR0F461YbKOZzSV1/APEJ96oTvtExMrWhOCs2yYr0piV5jF1vJp5yS/3IV2JIpKt4gKQDg556eLOeCKHvYSKIeGZmAcK5UWpvEEIqTCIz3RCvgyDb5lJZeycofuk3nRr2IBX+Dj3u84YaPtD1+65UIzvkqTZRGuH91M4Wzmocu32oL8usUZYW/i00XeoDU8NSoknpG0A0mtb3S7+bxDdybOzWdI3+WBbftEtm7UKA6aT7nzyzAwzXF8jZy+Y2p7ey+xrjSY1Gr/6pM5Q4p7IpBYp8sAXfvdt7HYXkr0Z5sCZpRuTFDuzbOcjR47vmbWNAsXhYnZUQR1xYxx/pDfEzEDRZk78Ow== 79823@LAPTOP-DQCB871B

C:\Users\79823>ssh 7d429729-9e59-4c13-809b-17af992d6813@serverhub.praktikum-services.ru -p 4554
morty@f2116ad96256:~$ psql -U morty -d scooter_rent
Password for user morty:
psql (11.18 (Debian 11.18-0+deb10u1))
Type "help" for help.
scooter_rent=# \dt
           List of relations
 Schema |     Name      | Type  | Owner
--------+---------------+-------+-------
 public | Couriers      | table | root
 public | Orders        | table | root
 public | SequelizeMeta | table | root
(3 rows)
ЗАДАНИЕ 1
scooter_rent=# SELECT "Couriers".login, COUNT(*) AS delivery_orders_count
scooter_rent-# FROM "Couriers"
scooter_rent-# JOIN "Orders" ON "Couriers".id = "Orders"."courierId"
scooter_rent-# WHERE "Orders"."inDelivery" = true
scooter_rent-# GROUP BY "Couriers".login;
 login | delivery_orders_count
-------+-----------------------
(0 rows)

ЗАДАНИЕ 2
scooter_rent=# SELECT
scooter_rent-#     track,
scooter_rent-#     CASE
scooter_rent-#         WHEN finished = true THEN 2
scooter_rent-#         WHEN cancelled = true THEN -1
scooter_rent-#         WHEN "inDelivery" = true THEN 1
scooter_rent-#         ELSE 0
scooter_rent-#     END AS status
scooter_rent-# FROM "Orders";
 track | status
-------+--------
(0 rows)