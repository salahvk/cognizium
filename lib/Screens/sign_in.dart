import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognizium/Screens/Admin/admin_home_page.dart';
import 'package:cognizium/Screens/Home_page.dart';
import 'package:cognizium/components/color_manager.dart';
import 'package:cognizium/components/styles_manager.dart';
import 'package:cognizium/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool _isPasswordVisible = false;
  String email = "";
  String password = "";
  bool loading = false;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 221, 221),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [ColorManager.gradient1, ColorManager.gradient2],
          )),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.11, bottom: size.height * 0.02),
                    child: Text(
                      'Welcome back!',
                      style: getRegularStyle(
                          color: ColorManager.background, fontSize: 16),
                    ),
                  ),
                  Text(
                    'Log in to your existent account \nof Cognizium!',
                    style: getRegularStyle(
                        color: ColorManager.background, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.04, bottom: size.height * 0.02),
                    child: Container(
                      width: size.width * 0.25,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: ColorManager.whiteText,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            style:
                                const TextStyle(color: ColorManager.background),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontroller,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focusNode);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter username',
                                hintStyle: getRegularStyle(
                                    color: ColorManager.grayDark,
                                    fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Container(
                      width: size.width * 0.25,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: ColorManager.whiteText,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          style:
                              const TextStyle(color: ColorManager.background),
                          focusNode: focusNode,
                          obscureText: !_isPasswordVisible,
                          controller: passcontroller,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  }),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: getRegularStyle(
                                  color: ColorManager.grayDark, fontSize: 12)),
                        ),
                      )),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       'Recovery Password',
                  //       style: getRegularStyle(color: ColorManager.grayDark),
                  //     ),
                  //   ],
                  // ),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      onsubmitted();
                      // print("Login");
                      // Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      //   return const HomePage();
                      // }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: size.height / 25, bottom: size.height * 0.04),
                      height: size.height / 17,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          color: ColorManager.errorRed,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: loading == false
                            ? Text("Sign In",
                                style: TextStyle(
                                    fontSize: size.height / 51,
                                    fontFamily: "Open",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                            : Container(
                                child: const CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    Text("Or continue with",
                        style: getRegularStyle(color: ColorManager.grayDark)),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: ColorManager.whiteText,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            child: Container(
                              width: size.width * 0.2,
                              height: size.height * 0.06,
                              decoration: const BoxDecoration(),
                              child: const Center(
                                  child: FaIcon(
                                FontAwesomeIcons.google,
                                color: ColorManager.errorRed,
                              )),
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.signInRoute);
                            },
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.whiteText,
                          child: InkWell(
                            child: Container(
                              width: size.width * 0.2,
                              height: size.height * 0.06,
                              decoration: const BoxDecoration(),
                              child: const Center(
                                  child: FaIcon(
                                FontAwesomeIcons.apple,
                              )),
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.phoneNumber);
                            },
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.whiteText,
                          child: InkWell(
                            child: Container(
                              width: size.width * 0.2,
                              height: size.height * 0.06,
                              decoration: const BoxDecoration(),
                              child: const Center(
                                  child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              )),
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.phoneNumber);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: getRegularStyle(
                            color: ColorManager.background, fontSize: 12),
                      ),
                      GestureDetector(
                        child: Text(
                          'Create new one',
                          style:
                              getRegularStyle(color: Colors.blue, fontSize: 12),
                        ),
                        onTap: () {
                          // Navigator.pushReplacementNamed(
                          //     context, Routes.signUpRoute);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//* on submitted function

  Future onsubmitted() async {
    email = emailcontroller.text.trim();
    password = passcontroller.text.trim();
    print(email);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    print('$emailValid emailValid');

    if (email.isEmpty || email.length < 4 || emailValid != true) {
      showSnackBar("Enter a valid Email!", context,
          icon: Icons.email, color: Colors.white);
    } else if (password.isEmpty || password.length < 6) {
      showSnackBar("Password must be 6 Characters!", context,
          icon: Icons.email, color: Colors.white);
    } else {
      setState(() {
        loading = true;
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text, password: passcontroller.text);
        print('Sign in');

        // getAdminDetails();
        if (emailcontroller.text == 'cogniziumofficial@gmail.com') {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const AdminHomePage();
          }));
          return;
        }
        getUserDetails();
        // Timer(const Duration(seconds: 2), () {
        //   print('How many');
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, Routes.shopList, (route) => false);
        // });
        Future.delayed(const Duration(seconds: 2), () {
          print('second');
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const HomePage();
          }));
        });
      } on FirebaseAuthException catch (e) {
        print(e.code);
        print(e.message);
        if (e.code == 'wrong-password') {
          // print(
          //     'The password is invalid or the user does not have a password.');
          showSnackBar("The password is invalid", context,
              icon: Icons.email, color: Colors.white);
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        } else if (e.code == 'user-not-found') {
          showSnackBar("There is no user in this name", context,
              icon: Icons.email, color: Colors.white);
        } else if (e.code == 'too-many-requests') {
          showSnackBar("Too many requests.Try again later", context,
              icon: Icons.email, color: Colors.white);
        } else if (e.code == 'network-request-failed') {
          showSnackBar(
              "interrupted connection ! Please check your network", context,
              icon: Icons.email, color: Colors.white);
        } else if (e.code == 'unknown') {
          showSnackBar("Please check your connection", context,
              icon: Icons.email, color: Colors.white);
        }
        setState(() {
          loading = false;
        });
      }
    }
  }

  //* on submitted function
  getUserDetails() {
    // final provider = Provider.of<Data>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    log('Get user details');
    print(user?.email);
    print('Login name');

    FirebaseFirestore.instance
        .collection(user!.email!)
        .doc(user.uid)
        .get()
        .then((value) {
      final userPlace = value.get('campusName');
      print(userPlace);
    });
  }
}
