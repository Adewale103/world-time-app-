import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
   WorldTime worldTime = WorldTime(location: "Paris", flag: 'France.png', url: "Europe/Paris");
   await worldTime.getTime();
   Navigator.pushReplacementNamed(context, "/home", arguments: {
     "location" : worldTime.location,
     "time" : worldTime.time,
     "flag" : worldTime.flag,
     "dayTime" : worldTime.dayTime
   });

  }
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[800],
      body : Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
