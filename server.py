# echo_server.py
import socket
import smtplib
import base64
from random import randint

global marker
marker = "AUNIQUEMARKER"

global part1
# Define the main headers.
part1 = """From: TPO IIT BHU <mes@gmail.com>
To: Concerned Person <to_person@gmail.com>
Subject: Email veriication
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=%s
--%s
""" % (marker, marker)

host = 'localhost'
port = 12345
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)

while True:
    conn, addr = s.accept()
    print ('client Connected ', addr)
    flag=1
    if flag:

        data = conn.recv(1024)
        data=data.decode("utf-8")
        data=str(data)
        try:
            print(data)

            gmail_user='sj380676@gmail.com'
            gmail_pwd='9782240033'

            sender = 'smtbtest@gmail.com'
            reciever=data

            OTP=randint(0,999999)
            OTP=str(OTP)



            body ="""
            Your OTP is %s
            """ %(OTP)


            message = part1 + body

            try:
               #smtpObj.ehlo()
               #smtpObj.starttls()
               #smtpObj.login(gmail_user,gmail_pwd)
               #smtpObj.sendmail(sender, reciever, message)
               print "Successfully sent email"
               flag=0
               #smtpObj.quit()
            except Exception:
               print "Error: unable to send email"

            data=OTP
            print data
            data=data.encode("utf-8")
            conn.sendall(data)
            conn.close()
        except:
            print("Invalid Input by Client")
            data="Enter a proper expression"
            data=data.encode("utf-8")
            conn.sendall(data)
