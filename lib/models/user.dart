import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  //final List<String> tags;
  //final List<Course> courses;
  //final List<Article> articles;
  //final List<Podcast> porcasts;
  //final String text;
  final String coverImage;

  User(this.id, this.name, this.email /*, this.tags*/, this.coverImage);

  static parse(DocumentSnapshot<Map<String, dynamic>> data) {
    // mock
    // if (data.hasError) {
    //   return Text("Something went wrong");
    // }

    // if (snapshot.hasData && !snapshot.data!.exists) {
    //   return Text("Document does not exist");
    // }

    // if (snapshot.connectionState == ConnectionState.done) {
    //   Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    //   return Text("Full Name: ${data['full_name']} ${data['last_name']}");
    // }

    // return Text("loading");
    return User(data['id'], data['name'], data['email'], data['coverImage']);
  }
}
