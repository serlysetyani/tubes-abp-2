// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngalamblog_flutetr/pages/homescreen.dart';

import 'package:ngalamblog_flutetr/pages/profile_screen.dart';

import '../pages/inbox_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  int selectedPage = 0;

  final _pageOptions = [HomeScreen(), InboxScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), label: "Cari"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 30), label: "Profil"),
          ],
          selectedItemColor: Colors.blue,
          elevation: 5.0,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
