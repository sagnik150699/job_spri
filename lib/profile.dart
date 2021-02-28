import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_spri/variables.dart';

import 'services/database.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    bool inputName= false;
    Variables variable = new Variables();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4D2136),
        title: variable.text2("Profile", 25.0, Colors.white, FontWeight.bold),
      ),
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
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  //Name
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: categoryHeight / 15,
                    //width: categoryWidth / 3,
                    color: Color(0xff4D2136),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          variable.text2(
                              "Name", 20.0, Colors.white, FontWeight.bold),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: (){setState(() {
                          inputName=true;
                        });}),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Input Name
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    height: categoryHeight / 15,
                    //color: Color(0xff4D2136),
                    child: inputName?
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.pinkAccent),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          // prefixIcon: IconButton(
                          //   focusColor: Colors.white,
                          //   onPressed: (){print("Icon profile");},
                          //   icon: Icon(
                          //     Icons.save,
                          //     color: Colors.pinkAccent,
                          //   ),
                          // ),

                          hintText: "Name",
                          hintStyle:
                          GoogleFonts.pacifico(color: Colors.white)),

                    ):
                        //Name display
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: variable.text2(
                            "Name", 20.0, Colors.white, FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Work experience
                  Container(
                      height: categoryHeight / 15,
                      color: Color(0xff4D2136),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          variable.text2("Work experience", 20.0, Colors.white,
                              FontWeight.bold),
                          IconButton(
                              icon: Icon(
                                Icons.add_box_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (_auth.currentUser.uid != null) {
                                  Database(uid: _auth.currentUser.uid)
                                      .updateUserContact(
                                          "AMlan Naskar", 920830219, 'Indine');
                                  Database(uid: _auth.currentUser.uid)
                                      .updateUserName("Arani Bhattacharya");
                                  Database(uid: _auth.currentUser.uid)
                                      .updateUserData("Flutter developer at ",
                                          "Made a Stop ", "1021");
                                }
                              })
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
