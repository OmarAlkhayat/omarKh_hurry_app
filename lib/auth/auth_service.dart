import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hurry_app/auth/widgets/logIn.dart';
import 'package:hurry_app/bloc/auth_bloc.dart';
import 'package:hurry_app/domain/model/user.dart';
import 'package:hurry_app/domain/services/base_service.dart';
import 'package:hurry_app/model/token_model.dart';
import 'package:hurry_app/order/widgets/order.dart';

// late UserModel userModel;
// late UserModelSignIn userModelSignIn;
String mytoken = '';
String mytokken = '';

class ImpRegisterService extends BaseService {
  Future login(UserModelSignIn userModelSignIn) async {
    try {
      Response response = await dio.post('$authUrl/login',
          options: Options(method: 'Post'), data: userModelSignIn.toJson());
      // print('service \n $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('service');
        // print(json.encode(response.data));
        TokenModel token = TokenModel.fromMap(response.data);
        // print(token.token);
        String myToken = token.token;
        await storage.write(key: 'token', value: myToken);
        // my

        // config.get<SharedPreferences>().setString('token', token.token);

        return token;
      } else {
        // print(response.statusMessage);
        return ErrorModel(messaeg: 'No Internet');
      }
    } catch (e) {
      String exc = e.toString();

      return ErrorModel(messaeg: exc);
    }
  }

  Future register(UserModel userModel) async {
    try {
      Response response = await dio.post(
        '$authUrl/register',
        options: Options(
          method: 'POST',
        ),
        data: userModel.toJson(),
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(json.encode(response.data));
        TokenModel tokenModel = TokenModel.fromMap(response.data);
        return tokenModel;
      } else {
        // print(response.statusMessage);
        return ErrorModel(messaeg: 'No Internet');
      }
    } catch (e) {
      String exc = e.toString();

      return ErrorModel(messaeg: exc);
    }
  }

  // UserModel getRegData() {
  //   return userModel;
  // }
}
