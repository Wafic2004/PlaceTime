import 'package:flutter/material.dart';
import 'package:place_time/setTime/setTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map setData = {};

  void setWorldTime() async {

    SetTime instance = SetTime(loc: setData['loc'], url: setData['url']);
    await instance.getData();
    Navigator.pushReplacementNamed(context, 'Home', arguments: {
      'loc': instance.loc,
      'time': instance.time,
      'url': setData['url'],
    });

  }

  @override
  Widget build(BuildContext context) {
    setData = ModalRoute.of(context)!.settings.arguments as Map;
    setWorldTime();
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
  
}
