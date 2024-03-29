import 'package:flutter/material.dart';
import 'package:climatee/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var WeatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: WeatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 15,
        ),
      ),
    );
  }
}
