import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vidme_live_video_chat/resources/auth_methods.dart';
import 'package:vidme_live_video_chat/screens/home_screen.dart';
import 'package:vidme_live_video_chat/screens/login_screen.dart';
import 'package:vidme_live_video_chat/screens/video_call_screen.dart';
import 'package:vidme_live_video_chat/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}


//lets build apk file....
//flutter build apk --build-name=1.0.1 --build-number=1
//flutter build apk --build-name=1.0.2 --build-number=2