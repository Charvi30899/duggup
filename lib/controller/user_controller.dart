import 'dart:convert';

import 'package:duggup/models/user_model.dart';
import 'package:duggup/utilities/app_strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  List<Results> user_list = <Results>[].obs;
  RxBool isload = true.obs;
  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  Future getUsers() async {
    isload.value = true;
    user_list.clear();
    final Map<String, String> queryParams = {
      'page': '1',
      'results': '20',
      'seed': 'abc'
    };
    var response = await http
        .get(Uri.parse(AppString.users).replace(queryParameters: queryParams));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = UserModel.fromJson(jsonDecode(response.body));
      if (data.results!.isNotEmpty) {
        user_list = data.results!;
      }
    }
    isload.value = false;
    print(isload);
    update();
  }
}
