import requests
import time

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
bot_token = "6028786366:AAHVKMZcUcKtxqbSey-L04y12u7A4FEcliI"
chat_id = "777722458"


reason = "🤔REASON: Training GPUs"
sentTime = "🕧TIME: " + time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

# Replace with the message you want to send
message = "\nMessage:\nTraining done\n\n"

data = reason + "\n" + sentTime + "\n" + message

# Send the message
send_message(bot_token, chat_id, message)