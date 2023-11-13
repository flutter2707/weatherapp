import 'package:dio/dio.dart';

import '../model/model_class.dart';

// http://api.weatherapi.com/v1/current.json?key=2e091dec0ba44650acc112837231211&q=Tashkent&aqi=yes
// q=Tashkent&aqi=yes  Query parametrni ichiga kiradi

class NetService {
  final Dio _dio = Dio();

  Future<CurrentWeatherData> getCurrWeath (String shahar) async {
     Response response = await _dio.get('http://api.weatherapi.com/v1/current.json?key=2e091dec0ba44650acc112837231211',
      queryParameters: {
        "q": shahar,
        "aqi" : "yes"
      }
     );
     CurrentWeatherData currentWeatherData = CurrentWeatherData();

     currentWeatherData = await CurrentWeatherData.fromJson(response.data);

    //  model classdan olingan obyectimizga internetdan jsonni tenglaymiz

    return currentWeatherData;
  }

}