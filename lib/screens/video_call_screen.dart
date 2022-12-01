import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:vidme_live_video_chat/resources/auth_methods.dart';
import 'package:vidme_live_video_chat/resources/jitsimeet_methods.dart';
import 'package:vidme_live_video_chat/utils/colors.dart';
import 'package:vidme_live_video_chat/widgets/custom_button.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController nameController;
  late TextEditingController meetingIdController;
  final JitsimeetMethods _jitsimeetMethods = JitsimeetMethods();

  joinMeeting() {
    _jitsimeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: false,
      isVideoMuted: false,
      username: nameController.text,
    );
  }

  @override
  void initState() {
    nameController = TextEditingController(text: _authMethods.user.displayName);
    meetingIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Join Meeting'),
            centerTitle: true,
            backgroundColor: backgroundColor),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                maxLines: 1,
                //keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: meetingIdController,
                textAlign: TextAlign.center,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Meeting ID',
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              CustomButton(text: 'Join Now', onPressed: joinMeeting)
            ],
          ),
        ));
  }
}
