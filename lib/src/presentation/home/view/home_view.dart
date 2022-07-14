import 'package:flutter/material.dart';

import '../../../model/icon/gift_shop_app_icons.dart';
import '../widgets/home_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> tabs = [
    const HomeTabView(),
    const Center(
      child: Text('Yêu thích'),
    ),
    const Center(
      child: Text('Lọc'),
    ),
    const Center(
      child: Text('Người dùng'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_selectedIndex],
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFFFFD4DE),
            child: const Icon(
              GiftShopAppIcon.box,
              color: Color(0xFF335D7E),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: const Color(0xFF8CBFE7),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.025,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: const Color(0xFFF27280),
              unselectedItemColor: const Color(0xFFFFD4DE),
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(GiftShopAppIcon.home, size: 26),
                  label: 'Trang chủ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(GiftShopAppIcon.favourite, size: 26),
                  label: 'Yêu thích',
                ),
                BottomNavigationBarItem(
                  icon: Icon(GiftShopAppIcon.filter, size: 26),
                  label: 'Lọc',
                ),
                BottomNavigationBarItem(
                  icon: Icon(GiftShopAppIcon.user, size: 26),
                  label: 'Người dùng',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
