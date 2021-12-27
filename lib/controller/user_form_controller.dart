import 'package:crudtask/remote_service/user_form_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isNewUser = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl = TextEditingController();
  late TextEditingController jobCtrl = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  updateUser(int userID) async {
    await UserFormRemoteService()
        .updateUser(userID, nameCtrl.text, jobCtrl.text);
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => Get.back());
  }

  createNewUser() {
    UserFormRemoteService()
        .createUser(nameCtrl.text, jobCtrl.text)
        .then((value) {
      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) => Get.back());
    });
  }

  String? validateName(String value) {
    if (!GetUtils.isUsername(value)) {
      return "Provide Valid Name";
    }
    return null;
  }

  // @override
  // void onClose() {
  //   nameCtrl.dispose();
  //   jobCtrl.dispose();
  //   super.onClose();
  // }
}
