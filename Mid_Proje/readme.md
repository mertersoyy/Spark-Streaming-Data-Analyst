# Streaming Data

![Pipeline Architect](mimari.png)

**Realtime Data**

Elimizdeki data bir web service üzerinden gelmediği için {} dosya ile csv datamızı python üzerinden anlık akan bir data gibi davranmasını sağladım.

**Google Cloud**

Google Cloud üzerinden compute engine tool'unun kullanarak kendimize bir makine oluşturuyoruz burada ki temel amaç kendi bilgisayarımızdan değil google üzerinden kiraladığımız bilgisayardan işlemlerimize devam etmek. Burada SSH platformu kullanıyoruz.

**Docker**

SSH dili ile bu pc de dockerı ayağa kaldırmamız gerekiyor docker üzerinden de containerlarımız ile kafka ve nifiyi ayağa kaldırıcaz.

sudo apt update
sudo apt upgrade
sudo apt install docker.io
sudo apt install docker-compose
nano docker-compose.yml --> docker.compose.yml dosyasını tanımlattığımız alan burası olacaktır.
sudo docker-compose up -d

sonrasında kafka ve nifiye erişim sağlayabiliriz.


**Nifi**

Burda python üzerinden gelen datamızı kafkadan nifiye çektik. Json formatına çevirip istediğimiz filtrelendirmeyi verip Google Cloud a Json dosyası olarak gönderdik.

**Kafka**

Bir test-çalışma dosyası oluşturdum. Datamı json a çeviriyor.

**Spark**

pyspark --packages org.apache.spark:spark-sql-kafka-0.10_2:12:3.1.2 --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar

ile hive ortamında pyspark'a kafka ve bigquery i tanımlıyorum.

verimize uygun olan yüklemeleri yapıyoruz kafkadan gelen veriyi okuyamabilmek için from json kullanıyoruz.

{}dosyamızı buraya koyuyorum.

**Bigquery**

Oluşturduğum databaseim altındaki tabloda schemalarımı oluşturuyorum bunların veri tipleri csv datamdan aldığım ve {} dosyanın içinde tanımladığım tipler ile aynı olmalı.

Geri kalan işlemler SQL sorguları

**Looker**

BigQuery de yaptığım sorguları Looker üzerinde görselleştiriyorum.

![q1 Solutions](q1LookerDashboard.png)

![q2 Solutions](q2LookerDashboard.png)

![q3 Solutions](q3LookerDashboard.png)


