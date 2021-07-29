
import 'package:architecture/architeture/api/api_base.dart';
import 'package:architecture/architeture/entity/entity.dart';
import 'package:architecture/architeture/entity/paginator.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

abstract class ModelNotifier<T extends Entity> extends ChangeNotifier {

  List<T> entidades = [];

  Future<List<T>> getAll() async {
    T t;

    var response = await getApi().get();

    this.entidades = convert.json.decode(response.body).map<T>((map) => t.fromMap(map)).toList();

    notifyListeners();

    return this.entidades;
  }

  Future<List<T>> get(Paginator paginator) async {
    T t;

    var response = await getApi().post(url: "/list", body: paginator);

    this.entidades = convert.json.decode(response.body).map<T>((map) => t.fromMap(map)).toList();

    notifyListeners();

    return this.entidades;
  }

  BaseApi getApi();

}