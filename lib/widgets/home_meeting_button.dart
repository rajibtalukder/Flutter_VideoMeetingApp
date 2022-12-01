import 'package:flutter/material.dart';
//import 'package:vidme_live_video_chat/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 36,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
