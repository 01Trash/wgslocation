import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override 
  _AppState createState() => _AppState(); 
}

class _AppState extends State<App> {

  String _locationMessage = ""; 

  void _getCurrentLocation() async {

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "Enlem: ${position.latitude}\nBoylam: ${position.longitude}\n";
    });

  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("WGS 84 Koordinat")
        ),
        body: Align(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(_locationMessage), 
            FlatButton(
              onPressed: () {
                  _getCurrentLocation();
              },
              color: Colors.green,
              child: Text("Konum Bul")
            )
          ]),
        )
      )
    );
  }
}

