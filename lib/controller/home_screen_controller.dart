import 'package:crudtask/custom_widget/custom_snackbar.dart';
import 'package:crudtask/model/user_data_per_page_model.dart';
import 'package:crudtask/remote_service/homescreen_remotte_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxList<Data> userlist = List<Data>.empty(growable: true).obs;
  int page = 1;
  RxBool isMoreDataAvailable = true.obs;

  @override
  void onInit() {
    // Fetch Data
    dataCalling(page);
    //paginate
    paginateUserData();
    super.onInit();
  }

//<================ Data Assign to List
  void dataCalling(int page) {
    try {
      isMoreDataAvailable(true);
      HomeScreenRemoteService().fetchData(page).then((resp) {
        isMoreDataAvailable(false);
        userlist.addAll(resp!.data.toList());
      }, onError: (err) {
        isMoreDataAvailable(false);
        print(err.toString());
      });
    } catch (e) {
      isMoreDataAvailable(false);
      print(e.toString());
    }
  }

  //<======================== Paginate Data
  //<=========== For Pagination
  void paginateUserData() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("Reached end");
        page++;
        getMoreTask(page);
        update();
      }
    });
  }

  getMoreTask(int page) {
    try {
      HomeScreenRemoteService().fetchData(page).then((resp) {
        // if (page < int.parse(resp!.totalPages.toString())) {
        if (resp!.data.isNotEmpty) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          CustomSnackBar(message: "No More User Available")
              .showNormalCustomSnakbar("Stop Please");
        }
        userlist.addAll(resp.data.toList());
      }, onError: (err) {
        CustomSnackBar(isWarning: true, message: err.toString())
            .showCustomSnakbar();
      });
    } catch (er) {
      CustomSnackBar(isWarning: true, message: er.toString())
          .showCustomSnakbar();
    }
  }

  // <================ Delete User
  void deleteUser(Data user) {
    HomeScreenRemoteService().deleteUser(user.id).then((value) {
      if (value) {
        userlist.remove(user);
        CustomSnackBar(isWarning: false, message: "User Removed")
            .showCustomSnakbar();
      } else {
        CustomSnackBar(isWarning: true, message: "Something Worng")
            .showCustomSnakbar();
      }
    });
  }
}
