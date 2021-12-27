import 'package:flutter/material.dart';

class UserFormScreen extends StatelessWidget {
  final bool isNewUser;
  const UserFormScreen({Key? key, required this.isNewUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewUser ? "Create New User" : "Update User"),
      ),
    );
  }
}
