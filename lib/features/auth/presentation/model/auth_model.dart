class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }
}

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class AgePrifile {
  final String gender;
  final String age;

  AgePrifile({required this.gender, required this.age});

  Map<String, dynamic> toJson() {
    return {'gender': gender, 'age': age};
  }
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imageUrl;
  final String gender;
  final String age;
  final List<AddressModel> addresses;
  final List<CardModel> cards;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.addresses,
    required this.cards,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? 0,
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? '',
    email: json["email"] ?? '',
    phone: json["phone"] ?? '',
    imageUrl: json["image_url"] ?? '',
    gender: json["gender"] ?? '',
    age: json["age"] ?? '',
    addresses: json["addresses"] == null
        ? []
        : List<AddressModel>.from(
            json["addresses"].map((x) => AddressModel.fromJson(x)),
          ),
    cards: json["cards"] == null
        ? []
        : List<CardModel>.from(json["cards"].map((x) => CardModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "image_url": imageUrl,
    "gender": gender,
    "age": age,
    "addresses": addresses == null
        ? []
        : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "cards": cards == null
        ? []
        : List<dynamic>.from(cards!.map((x) => x.toJson())),
  };
}

class AddressModel {
  final int? id;
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;

  AddressModel({this.id, this.street, this.city, this.state, this.zipCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    street: json["street"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "street": street,
    "city": city,
    "state": state,
    "zip_code": zipCode,
  };
}

class CardModel {
  final int? id;
  final String? cardNumber;
  final String? exp;
  final String? ccv;
  final String? cardholderName;

  CardModel({
    this.id,
    this.cardNumber,
    this.exp,
    this.ccv,
    this.cardholderName,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    id: json["id"],
    cardNumber: json["card_number"],
    exp: json["exp"],
    ccv: json["ccv"],
    cardholderName: json["cardholder_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "card_number": cardNumber,
    "exp": exp,
    "ccv": ccv,
    "cardholder_name": cardholderName,
  };
}
