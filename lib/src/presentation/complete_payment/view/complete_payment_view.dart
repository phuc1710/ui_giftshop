import 'package:flutter/material.dart';

import '../../tracking/view/tracking_view.dart';

class CompletePaymentView extends StatelessWidget {
  const CompletePaymentView({Key? key}) : super(key: key);

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF32BEA6),
              size: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Bạn đã thanh toán\nthành công',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push<Object?>(
                  MaterialPageRoute(
                    builder: (context) => const TrackingView(),
                  ),
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
                    child: Text('Xem tình trạng đơn hàng'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
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
                    child: Text('Tiếp tục mua quà'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
