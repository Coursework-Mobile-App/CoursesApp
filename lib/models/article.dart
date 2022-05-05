import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String id;
  final String title;
  final String section;
  final String author;
  //final List<String> tags;
  final String text;
  final String coverImage;

  Article(this.id, this.title, this.section /*, this.tags*/, this.text,
      this.author, this.coverImage);

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
    return Article(data['id'], data['title'], data['section'], data['text'],
        data['author'], data['coverImage']);
  }
}
