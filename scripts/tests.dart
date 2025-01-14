import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  String pointsUrl = "https://api.weather.gov/points/44.058,-121.31";
  Map<String, dynamic> pointsJsonData = await getJsonFromUrl(pointsUrl);

  String forecastUrl = pointsJsonData["properties"]["forecast"];
  String forecastHourlyUrl = pointsJsonData["properties"]["forecastHourly"];

  Map<String, dynamic> forecastJsonData = await getJsonFromUrl(forecastUrl);
  Map<String, dynamic> forecastHourlyJsonData = await getJsonFromUrl(forecastHourlyUrl);

  print("complete");
  print(forecastJsonData);

  processForecasts(forecastJsonData["properties"]["periods"]);
  processForecasts(forecastHourlyJsonData["properties"]["periods"]);

  return;
}

Future<Map<String, dynamic>> getJsonFromUrl(String url) async {
  http.Response r = await http.get(Uri.parse(url));
  return convert.jsonDecode(r.body);
}

void processForecasts(List<dynamic> forecasts){
  // TODO: pass the array of forecasts in from main
  // For loop through the forecasts and process each forecast with the
  // processForecast function below
    for (var index = 0; index < forecasts.length; index++) {
      var forecast = forecasts[index];
      processForecast(forecast);
    }
}

void processForecast(Map<String, dynamic> forecast){
  // TODO: Pass a forecast entry (either hourly or bidaily), and extract
  // The proper values that will be useful. i.e. temperature, shortForecast, longForecast
  // for now, don't return anything, just assign values for each
  // i.e. String shortForecast = "";

  String number = forecast["number"];
  String name = forecast["name"];
  String startTime = forecast["startTime"];
  String endTime = forecast["endTime"];
  String isDayTime = forecast["isDayTime"];
  String temperature = forecast["temperature"];
  String temperatureUnit = forecast["temperatureUnit"];
  String temperatureTrend = forecast["temperatureTrend"];
  String windSpeed = forecast["windSpeed"];
  String windDirection = forecast["windDirection"];
  String icon = forecast["icon"];
  String shortForecast = forecast["shortForecast"];
  String detailedForecast = forecast["detailedForecast"];

  print(number);
  print(name);
  print(startTime);
}