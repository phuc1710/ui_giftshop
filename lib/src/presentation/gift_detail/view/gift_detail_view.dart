import 'package:flutter/material.dart';

import '../../../model/cart/cart.dart';
import '../../cart/view/cart_view.dart';

class GiftDetailView extends StatefulWidget {
  const GiftDetailView({
    Key? key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  final String name;
  final String price;
  final String imagePath;
  final String description;

  @override
  State<GiftDetailView> createState() => _GiftDetailViewState();
}

class _GiftDetailViewState extends State<GiftDetailView> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: FittedBox(
                        child: Hero(
                          tag: '${widget.imagePath}ImagePath',
                          child: Image.asset(
                            'assets/images/${widget.imagePath}.jpg',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: '${widget.imagePath}Name',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Text(
                                      widget.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: '${widget.imagePath}Price',
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    widget.price,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFF27280),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () =>
                                    setState(() => favorite = !favorite),
                                child: Icon(
                                  favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: const Color(0xFFF27280),
                                ),
                              ),
                              const Text('Yêu thích')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Ý nghĩa',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.chat_bubble_outline),
                                Text('Nhắn tin')
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push<Object?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartView(),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.shopping_cart_outlined),
                                Text('Giỏ hàng')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cartItemsList.firstWhere(
                          (element) => element.itemId == widget.imagePath,
                          orElse: () {
                            cartItemsList.add(CartItem(widget.imagePath, 1));

                            return CartItem(widget.imagePath, 0);
                          },
                        ).quantity++;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Đã thêm sản phẩm vào giỏ hàng'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.of(context).popUntil(
                          (route) => route.isFirst,
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF8CBFE7),
                            ),
                          ),
                          const Text(
                            'MUA NGAY',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF27280),
                              fontWeight: FontWeight.bold,
                            ),
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
}
