// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent {}

class PostDataFromSignIn extends AuthEvent {
  UserModelSignIn userinfo;
  PostDataFromSignIn({
    required this.userinfo,
  });
}

class PostDataFromSignUp extends AuthEvent {
  UserModel userinfo;
  PostDataFromSignUp({
    required this.userinfo,
  });
}
