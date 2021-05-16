#!/bin/sh
post_to_chatwork() {
    CHATWORK_TOKEN=''
    CHATWORK_ROOM_ID=''
    url="https://api.chatwork.com/v2/rooms/${CHATWORK_ROOM_ID}/messages"

    message='hahaha'

    curl -k -s -X POST -H "X-ChatWorkToken: ${CHATWORK_TOKEN}" -d "body=$message" $url
}

post_to_chatwork

exit
