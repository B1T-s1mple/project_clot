class AddAdressModel {
  final String street;
  final String city;
  final String state;
  final String zipCode;

  AddAdressModel({

    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'zip_code': zipCode,
    };
  }
}
