#!/bin/sh
# declare -A input_urls
input_urls=(
    [0]="https://www"
    [1]="https;//test"
    [2]="https;//test"
    [3]="https;//test"
    [4]="https;//test"
    [5]="https;//test"
)

# declare -A input_sites
input_urls=(
    [0]="test0"
    [1]="test1"
    [2]="test2"
    [3]="test3"
    [4]="test4"
    [5]="test5"
)

# declare -A unusual_arr
unusual_arr()
for ((i=0;i<1;i++))
do 
    curl='curl -s --connect-timeout 60 -o /dev/null -w %{time_total} "${input_urls[$i]}"'
    c_res=${curl%.*}

    if [ $c_res -gt 3 ]
    then
        unusual_arr+=(["${inpyut_sites[$i]}"]="${input_urls[$i]}")
    fi
done

kakunin_arr()
if [ ${#unusual_arr[@] -eq 0} ]
    then
        message="稼働確認完了しました。異常なし"
    else
        {
            echo "[info]"
            echo "[title]稼働点検で基準値を満たさない対象がありました。[/title]"
            echo "下記のサイトを確認してください"
        } >> post_message.txt
    for site_name in ${!unusual_arr[@]}
    do
        {
            echo "$site_name: ${unusual_arr[$site_name]}"
        } >> post_message.txt
    done
        {
            echo "[/info}"
        } >> post_message.txt
    message='cat post_message.txt'
fi

# post_to_chatwork() {
#     CHATWORK_TOKEN=''
#     CHATWORK_ROOM_ID=''
#     url="https://api.chatwork.com/v2/rooms/${CHATWORK_ROOM_ID}/messages"

#     curl -k -s -X POST -H "X-ChatWorkToken: ${CHATWORK_TOKEN}" -d "body=$message" $url
# }

# post_to_chatwork
exit
