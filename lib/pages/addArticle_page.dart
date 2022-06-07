import 'package:flutter/material.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Artikel',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
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
            Container(
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
            SizedBox(
              height: 10,
            ),
            Container(
                child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: "Judul",
                      hintStyle: TextStyle(color: Colors.black)),
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
