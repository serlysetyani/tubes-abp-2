// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  Future addArticles() async {
    await FirebaseFirestore.instance.collection('articles').add({
      'title': _titleController.text,
      'content': _contentController.text,
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Artikel',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: addArticles,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.file_upload),
            ),
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                ImagePicker();
              },
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Column(
              children: [
                // Textfield Judul
                TextField(
                  decoration: InputDecoration(
                      hintText: "Judul",
                      hintStyle: TextStyle(color: Colors.black)),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 12,
                ),

                // Textfield Deskripsi
                TextField(
                  decoration: InputDecoration(
                      hintText: "Deskripsi",
                      hintStyle: TextStyle(color: Colors.black)),
                  controller: _contentController,
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}
