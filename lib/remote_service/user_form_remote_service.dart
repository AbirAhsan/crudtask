import 'dart:convert';

import 'package:crudtask/vaiables/all_variables.dart';
import 'package:http/http.dart' as http;

class UserFormRemoteService {
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
      return jsonDecode(response.body)["name"];
    } else {
      return response.statusCode.toString();
    }
  }

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
      return jsonDecode(response.body)["updatedAt"];
    } else {
      print("someting Wrong");
    }
  }
}
