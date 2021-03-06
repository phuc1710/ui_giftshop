import 'package:flutter/material.dart';

import '../../../model/product/product_detail.dart';

class GiftFindingResultView extends StatefulWidget {
  const GiftFindingResultView({Key? key}) : super(key: key);

  @override
  State<GiftFindingResultView> createState() => _GiftFindingResultViewState();
}

class _GiftFindingResultViewState extends State<GiftFindingResultView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.015,
                ),
                child: const Text(
                  'Đã tìm ra những món quà\nphù hợp với bạn rồi nè!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  children: List.generate(
                    productList.length,
                    (index) => InkWell(
                      onTap: () {
                        // Navigator.push<Object?>(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => GiftDetailView(
                        //       name: productList[index].name ?? '',
                        //       price: productList[index].price ?? '',
                        //       imagePath: productList[index].id ?? '',
                        //       description: '',
                        //     ),
                        //   ),
                        // );
                      },
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
                                    dimension:
                                        MediaQuery.of(context).size.height *
                                            0.18,
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
                onTap: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD4DE),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Về trang chủ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
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
