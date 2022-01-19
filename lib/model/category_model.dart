class CategoryModel {
  late String name, img;
  CategoryModel({required this.name, required this.img});
  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    img = map['img'];
  }
  toJson() {
    return {
      'name': name,
      'img': img,
    };
  }
}
