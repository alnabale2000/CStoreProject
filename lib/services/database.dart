
import 'package:cloud_firestore/cloud_firestore.dart';

class Userr {
  final String uid;
  Userr({this.uid});
}

class DataBaseService {
  final String uid;

  DataBaseService({this.uid});

  final CollectionReference allUsersCollection =
  FirebaseFirestore.instance.collection('users');

  Future upadteUserData(String username, String phoneNumber) async {
    return await allUsersCollection.doc(uid).set({
      'username': username,
      'phoneNumber': phoneNumber,
    });
  }
}