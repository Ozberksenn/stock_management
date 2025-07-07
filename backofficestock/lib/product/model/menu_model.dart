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
        menuId: json['MenuId'],
        menuName: json['Name'],
        menuDescription: json['Description'],
        menuImage: json['Image'],
        showStore: json['ShowStore'] ?? true);
  }

  Map<String, dynamic> toJson() {
    return {
      'MenuId': menuId,
      'Name': menuName,
      'Description': menuDescription,
      'Image': menuImage,
      'ShowStore': showStore
    };
  }
}
