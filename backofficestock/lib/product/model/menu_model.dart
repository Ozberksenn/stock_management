class MenuModel {
  final int menuId;
  final String? menuName;
  final String? menuDescription;
  final String? menuImage;
  final bool showStore;

  MenuModel(
      {required this.menuId,
      this.menuName,
      this.menuDescription,
      this.menuImage,
      required this.showStore});

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
        menuId: json['MENUID'],
        menuName: json['MENUNAME'],
        menuDescription: json['MENUDESCRIPTION'],
        menuImage: json['MENUIMAGE'],
        showStore: json['SHOWSTORE'] ?? true);
  }

  Map<String, dynamic> toJson() {
    return {
      'MENUID': menuId,
      'MENUNAME': menuName,
      'MENUDESCRIPTION': menuDescription,
      'MENUIMAGE': menuImage,
      'SHOWSTORE': showStore
    };
  }
}
