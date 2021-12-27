import 'package:crudtask/custom_widget/custom_snackbar.dart';
import 'package:crudtask/remote_service/user_form_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isNewUser = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl, jobCtrl;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    jobCtrl = TextEditingController();
    super.onInit();
  }

  updateUser(int userID) {
    UserFormRemoteService()
        .updateUser(userID, nameCtrl.text, jobCtrl.text)
        .then((value) {});
  }

  createNewUser() {
    UserFormRemoteService()
        .createUser(nameCtrl.text, jobCtrl.text)
        .then((value) {});
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    jobCtrl.dispose();
    super.onClose();
  }
}
