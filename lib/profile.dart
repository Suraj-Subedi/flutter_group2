import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Hero(
        tag: 'profile',
        child: CircleAvatar(
          radius: 80,
          // backgroundImage: AssetImage('assets/profile.png'),
          backgroundImage: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
          ),
        ),
      ),
    ));
  }
}
