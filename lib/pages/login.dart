import 'package:cuki_app/models/constants.dart';
import 'package:cuki_app/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Constants myConstant = Constants();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/logo.png",
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text(
                //   "Job Finder",
                //   style: TextStyle(
                //       fontSize: 30,
                //       fontWeight: FontWeight.w800,
                //       color: myConstant.secondaryColor),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: myConstant.secondaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Email"),
                    controller: emailController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: myConstant.secondaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Password"),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    firebaseAuth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                    // login(context, emailController.text.toString(),
                    //     passwordController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: myConstant.secondaryColor,
                        border: Border.all(color: myConstant.secondaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        firebaseAuth
                            .signInWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString())
                            .then((value) => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => Welcome())));
                        // login(context, emailController.text.toString(),
                        //     passwordController.text.toString());
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    firebaseAuth.createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                    //firebaseAuth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
                    // login(context, emailController.text.toString(),
                    //     passwordController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //     color: myConstant.secondaryColor,
                    //     border: Border.all(color: myConstant.secondaryColor),
                    //     borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        firebaseAuth
                            .createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString())
                            .then((value) => (value))
                            .catchError((e) {
                          Fluttertoast.showToast(msg: 'Gagal');
                        });
                        // login(context, emailController.text.toString(),
                        //     passwordController.text.toString());
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

void login(BuildContext context, String username, String password) {
  try {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Welcome(username)),
    // );
  } catch (e) {}
}
