import http.client
import json

conn = http.client.HTTPSConnection("api.surveymonkey.com")

payload = open("survey.json").read()
cont = "{\"name\":\"My Contact list\"}"


headers = {
    'Content-Type': "application/json",
    'Accept': "application/json",
    'Authorization': "Bearer X3k4koLgkvsFaCDiOVh-Umr20W50uaTeJ8VvtZQBMRujmTlhbVEgNSp23X-ZToe264jYFSkpzxU.Imvif66mywLKL3b.naLyZyZHiR5bvPeqyFTkRubV6fMGIWG6lzlL"
    }

conn.request("POST", "/v3/surveys/", payload, headers)
data = conn.getresponse().read()

survey_url = json.loads(data.decode("utf-8"))['preview']


print(f"The created survey URL is: {survey_url}")
