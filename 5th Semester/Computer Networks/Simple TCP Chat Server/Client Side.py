# ************ Parsa Yousefi Nejad ************
# ********* Multi Client Chat Server **********
"""
Computer Networks Project

multiThreaded, TCP, IPv4, loopback
(((Server Code)))
"""
import threading
import socket

SERVER_HOST, SERVER_PORT = ('localhost', 10666)

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
username = input('\x1B[34mType your username:\033[0m ')

client_socket.connect((SERVER_HOST, SERVER_PORT))

def receive_message():
    while True:
        try:
            message = client_socket.recv(4096).decode()
            if message == "!NameREQUESTED":
                client_socket.send(username.encode())
                print('\033[2;;32mYou are connected!\033[0m')
            elif message[8:].split(':')[0] != username and message[10:].find(username) != 0:
                print(message)
        except:
            print('Error Occurred!')
            client_socket.close()
            break

def send_message():
    while True:
        client_socket.send(f"\x1B[;1;36m{username}:\033[0m \x1B[93m{input('')}\033[0m".encode())

receiver_thread = threading.Thread(target=receive_message)
sender_thread   = threading.Thread(target=send_message)

sender_thread.start()
receiver_thread.start()
# Coded By Parsa Yousefi Nejad