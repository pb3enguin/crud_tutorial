import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../function/person_info_firestore.dart';

class StreamTestScreen extends StatefulWidget {
  const StreamTestScreen({Key? key}) : super(key: key);

  @override
  State<StreamTestScreen> createState() => _StreamTestScreenState();
}

class _StreamTestScreenState extends State<StreamTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: context
            .read<FireStorePersonInfo>()
            .fireInstance
            .collection('stream_test')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                print(index);
                print(documentSnapshot['value'].toString());
                return Card(
                  child: Text(documentSnapshot['value'].toString()),
                );
              },
            );
          }
          return const CircularProgressIndicator(
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
