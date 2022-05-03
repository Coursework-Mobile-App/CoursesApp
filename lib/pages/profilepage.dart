import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/models/data/user_data.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = user_info;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                buildImage(),
                Positioned(
                  bottom: 0,
                  right: 15,
                  child: buildEditIcon(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          buildName(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: CachedNetworkImageProvider(user_info.coverImage),
          fit: BoxFit.cover,
          width: 228,
          height: 228,
        ),
      ),
    );
  }

  Widget buildEditIcon() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      //color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Color(0xFFEC407A)),
        ),
        child: const Icon(
          Icons.edit,
          color: Color(0xFFEC407A),
          size: 30,
        ),
      ),
    );
  }

  Widget buildName() {
    return Column(
      children: [
        Text(
          user_info.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          user_info.email,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
