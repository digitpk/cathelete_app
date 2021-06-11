import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ModelPopularWorkout
{

  int id;
  String name;
  String color;
  String image;


  ModelPopularWorkout.fromMap(dynamic objects)
  {
    image=objects['image'];
    color=objects['color'];
    name=objects['name'];
    id=objects['id'];
  }

  Map<String, dynamic> toMap() {
    var map = new HashMap<String, dynamic>();
    map['image']=image;
    map['color']=color;
    map['name']=name;
    map['id']=id;
    return map;
  }

  }