

import 'dart:convert';

import 'package:architecture/architeture/api/api.dart';
import 'package:architecture/architeture/api/api_path.dart';
import 'package:architecture/architeture/auth/entity/usuario.dart';
import 'package:http/http.dart' as http;

class AuthApi extends Api<Usuario> {

  @override
  String getPathEndPoint() {
    return ApiPath.AUTH;
  }

  @override
  Usuario fromJson(Map<String, dynamic> map) {
    return Usuario.fromJson(map);
  }

  Future<http.Response> login(String login, String senha) async {

      Map<String, String> headers = {
        "Content-Type": "application/json"
      };

      Map<String, String> queryParams = {
        'username': login,
        'password': senha,
        'app': 'true'
      };

      return await post(headers: headers, queryParams: queryParams);
  }
}