import 'package:flutter/material.dart';
import 'package:vidme_live_video_chat/screens/history_screen.dart';
import 'package:vidme_live_video_chat/screens/meeting_screen.dart';
import 'package:vidme_live_video_chat/screens/setting_screen.dart';
import 'package:vidme_live_video_chat/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    MeetingScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];
  int _page = 0;
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VidMe Meeting'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        //elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          backgroundColor: footerColor,
          type: BottomNavigationBarType.shifting,
          currentIndex: _page,
          onTap: onPageChanged,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.videocam), label: 'Meeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ]),
      body: pages[_page],
    );
  }
}
