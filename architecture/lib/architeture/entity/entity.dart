import 'dart:convert' as convert;

abstract class Entity {
  int id;

  Entity({this.id});

  Map<String, dynamic> toMap();

  fromMap(Map<String, dynamic> json);

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }

}