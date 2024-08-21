import requests
import json
import os

url = 'http://127.0.0.1:8081/virtual'
data = {
    "category": "Media",
    "tool_name": "newapi_for_media",
    "api_name": "url",
    "tool_input": {'url': 'https://api.socialmedia.com/friend/photos'},
    "strip": "",
    "toolbench_key": "0eab2PqL7KfCkymQIdnR4DzYg5uh8jZBiEX3tOWTVUSFMHs16l"
}
headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
}

# Make the POST request
response = requests.post(url, headers=headers, data=json.dumps(data))
print(response.text)