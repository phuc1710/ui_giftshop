import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String totalValueWithShipping =
      calcTotalPriceAndNormalShipping(cartItemsList);
  String shippingCost = '20,000 đ';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                        ShippingMethodInfo(
                          onNormalShippingSelected: () => setState(() {
                            totalValueWithShipping =
                                calcTotalPriceAndNormalShipping(cartItemsList);
                            shippingCost = '20,000 đ';
                          }),
                          onTimedShippingSelected: () => setState(() {
                            totalValueWithShipping =
                                calcTotalPriceAndTimedShipping(cartItemsList);
                            shippingCost = '40,000 đ';
                          }),
                        ),
                        const PaymentMethodInfo(),
                        PaymentDetailInfo(
                          totalValue: totalValue,
                          shippingCost: shippingCost,
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
          Container(
            color: Colors.white,
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
    );
  }
}

class PaymentDetailInfo extends StatelessWidget {
  const PaymentDetailInfo({
    Key? key,
    required this.totalValue,
    required this.totalValueWithShipping,
    required this.shippingCost,
  }) : super(key: key);

  final String totalValue;
  final String shippingCost;
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
                children: [
                  const Text('Tổng tiền phí vận chuyển'),
                  Text(shippingCost),
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

class PaymentMethodInfo extends StatefulWidget {
  const PaymentMethodInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethodInfo> createState() => _PaymentMethodInfoState();
}

class _PaymentMethodInfoState extends State<PaymentMethodInfo> {
  String paymentMethod = 'Thanh toán khi nhận hàng';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: const Text(
                      'Phương thức thanh toán',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () => paymentMethod = 'Thanh toán khi nhận hàng',
                        );
                        Navigator.of(context).pop();
                      },
                      radius: 15,
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: Utils.buildBoxShadow(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Thanh toán khi nhận hàng'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () => paymentMethod =
                              'Thẻ ATM nội địa (Internet Banking)',
                        );
                        Navigator.of(context).pop();
                      },
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: Utils.buildBoxShadow(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Thẻ ATM nội địa (Internet Banking)'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Ink(
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
                  'Phương thức thanh toán',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(paymentMethod),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShippingMethodInfo extends StatefulWidget {
  const ShippingMethodInfo({
    Key? key,
    required this.onNormalShippingSelected,
    required this.onTimedShippingSelected,
  }) : super(key: key);

  final VoidCallback onNormalShippingSelected;
  final VoidCallback onTimedShippingSelected;
  @override
  State<ShippingMethodInfo> createState() => _ShippingMethodInfoState();
}

class _ShippingMethodInfoState extends State<ShippingMethodInfo> {
  DateTime? shippingDate = DateTime.now().add(const Duration(days: 2));
  TimeOfDay? shippingTime = TimeOfDay.now();
  String shippingMethod = 'Vận chuyển thường';
  String shippingCost = '20,000 đ';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: () => showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: const Text(
                      'Phương thức vận chuyển',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shippingMethod = 'Vận chuyển thường';
                          shippingCost = '20,000 đ';
                        });
                        widget.onNormalShippingSelected();
                        Navigator.of(context).pop();
                      },
                      radius: 15,
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: Utils.buildBoxShadow(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Vận chuyển thường'),
                                  Text('20,000đ'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          shippingMethod = 'Vận chuyển theo thời gian';
                          shippingCost = '40,000 đ';
                        });
                        widget.onTimedShippingSelected();
                        Navigator.of(context).pop();
                      },
                      child: Ink(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: Utils.buildBoxShadow(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: StatefulBuilder(
                            builder: (context, setState) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Vận chuyển theo thời gian'),
                                      Tooltip(
                                        message:
                                            'Thời gian vận chuyển ít nhất 2 ngày\nkể từ ngày đặt hàng',
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: Icon(
                                          Icons.info_outline,
                                          size: 28,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.0,
                                          ),
                                          child: Text(
                                            'Ngày: ',
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.0,
                                          ),
                                          child: Text(
                                            'Giờ: ',
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    showDatePicker(
                                                      context: context,
                                                      helpText:
                                                          'Chọn ngày giao hàng',
                                                      cancelText: 'Hủy',
                                                      initialDate:
                                                          DateTime.now().add(
                                                        const Duration(
                                                          days: 2,
                                                        ),
                                                      ),
                                                      firstDate:
                                                          DateTime.now().add(
                                                        const Duration(
                                                          days: 2,
                                                        ),
                                                      ),
                                                      lastDate:
                                                          DateTime.now().add(
                                                        const Duration(
                                                          days: 3670,
                                                        ),
                                                      ),
                                                    ).then((pickedDate) {
                                                      if (pickedDate == null) {
                                                        return;
                                                      }
                                                      setState(() {
                                                        shippingDate =
                                                            pickedDate;
                                                      });
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        DateFormat('dd/MM/yyyy')
                                                            .format(
                                                          shippingDate ??
                                                              DateTime.now(),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 4.0,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .date_range_outlined,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    showTimePicker(
                                                      context: context,
                                                      helpText:
                                                          'Chọn giờ giao hàng',
                                                      cancelText: 'Hủy',
                                                      initialTime:
                                                          TimeOfDay.now(),
                                                    ).then((pickedTime) {
                                                      if (pickedTime == null) {
                                                        return;
                                                      }
                                                      setState(() {
                                                        shippingTime =
                                                            pickedTime;
                                                      });
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        shippingTime?.format(
                                                              context,
                                                            ) ??
                                                            '',
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 4.0,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .more_time_outlined,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [Text('40,000 đ')],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        radius: 15,
        child: Ink(
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
                  children: [
                    Text(shippingMethod),
                    Text(shippingCost),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

class _ShippingInfoState extends State<ShippingInfo> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController phoneNumberInput = TextEditingController();
  TextEditingController addressInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: InkWell(
        onTap: () => showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: const Center(
                          child: Text(
                            'Thông tin giao hàng',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Họ tên người nhận hàng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: Utils.buildBoxShadow(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: TextField(
                              controller: nameInput,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Số điện thoại',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: Utils.buildBoxShadow(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: TextField(
                              controller: phoneNumberInput,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Địa chỉ nhận hàng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: Utils.buildBoxShadow(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: TextField(
                              controller: addressInput,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ).whenComplete(
          () => setState(() {
            name = nameInput.text;
            phoneNumber = phoneNumberInput.text;
            address = addressInput.text;
          }),
        ),
        child: Ink(
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
                  children: [
                    Text(name),
                    Text(phoneNumber),
                  ],
                ),
                Text(address)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
