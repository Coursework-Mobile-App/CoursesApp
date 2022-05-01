import 'package:flutter/material.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({Key? key}) : super(key: key);

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          shadowColor: Colors.black,
          //foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
          backgroundColor: Colors.grey[100],
          floating: false,
          expandedHeight: 20.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'Подкасты',
              style: TextStyle(color: Color(0xFFEC407A)),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Color(0xFFEC407A),
              onPressed: () => null,
            ),
          ],
        )
      ],
    );
  }
}
