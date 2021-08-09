
import 'dart:convert';

import 'package:architecture/architeture/api/api.dart';
import 'package:architecture/architeture/api/api_response.dart';
import 'package:architecture/architeture/auth/api/auth_api.dart';
import 'package:architecture/architeture/auth/entity/usuario.dart';
import 'package:architecture/architeture/entity/entity.dart';
import 'package:architecture/architeture/provider/base_provider.dart';

class AuthProvider extends BaseProvider<Usuario> {

  AuthApi _authApi = AuthApi();

  Future<ApiResponse> logar(String login, String senha) async {
    ApiResponse apiResponse;

    try {
      var response = await _authApi.login(login, senha);

      print("Response >>> ${response.body}");

      String token = response.body;
      // Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        // final user = new Usuario.fromJson(mapResponse);
        Usuario user = Usuario(login: login, token: token);

        user.save();

        apiResponse = ApiResponse.ok(result: user);
      } else {
        apiResponse = ApiResponse.error(msg: "Erro não previsto");
      }
    } catch(error, exception) {
      print("Erro no login $error > $exception");
      apiResponse = ApiResponse.error(msg: "Erro não previsto");
    }

    return apiResponse;
  }

  Future<ApiResponse> signup(String email, String password) async {
    ApiResponse apiResponse;
    try {
      var response = await _authApi.signup(email, password);

      apiResponse = ApiResponse.ok(result: true);
    } catch(error, exception) {
      print("Erro no login $error > $exception");
      apiResponse = ApiResponse.error(msg: "Erro não previsto");
    }

    return apiResponse;
  }

  @override
  Api<Entity> getApi() {
    return _authApi;
  }
}