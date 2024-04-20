import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String path;
  String flag;
  String baseWorldTimeURL = 'worldtimeapi.org';
  String baseWorldTimePath = '/api/timezone/';
  bool isDayTime = true;


  WorldTime({required this.location, required this.flag, required this.path}) {
    time = '';
  }


  Future<String> getTime() async {
    var timeUrl =
        Uri.https(baseWorldTimeURL, baseWorldTimePath+path, {'q': '{http}'});

    try {
      var timeResponse = await http.get(timeUrl);
      Map timeData = jsonDecode(timeResponse.body);

      //get properties from data
      String datatime = timeData['datetime'];
      String offset = timeData['utc_offset'];
      offset = offset.substring(1, 3);

      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour>6 &&  now.hour<19? true:false;
      time = DateFormat.jm().format(now);

      return DateFormat.jm().format(now);
    }catch(e){
      print('Error caught: $e');
      return 'Time fetch failed';
    }

  }
}

