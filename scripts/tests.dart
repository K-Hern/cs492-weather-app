import './forecast.dart' as forecast;

Future<void> main() async {
  // TODO: Seach for latitutes and longitudes of 5 cities in the US on the internet
  List<List<double>> coordinates = [
    [44.05, -121.31],
    [40.71, -74.006],
    [41.878, -87.629],
    [25.7617, -80,1918],
    [35.0844, -106.65]
  ];

  // Create a for loop that will generate forecasts arrays for each city
  // TODO: create forecasts and forecastsHourly both of type List<forecast.Forecast>
  for (List<double> coord in coordinates){
    List<forecast.Forecast> forecasts = await forecast.getForecastFromPoints(coord[0], coord[1]);
    print(forecasts);

    List<forecast.Forecast> hourlyForecasts = await forecast.getForecastHourlyFromPoints(coord[0], coord[1]);
    print(hourlyForecasts);
  }
  

}