import 'package:crudtask/controller/user_form_controller.dart';
import 'package:crudtask/model/user_data_per_page_model.dart';
import 'package:crudtask/services/form_validation.dart';
import 'package:crudtask/views/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormScreen extends GetView<UserFormController> {
  final bool isNewUser;
  final Data? user;
  const UserFormScreen({Key? key, required this.isNewUser, this.user})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final UserFormController formCtrl = Get.put(UserFormController());
    if (!isNewUser) {
      formCtrl.nameCtrl.text = "${user!.firstName} ${user!.lastName}";
    }
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
            key: formCtrl.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    labelText: "Name",
                    hintText: "ex. Robert",
                    controller: formCtrl.nameCtrl,
                    validator: (value) {
                      return formCtrl.validateName(value!);
                    },
                    onChanged: (val) {
                      formCtrl.nameCtrl.text = val;
                      formCtrl.nameCtrl.selection = TextSelection.fromPosition(
                          TextPosition(offset: formCtrl.nameCtrl.text.length));
                    },
                  ),
                  CustomTextField(
                    labelText: "Job",
                    hintText: "ex. Manager",
                    controller: formCtrl.jobCtrl,
                    validator: (value) {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (validateAndSave(formCtrl.formKey)) {
                        if (isNewUser) {
                          //create new

                          formCtrl.createNewUser();
                        } else {
                          //update
                          formCtrl.updateUser(user!.id);
                        }
                      }
                    },
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
