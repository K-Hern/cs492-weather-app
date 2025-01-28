import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/widgets/forecast_summary_widget.dart';

class ForecastSummaries extends StatelessWidget {
  const ForecastSummaries({
    super.key,
    required this.forecasts,
  });

  final List<forecast.Forecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final forecast in forecasts)
          ForecastSummaryWidget(currentForecast: forecast),
      ],
    );
  }
}
