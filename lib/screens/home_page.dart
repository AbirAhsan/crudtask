import 'package:crudtask/controller/home_screen_controller.dart';
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
      ),
      body: SizedBox(
        height: _height,
        width: _width,
        child: Obx(() {
          return ListView.builder(
            controller: homeCtrl.scrollController,
            itemCount: homeCtrl.userlist.length,
            itemBuilder: (context, index) {
              if (index == homeCtrl.userlist.length - 1 &&
                  homeCtrl.isMoreDataAvailable.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  child: Center(
                    child: Text(homeCtrl.userlist[index].firstName),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
