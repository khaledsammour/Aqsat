class AddressModel {
  late String latitude;
  late String longitude;
  late String userId;
  late String phoneNumber;
  AddressModel({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
  });

  AddressModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    userId = map['userId'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    phoneNumber = map['phoneNumber'];
  }
  toJson() {
    return {
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'phoneNumber': phoneNumber,
    };
  }
}
