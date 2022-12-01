import 'package:flutter/material.dart';
//import 'package:vidme_live_video_chat/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.teal,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
