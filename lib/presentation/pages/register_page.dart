import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_pages.dart';
import '../widgets/text_form_global.dart';
import '../widgets/text_form_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? name;
  TextEditingController? username;
  final _formKey = GlobalKey<FormState>();
  bool obscureT = true;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email?.dispose();
    password?.dispose();
    username?.dispose();
    name?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Register Account",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormGlobal(
                        control: email!,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please make sure use correct format";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Your Email"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormGlobal(
                        control: name!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is Empty";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Your Name"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormGlobal(
                        control: username!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "UserName is Empty";
                          }
                          return null;
                        },
                        inputType: TextInputType.text,
                        icon: Icons.person,
                        label: "Enter Your Identity"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormPassword(
                        control: password!,
                        obscure: obscureT,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            obscureT = !obscureT;
                          });
                        }),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Checkbox(value: false, onChanged: (value) {}),
                    //         const Text("Remember Me")
                    //       ],
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: const Text("Forgot Password?"),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(text: "Haven't an account? ", children: [
              TextSpan(
                  text: "Login",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go(Routes.login))
            ])),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[900]),
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
