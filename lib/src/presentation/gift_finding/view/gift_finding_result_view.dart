import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/router/app_router.dart';
import '../../../core/utils/utils.dart';
import '../../../model/product/product_detail.dart';

class GiftFindingResultView extends StatefulWidget {
  const GiftFindingResultView({Key? key}) : super(key: key);

  @override
  State<GiftFindingResultView> createState() => _GiftFindingResultViewState();
}

class _GiftFindingResultViewState extends State<GiftFindingResultView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: height * 0.0995,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.015),
                child: const Text(
                  'Đã tìm ra những món quà\nphù hợp với bạn rồi nè!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: height * 0.6,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  children: List.generate(
                    productList.length,
                    (index) => InkWell(
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
                          color: const Color(0xFFFFD4DE),
                          height: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 16,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox.square(
                                    dimension: height * 0.18,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Hero(
                                        tag:
                                            '${productList[index].id}ImagePath',
                                        child: Image.asset(
                                          'assets/images/${productList[index].id}.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '${productList[index].id}Name',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text('${productList[index].name}'),
                                ),
                              ),
                              Hero(
                                tag: '${productList[index].id}Price',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    productList[index].price ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.router.popUntil((route) => route.isFirst),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD4DE),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: Utils.buildBoxShadow(),
                    ),
                    child: const Center(
                      child: Text(
                        'Về trang chủ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
