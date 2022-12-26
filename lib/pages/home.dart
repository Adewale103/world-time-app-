import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['dayTime'] ? 'day2.jpg' : 'night.jpeg';
    Color bgColour = data['dayTime'] ? Colors.blue : Colors.indigo;
    return  Scaffold(
      backgroundColor: bgColour,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.fill
            )
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
              child: Column(
                children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "location" : result["location"],
                        "time" : result["time"],
                        "flag" : result["flag"],
                        "dayTime" : result["dayTime"]
                      };
                    });
                    },
                    icon: Icon(Icons.edit_location),

                    label: Text(
                        "Edit Location",
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text(
                        data["location"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          letterSpacing: 2
                        )
                      ),
                       ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        data["time"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 66.0,
                        ),
                      )
                ],

              )),
        ),
      ),

    );
  }
}
