import 'dart:convert';

class MenuModel {
  final String? menuName;
  final String? menuDescription;
  final String? menuImage;

  MenuModel({this.menuName, this.menuDescription, this.menuImage});

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
        menuName: json['MENUNAME'],
        menuDescription: json['MENUDESCRIPTION'],
        menuImage: json['MENUIMAGE']);
  }

  factory MenuModel.toMap(json) {
    return MenuModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toJson() {
    return {
      'MENUNAME': menuName,
      'MENUDESCRIPTION': menuDescription,
      'MENUIMAGE': menuImage,
    };
  }
}
