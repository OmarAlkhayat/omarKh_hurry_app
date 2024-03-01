import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/auth/auth_service.dart';
import 'package:hurry_app/auth/widgets/logIn.dart';
import 'package:hurry_app/bloc/auth_bloc.dart';
import 'package:hurry_app/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/get_it.dart';

String title = '';
// String omar = '';
// String myToken = '';

// blodpro
// builder
// blodcons
//     builder
class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(
            // title: Text(),
            // title: Text(config.get<SharedPreferences>().getString('token')),
            ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var token = await storage.read(key: 'token');
                print(token);
              },
              child: Icon(Icons.abc),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
