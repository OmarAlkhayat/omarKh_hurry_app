// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String email;
  String password;
  String gender;
  String birth;
  String phone;
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birth,
    required this.phone,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? gender,
    String? birth,
    String? phone,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'birth': birth,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: map['gender'] as String,
      birth: map['birth'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, gender: $gender, birth: $birth, phone: $phone)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.gender == gender &&
        other.birth == birth &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        birth.hashCode ^
        phone.hashCode;
  }
}

class UserModelSignIn {
  String email;
  String password;
  UserModelSignIn({
    required this.email,
    required this.password,
  });

  UserModelSignIn copyWith({
    String? email,
    String? password,
  }) {
    return UserModelSignIn(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory UserModelSignIn.fromMap(Map<String, dynamic> map) {
    return UserModelSignIn(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSignIn.fromJson(String source) => UserModelSignIn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModelSignIn(email: $email, password: $password)';

  @override
  bool operator ==(covariant UserModelSignIn other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
