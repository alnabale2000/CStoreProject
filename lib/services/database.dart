import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/post.dart';

class Userr {
  final String uid;
  Userr({this.uid});
}

class DataBaseService {
  final String uid;
  final String idFromUserStore;
  final String type;
  final String orderRule;
  final bool boolean;
  final int startPrice;
  final int finalPrice;
  String sOrb;
  String uOrN;
  final String collection;

  DataBaseService(
      {this.uid,
      this.type,
      this.orderRule,
      this.boolean,
      this.startPrice,
      this.finalPrice,
      this.sOrb,
      this.uOrN,
      this.idFromUserStore,
      this.collection});

  final CollectionReference allUsersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference ps3collection =
      FirebaseFirestore.instance.collection('ps3');

  final CollectionReference ps4collection =
      FirebaseFirestore.instance.collection('ps4');

  final CollectionReference ps5collection =
      FirebaseFirestore.instance.collection('ps5');

  final CollectionReference xBox360collection =
      FirebaseFirestore.instance.collection('x360');

  final CollectionReference x1collection =
      FirebaseFirestore.instance.collection('xBox1');

  final CollectionReference xSxcollection =
      FirebaseFirestore.instance.collection('XboxSX');

  CollectionReference choosenCollection;

  Future upadteUserData(
    String username,
    String phoneNumber,
    String dateTime,
    String isVerify,
  ) async {
    return await allUsersCollection.doc(uid).set({
      'username': username,
      'phoneNumber': phoneNumber,
      'creationTime': dateTime,
      'verify': isVerify,
    });
  }

  Future addVerify(String isVerify) async {
    return await allUsersCollection.doc(uid).update({'verify': isVerify});
  }

  List<Post> _postList(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Post(
            url: doc.data()['url'] ?? 'No Image.',
            title: doc.data()['title'] ?? '',
            description: doc.data()['description'] ?? 'No More details',
            price: doc.data()['price'] ?? '',
            city: doc.data()['city'] ?? '',
            neighborhood: doc.data()['neighborhood'] ?? 'UnKnown',
            condition: doc.data()['condition'] ?? '',
            sOrB: doc.data()['sOrb'] ?? '',
            phoneNum: doc.data()['phone_number'] ?? '',
            userName: doc.data()['username'] ?? '',
            dateTime: doc.data()['creationTime'],
            time: doc.data()['time'] ?? '',
            uid: doc.data()['userId'] ?? ''))
        .toList();
  }

  Stream<List<Post>> get posts {
    if (collection == 'ps3') {
      choosenCollection = ps3collection;
    }
    if (collection == 'ps4') {
      choosenCollection = ps4collection;
    }
    if (collection == 'ps5') {
      choosenCollection = ps5collection;
    }
    if (collection == 'x3') {
      choosenCollection = xBox360collection;
    }
    if (collection == 'x4') {
      choosenCollection = x1collection;
    }
    if (collection == 'x5') {
      choosenCollection = xSxcollection;
    }
    if (collection == 'm') {
      choosenCollection =
          allUsersCollection.doc(idFromUserStore).collection('posts');
    }

    return choosenCollection
        .orderBy(orderRule ?? 'price', descending: boolean ?? false)
        .where('price',
            isGreaterThanOrEqualTo: startPrice ?? 1,
            isLessThanOrEqualTo: finalPrice ?? 1000)
        .where('sOrb', isEqualTo: sOrb ?? null)
        .where('condition', isEqualTo: uOrN ?? null)
        .where('userId', isEqualTo: idFromUserStore ?? null)
        .snapshots()
        .map(_postList);
  }

  void addPostToUserStore(
    String title,
    String description,
    int price,
    String neighborhood,
    String city,
    String condition,
    String sOrb,
    String url,
    String userName,
    String phoneNumber,
    String dateTime,
    var time,
  ) async {
    await allUsersCollection.doc(uid).collection('posts').add({
      'title': title,
      'description': description,
      'price': price,
      'neighborhood': neighborhood,
      'city': city,
      'condition': condition,
      'sOrb': sOrb,
      'url': url,
      'userId': uid,
      'username': userName,
      'phone_number': phoneNumber,
      'creationTime': dateTime,
      'time': time,
    });
  }

  Future addPost({
    String title,
    String description,
    int price,
    String neighborhood,
    String city,
    String condition,
    String sOrb,
    String url,
  }) async {
    var userData = await allUsersCollection.doc(uid).get();
    String phoneNumber = userData.data()['phoneNumber'];
    String dateTime = userData.data()['creationTime'];
    String userName = userData.data()['username'];

    var time = DateTime.now().toString();

    if (type == 'ps3') {
      return await ps3collection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
    if (type == 'ps4') {
      return await ps4collection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
    if (type == 'ps5') {
      return await ps5collection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
    if (type == 'XBox360') {
      return await xBox360collection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
    if (type == 'XBoxOne') {
      return await x1collection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
    if (type == 'XBox Series X') {
      return await xSxcollection.add({
        'title': title,
        'description': description,
        'price': price,
        'neighborhood': neighborhood,
        'city': city,
        'condition': condition,
        'sOrb': sOrb,
        'url': url,
        'userId': uid,
        'username': userName,
        'phone_number': phoneNumber,
        'creationTime': dateTime,
        'time': time,
      }).then((value) => addPostToUserStore(
          title,
          description,
          price,
          neighborhood,
          city,
          condition,
          sOrb,
          url,
          userName,
          phoneNumber,
          dateTime,
          time));
    }
  }
}
