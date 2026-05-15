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
// ignore: camel_case_types
class agePrifile {
  final String gender;
  final String age;

  agePrifile({
    required this.gender,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'age': age,
    };
  }
}
