import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class SetTime {

  String url = "";
  String loc = "";
  String time = "";

  SetTime({ required this.loc, required this.url });

  Future<void> getData() async {

    try {

      //getting the http response
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      //getting the response info to convert as Map
      Map info = jsonDecode(response.body);
      //print(info);

      //picking up the time map from the body and setting to a variable
      String dateTime = info['datetime'];
      String offSetHours = info['utc_offset'].substring(0,3);
      String offSetMin = info['utc_offset'].substring(4,6);
      //print(offSetMin);

      //creating an DateTime object called "now" and updating the time
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSetHours), minutes: int.parse(offSetMin)));
      //print(now);

      //changing the format of time and setting it to time var
      time = DateFormat.jm().format(now);
      //print(time);

    }//try

    catch (error) {

      print("ERROR ON : $error");
      time = "ERROR";

    }//catch

  }//getData()

}//SetTime - class
