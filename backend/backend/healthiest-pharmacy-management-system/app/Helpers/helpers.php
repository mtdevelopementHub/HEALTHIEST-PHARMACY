<?php

use Illuminate\Support\Carbon;






function checkStatus($orderDuration, $startTime)
{
    $deliveryTime = Carbon::parse($orderDuration)->addMinutes($orderDuration);
    $startTime = Carbon::parse($startTime);

    $difference = Carbon::now() - $startTime;

    if (!Carbon::now() > $deliveryTime) {

        dd($difference);

    }
}


//   // Define your query parameters
//   Map<String, String> queryParams = {
//     'param1': 'value1',
//     'param2': 'value2',
//   };

//   // Build the URL with query parameters
//   String url = baseUrl + endpoint + '?' + Uri(queryParameters: queryParams).query;