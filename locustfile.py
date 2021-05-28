import json
import time
import random
import json
from locust import HttpUser, task, tag, between

class RESTServerUser(HttpUser):
    wait_time = between(1.0, 5.0)
    
    def hello_vapor(self):
        self.client.get("/")
        
    @tag("get_id_task")
    @task(10)
    def get_id_task(self):
        ID = random.randint(1, 200)
        with self.client.get("/users/%s" %ID, catch_response=True, name="/users/%s" %ID) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Status code is %s" %response.status_code)

    @tag("post_task")
    @task(10)
    def post_task(self):
        # x = random.randint(100, 1000)
        # xs = random.randint(10, 100)
        # name = "user%s" % str(x)
        # email = "%s@%s.com" % (str(x), str(xs))
        # phoneNumber = "%s%s%s" % (str(x), str(x), str(xs))
        # address = "ugabuga #%s" % str(xs)
        # POST_DATA = json.dumps({'name':name, 'phoneNumber':phoneNumber,'email':email, 'address':address})
        POST_DATA = json.dumps({'name': 'nes', 'email':'email', 'phoneNumber':'88005553535' })
        with self.client.post("/users", catch_response=True, name="/users", data=POST_DATA, headers={'content-type':'application/json'}) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Status code is %s" % response.status_code)

    @tag("put_task")
    @task(10)
    def put_task(self):
        ID = random.randint(1, 500)
        x = random.randint(100, 1000)
        xs = random.randint(10, 100)
        phoneNumber = "%s%s%s" % (str(xs), str(x), str(x))
        PUT_DATA = json.dumps({'name':'nes', 'email':'email', 'phoneNumber':phoneNumber })
        with self.client.put("/users/%s" % ID, catch_response=True, name="/users/%s" %ID, data=PUT_DATA, headers={'content-type':'application/json'}) as response:
             if response.status_code == 200:
                response.success()
             else:
                response.failure("Status code is %s" % response.status_code)
