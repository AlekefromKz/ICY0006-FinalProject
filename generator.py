import csv
import random


def write_data(filename: str, lines: int):
    with open(filename, 'w', newline='') as csvfile:
        fieldnames = ['AREA', 'DISTANCE_F_C_C', 'FLOOR', 'MAX_FLOOR', 'ROOMS', 'WINDOWS', 'PRICE']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for i in range(lines):
            if i % 2 == 0:
                area = round(random.uniform(20.0, 100.0), 1)
            else:
                area = round(random.uniform(20.0, 70.0), 1)

            if area is int:
                area = float(area)

            distance = random.randint(100, 10000)
            distance = distance // 100 * 100

            max_floor = random.randint(1, 12)
            floor = random.randint(1, max_floor)

            rooms = area // 23 + random.randint(-2, 3)
            while rooms < 1:
                rooms += 1

            if area < 30 and rooms > 3:
                rooms = 2

            windows = rooms + random.randint(1, 4)

            # price per meter squared
            if distance < 500:
                ppm = random.randint(2500, 3500)

            elif distance < 2000:
                ppm = random.randint(2000, 3200)

            elif distance < 5000:
                ppm = random.randint(1700, 2700)

            else:
                ppm = random.randint(1300, 2000)

            if floor == 1 or floor > max_floor - 2:
                price = int(0.9 * ppm * area)
            else:
                price = int(0.95 * ppm * area)

            price = price // 10 * 10

            writer.writerow({'AREA': area, 'DISTANCE_F_C_C': distance, 'FLOOR': floor, 'MAX_FLOOR': max_floor,
                             'ROOMS': rooms, 'WINDOWS': windows, 'PRICE': price})


write_data('train.csv', 8000)
write_data('test.csv', 2000)
