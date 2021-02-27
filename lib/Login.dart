import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_spri/services/auth.dart';
import 'package:job_spri/services/database.dart';

import 'Intro.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  Authentication authentication = new Authentication();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    //const Color(0xfffffdd0),
                    const Color(0xff1B1A2A),
                    const Color(0xff1B192A),
                    const Color(0xff4D2136),
                  ],
                ),
              ),
            ),
            ListView(
              children: [
                SizedBox(height: 150,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Image(image: AssetImage("images/image.png")),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: _emailField,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pinkAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.pinkAccent,
                        ),
                        hintText: "Email",
                        hintStyle:
                            GoogleFonts.pacifico(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextFormField(
                    controller: _passwordField,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pinkAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.pinkAccent,
                        ),
                        hintText: "Password",
                        hintStyle:
                            GoogleFonts.pacifico(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Login
                    Container(
                      height: categoryHeight / 13,
                      width: categoryWidth / 2.5,
                      child: MaterialButton(
                        child: Text(
                          "Login",
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        onPressed: () async {
                          // final user1 =
                          //     await _auth.signInWithEmailAndPassword(
                          //         email: _emailField.text,
                          //         password: _passwordField.text);
                          Database(uid:_auth.currentUser.uid).updateUserData(" Developer at Coding liquids  ", "Created the business ", "12/12/21 to 12/123/21");

                          print("Logged");
                          if (authentication.login(_emailField.text, _passwordField.text) == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen1()),
                            );
                          }
                        },
                        splashColor: Colors.pinkAccent,
                        // color: Colors.pink[300],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.pinkAccent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),

                        //Border.all(color: Colors.pinkAccent,width: 2.0)
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //Register
                    Container(
                      height: categoryHeight / 13,
                      width: categoryWidth / 2.5,
                      child: MaterialButton(
                        child: Text(
                          "Register",
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        onPressed: () async {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _emailField.text,
                                  password: _passwordField.text);
                          print("Logged");
                          if (newUser != null) {
                            Database(uid:_auth.currentUser.uid).
                            updateUserContact("sagnikbhattacharya", 9804044741, 'kolkata');
                            Database(uid:_auth.currentUser.uid).
                            updateUserName("Sagnik Bhattacharya");
                            Database(uid:_auth.currentUser.uid).
                            updateUserData("Django developer at ", "Made a few ", "12/12/21 to 12/123/21");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen1()),
                            );
                          }
                        },
                        splashColor: Colors.pinkAccent,
                        // color: Colors.pink[300],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.pinkAccent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),

                        //Border.all(color: Colors.pinkAccent,width: 2.0)
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:40.0,right: 40.0),
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      final user = await _googleSignIn.signIn();
                      print("Hello");
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen1()),
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.pinkAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
