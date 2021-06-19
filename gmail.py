import smtplib
from email.message import EmailMessage
msg=EmailMessage()
msg['Subject']='Prithvi is logging in'
msg['From']='prithvi Laptop'
msg['To']='prithvilee007@gmail.com'
msg.set_content('prithvi is logging in..!')
server=smtplib.SMTP_SSL("smtp.gmail.com",465)
server.login('prithvilee22@gmail.com','**********')
server.send_message(msg)
server.quit()