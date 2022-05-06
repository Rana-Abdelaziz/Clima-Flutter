import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '1315f8a6652682f67bb9d63b93e6c438';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    Network_Helper network = Network_Helper(url);
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    location_Service location_service = location_Service();
    await location_service.getLocation();
    Network_Helper network_helper = Network_Helper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location_service.Latitude}&lon=${location_service.Longitude}&appid=$apiKey&units=metric');
    //will return response body decoded
    var weatherData = await network_helper.getData();
    return weatherData;
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
