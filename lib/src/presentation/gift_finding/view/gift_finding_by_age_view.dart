import 'package:flutter/material.dart';

import 'gift_finding_by_occasion_view.dart';

class GiftFindingByAgeView extends StatefulWidget {
  const GiftFindingByAgeView({Key? key}) : super(key: key);

  @override
  State<GiftFindingByAgeView> createState() => _GiftFindingByAgeViewState();
}

class _GiftFindingByAgeViewState extends State<GiftFindingByAgeView> {
  int selectedIndex = -1;
  List<String> ageRanges = [
    'Dưới 3 tuổi',
    'Từ 3 tới 5 tuổi',
    'Từ 6 tới 10 tuổi',
    'Từ 6 tới 10 tuổi',
    'Từ 11 tới 15 tuổi',
    'Từ 16 tới 18 tuổi',
    'Từ 19 tới 22 tuổi',
    'Từ 23 tới 27 tuổi',
    'Từ 27 tới 30 tuổi',
    'Trên 30 tuổi'
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
                      child: Image.asset('assets/images/gift_finder_0.png'),
                    ),
                  ),
                  const Text(
                    'Độ tuổi của\nngười nhận là?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ageRanges.length,
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
                            ageRanges[index],
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
                    onTap: () => Navigator.of(context).pop(),
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
                        : Navigator.of(context).push<Object?>(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GiftFindingByOccasionView(),
                            ),
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
                            'Tiếp theo',
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
