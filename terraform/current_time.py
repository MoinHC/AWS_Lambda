import datetime
import json

def current_time(event, context):
    currentTime = (datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S")
    currentTime_json = {"currentTime": str(currentTime)}
    print(currentTime_json)
