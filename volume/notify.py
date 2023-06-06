import requests
import time
import os

from dotenv import load_dotenv

load_dotenv()

def send_message(bot_token, chat_id, message):
    url = f"https://api.telegram.org/bot{bot_token}/sendMessage"
    payload = {
        "chat_id": chat_id,
        "text": data
    }
    response = requests.post(url, data=payload)
    if response.status_code != 200:
        print(f"Failed to send message. Response: {response.text}")
    else:
        print("Message sent successfully!")

# Replace with your bot token and chat ID
bot_token = os.environ.get('TELEGRAM_TOKEN')
chat_id = os.environ.get('CHAT_ID')

reason = "🤔REASON: Training GPUs"
sentTime = "🕧TIME: " + time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

# Replace with the message you want to send
message = "\nMessage:\nTraining done\n\n"

data = reason + "\n" + sentTime + "\n" + message

# Send the message
send_message(bot_token, chat_id, message)