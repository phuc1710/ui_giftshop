import 'package:flutter/material.dart';

import 'src/presentation/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GiftShop',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
