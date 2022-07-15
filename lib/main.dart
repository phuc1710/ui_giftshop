import 'package:flutter/material.dart';

import 'src/presentation/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiftShop',
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData(
        primaryColor: const Color(0xFF8CBFE7),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: const Color(0xFF8CBFE7)),
      ),
    );
  }
}
