class BuyModel {
  late String productId,
      time,
      name,
      img,
      price,
      userId,
      firstPay,
      monthlyPay,
      total,
      pending,
      news,
      monthLeft,
      latitude,
      longitude,
      lastPayDate,
      buyId;
  late Map paymentHistory;
  BuyModel({
    required this.userId,
    required this.name,
    required this.img,
    required this.price,
    required this.firstPay,
    required this.monthlyPay,
    required this.total,
    required this.pending,
    required this.news,
    required this.monthLeft,
    required this.latitude,
    required this.longitude,
    required this.productId,
    required this.time,
    required this.lastPayDate,
    required this.paymentHistory,
  });
  BuyModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    img = map['img'];
    price = map['price'];
    userId = map['userId'];
    firstPay = map['firstPay'];
    monthlyPay = map['monthlyPay'];
    total = map['total'];
    pending = map['pending'];
    news = map['news'];
    monthLeft = map['monthLeft'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    productId = map['productId'];
    time = map['time'];
    buyId = map['buyId'];
    lastPayDate = map['lastPayDate'];
    paymentHistory = map['paymentHistory'];
  }
  toJson(v) {
    return {
      'name': name,
      'img': img,
      'price': price,
      'userId': userId,
      'firstPay': firstPay,
      'monthlyPay': monthlyPay,
      'total': total,
      'pending': pending,
      'news': news,
      'monthLeft': monthLeft,
      'latitude': latitude,
      'longitude': longitude,
      'productId': productId,
      'time': time,
      'buyId': v,
      'lastPayDate': lastPayDate,
      'paymentHistory': paymentHistory,
    };
  }
}
