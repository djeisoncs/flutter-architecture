import 'dart:convert' as convert;

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Entity extends Equatable {

  Map<String, dynamic> toMap();

  Entity clonar();

  String toJson() => convert.json.encode(toMap());

  String getId();
}