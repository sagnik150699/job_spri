import 'package:flutter/material.dart';
import 'package:job_spri/profile.dart';

import 'variables.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    Variables variable = new Variables();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4D2136),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("How Jobspri works?"),
            IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation,
                        Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.slowMiddle);

                      return ScaleTransition(
                        alignment: Alignment.centerLeft,
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondAnimation) {
                      return Profile();
                      // MaterialPageRoute(
                      //     builder: (context) => Profile()),
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color(0xff1B1A2A),
                const Color(0xff1B192A),
                const Color(0xff4D2136),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                SizedBox(height: 30),
                Container(
                  height: categoryHeight / 6,
                  width: categoryWidth / 1.5,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),

                    // color: Color(0xff4D2136),
                    splashColor: Color(0xff4D2136),

                    child: Column(
                      children: [
                        variable.text2(
                            "How", 20.0, Colors.white, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        variable.text2(
                            "Select relevant Preference And job expectations that you are looking for as your dream job.",
                            15.0,
                            Colors.white,
                            FontWeight.normal),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: categoryHeight / 6,
                  width: categoryWidth / 1.5,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),

                    // color: Color(0xff4D2136),
                    splashColor: Color(0xff4D2136),

                    child: Column(
                      children: [
                        variable.text2(
                            "How", 20.0, Colors.white, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        variable.text2(
                            "Select relevant Preference And job expectations that you are looking for as your dream job.",
                            15.0,
                            Colors.white,
                            FontWeight.normal),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: categoryHeight / 6,
                  width: categoryWidth / 1.5,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),

                    // color: Color(0xff4D2136),
                    splashColor: Color(0xff4D2136),

                    child: Column(
                      children: [
                        variable.text2(
                            "How", 20.0, Colors.white, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        variable.text2(
                            "Select relevant Preference And job expectations that you are looking for as your dream job.",
                            15.0,
                            Colors.white,
                            FontWeight.normal),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: categoryHeight / 6,
                  width: categoryWidth / 1.5,
                  child: MaterialButton(
                    height: categoryHeight / 7,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),

                    // color: Color(0xff4D2136),
                    splashColor: Color(0xff4D2136),

                    child: Column(
                      children: [
                        variable.text2(
                            "How", 20.0, Colors.white, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        variable.text2(
                            "Select relevant Preference And job expectations that you are looking for as your dream job.",
                            15.0,
                            Colors.white,
                            FontWeight.normal),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                //Next Button
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: MaterialButton(
                    child: variable.text2(
                        "Next", 30.0, Colors.white, FontWeight.bold),
                    height: categoryHeight / 15,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    // color: Color(0xff4D2136),
                    splashColor: Color(0xff4D2136),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
