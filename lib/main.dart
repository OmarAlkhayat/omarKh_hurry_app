// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hurry_app/auth/widgets/logIn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/config/bloc_observer.dart';
import 'package:hurry_app/config/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  getIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInWidget(),
    );
  }
}
