import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vidme_live_video_chat/resources/firestore_methods.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(
                    'Room ID : ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                    subtitle:Text('Joined on : ${DateFormat.yMMMd().format( (snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
              )),
        );
      }),
    );
  }
}
