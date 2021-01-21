#!/bin/sh


# Set local port from command line arg or default to 8080
#LOCAL_PORT=${1-8080}
LOCAL_PORT=${1-31380}

echo "Start ngrok in background on port [ $LOCAL_PORT ]"
#nohup ngrok http ${LOCAL_PORT} &>/dev/null  &
nohup ngrok http 31380 2&1> ngrok.log --authtoken=1gSHtr6Di9mPP96hj5cho3xAMAE_25SbpHJSnJeziEkzb71vZ &
#nohup ngrok http 31380 -log=stdout &> ngrok.log --authtoken=1gSHtr6Di9mPP96hj5cho3xAMAE_25SbpHJSnJeziEkzb71vZ &

echo -n "Extracting ngrok public url ."
NGROK_PUBLIC_URL=""
while [ -z "$NGROK_PUBLIC_URL" ]; do
  # Run 'curl' against ngrok API and extract public (using 'sed' command)
  export NGROK_PUBLIC_URL=$(curl --silent --max-time 10 --connect-timeout 5 \
                            --show-error http://127.0.0.1:4040/api/tunnels | \
                            sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
  sleep 1
  echo -n "."
done

echo
echo "NGROK_PUBLIC_URL => [ https://$NGROK_PUBLIC_URL ]"
