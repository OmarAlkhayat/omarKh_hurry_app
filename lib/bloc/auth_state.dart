// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'auth_bloc.dart';

sealed class AuthState {
  AuthState();
}

final class AuthInitial extends AuthState {}

class LoadingData extends AuthState {}


class SuccessFetchingSiginInData extends AuthState {
  TokenModel tokenModelSignIn;
  SuccessFetchingSiginInData({required this.tokenModelSignIn});
}


class ErrorFetchingData extends AuthState {}


class SuccessFetchingSiginUpData extends AuthState {
  TokenModel userModel;
  SuccessFetchingSiginUpData({required this.userModel});
}

