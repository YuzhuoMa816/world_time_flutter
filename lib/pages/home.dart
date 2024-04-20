import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataFromChooseLocation = {};


  Map renderingData = {};
  @override
  Widget build(BuildContext context) {
    var loadingPageArgument = ModalRoute.of(context)?.settings.arguments;
    if (dataFromChooseLocation.isEmpty) {
      if (loadingPageArgument != null && loadingPageArgument is Map<dynamic, dynamic>) {
        renderingData = loadingPageArgument;
      } else {
        print("Argument passing wrong from loading");
      }
    }else{
      renderingData = dataFromChooseLocation;
    }

    // set background
    String bgImage =
    renderingData['isDayTime'] ? 'pic_daytime.jpg' : 'pic_night.jpg';
    Color bgColor = renderingData['isDayTime'] ? Colors.blue : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('Assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        dataFromChooseLocation = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],
                        };
                      });
                    }else{
                      dataFromChooseLocation = {};
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_location,
                          color: Colors.grey[500],
                        ),
                        Text(
                          'Edit location',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ])),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    renderingData['location'],
                    style: const TextStyle(
                        fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                renderingData['time'],
                style: const TextStyle(
                  fontSize: 66,
                    color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
