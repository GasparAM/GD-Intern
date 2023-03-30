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

# conn.request("POST", "/v3/surveys/", payload, headers)
# conn.request("GET", "/v3/surveys/", headers=headers)
# conn.request("GET", "/v3/collectors/511667704", headers=headers)
# conn.request("POST", "/v3/contact_lists", cont, headers)
conn.request("POST", "/v3/contact_lists", cont, headers)
# f = json.loads(json.dumps(f))
# print(f[id])

# for i in open('email.txt').read().splitlines():
#     email = "{\"email\":\"" + i +"\"}"
#     # print(email)
#     conn.request("POST", "/v3/contact_lists/241961157/contacts", email, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
