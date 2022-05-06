import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/podcast.dart';

class PodcastNetwork {
  PodcastNetwork();

  CollectionReference podcasts = FirebaseFirestore.instance.collection('podcasts');

  Future<void> addPodcastToDb(Podcast podcast) {
    return podcasts
        .add({
          'id' : podcast.id,
          'title': podcast.title,
          'info': podcast.info,
          'section': podcast.section,
          'author' : podcast.author,
          'coverImage' : podcast.coverImage,
          'audio': podcast.audio,
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

    Future<List<Podcast>> getAllPodcastsFromDb() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('podcasts').get();
    return Podcast.parseAll(querySnapshot);
  }
}
