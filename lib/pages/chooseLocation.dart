import 'package:flutter/material.dart';
import 'package:my_flutter_app/services/worldTime.dart';

class chooseLocation extends StatefulWidget {
  const chooseLocation({super.key});

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  List<WorldTime> locations = [
    WorldTime(path: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(path: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(path: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(path: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(path: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(path: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(path: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(path: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(path: 'Asia/Shanghai', location: 'Beijing', flag: 'china.png'),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'Assets/${locations[index].flag}'
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
