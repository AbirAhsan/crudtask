import 'package:crudtask/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatelessWidget {
  final bool isNewUser;
  const UserFormScreen({Key? key, required this.isNewUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewUser ? "Create New User" : "Update User"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SizedBox(
          height: _height,
          width: _width,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    labelText: "Name",
                    hintText: "ex. Robert",
                    validator: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Job",
                    hintText: "ex. Manager",
                    validator: (value) {},
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      isNewUser ? "Create" : "Update",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
