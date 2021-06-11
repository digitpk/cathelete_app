
import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ModelWorkoutList {
  int id;
  int levelType;
  String name ;
  String image;

  ModelWorkoutList.fromMap(dynamic dynamicObj) {
    name = dynamicObj['name'];
    levelType = dynamicObj['level_type'];
    image = dynamicObj['image'];
    id = dynamicObj['id'];
  }

  Map<String, dynamic> toMap() {
    var map = new HashMap<String, dynamic>();
    map['id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['level_type'] = levelType;
    return map;
  }
}
