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
}
