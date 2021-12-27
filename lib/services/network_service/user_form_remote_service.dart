import 'dart:convert';

import 'package:crudtask/vaiables/all_variables.dart';
import 'package:crudtask/views/custom_widget/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class UserFormRemoteService {
  //
  //<================== Create User
  //
  Future createUser(String? name, String? job) async {
    Uri userCreateUrl = Uri.parse("$baseUrl/api/users");

    var response = await http.post(
      userCreateUrl,
      body: {
        'name': '$name',
        'job': '$job',
      },
    );

    if (response.statusCode == 201) {
      CustomSnackBar(
              isWarning: false,
              message: "User Created for ${jsonDecode(response.body)["name"]}")
          .showCustomSnakbar();
      print(jsonDecode(response.body)["createdAt"]);
      return jsonDecode(response.body)["createdAt"];
    } else {
      CustomSnackBar(
        isWarning: true,
        message: "Error Code ${response.statusCode}",
      ).showCustomSnakbar();
      return response.statusCode.toString();
    }
  }

//
//<==================== Update User
//
  Future updateUser(int userID, String? name, String? job) async {
    Uri userUpdateUrl = Uri.parse("$baseUrl/api/users/$userID");

    var response = await http.put(
      userUpdateUrl,
      body: {
        'name': '$name',
        'job': '$job',
      },
    );

    if (response.statusCode == 200) {
      CustomSnackBar(
              isWarning: false,
              message: "Last Updated ${jsonDecode(response.body)["updatedAt"]}")
          .showCustomSnakbar();
      return jsonDecode(response.body)["updatedAt"];
    } else {
      CustomSnackBar(
        isWarning: true,
        message: "Error Code ${response.statusCode}",
      ).showCustomSnakbar();
    }
  }
}
