import 'package:ClimateChange/allscreens/images.dart';
import 'package:ClimateChange/allscreens/registerationScreen.dart';
import 'package:ClimateChange/allscreens/registrationscreen/resscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../AllWidgets/progressDialog.dart';
import '../main.dart';
import '../mainscreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "Login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  LoginScreen({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const bgimages(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45.0,
                  ),
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/farmer.jpg',
                          height: 350,
                          width: 350,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Namsate',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Martian Mono',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1.0,
                        ),
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (!emailTextEditingController.text
                                .contains("@")) {
                              displayToastMessage(
                                  "hey email message isn/'t valid", context);
                            } else if (passwordTextEditingController
                                .text.isEmpty) {
                              displayToastMessage(
                                  "password is mandatory", context);
                            } else {
                              loginAndAuthenticateUser(context);
                            }
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Login Button',
                                style: TextStyle(
                                  fontFamily: 'Martian Mono',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Registration.idScreen, (route) => false);
                    },
                    child: const Text('Do not have account? Registered here'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating, Please wait..",
          );
        });

    final User = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: $errMsg", context);
    }))
        .user;

    if (User != null) {
      usersRef.child(User.uid).once().then((DatabaseEvent snap) {
        if (snap != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.idScreen, (route) => false);
          displayToastMessage("you have been logged in", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              'No record exit for this user. please Create new account',
              context);
        }
      });
      // save user info to database else
    } // null

    else {
      Navigator.pop(context);
      displayToastMessage("Error can't be signed in", context);
    }
  }
}
