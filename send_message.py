from fbchat import Client
from fbchat.models import *

client = Client("abc@gmail.com", "sljflsj")

# group_id = "6602094873181820"
# message = "Accah"

client.send(Message(text=message), thread_id=group_id, thread_type=ThreadType.GROUP)

client.logout()
