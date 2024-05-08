<?php

function dateTimeFormat($date_time)
{

$date_time = explode(" ",$date_time);
$date = explode("-", $date_time[0]);
$date = "$date[2].$date[1].$date[0]";

$time = explode(":",$date_time[1]);
$time = "$time[0]:$time[1]";

$date_time = "$date - $time";
return($date_time);
}

?>