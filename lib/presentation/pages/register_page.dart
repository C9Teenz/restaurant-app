import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/cubit/register/register_cubit.dart';
import 'package:restaurant/data/models/requests/register/register_request_model.dart';

import '../../routes/app_pages.dart';
import '../widgets/text_form_global.dart';
import '../widgets/text_form_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        icon: Icons.email,
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
                        icon: Icons.attach_file_sharp,
                        label: "Enter Your username"),
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
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (data) {
                        context.go(Routes.login);
                      },
                      error: (error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: Text(error),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber[900]),
                          onPressed: () {
                            final request = RegisterRequestModel(
                                email: email!.text,
                                name: name!.text,
                                username: username!.text,
                                password: password!.text);
                            if (_formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().register(request);
                            }
                          },
                          child: const Text("Register"),
                        );
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
