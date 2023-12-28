# ************ Parsa Yousefi Nejad ************
# ************* Simple FTP Server *************
"""
2nd Computer Networks Project

(((FTP Client Code)))
"""
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

FTP_HOST, FTP_PORT = ('localhost', 666) 
FTP_USER, FTP_PASSWORD =('King', '123451')
FTP_ROOT_DIR = '/Users/parsa/Downloads'

authorizer = DummyAuthorizer()
authorizer.add_user(FTP_USER, FTP_PASSWORD, FTP_ROOT_DIR, perm='elradfmw')

handler = FTPHandler
handler.authorizer = authorizer

server = FTPServer((FTP_HOST, FTP_PORT), handler)

print(f"\033[1;44;35mFTP Server is listening on\033[0m {FTP_HOST}:{FTP_PORT}")
server.serve_forever()
# Not Coded Completely By Parsa Yousefi Nejad