import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../model/cart/cart.dart';
import '../../complete_payment/view/complete_payment_view.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String totalValue = calcTotalPrice(cartItemsList);
  String totalValueWithShipping = calcTotalPriceAndShipping(cartItemsList);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Thanh toán'),
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
                  children: <Widget>[
                        const ShippingInfo(),
                      ] +
                      generateProductOrderList(context) +
                      [
                        const ShippingMethodInfo(),
                        const PaymentMethodInfo(),
                        PaymentDetailInfo(
                          totalValue: totalValue,
                          totalValueWithShipping: totalValueWithShipping,
                        )
                      ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              height: 0,
              color: Colors.black,
            ),
            BottomPaymentInfoRow(
              totalValueWithShipping: totalValueWithShipping,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateProductOrderList(BuildContext context) {
    return List.generate(
      cartItemsList.length,
      (index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: Utils.buildBoxShadow(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              children: [
                ImageInfo(index: index),
                NameAndPriceInfo(index: index),
                QuantityInfo(index: index)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageInfo extends StatelessWidget {
  const ImageInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox.square(
          dimension: MediaQuery.of(context).size.height * 0.1,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/images/${cartItemsList[index].getItemId()}.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class QuantityInfo extends StatelessWidget {
  const QuantityInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('x${cartItemsList[index].quantity}'),
          )
        ],
      ),
    );
  }
}

class NameAndPriceInfo extends StatelessWidget {
  const NameAndPriceInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${cartItemsList[index].getItemName()}'),
        Text('${cartItemsList[index].getItemPriceString()}'),
      ],
    );
  }
}

class BottomPaymentInfoRow extends StatelessWidget {
  const BottomPaymentInfoRow({
    Key? key,
    required this.totalValueWithShipping,
  }) : super(key: key);

  final String totalValueWithShipping;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    '$totalValueWithShipping đ',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => Navigator.of(context).push<Object?>(
                MaterialPageRoute(
                  builder: (context) => const CompletePaymentView(),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF8CBFE7),
                    ),
                  ),
                  const Text(
                    'THANH TOÁN',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFF27280)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDetailInfo extends StatelessWidget {
  const PaymentDetailInfo({
    Key? key,
    required this.totalValue,
    required this.totalValueWithShipping,
  }) : super(key: key);

  final String totalValue;
  final String totalValueWithShipping;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: Utils.buildBoxShadow(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chi tiết thanh toán',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tổng tiền hàng'),
                  Text('$totalValue đ'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Tổng tiền phí vận chuyển'),
                  Text('30,000 đ'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tổng thanh toán'),
                  Text('$totalValueWithShipping đ'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodInfo extends StatelessWidget {
  const PaymentMethodInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
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
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phương thức thanh toán',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Thanh toán khi nhận hàng'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingMethodInfo extends StatelessWidget {
  const ShippingMethodInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
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
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phương thức vận chuyển',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Vận chuyển nhanh'),
                  Text('30,000 đ'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: Utils.buildBoxShadow(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thông tin giao hàng',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Lê Hiếu'),
                  Text('(+84) 933177122'),
                ],
              ),
              const Text(
                '227 Nguyễn Văn Cừ, phường 8,\nquận 5, Hồ Chí Minh',
              )
            ],
          ),
        ),
      ),
    );
  }
}
