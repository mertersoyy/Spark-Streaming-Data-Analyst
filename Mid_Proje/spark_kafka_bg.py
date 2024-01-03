# pyspark --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2 --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar



from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, FloatType ,TimestampType
from pyspark.sql.functions import from_json



spark = SparkSession.builder.appName('kafka').getOrCreate()

buket = "mid-proje"
spark.conf.set('temporaryGcsBucket', buket)
spark.conf.set('parentProject', 'skilled-module-406113')
# {'Customer_ID': 719, 'Age': 22, 'Gender': 'Male', 'Item_Purchased': 'Shirt', 'Category': 'Clothing', 'Purchase_Amount(USD)': 22, 'Location': 'Florida', 'Size': 'M',
#  'Color': 'Peach', 'Season': 'Summer', 'Review_Rating': 4.6, 'Subscription_Status': 'Yes', 'Shipping_Type': 'Standard', 'Discount_Applied': 'Yes', 'Promo_Code_Used': 'Yes', 
# 'Previous_Purchases': 25, 'Payment_Method': 'Bank Transfer', 'Frequency_Purchases': 'Annually'}


schema = StructType([
    StructField('Customer_ID', IntegerType()),
    StructField('Age', IntegerType()),
    StructField('Gender', StringType()),
    StructField('Item_Purchased', StringType()),
    StructField('Category', StringType()),
    StructField('Purchase_Amount', IntegerType()),
    StructField('Location', StringType()),
    StructField('Size', StringType()),
    StructField('Color', StringType()),
    StructField('Season', StringType()),  
    StructField('Review_Rating', FloatType()),
    StructField('Subscription_Status', StringType()),
    StructField('Shipping_Type', StringType()),
    StructField('Discount_Applied', StringType()),
    StructField('Promo_Code_Used', StringType()),
    StructField('Previous_Purchases', IntegerType()), 
    StructField('Payment_Method', StringType()),
    StructField('Frequency_Purchases', StringType())    
])

kafkaDf = spark.readStream.format('kafka') \
            .option('kafka.bootstrap.servers', '35.184.245.41:9092') \
            .option('subscribe', 'mid_proje').load()
# from_json.user_id
# from_json.platform
# data.user_id
# select('data.*') -> user_id, platform, product_id, event, sid, timestamp

read_kafka = kafkaDf.select(from_json(kafkaDf["value"].cast("string"),schema).alias('data')).select('data.*')

# filter_df = read_kafka.filter(read_kafka.event == 'impression')

# read_kafka.writeStream.format('console').start().awaitTermination()

read_kafka.writeStream.format('bigquery') \
    .option('table', 'mid_proje.shopping_behavior') \
    .option('checkpointLocation', '/path/to/checkpoint/dir/in/hdfs') \
    .option("failOnDataLoss", False) \
    .start().awaitTermination()