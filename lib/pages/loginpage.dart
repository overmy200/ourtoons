import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ourtoons/components/customdialog.dart';
import 'package:ourtoons/pages/profilepage.dart';
import 'package:ourtoons/pages/signup.dart';

class MyLoginPageMobile extends StatefulWidget {
  MyLoginPageMobile({super.key});

  @override
  State<MyLoginPageMobile> createState() => _MyLoginPageMobileState();
}

class _MyLoginPageMobileState extends State<MyLoginPageMobile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      if (userCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.show(
            context, 'User not found', 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'worng-password') {
        CustomDialog.show(context, 'Password not found',
            'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      } else {
        CustomDialog.show(context,'Not found this User.','Wrong password or email.');
        print('Error: ${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 5 / 9,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(3, 30),
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 3)
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30, top: 80)),
                      Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Text(
                        "Doesn't have an accout yet?",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: _login,
                          child:
                              Text('LOGIN', style: TextStyle(fontSize: 25)))),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 1,
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(2, 3),
                              ),
                            ]),
                        child: Center(
                            child: Text('Or', style: TextStyle(fontSize: 25))),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      )
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
}
