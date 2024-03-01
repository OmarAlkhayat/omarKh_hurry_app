// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ResultModel {}

class ErrorModel extends ResultModel {
  String messaeg;
  ErrorModel({
    required this.messaeg,
  });

  ErrorModel copyWith({
    String? messaeg,
  }) {
    return ErrorModel(
      messaeg: messaeg ?? this.messaeg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messaeg': messaeg,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      messaeg: map['messaeg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorModel(messaeg: $messaeg)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;

    return other.messaeg == messaeg;
  }

  @override
  int get hashCode => messaeg.hashCode;
}

///////////////////////////////////////////////////////////////////
class TokenModel extends ResultModel {
  String token;
  TokenModel({
    required this.token,
  });
  getToken() {
    return token;
  }

  TokenModel copyWith({
    String? token,
  }) {
    return TokenModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TokenModel(token: $token)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
