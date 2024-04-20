import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:place_time/setTime/setTime.dart';

class ChoosePlace extends StatefulWidget {
  const ChoosePlace({super.key});

  @override
  State<ChoosePlace> createState() => ChoosePlacesState();
}

class ChoosePlacesState extends State<ChoosePlace> {

  List<SetTime> Locs_Asia = [
    //asia regions
    SetTime(loc: "Kolkata", url: "Asia/Kolkata"),
    SetTime(loc: "Dubai", url: "Asia/Dubai"),
    SetTime(loc: "Singapore", url: "Asia/Singapore"),
    SetTime(loc: "Hong_Kong", url: "Asia/Hong_Kong"),
    SetTime(loc: "Gaza", url: "Asia/Gaza"),
    SetTime(loc: "Riyadh", url: "Asia/Riyadh"),
    SetTime(loc: "Tokyo", url: "Asia/Tokyo"),
    SetTime(loc: "Shanghai", url: "Asia/Shanghai"),
  ];

  List<SetTime> Locs_America = [
    //america regions
    SetTime(loc: "Mexico_City", url: "America/Mexico_City"),
    SetTime(loc: "New_York", url: "America/New_York"),
  ];

  List<SetTime> Locs_Europe = [
    //europe regions
    SetTime(loc: "London", url: "Europe/London"),
    SetTime(loc: "Moscow", url: "Europe/Moscow"),
  ];

  List<SetTime> SetLoc = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: TweenAnimationBuilder(
          child: Text(
              "CHOOSE PLACE",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 5.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 1500),

          builder: (BuildContext context, double twe, Widget? child) {
            return Opacity(
              opacity: twe,
              child: Padding(
                padding: EdgeInsets.only(top: twe * 10),
                child: child,
              ),
            );
          },
        ),
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 15,),

          Padding(
              padding: EdgeInsets.only(left: 0),
            child: Text(
              "REGIONS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 10),

          Container(
            height: 200,
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    onTap: () {
                     setState(() {
                       SetLoc = Locs_Asia;
                     });
                    },
                    title: Center(
                      child: Text(
                        "ASIA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        SetLoc = Locs_America;
                      });
                    },
                    title: Center(
                      child: Text(
                        "AMERICA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        SetLoc = Locs_Europe;
                      });
                    },
                    title: Center(
                      child: Text(
                        "EUROPE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    onTap: () {},
                    title: Center(
                      child: Text(
                        "IN FUTURE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),

          Divider(
            height: 50,
            color: Colors.green,
            thickness: 2,
          ),

          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              "PLACES",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                itemCount: SetLoc.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                     onTap: () {
                       Navigator.pushReplacementNamed(context, 'Loading', arguments: {
                         'loc': SetLoc[index].loc,
                         'url': SetLoc[index].url,
                       });
                     },
                      title: Center(
                        child: Text(
                           SetLoc[index].loc.toUpperCase(),
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 15,
                         ),
                       ),
                     ),
                   ),
                 );
                }
                ),
          ),
        ],
      ),
    );
  }
}
