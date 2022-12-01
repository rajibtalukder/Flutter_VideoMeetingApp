import 'package:flutter/material.dart';
import 'package:vidme_live_video_chat/resources/auth_methods.dart';

import 'package:vidme_live_video_chat/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginBack.png"),
                fit: BoxFit.cover,
                opacity: 0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'VidMe',
                    style: TextStyle(
                      //color: Colors.amber,
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Text('Let\'s make a video meeting',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 80),
                CustomButton(
                  text: 'Sign In with Google',
                  onPressed: () async {
                    bool res = await _authMethods.signInWithGoogle(context);
                    if(res){
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
