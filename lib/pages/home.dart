import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  
  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    
    return Scaffold(
       backgroundColor: Colors.grey[300],
       body: SafeArea(
         child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('images/$bgImage'),
             fit: BoxFit.cover,
             )
           ),
          child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
             
           child:  Column(
               children: <Widget>[
                 FlatButton.icon(
                  onPressed: () async{
                  dynamic result = await   Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': result['location'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey,

                  ),
                  label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                      )
                  ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 3.0,
                      color: Colors.white,
                    ),
                    ),
                  

               ],
             ),
             ),
         ),
       ) ,
    );
  }
}