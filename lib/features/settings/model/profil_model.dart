
class ProfilModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String imageUrl;
  final String gender;
  final String age; 
  final List<dynamic> addresses;
  final List<dynamic> cards;

  ProfilModel({
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

  factory ProfilModel.fromJson(Map<String, dynamic> json) {
    return ProfilModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      imageUrl: json['image_url'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? '',
      addresses: List<dynamic>.from(json['addresses'] ?? []),
      cards: List<dynamic>.from(json['cards'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'image_url': imageUrl,
      'gender': gender,
      'age': age,
      'addresses': addresses,
      'cards': cards,
    };
  }
}