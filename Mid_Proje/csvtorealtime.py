from kafka import KafkaProducer
import json
import time
import pandas as pd

df = pd.read_csv('shopping_behavior.csv')

producer = KafkaProducer (bootstrap_servers='35.184.245.41:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))

for index, row in df.iterrows():
    row_dict = row.to_dict()

    producer.send('mid_proje', row_dict)
    time.sleep(1)
    print(row_dict)