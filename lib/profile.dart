import 'package:flutter/material.dart';
import 'package:job_spri/variables.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    Variables variable = new Variables();

    return Scaffold(
      body: Stack(
        children: [
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
           child: ListView(
             children: [
               SizedBox(height: 30),
               Padding(
                 padding: const EdgeInsets.only(left:20.0, right: 20.0),
                 child: MaterialButton(
                   height: categoryHeight/7,
                   onPressed: (){},
                   shape:  RoundedRectangleBorder(
                       side: BorderSide(
                         color: Colors.pinkAccent,
                         width: 1.0,
                       ),
                       borderRadius: BorderRadius.circular(30.0)),

                   // color: Color(0xff4D2136),
                   splashColor: Color(0xff4D2136),
                   child: Column(
                     children: [
                       variable.text2("Work Experience", 20.0, Colors.white, FontWeight.bold),
                       SizedBox(height: 5,),
                       variable.text2("Select relevant Preference And job expectations that you are looking for as your dream job.", 15.0, Colors.white, FontWeight.normal),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
