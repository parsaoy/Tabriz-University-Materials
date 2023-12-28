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

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((SERVER_HOST, SERVER_PORT))
server_socket.listen()                  

connected_clients, client_usernames = [], []

def broadcast_message(message):                 #message should be encoded beforehand
    for client in connected_clients:
        try:
            client.send(message)
        except socket.error:
            handle_client_disconnect(client)

def handle_client(client):
    while True:
        try:
            message = client.recv(4096)
            if message:
                broadcast_message(message)
        except (socket.error, OSError):
            handle_client_disconnect(client)
            break

def handle_client_disconnect(client):
    if client in connected_clients:
        client_index = connected_clients.index(client)
        connected_clients.remove(client)
        client.close()
        username = client_usernames[client_index]
        client_usernames.remove(username)
        broadcast_message(f'\x1B[41;1;35m{username} has left the chatroom\033[0m'.encode())

def receive_connections():
    
    print('\033[4;42;30mServer is running\033[0m')
    print(f'\033[4;42;30mServer is listening to port \033[3;43;30m{SERVER_PORT}\033[0m\033[0m')

    while True:
        try:
            client_socket, address = server_socket.accept()             #3 way handshaking
            print(f'\033[1;42;34m{str(address)} is connected\033[0m')

            client_socket.send('!NameREQUESTED'.encode())
            username = client_socket.recv(1024).decode().strip()

            connected_clients.append(client_socket)
            client_usernames.append(username)

            print(f'New client connected: {username}')

            broadcast_message(f'\033[3;45;37m{username} has joined the chat\033[0m'.encode())

            thread = threading.Thread(target=handle_client, args=(client_socket,))
            thread.start()
            
        except socket.error:
            print('An error occurred while accepting a new connection.')


receive_connections()
# Coded By Parsa Yousefi Nejad