import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool b = true;
   var uid ;
  login(String email, String password) async{
    final user1 =
    await _auth.signInWithEmailAndPassword(
        email:email,
        password: password);
    if(user1!=null)
      b=true;

    return b;
  }
}