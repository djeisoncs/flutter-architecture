import 'package:architecture/architeture/api/api.dart';
import 'package:architecture/architeture/entity/entity.dart';
import 'package:architecture/architeture/entity/paginator.dart';
import 'package:flutter/material.dart';

abstract class BaseProvider<T extends Entity> with ChangeNotifier {
  List<T> _entitys;

  List<T> get entitys => {..._entitys}.toList();

  int get entitysCount => _entitys.length;

  void setEntitys(List<T> entitys) {
    this._entitys = entitys;

    notifyListeners();
  }

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

  void list(Paginator paginator) {
    getApi().list(paginator).then((response) {
      if (response.ok) {
        setEntitys(response.entidades);
      }
    });
  }

  void getById(String id) {
    getApi().getById(id).then((response) {
      if (response.ok) {
        addEntity(response.result);
      }
    });
  }

  void salvar(T entity) {
    getApi().save(entity).then((response) {
      if (response.ok) {
        addEntity(response.result);
      } else {
        /**
         * TODO adicionar o dialoig para exibição de erro
         */
      }
    });
  }
  
  void delete(T entity) {
    getApi().deletar(entity).then((response) {
      if (response.ok) {
        removeEntity(entity);
      } else {
        /**
         * TODO adicionar o dialoig para exibição de erro
         */
      }
    });
  }

  Api getApi();
}
