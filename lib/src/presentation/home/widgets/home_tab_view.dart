import 'dart:async';

import 'package:flutter/material.dart';

import '../../../model/icon/gift_shop_app_icons.dart';
import '../../cart/view/cart_view.dart';
import '../../gift_finding/view/gift_finding_result_view.dart';
import 'page_indicator.dart';

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
            const Text(
              'Quà sinh nhật phổ biến',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            PopularGifts(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 4),
              child: Text(
                'Danh mục các ngày kỉ niệm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CategorySection()
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            icons[index],
                            size: 32,
                          ),
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
  PopularGifts({
    Key? key,
  }) : super(key: key);

  final List<String> product = [
    'Gấu Teddy',
    'Thỏ trắng',
    'Minions',
    'Ngựa cưỡi',
    'Rô bốt',
    'Xe 4 bánh',
  ];
  final List<String> price = [
    '220 000 đ',
    '150 000 đ',
    '220 000 đ',
    '150 000 đ',
    '220 000 đ',
    '150 000 đ',
  ];

  final List<String> imageFileName = [
    'teddy',
    'rabbit',
    'minion',
    'horse',
    'robot',
    'bike'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8),
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
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox.square(
                        dimension: MediaQuery.of(context).size.height * 0.09,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            'assets/images/${imageFileName[index]}.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    product[index],
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    price[index],
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFD4DE),
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
                  return FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('assets/images/image_slider_$index.png'),
                  );
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
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(Icons.adobe_outlined),
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
                textInputAction: TextInputAction.search,
                onSubmitted: (value) =>
                    Navigator.of(context).pushAndRemoveUntil<Object?>(
                  MaterialPageRoute(
                    builder: (context) => const GiftFindingResultView(),
                  ),
                  (route) => route.isFirst,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  hintText: 'Nhập tên món quà của bạn?',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push<Object?>(
              context,
              MaterialPageRoute(builder: (context) => const CartView()),
            );
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
