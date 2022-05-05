import 'package:courses_app/models/course.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.course.coverImage,
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[]),
      ),
    );
  }
}
