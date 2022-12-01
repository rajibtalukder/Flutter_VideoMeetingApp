import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vidme_live_video_chat/resources/jitsimeet_methods.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsimeetMethods _jitsimeetMethods = JitsimeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsimeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Create a new meeting / Join a meeting!',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                  onPressed: createNewMeeting,
                  icon: Icons.videocam_outlined,
                  text: 'Create Meeting'),
              HomeMeetingButton(
                  onPressed: () => joinMeeting(context),
                  icon: Icons.video_call_outlined,
                  text: 'Join Meeting'),
            ],
          ),
        ),
      ],
    );
  }
}
