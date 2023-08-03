import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourtoons/components/customdialog.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    }
    CustomDialog.show(context, 'Success', 'Go to login page.');
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(3, 3))
              ]),
          child: Container(
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true),
              ),
              SizedBox(height: 30),
              SizedBox(
                  width: 250,
                  height: 50,
                  child:
                      ElevatedButton(onPressed: _signUp, child: Text('Send'))),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Already have accout?',
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In'))
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
