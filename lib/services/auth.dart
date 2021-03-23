import 'package:cstore/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String dateTime;
  bool isV;

  Stream<Userr> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Userr _userFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      dynamic result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      User user = result.user;

      if (user.emailVerified) {
        print('CHECKEDD !!');
        await DataBaseService(uid: user.uid).addVerify('true');
      }
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
      dateTime = user.metadata.creationTime.toString();

      await DataBaseService(uid: user.uid)
          .upadteUserData(username, phoneNumber, dateTime, 'false');
      try {
        await user.sendEmailVerification();
      } catch (e) {
        print(e.toString());
      }

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
