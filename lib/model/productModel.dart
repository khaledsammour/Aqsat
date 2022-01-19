class ProductModel {
  late String productId,
      name,
      img,
      description,
      storage,
      price,
      quantity,
      cool,
      firstPay,
      monthlyPay,
      popular,
      categorey,
      cpu,
      ram;
  //late Color color;
  ProductModel({
    required this.name,
    required this.img,
    required this.description,
    //required this.color,
    required this.storage,
    required this.price,
    required this.quantity,
    required this.firstPay,
    required this.monthlyPay,
    required this.popular,
    required this.categorey,
    required this.productId,
    required this.cpu,
    required this.ram,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    img = map['img'];
    description = map['description'];
    // color = HexColor.fromHex(map['color']);
    storage = map['storage'];
    price = map['price'];
    firstPay = map['firstPay'];
    monthlyPay = map['monthlyPay'];
    quantity = map['quantity'];
    popular = map['popular'];
    categorey = map['categorey'];
    productId = map['productId'];
    cpu = map['cpu'];
    ram = map['ram'];
  }
  toJson() {
    return {
      "img": img.toString(),
      "name": name,
      "description": description,
      // "color": color.toString(),
      "storage": storage,
      "price": price,
      "firstPay": firstPay,
      "monthlyPay": monthlyPay,
      "quantity": quantity,
      "popular": popular,
      "cool": 'false',
      "categorey": categorey,
      "productId": productId,
      "cpu": cpu,
      "ram": ram,
    };
  }
}
