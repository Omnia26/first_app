// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, avoid_print


import 'package:firstapp/shared/components/components%20copy.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultformfield(
                    emailController: emailController,
                    type: TextInputType.emailAddress,
                    icoon: Icons.email,
                    label: "email",
                    onchange: (value) {
                      print(value);
                    },
                    onsubmit: (value) {
                      print(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'email can not be null';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultformfield(
                    emailController: passwordController,
                    type: TextInputType.visiblePassword,
                    icoon: Icons.lock,
                    suffix: ispassword ? Icons.visibility_off : Icons.visibility,
                    label: "password",
                    ispass: ispassword,
                    onchange: (value) {
                      print(value);
                    },
                    onsubmit: (value) {
                      print(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password can not be null';
                      }
                      return null;
                    },
                    suffixpressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    width: double.infinity,
                    uesdcolor: Colors.red,
                    raddius: 6.0,
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
