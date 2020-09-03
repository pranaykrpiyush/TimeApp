import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location; // location name for the ui
  String time; // time in that location
  String flag; //URL to flag location
  String url; //location URL for API end-point 
  bool isDayTime; // true or false if day or night
  WorldTime ({this.location, this.flag, this.url});
  Future<void>  getTime() async{

    try{
    Response response = await get ('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    
    //get properties from date time;
    
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

    time = DateFormat.jm().format(now);
    }
    catch(e){
      time = 'Could not get time, check location provided';
    }
}  




  
}