import 'dart:collection';

class ModelDiscover {
  int id;
  String title;
  String description;
  String image;
  String background;

  ModelDiscover.fromMap(dynamic objects) {
    id = objects['id'];
    background = objects['background'];
    image = objects['image'];
    description = objects['description'];
    title = objects['title'];
  }

  Map<String, dynamic> toMap() {
    var map = new HashMap<String, dynamic>();
    map['background'] = background;
    map['image'] = image;
    map['description'] = description;
    map['title'] = title;
    map['id'] = id;
    return map;
  }
}
