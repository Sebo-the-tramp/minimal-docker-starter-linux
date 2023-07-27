import requests
import time
import os
import pytz

from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

def send_message(bot_token, chat_id, message):
    url = f"https://api.telegram.org/bot{bot_token}/sendMessage"
    payload = {
        "chat_id": chat_id,
        "text": message,
        "parse_mode":"MarkdownV2"
    }
    response = requests.post(url, data=payload)
    if response.status_code != 200:
        print(f"Failed to send message. Response: {response.text}")
    else:
        print("Message sent successfully!")

# Replace with your bot token and chat ID
bot_token = os.environ.get('TELEGRAM_TOKEN')
chat_id = os.environ.get('CHAT_ID')

container_name = os.getenv('DOCKER_CONTAINER_NAME').replace("_", " ")

# Define your local timezone
local_tz = pytz.timezone('Europe/Berlin')  # replace 'Europe/Berlin' with your timezone
# Get the current time and adjust it to your local timezone
now_local = datetime.now(local_tz)
sentTime = "🕧 " + now_local.strftime("%H:%M:%S")

# read output
# Open the file in 'read' mode
with open('log.txt', 'r') as file:
    lines = file.readlines()

details = "\n📣\n```\n" + "".join(lines[-12:]) + "\n```"
message = "🎉 Finished Training 🎉\n\n" + sentTime + "\n🐳 " + container_name + details

print(message)

# Send the message
send_message(bot_token, chat_id, message)