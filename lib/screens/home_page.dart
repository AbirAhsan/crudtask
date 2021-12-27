import 'package:crudtask/controller/home_screen_controller.dart';
import 'package:crudtask/custom_widget/custom_listtile.dart';
import 'package:crudtask/model/user_data_per_page_model.dart';
import 'package:crudtask/screens/user_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final HomeScreenController homeCtrl = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const UserFormScreen(isNewUser: true));
              },
              icon: const Icon(
                Icons.person_add,
                size: 32,
              ))
        ],
      ),
      body: SizedBox(
        height: _height,
        width: _width,
        child: Obx(() {
          return ListView.builder(
            controller: homeCtrl.scrollController,
            itemCount: homeCtrl.userlist.length,
            itemBuilder: (context, index) {
              Data userDetails = homeCtrl.userlist[index];
              if (index == homeCtrl.userlist.length - 1 &&
                  homeCtrl.isMoreDataAvailable.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomListTile(
                name: "${userDetails.firstName} ${userDetails.lastName}",
                imageUrl: userDetails.avatar,
                emailAddress: userDetails.email,
                editButtonFunc: () {
                  Get.to(const UserFormScreen(isNewUser: false));
                },
                deleteButtonFunc: () {
                  homeCtrl.deleteUser(userDetails);
                },
              );
            },
          );
        }),
      ),
    );
  }
}
