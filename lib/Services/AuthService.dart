import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword1(
      String email, String password, String number, String userName) async {
    final String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: hashedPassword);
    await firestore.collection("users").doc(currentUser!.uid).set({
      'email': currentUser!.email,
      'myCart': [],
      'liked': [],
      'username': userName,
      'number': number
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
