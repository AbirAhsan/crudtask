import 'package:crudtask/custom_widget/custom_eassy_loading.dart';
import 'package:crudtask/remote_service/user_form_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  //RxBool isLoading = false.obs;
  RxBool isNewUser = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl, jobCtrl;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    jobCtrl = TextEditingController();
    super.onInit();
  }

  updateUser(int userID) async {
    CustomEassyLoading().startLoading();
    await UserFormRemoteService()
        .updateUser(userID, nameCtrl.text, jobCtrl.text);
    EasyLoading.dismiss();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => Get.back());
  }

  createNewUser() {
    CustomEassyLoading().startLoading();
    UserFormRemoteService()
        .createUser(nameCtrl.text, jobCtrl.text)
        .then((value) {
      EasyLoading.dismiss();
      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) => Get.back());
    });
  }

  String? validateName(String value) {
    if (value.isEmpty || value.length < 3) {
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
