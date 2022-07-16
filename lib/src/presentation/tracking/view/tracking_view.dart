import 'package:flutter/material.dart';

import '../../../model/cart/cart.dart';

class TrackingView extends StatefulWidget {
  const TrackingView({Key? key}) : super(key: key);

  @override
  State<TrackingView> createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {
  String totalValueWithShipping = calcTotalPriceAndShipping(cartItemsList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Tình trạng đơn hàng'),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Đang xử lý'),
                Tab(text: 'Đã giao'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2),
                        ),
                        child: Column(
                          children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        '#1192',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Tình trạng: Đang giao')
                                    ],
                                  ),
                                ),
                              ] +
                              List.generate(
                                cartItemsList.length,
                                (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    vertical: 4.0,
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: SizedBox.square(
                                                dimension:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.1,
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Image.asset(
                                                    'assets/images/${cartItemsList[index].getItemId()}.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cartItemsList[index].getItemName()}',
                                              ),
                                              Text(
                                                '${cartItemsList[index].getItemPriceString()}',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'x${cartItemsList[index].quantity}',
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ) +
                              [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Tổng tiền: '),
                                      Text(
                                        '$totalValueWithShipping đ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search_off,
                    color: Color.fromARGB(255, 50, 76, 190),
                    size: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Không có\nđơn hàng nào cả',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
