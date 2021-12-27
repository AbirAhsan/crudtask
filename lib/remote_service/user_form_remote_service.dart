import 'dart:convert';

import 'package:crudtask/vaiables/all_variables.dart';
import 'package:http/http.dart' as http;

class UserFormRemoteService {
  Future updateUser(int userID, String? name, String? job) async {
    Uri userUpdateUrl = Uri.parse("$baseUrl/api/users/$userID");

    var response = await http.put(
      userUpdateUrl,
      body: {'name': '$name', '$job': ''},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["updatedAt"];
    } else {
      print("someting Wrong");
    }
  }
}
