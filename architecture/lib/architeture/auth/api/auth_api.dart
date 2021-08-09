

import 'dart:convert';

import 'package:architecture/architeture/api/api.dart';
import 'package:architecture/architeture/api/api_path.dart';
import 'package:architecture/architeture/auth/entity/usuario.dart';
import 'package:http/http.dart' as http;

class AuthApi extends Api<Usuario> {

  bool _utilizaPahEndPoint = true;
  @override
  String getPathEndPoint() => _utilizaPahEndPoint ? ApiPath.AUTH : "";

  String getBasePathEndPoint() => ApiPath.API_BASE_URL_FIREBASE;

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

  Future<void> signup(String email, String password) async {
    _utilizaPahEndPoint = false;
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    String jsonEnv = json.encode({
      "email": email,
      "displayName": "Djeison",
      "photoURL": "https://s3-sa-east-1.amazonaws.com/livetouch-temp/livrows/foto.png",
      "password": password,
      "returnSecureToken": true
    });

    final response = await post(body: jsonEnv, headers: headers);

    print("Response ${json.decode(response.body)}");

    return Future.value();
  }
}