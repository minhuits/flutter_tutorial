class FormModel {
  final String name;
  final String email;
  final String gender;
  final String dateOfBirth;
  final String password;

  const FormModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.dateOfBirth,
    required this.password,
  });

  static copyWith({
    String? name,
    String? email,
    String? gender,
    String? dateOfBirth,
    String? password,
  }) {
    return FormModel(
      name: name ?? name!,
      email: email ?? email!,
      gender: gender ?? gender!,
      dateOfBirth: dateOfBirth ?? dateOfBirth!,
      password: password ?? password!,
    );
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      name: map['name'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      password: map['password'] as String,
    );
  }
}
