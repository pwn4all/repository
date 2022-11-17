
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import smtplib, ssl, base64, re

from email import encoders
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


########################################################################
## get message for sending
########################################################################
def get_message(filename):
    message = ''
    with open(filename, 'r') as fd:
        lines = fd.readlines()
        for line in lines:
            message = message + line.rstrip()

    return message


########################################################################
## get receiver list
########################################################################
def get_receivers(filename):
    receivers = list()
    with open(filename, 'rb') as fd:
        lines = fd.readlines()
        for line in lines:
            line = line.decode('ascii').strip()
            receivers.append(line)
    # print(receivers)
    return receivers


########################################################################
## get username and password for auth
########################################################################
def get_sender(filename):
    username = ""
    userpass = ""
    with open(filename, 'rb') as fd:
        for line in fd.readlines():
            if line.decode('ascii').startswith('username='):
                username = line[len('username='):].strip()
            elif line.decode('ascii').startswith('userpass='):
                userpass = line[len('userpass='):].strip()
    # print(username, userpass)
    return username, userpass


########################################################################
## base54 decoder for account info
########################################################################
def b64_decoder(username, userpass):
    username = base64.b64decode(username).decode('ascii')
    userpass = base64.b64decode(userpass).decode('ascii')
    # print(username, userpass)
    return username, userpass


########################################################################
## call only one time in case of first account setting
## save base64 encoded username and userpass to a file
########################################################################
def b64_encoder(filename):
    username = b'gmail_sender_account@gmail.com'
    username = base64.b64encode(username).decode('ascii')
    userpass = b'abcd efgh abcc efgk'
    userpass = base64.b64encode(userpass).decode('ascii')

    # print(username, userpass)
    with open(filename, 'w') as fd:
        fd.write(f'username={username}\n')
        fd.write(f'userpass={userpass}')


########################################################################
## create MIMEMultipart object and set the object
########################################################################
def set_email(sender, receiver, subject):
    # create MIMEMultipart object
    # msg = MIMEMultipart("alternative")
    msg = MIMEMultipart()
    msg["Subject"] = subject
    msg["From"] = sender
    msg["To"] = ','.join(receiver)

    return msg


########################################################################
## global variables
########################################################################
path = '/Documents/workcharm/do_test/sendmail/'
file_sender = 'list_sender.txt'
file_receiver = 'list_receivers.txt'
file_message = 'content.html'
file_attach = 'content.html'

subject = 'hello report'

########################################################################
## call only one time in case of first account setting
########################################################################
b64_encoder(path+file_sender)


########################################################################
## get username and userpass to a file
########################################################################
username, userpass = get_sender(path+file_sender)
username, userpass = b64_decoder(username, userpass)
# print(username, userpass)


########################################################################
## get receiver list
########################################################################
receivers = get_receivers(path+file_receiver)
# for receiver in receivers:
#     print(type(receiver))
# print(receivers)


########################################################################
## need to set coder
########################################################################
def chg_content(content):
    content = re.sub("TITLE-GREEN-1111", "GREEN-Report", content)

    content = re.sub("COL-GREEN-1111", "Company", content)
    content = re.sub("COL-GREEN-2222", "Country", content)
    content = re.sub("COL-GREEN-3333", "Name", content)
    content = re.sub("COL-GREEN-4444", "Email", content)

    content = re.sub("ROW-GREEN-1111", "Hello Company", content)
    content = re.sub("CELL-GREEN-AAAA", "Germany", content)
    content = re.sub("CELL-GREEN-BBBB", "Muller", content)
    content = re.sub("CELL-GREEN-CCCC", "muller@hello.company", content)

    content = re.sub("ROW-GREEN-2222", "World Company", content)
    content = re.sub("CELL-GREEN-DDDD", "Australia", content)
    content = re.sub("CELL-GREEN-EEEE", "Anderson", content)
    content = re.sub("CELL-GREEN-FFFF", "anderson@world.company", content)

    content = re.sub("ROW-GREEN-3333", "Earth Company", content)
    content = re.sub("CELL-GREEN-GGGG", "U.S.A", content)
    content = re.sub("CELL-GREEN-HHHH", "Clark", content)
    content = re.sub("CELL-GREEN-IIII", "clark@earth.company", content)

    return content


########################################################################
## set email
########################################################################
msg = set_email(username, receivers, subject)

content = get_message(path+file_message)
content = chg_content(content)


########################################################################
## create MIMEMultipart object and set the object
########################################################################
part = MIMEText(content, 'html')
msg.attach(part)


########################################################################
## add Attach
########################################################################
with open(file_attach, "rb") as attachment:
    part = MIMEBase("application", "octet-stream")
    part.set_payload(attachment.read())

encoders.encode_base64(part)

part.add_header(
    "Content-Disposition",
    "attachment", filename=file_attach
)
msg.attach(part)


########################################################################
## connect SMTP and send email
########################################################################
context = ssl.create_default_context()
with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as conn:
    conn.login(username, userpass)
    for receiver in receivers:
        # conn.login(username, userpass)
        conn.sendmail( username, receiver.split(','), msg.as_string() )

