<?php
define("API_URL", "https://api.chatwork.com");
define("CHATWORK_TOKEN", "");
 
class Chatwork{
    public static function postMessage($room_id, $body){
        $headers = [ "X-ChatWorkToken: " . CHATWORK_TOKEN ];
        $option = [ 'body' => $body ];
        $curl = curl_init(API_URL . "/v2/rooms/${room_id}/messages" );
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($option));
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($curl);
        curl_close($curl);
        return $result;
    }
}