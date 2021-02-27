import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;

  Database({this.uid});

  final CollectionReference experience = FirebaseFirestore.instance.collection(
      'experience');
  final CollectionReference name = FirebaseFirestore.instance.collection(
      'Name');
  final CollectionReference contact = FirebaseFirestore.instance.collection(
      'Contact');

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
  Future updateUserContact(String email, int number, String address) async {
    return await contact.doc(uid).set({
      'email': email,
      'number': number,
      'address': address
    });
  }
}

