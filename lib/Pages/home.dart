import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'choose_place');
                },
                icon: Icon(Icons.map_outlined, color: Colors.black,),
                label: Text(
                    "Choose Place",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['loc'],
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'Loading', arguments: {
                          'loc': data['loc'],
                          'url': data['url'],
                        });
                      },
                      icon: Icon(Icons.repeat, color: Colors.black,),
                      label: Text(
                        "Reload Time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
