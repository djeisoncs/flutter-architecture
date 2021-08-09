import 'package:architecture/architeture/entity/entity.dart';
import 'dart:convert' as convert;

import 'package:architecture/architeture/utils/prefs.dart';

// ignore: must_be_immutable
class Usuario extends Entity {
  String id;
  String login;
  String nome;
  String email;
  String token;
  String urlFoto;
  String senha;

  Usuario(
      {this.id, this.login, this.nome, this.email, this.urlFoto, this.token, this.senha});

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["login"] = this.login;
    data["nome"] = this.nome;
    data["email"] = this.email;
    data["token"] = this.token;
    data["urlFoto"] = this.urlFoto;
    return data;
  }

  factory Usuario.fromJson(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      login: map['login'],
      nome: map['nome'],
      email: map['email'],
      urlFoto: map['urlFoto'],
      token: map['token'],
    );
  }

  @override
  List<Object> get props => [login, nome, email];

  @override
  Usuario clonar() {
    return Usuario(
      id: id,
      login: login,
      nome: nome,
      email: email,
      urlFoto: urlFoto,
      token: token,
    );
  }

  @override
  String getId() {
    return this.id;
  }

  save() {
    Prefs.setString("user.prefs", convert.json.encode(toJson()));
  }

  static clear() {
    Prefs.setString("user.prefs", "");
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");

    if (json.isEmpty) {
      return null;
    }

    return Usuario.fromJson(convert.json.decode(json));
  }
}
