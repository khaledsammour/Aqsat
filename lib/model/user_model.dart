class UserModel {
  late String userId, email, name, pic, type, phoneNumber;
  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
    required this.type,
    required this.phoneNumber,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    type = map['type'];
    phoneNumber = map['phoneNumber'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'type': type,
      'phoneNumber': phoneNumber,
    };
  }
}
