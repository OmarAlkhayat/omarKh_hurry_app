// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hurry_app/auth/auth_service.dart';
import 'package:hurry_app/domain/model/user.dart';
import 'package:hurry_app/model/token_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final storage = new FlutterSecureStorage();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<PostDataFromSignIn>((event, emit) async {
      emit(LoadingData());

      ResultModel temp = await ImpRegisterService().login(event.userinfo);
      if (temp is ErrorModel) {
        emit(ErrorFetchingData());
      } else {
        //  await storage.write(key: 'token', value: temp.toString());
        emit(SuccessFetchingSiginInData(tokenModelSignIn: temp as TokenModel));
      }
      // emit(SuccessFetchingSiginInData(userModel: data));
    });
    on<PostDataFromSignUp>((event, emit) async {
      emit(LoadingData());

      ResultModel temp = await ImpRegisterService().register(event.userinfo);
      if (temp is ErrorModel) {
        emit(ErrorFetchingData());
      }
      // else if (temp == 'No Internet') {
      //   print('else if');
      //   emit(NoInternet());
      // }
      else {
        emit(SuccessFetchingSiginUpData(userModel: temp as TokenModel));
      }
      // emit(SuccessFetchingSiginInData(userModel: data));
    });
  }
}
