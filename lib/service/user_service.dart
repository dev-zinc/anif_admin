

import 'dart:convert';

import 'package:anif_admin/lib/request.dart';
import 'package:anif_admin/model/user/user.dart';

class UserService {
  Future<User> getUser(String uuid) async {
    final jsonResponse = await request("user/$uuid");

    return User.fromJson(jsonResponse);
  }

  Future<List<User>> getUserList() async {
    final jsonResponse = await request("user/list");
    final objectList = jsonResponse as List<dynamic>;
    print("$objectList");
    final list = objectList.map((json) => User.fromJson(json)).toList();
    return list;
  }
}