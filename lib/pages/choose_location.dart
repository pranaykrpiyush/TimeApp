import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseL extends StatefulWidget {
  ChooseL({Key key}) : super(key: key);

  @override
  _ChooseLState createState() => _ChooseLState();
}

class _ChooseLState extends State<ChooseL> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpeg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.jpeg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpeg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpeg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpeg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpeg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpeg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpeg'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDayTime': instance.isDayTime,

    } 
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Chooose Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}')),
              ),
            ),
          );
        },
      ),
    );
  }
}
