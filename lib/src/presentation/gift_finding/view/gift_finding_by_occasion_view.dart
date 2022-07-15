import 'package:flutter/material.dart';

import 'gift_finding_result_view.dart';

class GiftFindingByOccasionView extends StatefulWidget {
  const GiftFindingByOccasionView({Key? key}) : super(key: key);

  @override
  State<GiftFindingByOccasionView> createState() =>
      _GiftFindingByOccasionViewState();
}

class _GiftFindingByOccasionViewState extends State<GiftFindingByOccasionView> {
  int selectedIndex = -1;
  List<String> occasions = [
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: FittedBox(
                      child: Image.asset('assets/images/gift_finder_1.png'),
                    ),
                  ),
                  const Text(
                    'Bạn muốn tặng\nvào dịp gì vậy?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: occasions.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => setState(() {
                      selectedIndex = index;
                    }),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? const Color(0xFFFFD4DE)
                              : Colors.transparent,
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            occasions[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => selectedIndex == -1
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Vui lòng chọn một câu trả lời'),
                            ),
                          )
                        : Navigator.of(context).pop(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                        child: const Center(
                          child: Text(
                            'Trở lại',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => selectedIndex == -1
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Vui lòng chọn một câu trả lời'),
                            ),
                          )
                        : Navigator.of(context).pushAndRemoveUntil<Object?>(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GiftFindingResultView(),
                            ),
                            (route) => route.isFirst,
                          ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
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
                            'Tìm quà',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
