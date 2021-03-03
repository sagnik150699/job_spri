import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool inputName = false;
  bool inputNumber = false;
  bool inputAddress = false;
  bool inputCity = false;
  bool inputJob =false;
  var counter;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController job1 = TextEditingController();
  TextEditingController desc1 = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String displayName = "";
  String displayAddress = "";
  String displayNumber = " ";
  String displayCity = "";
 List <String> displayJob1;
  List <String> displayDesc1;
  Variables variable = new Variables();

  Future returnName() async {
    await FirebaseFirestore.instance
        .collection("Name")
        .doc(_auth.currentUser.uid)
        .get()
        .then((value) {
      displayName = value.data()["Name"];
      print(value.data()["Name"]);
    });
    return null;
  }

  Future returnNumber() async {
    await FirebaseFirestore.instance
        .collection("Contact")
        .doc(_auth.currentUser.uid)
        .get()
        .then((value) {
      displayNumber = value.data()["Contact"];
      print(value.data()["Contact"]);
    });
    return null;
  }

  Future returnAddress() async {
    await FirebaseFirestore.instance
        .collection("Address")
        .doc(_auth.currentUser.uid)
        .get()
        .then((value) {
      displayAddress = value.data()["Address"];
      print(value.data()["Address"]);
    });
    return null;
  }
  Future returnCity() async {
    await FirebaseFirestore.instance
        .collection("City")
        .doc(_auth.currentUser.uid)
        .get()
        .then((value) {
      displayCity = value.data()["City"];
      print(value.data()["City"]);
    });
    return null;
  }
  Future returnJob() async {
    for (var i in counter){
       await FirebaseFirestore.instance
          .collection("Job$counter")
          .doc(_auth.currentUser.uid)
          .get()
          .then((value) {
         displayJob1[counter] = value.data()["Job$counter"];
         displayDesc1[counter] = value.data()["Desc$counter"];
        // //print(value.data()["City"]);
      });
    }
    return null;
  }

   printJob() {
    return ListView.builder(
      itemCount: counter,
      itemBuilder: (context,index){
        return ListTile(
          leading: variable.text2(displayJob1[index], 15, Colors.white, FontWeight.w200),
          trailing: variable.text2(displayDesc1[index], 15, Colors.white, FontWeight.w200),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    Database _database = new Database(uid: _auth.currentUser.uid);
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4D2136),
        title: variable.text2("Profile", 25.0, Colors.white, FontWeight.bold),
      ),
      body: Stack(
        children: [
          //colour
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          variable.text2(
                              "Name", 20.0, Colors.white, FontWeight.normal),
                          inputName
                              ? IconButton(
                                  icon: Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    await _database.updateUserName(name.text);
                                    await FirebaseFirestore.instance
                                        .collection("Name")
                                        .doc(_auth.currentUser.uid)
                                        .get()
                                        .then((value) {
                                      setState(() {
                                        displayName = value.data()["Name"];
                                      });
                                      displayName = value.data()["Name"];
                                      print(value.data()["Name"]);
                                    });

                                    setState(() {
                                      returnName();
                                      inputName = false;
                                      print(inputName);
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      inputName = true;
                                      print(inputName);
                                    });
                                  }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Input Name
                  FutureBuilder(
                      future: returnName(),
                      builder: (context, snapshot) {
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: categoryHeight / 15,
                          //color: Color(0xff4D2136),
                          child: inputName
                              ? TextFormField(
                                  controller: name,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.pinkAccent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      hintText: displayName,
                                      hintStyle: GoogleFonts.pacifico(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal)),
                                )
                              :
                              //Name display
                              Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: variable.text2(displayName, 20.0,
                                        Colors.white, FontWeight.w200),
                                  ),
                                ),
                        );
                      }),
                  SizedBox(height: 30),
                  //Phone number
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: categoryHeight / 15,
                    //width: categoryWidth / 3,
                    color: Color(0xff4D2136),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          variable.text2("Phone number", 20.0, Colors.white,
                              FontWeight.normal),
                          inputNumber
                              ? IconButton(
                                  icon: Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    //displayNumber = number.text;
                                    await _database
                                        .updateUserContact(number.text);
                                    await FirebaseFirestore.instance
                                        .collection("Contact")
                                        .doc(_auth.currentUser.uid)
                                        .get()
                                        .then((value) {
                                      setState(() {
                                        displayNumber = value.data()["Contact"];
                                      });
                                      displayNumber = value.data()["Contact"];
                                      print(value.data()["Contact"]);
                                    });
                                    setState(() {
                                      inputNumber = false;
                                      print(inputNumber);
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      inputNumber = true;
                                      print(inputNumber);
                                    });
                                  }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Input phone number
                  FutureBuilder(
                      future: returnNumber(),
                      builder: (context, snapshot) {
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: categoryHeight / 15,
                          //color: Color(0xff4D2136),
                          child: inputNumber
                              ? TextFormField(
                                  controller: number,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.pinkAccent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),

                                      // ),

                                      hintText: displayNumber,
                                      hintStyle: GoogleFonts.pacifico(
                                          color: Colors.white)),
                                )
                              :
                              //Name display
                              Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: variable.text2(displayNumber, 20.0,
                                        Colors.white, FontWeight.w200),
                                  ),
                                ),
                        );
                      }),
                  SizedBox(height: 30),
                  //Address
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: categoryHeight / 15,
                    //width: categoryWidth / 3,
                    color: Color(0xff4D2136),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          variable.text2(
                              "Address", 20.0, Colors.white, FontWeight.normal),
                          inputAddress
                              ? IconButton(
                                  icon: Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async{
                                    await _database.updateUserAddress(address.text);
                                    await FirebaseFirestore.instance
                                        .collection("Address")
                                        .doc(_auth.currentUser.uid)
                                        .get()
                                        .then((value) {
                                      setState(() {
                                        displayAddress = value.data()["Address"];
                                      });
                                      displayAddress = value.data()["Address"];
                                      print(value.data()["Address"]);
                                    });
                                    setState(() {
                                      inputAddress = false;
                                      print(inputAddress);
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      inputAddress = true;
                                      print(inputAddress);
                                    });
                                  }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Input Address
                  FutureBuilder(
                    future: returnAddress(),
                      builder: (context,snapshot){
                      return Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: categoryHeight / 15,
                        //color: Color(0xff4D2136),
                        child: inputAddress
                            ? TextFormField(
                          controller: address,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.pinkAccent),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0))),
                              hintText: displayAddress,
                              hintStyle:
                              GoogleFonts.pacifico(color: Colors.white)),
                        )
                            :
                        //Name display
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: variable.text2(displayAddress, 20.0,
                                Colors.white, FontWeight.w200),
                          ),
                        ));
                      }),
                  SizedBox(height: 30),
                  //City
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: categoryHeight / 15,
                    //width: categoryWidth / 3,
                    color: Color(0xff4D2136),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          variable.text2(
                              "City", 20.0, Colors.white, FontWeight.normal),
                          inputCity
                              ? IconButton(
                                  icon: Icon(
                                    Icons.save,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async{
                                    await _database.updateUserCity(city.text);
                                    await FirebaseFirestore.instance
                                        .collection("City")
                                        .doc(_auth.currentUser.uid)
                                        .get()
                                        .then((value) {
                                      setState(() {
                                        displayCity = value.data()["City"];
                                      });
                                      displayCity = value.data()["City"];
                                      print(value.data()["City"]);
                                    });
                                    setState(() {
                                      inputCity = false;
                                      print(inputCity);
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      inputCity = true;
                                      print(inputCity);
                                    });
                                  }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Input City
                  FutureBuilder(
                      future: returnCity(),
                      builder: (context,snapshot){
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: categoryHeight / 15,
                          //color: Color(0xff4D2136),
                          child: inputCity
                              ? TextFormField(
                            controller: city,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.pinkAccent),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                hintText: displayCity,
                                hintStyle:
                                GoogleFonts.pacifico(color: Colors.white)),
                          )
                              :
                          //Name display
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: variable.text2(
                                  displayCity, 20.0, Colors.white, FontWeight.w200),
                            ),
                          ),
                        );
                      }),

                  SizedBox(height: 20),
                  //Work experience
                  Container(
                      height: categoryHeight / 15,
                      color: Color(0xff4D2136),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          variable.text2("Work experience", 20.0, Colors.white,
                              FontWeight.normal),
                          inputJob?
                          IconButton(
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              onPressed: () async{
                               final count= await _database.checkCounter(counter);
                               counter = count;
                                print("hello world $counter");
                               await _database.updateUserJob1(job1.text, desc1.text,counter);
                                await FirebaseFirestore.instance
                                    .collection("Job$counter")
                                    .doc(_auth.currentUser.uid)
                                    .get()
                                    .then((value) {
                                  // displayJob1[count] = value.data()["Job"];
                                  // displayDesc1[count] = value.data()["Desc"];
                                  // //print(value.data()["City"]);
                                });
                                setState(() {
                                  inputJob=false;
                                  counter++;
                                });
                                await _database.updateCounter(counter);
                              }):
                          IconButton(
                              icon: Icon(
                                Icons.add_box_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {
                               setState(() {
                                 inputJob = true;
                               });

                              })
                        ],
                      )),
                  //Input Job
                  FutureBuilder(
                    future: returnJob(),
                      builder: (context,snapshot){
                    return inputJob?
                    Column(
                      children: [
                        TextFormField(controller: job1,),
                        TextFormField(controller: desc1,),
                      ],
                    )

                        :
                        printJob();
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
