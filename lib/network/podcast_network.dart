import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/podcast.dart';

class PodcastNetwork {
  PodcastNetwork();

  CollectionReference podcasts = FirebaseFirestore.instance.collection('podcasts');

  Future<void> addPodcastToDb(Podcast podcast) {
    return podcasts
        .add({
          'audio': podcast.id,
          'title': podcast.title,
          'section': podcast.section,
          'info': podcast.info,
          'id' : podcast.id,
          'coverImage' : podcast.coverImage,
        })
        .then((value) => print("Podcast Added"))
        .catchError((error) => print("Failed to add podcast: $error"));
  }

  Future<Podcast> getPodcastFromDb(String id) async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("podcasts")
        .doc(id)
        .get(); //get the data
    return Podcast.parse(data);
  }
}
