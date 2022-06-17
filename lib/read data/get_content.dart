import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetContent extends StatelessWidget {
  final String documentId;

  GetContent({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference articles =
        FirebaseFirestore.instance.collection('articles');

    return FutureBuilder<DocumentSnapshot>(
      future: articles.doc(documentId).get(),
      builder: (((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['title']}");
        }
        return Text("Loading");
      })),
    );
  }
}
