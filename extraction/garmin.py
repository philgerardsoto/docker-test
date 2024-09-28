import os
import garminconnect
from datetime import date, timedelta

# Fetch email and password from environment variables
email = os.getenv("GARMIN_USER")
password = os.getenv("GARMIN_PASS")

if not email or not password:
    raise ValueError("Environment variables GARMIN_USER and GARMIN_PASS must be set")

garmin = garminconnect.Garmin(email, password)
garmin.login()

print(garmin.display_name)
GARTH_HOME = os.getenv("GARTH_HOME", "~/.garth")
garmin.garth.dump(GARTH_HOME)

yesterday = date.today() - timedelta(days=1)
yesterday = yesterday.isoformat()
print(garmin.get_stats(yesterday))