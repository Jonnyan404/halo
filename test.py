#!/usr/bin/env python
# coding=utf-8
import my_logging
import socket
import json
import logging

HOST = ''
PORT = 8000
my_logging.load_my_logging_cfg()
# Configure socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind((HOST, PORT))
sock.listen(100)

# infinite loop
while True:
    # maximum number of requests waiting
    conn, addr = sock.accept()
    request = conn.recv(1024)
    #print(request)
    method = request.split()[0]

    #print ('Connect by: ', addr)

    # deal wiht GET method
    if method == 'GET':
        continue
    elif method == 'POST':
        form = request.split('\r\n')
        entry = form[-1]  # main content of the request
        data=json.loads(entry)
        logging.error(data)
        print data['event']['message']
    else:
        continue
