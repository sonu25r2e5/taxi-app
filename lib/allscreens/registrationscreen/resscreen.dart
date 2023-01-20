import 'package:ClimateChange/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../AllWidgets/progressDialog.dart';
import '../../main.dart';
import '../images.dart';
import '../loginScreen.dart';

class resscreen extends StatelessWidget {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  resscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const bgimages(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 35.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellowAccent,
                    image: DecorationImage(
                        image: AssetImage('assets/images/girl.png')),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Welcome',
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
                        controller: nametextEditingController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          label: Text(
                            'Name',
                            style: TextStyle(color: Colors.white),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      TextField(
                        controller: emailtextEditingController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text(
                            'email',
                            style: TextStyle(color: Colors.white),
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
                        controller: phonetextEditingController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          label: Text(
                            'Phone',
                            style: TextStyle(color: Colors.white),
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
                        controller: passwordtextEditingController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (nametextEditingController.text.length < 3) {
                            displayToastMessage(
                                'name must be 3 character', context);
                          } else if (!emailtextEditingController.text
                              .contains("@")) {
                            displayToastMessage(
                                "hey email message isn/'t valid", context);
                          } else if (phonetextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Phone number is mandatory", context);
                          } else if (passwordtextEditingController.text.length <
                              6) {
                            displayToastMessage(
                                "password must be 3 character", context);
                          } else {
                            registerNewUser(context);
                          }
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'Create Account',
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
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.idScreen, (route) => false);
                  },
                  child: const Text(
                    'Already have a account? Login here',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering please wait",
          );
        });

    final User = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailtextEditingController.text,
                password: passwordtextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: $errMsg", context);
    }))
        .user;

    if (User != null) {
      Map userDataMap = {
        "name": nametextEditingController.text.trim(),
        "email": emailtextEditingController.text.trim(),
        "phone": phonetextEditingController.text.trim(),
      };
      usersRef.child(User.uid).set(userDataMap);
      displayToastMessage(
          "congratulationn your account has been created", context);
      Navigator.pushNamedAndRemoveUntil(context, HomePage.idScreen,
          (route) => false); // save user info to database else
    } // null
    else {
      Navigator.pop(context);
      displayToastMessage("New user account has not been created",
          context); // error occur display error mssg
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
