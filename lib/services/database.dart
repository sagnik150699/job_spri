import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;

  Database({this.uid});

  final CollectionReference experience = FirebaseFirestore.instance.collection(
      'Experience');
  final CollectionReference name = FirebaseFirestore.instance.collection(
      'Name');
  final CollectionReference contact = FirebaseFirestore.instance.collection(
      'Contact');
  final CollectionReference cityC = FirebaseFirestore.instance.collection(
      'City');
  final CollectionReference address= FirebaseFirestore.instance.collection(
      'Address');

  Future updateUserData(String title, String description, String date) async {
    return await experience.doc(uid).set({
      'Job1 title': title,
      'Job1 description': description,
      'Job1 date': date
    });
  }
  Future updateUserName(String names) async {
    return await name.doc(uid).set({
      'Name': names,
    });
  }
  //get name
  Future updateUserContact( String number) async {
    return await contact.doc(uid).set({
      'Contact': number,
    });
  }
  Future updateUserCity( String city) async {
    return await cityC.doc(uid).set({
      'City': city,
    });
  }
  Future updateUserAddress( String address1) async {
    return await address.doc(uid).set({
      'Address': address1,
    });
  }
}

