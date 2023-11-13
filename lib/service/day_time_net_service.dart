import 'package:dio/dio.dart';
import '../model/day_time_weather.dart';
// http://api.weatherapi.com/v1/forecast.json?key=2e091dec0ba44650acc112837231211&q=Tashkent&days=1&aqi=yes&alerts=no
class DayTimeNetService {
  final Dio _dio = Dio();
  Future<DayTimeWeather> soatWeather(String city) async {
    // http://api.weatherapi.com/v1/forecast.json?key=2e091dec0ba44650acc112837231211
    Response response = await _dio.get("http://api.weatherapi.com/v1/forecast.json?key=2e091dec0ba44650acc112837231211",
      queryParameters: {
        'q' : city,
        'days' : 7,
        'aqi' : 'yes',
        'alerts' : 'no'
      }
    );
    DayTimeWeather dayTimeWeather = DayTimeWeather();
    dayTimeWeather = await DayTimeWeather.fromJson(response.data);
    return dayTimeWeather;
  }
}