import 'package:climatee/services/location.dart';
import 'package:climatee/services/networking.dart';

const apiKey = '24e235c2ae7b2e5481a37214b55769f0';
const networkURL = 'https://api.openweathermap.org/data/2.5';

class WeatherModel {
  Future<dynamic> getWeather(String cityName) async {
    Networkhelper networkHelper = Networkhelper('$networkURL/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;

    Networkhelper networkHelper = Networkhelper('$networkURL/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getThreeDayForecast(String cityName) async {
    Networkhelper networkHelper = Networkhelper('$networkURL/forecast?q=$cityName&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    return forecastData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
