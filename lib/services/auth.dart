import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthResult {
  FirebaseAuth auth = FirebaseAuth.instance;

  // FirebaseDatabase userDb =
  //     FirebaseDatabase.instance;
  final userRefs = FirebaseDatabase.instance.reference().child("Users");

  void signInWithEmail(
      String _email, String _password, String _username) async {
    final user = (await auth
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .catchError((onError) {
      Fluttertoast.showToast(
          msg: onError.toString(), toastLength: Toast.LENGTH_LONG);
    }))
        .user;
    if (user != null) {
      //save to DB
      Fluttertoast.showToast(
          msg: "Your Acc Was Created Successfully !!!",
          toastLength: Toast.LENGTH_LONG);
      Map userDataMap = {
        "email": _email,
        "password": _password,
        "username": _username,
        "timestamp": DateTime.now().microsecondsSinceEpoch
      };
      userRefs.child(user.uid).set(userDataMap);
    } else {
      Fluttertoast.showToast(
          msg: "Cannot Login TRy again", toastLength: Toast.LENGTH_LONG);
    }
  }
}
