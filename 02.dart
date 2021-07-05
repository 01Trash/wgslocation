import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // ignore: avoid_print
    //print(position);

    setState(() {
      _locationMessage =
          "Enlem: ${position.latitude.toStringAsFixed(7)}\nBoylam: ${position.longitude.toStringAsFixed(7)}\n";
    });

    return _getCurrentLocation();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("WGS 84 Koordinat")),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_locationMessage),
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    _getCurrentLocation();
                  },
                  color: Colors.green,
                  child: const Text("Konum Bul"))
            ],
          ),
        ),
      ),
    );
  }
}
