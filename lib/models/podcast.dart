import 'package:cloud_firestore/cloud_firestore.dart';

class Podcast {
  final String id;
  final String title;
  final String info;
  final String section;
  //final List<String> tags;
  //final String text;
  final String coverImage;

  Podcast(this.id, this.title, this.info /*, this.tags*/, this.section,
      this.coverImage);

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
    return Podcast(data['id'], data['title'], data['info'], data['section'],
        data['coverImage']);
  }
}
