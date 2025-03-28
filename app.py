import os
from datetime import datetime, date

from pyspark.sql import SparkSession
from pyspark.sql import Row

# Create a SparkSession
spark = SparkSession.builder.getOrCreate()

# Create a DataFrame
df = spark.createDataFrame([
    Row(a=1, b=2., c='string1', d=date(2000, 1, 1), e=datetime(2000, 1, 1, 12, 0)),
    Row(a=2, b=3., c='string2', d=date(2000, 2, 1), e=datetime(2000, 1, 2, 12, 0)),
    Row(a=4, b=5., c='string3', d=date(2000, 3, 1), e=datetime(2000, 1, 3, 12, 0))
])

# Show the DataFrame
df.show()

# Stop the SparkSession
spark.stop()