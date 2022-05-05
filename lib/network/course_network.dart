import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/course.dart';
import 'package:courses_app/models/user.dart';

class CourseNetwork {
  CourseNetwork();

  CollectionReference courses = FirebaseFirestore.instance.collection('courses');

  Future<void> addCourseToDb(Course course) {
    return courses
        .add({
          'id': course.id,
          'section': course.section,
          'text': course.text,
          'coverImage': course.coverImage,
          'title' : course.title,
          'videos' : course.videos
        })
        .then((value) => print("Course Added"))
        .catchError((error) => print("Failed to add Course: $error"));
  }

  Future<Course> getCourseFromDb(String id) async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("courses")
        .doc(id)
        .get(); //get the data
    return Course.parse(data);
  }
}
