import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<Map<String, dynamic>> getUserInfo() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    var userInfo = {
      "username": documentSnapshot["username"],
      "email": documentSnapshot["email"],
      "number": documentSnapshot["number"]
    };
    return userInfo;
  }

  Future<void> updateUserInfo(String currentText, String _editedText) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference documentRef = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid);

    await documentRef.update({
      currentText: _editedText,
    });
  }
}
