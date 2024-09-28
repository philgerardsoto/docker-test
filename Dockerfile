FROM python:3.9-slim

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set Garmin ENV Variables
ARG GARMIN_USER
ARG GARMIN_PASS

ENV GARMIN_USER=$GARMIN_USER
ENV GARMIN_PASS=$GARMIN_PASS

# Set working directory
WORKDIR app

# Copy requirements
COPY requirements.txt .

# Install DBT
RUN pip install -U pip
RUN pip install -r requirements.txt

COPY extraction ./extraction
