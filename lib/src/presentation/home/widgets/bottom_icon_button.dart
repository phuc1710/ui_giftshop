import 'package:flutter/material.dart';

class BottomIconButton extends StatelessWidget {
  const BottomIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFFF27280),
            size: 24,
          ),
          Text(title)
        ],
      ),
    );
  }
}
