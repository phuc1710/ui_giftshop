import 'dart:async';

import 'package:flutter/material.dart';

import '../../../model/icon/gift_shop_app_icons.dart';
import 'page_indicator.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final _controller = PageController();
  var page = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (page < 2) {
        page++;
      } else {
        page = 0;
      }

      if (_controller.hasClients)
        _controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(GiftShopAppIcon.box),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.03,
                            ),
                            hintText: 'Nhập tên món quà của bạn?',
                            suffixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(GiftShopAppIcon.box),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView(
                        controller: _controller,
                        onPageChanged: (index) => setState(() {
                          page = index;
                        }),
                        children: List.generate(3, (index) {
                          return Center(child: Text(index.toString()));
                        }),
                      ),
                      PageIndicator(
                        controller: _controller,
                        pageCount: 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Text('Quà sinh nhật phổ biến'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: const Color(0xFFFFD4DE),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.blue,
                                child: const Placeholder(
                                  fallbackHeight: 50,
                                ),
                              ),
                            ),
                          ),
                          Text('dummy $index'),
                          Text('dummy $index')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Danh mục các ngày kỉ niệm'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    8,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                color: const Color(0xFFFFD4DE),
                                width: MediaQuery.of(context).size.height * 0.07,
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Placeholder(
                                    fallbackHeight: 1,
                                  ),
                                ),
                              ),
                            ),
                            Text('dumm $index')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
