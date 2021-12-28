import 'dart:convert';
import 'package:crudtask/services/vaiables/all_variables.dart';
import 'package:http/http.dart' as http;
import 'package:crudtask/model/user_data_per_page_model.dart';

class HomeScreenRemoteService {
  Future<UserDataPerPageModel?> fetchData(int page) async {
    Uri userListUrl = Uri.parse("$baseUrl/api/users?page=$page&per_page=10");

    var response = await http.get(
      userListUrl,
    );

    if (response.statusCode == 200) {
      return UserDataPerPageModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> deleteUser(int userID) async {
    Uri userDeleteUrl = Uri.parse("$baseUrl/api/users/$userID");

    var response = await http.delete(
      userDeleteUrl,
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
