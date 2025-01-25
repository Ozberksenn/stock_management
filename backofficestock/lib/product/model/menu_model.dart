import 'dart:convert';

class MenuModel {
  final int menuId;
  final String? menuName;
  final String? menuDescription;
  final String? menuImage;

  MenuModel(
      {required this.menuId,
      this.menuName,
      this.menuDescription,
      this.menuImage});

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
        menuId: json['MENUID'],
        menuName: json['MENUNAME'],
        menuDescription: json['MENUDESCRIPTION'],
        menuImage: json['MENUIMAGE']);
  }

  factory MenuModel.toMap(json) {
    return MenuModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toJson() {
    return {
      'MENUID': menuId,
      'MENUNAME': menuName,
      'MENUDESCRIPTION': menuDescription,
      'MENUIMAGE': menuImage,
    };
  }
}
