import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/user.dart';

class UserNetwork {
  UserNetwork();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) {
    return users
        .add({
          'user_id': user.id,
          'firstName': user.name,
          'email': user.email,
          'coverImage': user.coverImage,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
