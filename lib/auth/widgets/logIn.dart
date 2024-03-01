// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/auth/auth_service.dart';
import 'package:hurry_app/auth/widgets/signUp.dart';
import 'package:hurry_app/bloc/auth_bloc.dart';
import 'package:hurry_app/config/get_it.dart';
import 'package:hurry_app/domain/model/user.dart';
import 'package:hurry_app/model/token_model.dart';
import 'package:hurry_app/order/widgets/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
late UserModelSignIn userModelSignIn;
String SignIn = 'Sign In';
Color color = Color(0xff4CE5B1);
bool success = false;

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) async {
              if (state is SuccessFetchingSiginInData) {
                success = true;
                SignIn = 'Done';
                color = Colors.green;
                // print(await storage.read(key: 'token'));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderWidget()));

                return print('SuccessFetchingSiginInData');
              } else if (state is ErrorFetchingData) {
                setState(() {
                  SignIn = 'Invalid credentials';
                  color = Colors.red;
                });
                return print('ErrorFetchingData');
              } else if (state is LoadingData) {
                SignIn = 'Loading';
                return print('LoadingData');
              } else {
                print('else state');
              }
            },
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  radius: 0.75,
                  center: Alignment(0, -0.75),
                  colors: [Color.fromARGB(255, 16, 32, 26), Colors.black],
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                              text: 'r',
                              children: [
                            TextSpan(
                                text: 'i',
                                style: TextStyle(color: Color(0xff1EFFB2))),
                            TextSpan(
                                text: 'i',
                                style: TextStyle(color: Color(0xff1EFFB2))),
                            TextSpan(text: 'd'),
                            TextSpan(text: 'e')
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to RIIDE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'USERNAME',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 48,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: email,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 0)),
                                  fillColor: Color.fromARGB(255, 21, 21, 21),
                                  filled: true,
                                  hintText: 'Enter email or username',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(123, 158, 158, 158),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PASSWORD',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 48,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: password,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                fillColor: Color.fromARGB(255, 21, 21, 21),
                                filled: true,
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(123, 158, 158, 158),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // borderSide: BorderSide(color: Colors.amber),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Remember me',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 9),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 50,
                          width: screenWidth * 340 / screenWidth,
                          child: FloatingActionButton(
                            backgroundColor: color,
                            // Color(0xff4CE5B1),
                            onPressed: () {
                              // UserModelSignIn userModelSignIn = UserModelSignIn(
                              //     email: email.text, password: password.text);
                              // var data = {
                              //   "email": email.text,
                              //   "password": password.text
                              // };
                              userModelSignIn = UserModelSignIn(
                                  email: email.text, password: password.text);
                              context.read<AuthBloc>().add(PostDataFromSignIn(
                                  userinfo: userModelSignIn));
                            },
                            child: (state is LoadingData)
                                ? CircularProgressIndicator()
                                : Text(
                                    SignIn,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpWidget()));
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
