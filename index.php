<?php 
require_once "Chatwork.php";
 
define("CHATWORK_ROOM_ID", );
define("CHATWORK_TO_ID"  , "");

$url = "http://www.gafa/";

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

curl_exec($ch);
$res =  curl_getinfo($ch);

if(floor($res["total_time"]) < 5){
    $body = "正常です";
} else {
    $body = "リクエストタイムは".floor($res["total_time"])."秒。基準値以下です。";
}

curl_close($ch);

Chatwork::postMessage(CHATWORK_ROOM_ID, $body);
?>