import 'package:http/http.dart';
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.Url);
  final String Url;

  Future getData() async {
    Response response = await get(Uri.parse(Url));

    if (response.statusCode == 200) {
      try {
        String data = response.body;
        // print('Weather Data: ${response.body}');
        // You can parse and handle the weather data here.

        var weatherDesc = jsonDecode(data);
        return weatherDesc;
      }
      catch (e){
        print("error: $e");
      }
    } else {
      print(
          'Failed to fetch weather data. Status code: ${response.statusCode}');
      // Handle the error or retry the request.
    }
  }
}
