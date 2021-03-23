import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<Userr> get user {
    return _auth.authStateChanges().map((_userFromFirebaseUser));
  }

  Userr _userFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      dynamic result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future regWithEmailAndPass(
      String email, String pass, String username, String phoneNumber) async {
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = result.user;
      await DataBaseService(uid: user.uid)
          .upadteUserData(username, phoneNumber);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}


