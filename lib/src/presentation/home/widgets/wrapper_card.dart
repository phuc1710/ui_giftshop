import 'package:flutter/material.dart';

class WrapperCard extends StatelessWidget {
  const WrapperCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
