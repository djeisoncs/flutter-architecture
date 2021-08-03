
import 'package:architecture/architeture/entity/entity.dart';
import 'package:flutter/material.dart';

abstract class BaseProvider<T extends Entity> with ChangeNotifier {

  List<T> _entitys;

  List<T> get entitys => {..._entitys}.toList();

  int get entitysCount => _entitys.length;

  void setEntitys(List<T> entitys) => this._entitys = entitys;

  void addEntity(T t) {
    _entitys.add(t);

    notifyListeners();
  }

  void removeEntity(T t) {
    _entitys.remove(t);

    notifyListeners();
  }

  void clear() {
    _entitys = [];

    notifyListeners();
  }
}