// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_app/auth/widgets/logIn.dart';
import 'package:hurry_app/bloc/auth_bloc.dart';
import 'package:hurry_app/domain/model/user.dart';
import 'package:hurry_app/order/widgets/order.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController birth = TextEditingController();
TextEditingController phone = TextEditingController();

String signUp = 'Sign up';
Color colorSignUp = Color(0xff4CE5B1);
bool successSignUp = false;

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  String dropdownvalue = gendertype[0];
  void dropdownCallback(String selectedValue) {
    setState(() {
      gendertype[0] = selectedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is SuccessFetchingSiginInData) {
                successSignUp = true;
                SignIn = 'Done';
                colorSignUp = Colors.green;
                return print('SuccessFetchingSiginInData');
              } else if (state is ErrorFetchingData) {
                colorSignUp = Colors.red;
                signUp = 'Invalid credentials';
                return print('ErrorFetchingData');
              } else if (state is LoadingData) {
                signUp = 'Loading...';
                return print('LoadingData');
              } else {
                print('object');
              }
            },
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  radius: 0.75,
                  center: Alignment(0, -0.75),
                  colors: const [Color.fromARGB(255, 16, 32, 26), Colors.black],
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
                              children: const [
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
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NAME',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 48,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: name,
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
                                  hintText: 'Enter your name',
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
                            'EMAIL',
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
                                  hintText: 'Enter your email',
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BIRTH',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 48,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: birth,
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
                                hintText: 'Enter your birth',
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PHONE',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          SizedBox(
                            width: screenWidth * 340 / screenWidth,
                            height: 48,
                            child: TextFormField(
                              style: TextStyle(color: Colors.grey),
                              controller: phone,
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
                                hintText: 'Enter your phone',
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
                    DropdownButton(
                      dropdownColor: Colors.black,
                      style: TextStyle(color: Colors.grey),
                      items: gendertype.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Remember me',
                              style: TextStyle(color: Colors.grey, fontSize: 9),
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
                            backgroundColor: colorSignUp,
                            onPressed: () {
                              UserModel userModel = UserModel(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  gender: dropdownvalue,
                                  birth: birth.text,
                                  phone: phone.text);
                              context
                                  .read<AuthBloc>()
                                  .add(PostDataFromSignUp(userinfo: userModel));
                              if (successSignUp) {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderWidget()));
                              }
                            },
                            child: Text(
                              signUp,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInWidget()));
                            },
                            child: Text(
                              'Sign in',
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

var gendertype = ['Male', 'Female'];
