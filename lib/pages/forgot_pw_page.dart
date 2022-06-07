// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Link reset password telah dikirim ke email anda"),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Password'),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 24),

          // reset password message
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
                "Masukkan email anda untuk mengirimkan link untuk mereset password"),
          ),

          // email textfield
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Email"),
                ),
              ),
            ),
          ),

          // button reset password

          SizedBox(height: 8),
          MaterialButton(
              onPressed: passwordReset,
              color: Colors.blue,
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
