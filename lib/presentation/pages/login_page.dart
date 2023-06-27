import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../widgets/text_form_password.dart';
import '../../routes/app_pages.dart';

import '../widgets/text_form_global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? identity;
  TextEditingController? password;
  final _formKey = GlobalKey<FormState>();
  bool obscureT = true;

  @override
  void initState() {
    identity = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    identity?.dispose();
    password?.dispose();
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
                  "Login Account",
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
                        control: identity!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your identity";
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
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text("Remember Me")
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        )
                      ],
                    )
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
                  text: "Register",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go(Routes.register))
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
                  child: const Text("Login"),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
