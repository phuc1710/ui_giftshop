import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/routes.dart';
import '../../../model/icon/gift_shop_app_icons.dart';
import '../../../model/product/product_detail.dart';
import 'page_indicator.dart';
import 'wrapper_card.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
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
              child: const HeaderRow(),
            ),
            const ImageSlider(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 4),
              child: Text(
                'Danh mục các ngày kỉ niệm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CategorySection(),
            const Text(
              'Quà sinh nhật phổ biến',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const PopularGifts(),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  CategorySection({
    Key? key,
  }) : super(key: key);

  final List<IconData> icons = [
    GiftShopAppIcon.birthday_cake,
    GiftShopAppIcon.woman,
    GiftShopAppIcon.mother,
    GiftShopAppIcon.graduation_hat,
    GiftShopAppIcon.children,
    GiftShopAppIcon.new_house,
    GiftShopAppIcon.valentines_day,
    GiftShopAppIcon.teaching
  ];

  final List<String> occasions = [
    'Sinh nhật',
    'Ngày 8/3',
    'Ngày của mẹ',
    'Tốt nghiệp',
    'Ngày 1/6',
    'Tân gia',
    'Valentine',
    'Ngày 20/11',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.3,
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          8,
          (index) => InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: height * 0.1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color(0xFFFFD4DE),
                        width: height * 0.07,
                        height: height * 0.07,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(icons[index], size: 32),
                        ),
                      ),
                    ),
                    Text(occasions[index], style: const TextStyle(fontSize: 10))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PopularGifts extends StatelessWidget {
  const PopularGifts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.18,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8),
          child: InkWell(
            onTap: () => context.router.push(
              GiftDetailRoute(
                name: productList[index].name ?? '',
                price: productList[index].price ?? '',
                imagePath: productList[index].id ?? '',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                color: const Color(0xFFFFD4DE),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.square(
                          dimension: height * 0.09,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Hero(
                              tag: '${productList[index].id}ImagePath',
                              child: Image.asset(
                                'assets/images/${productList[index].id}.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${productList[index].name}',
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      '${productList[index].price}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final _controller = PageController();
  var page = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (page < 2) {
        page++;
      } else {
        page = 0;
      }

      if (_controller.hasClients)
        _controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: WrapperCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: height * 0.22,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) => setState(() => page = index),
                  children: List.generate(
                    3,
                    (index) => FittedBox(
                      fit: BoxFit.fill,
                      child:
                          Image.asset('assets/images/image_slider_$index.png'),
                    ),
                  ),
                ),
                PageIndicator(controller: _controller, pageCount: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: WrapperCard(
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) => context.router.pushAndPopUntil(
                  const GiftFindingResultRoute(),
                  predicate: (route) => route.isFirst,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(top: width * 0.03, left: width * 0.03),
                  hintText: 'Nhập tên món quà của bạn?',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => context.router.pushNamed(Routes.cart),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
