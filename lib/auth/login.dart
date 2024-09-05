import 'package:flutter/material.dart';
import 'package:minto/constands/constands.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/minto_logo.png',
                      width: 200,
                    ),
                  ),
                  const Text(
                    'MINTO',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Bryndan',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter a valid username';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter a valid password';
                      }
                      return null;
                    },
                    controller: passController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ],
              ),
              ActionButton(
                  onpressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushReplacementNamed(context, '/home')
                          .then((value) {});

                      message(context,
                          message: 'login successfully', color: Colors.green);
                    }
                  },
                  actionTitle: 'login')
            ],
          ),
        ),
      ),
    );
  }
}
