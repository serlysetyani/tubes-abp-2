import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/inbox_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                "Profil",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "${user?.email}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  // Sign out button

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
