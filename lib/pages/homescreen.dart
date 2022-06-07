// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngalamblog_flutetr/pages/addArticle_page.dart';

import '../pages/inbox_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Beranda",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
        body: Center(
          child: Text("data"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddArticle();
            }));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
