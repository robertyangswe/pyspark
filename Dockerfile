# Use a base image
FROM python:3.12-slim

# Set working directory
WORKDIR /workspace

# Install necessary utilities
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    
# Set Java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-arm64
ENV PATH $PATH:$JAVA_HOME/bin

# Install Apache Spark
ENV APACHE_SPARK_VERSION 3.4.3
ENV HADOOP_VERSION 3

# Download and install Spark (version 3.4.0 as an example)
ENV SPARK_VERSION=3.4.0

# Install PySpark Python package for convenience
RUN python3 -m pip install pyspark==${SPARK_VERSION}

# Copy PySpark script into the container
COPY app.py .

# Command to run the PySpark application
CMD ["python3.12", "app.py"]