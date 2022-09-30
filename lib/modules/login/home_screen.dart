// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:firstapp/shared/components/components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var emailcontroller = TextEditingController();

  var passcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_rounded,
        ),
        title: Text(
          'page 1',
        ),
        actions: [
          IconButton(
            onPressed: onNotification,
            icon: Icon(
              Icons.search,
            ),
          )
        ],
      ),
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
                  defaultFormField(
                    controller: emailcontroller,
                    label: 'Email',
                    prefix: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    onChange: (String value) {
                      print(value);
                    },
                    onSubmit: (String value) {
                      print(value);
                    }, onTap: (){},
                    
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controller: passcontroller,
                    label: 'password',
                    prefix: Icons.lock,
                    ispassword: ispassword,
                    suffix: ispassword ? Icons.visibility_off : Icons.visibility,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    
                    onChange: (String value) {
                      print(value);
                    },
                    onSubmit: (String value) {
                      print(value);
                    },
                    suffixpressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    }, onTap: (){},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    
                    function: () {
                      if (formkey.currentState!.validate()) {
                        ///
                        print(emailcontroller.text);
                        print(passcontroller.text);
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onNotification() {
    print('notification clicked');
  }
}
