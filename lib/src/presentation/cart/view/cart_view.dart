import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/router/routes.dart';
import '../../../model/cart/cart.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String totalValue = calcTotalPrice(cartItemsList);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Giỏ hàng'),
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: cartItemsList.isEmpty
            ? const NoProductFoundBody()
            : Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                      itemCount: cartItemsList.length,
                      itemBuilder: (context, index) {
                        bool favorite = false;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
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
                            child: Row(
                              children: [
                                ProductImage(index: index),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cartItemsList[index].getItemName()}',
                                    ),
                                    Text(
                                      '${cartItemsList[index].getItemPriceString()}',
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState) => InkWell(
                                        onTap: () => setState(
                                          () => favorite = !favorite,
                                        ),
                                        child: Icon(
                                          favorite
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: const Color(0xFFF27280),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SelectCheckBox(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                onSubtractPressed(index),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.shade600,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            cartItemsList[index]
                                                .quantity
                                                .toString(),
                                          ),
                                          InkWell(
                                            onTap: () => onAddPressed(index),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.shade600,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 0,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Tổng tiền'),
                                ),
                                Text(
                                  '$totalValue đ',
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () =>
                                context.router.pushNamed(Routes.payment),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8CBFE7),
                                  ),
                                ),
                                const Text(
                                  'ĐẶT HÀNG',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFFF27280)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void onAddPressed(int index) {
    return setState(() {
      cartItemsList[index].quantity++;
      totalValue = calcTotalPrice(
        cartItemsList,
      );
    });
  }

  void onSubtractPressed(int index) {
    return setState(() {
      if (cartItemsList[index].quantity > 0) {
        cartItemsList[index].quantity--;
        if (cartItemsList[index].quantity == 0) {
          cartItemsList.removeAt(index);
        }
        totalValue = calcTotalPrice(
          cartItemsList,
        );
      }
    });
  }
}

class SelectCheckBox extends StatefulWidget {
  const SelectCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectCheckBox> createState() => _SelectCheckBoxState();
}

class _SelectCheckBoxState extends State<SelectCheckBox> {
  bool? selected = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: selected,
      activeColor: const Color(0xFFF27280),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      onChanged: (checked) {
        setState(() {
          selected = checked;
        });
      },
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01,
        right: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox.square(
          dimension: MediaQuery.of(context).size.height * 0.18,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'assets/images/${cartItemsList[index].getItemId()}.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class NoProductFoundBody extends StatelessWidget {
  const NoProductFoundBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: const Center(
            child: Text(
              'Không có sản phẩm trong giỏ hàng',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        InkWell(
          onTap: () => context.router.popUntil((route) => route.isFirst),
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
              child: Text('Mua hàng ngay'),
            ),
          ),
        ),
      ],
    );
  }
}
