import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Icon(
        Icons.person,
        color: Colors.grey[400],
        size: 38,
      ),
    );
  }
}
