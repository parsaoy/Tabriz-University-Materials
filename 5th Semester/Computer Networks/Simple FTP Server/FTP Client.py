# ************ Parsa Yousefi Nejad ************
# ************* Simple FTP Server *************
"""
2nd Computer Networks Project

(((FTP Client Code)))
"""
from ftplib import FTP

FTP_HOST, FTP_PORT = ('localhost', 666) 
FTP_USER, FTP_PASSWORD =('King', '123451')

# Connect to the FTP server
ftp = FTP()
ftp.connect(FTP_HOST, FTP_PORT)
ftp.login(FTP_USER, FTP_PASSWORD)


#-------------------------------------------------------------------------
##............... Uploading a file. : Address of ClientFTP code
file_to_upload = 'UploadDesktop.mp4'
upload_address_file = '/Users/parsa/Desktop/' + file_to_upload
with open(upload_address_file, 'rb') as file:
    ftp.storbinary('STOR '+file_to_upload, file)
    
print(f"\n\033[4;42;30m{file_to_upload} Uploaded Successfully.\033[0m")
#............... End of Uploading Procedure
#-------------------------------------------------------------------------
##............... Downloading a file. : Address of FTP Server
file_to_download = 'PaperDownloads.pdf'  
with open(file_to_download, 'wb') as file:
    ftp.retrbinary(f'RETR {file_to_download}', file.write)

print(f"\033[1;42;34mFile {file_to_download} downloaded successfully.\033[0m")
#............... End of Downloading Procedure
#-------------------------------------------------------------------------
##............... LS -la.
file_list = ftp.nlst()  # To get only the file names
print('\n\x1B[41;1;35m ls (showing Files and Folders)\033[0m')
for name in file_list:
    print(f"\033[3;43;30m{name}\033[0m")
##............... .
ftp.quit()
# Coded By Parsa Yousefi Nejad