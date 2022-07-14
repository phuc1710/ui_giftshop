import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required PageController controller,
    required this.pageCount,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: pageCount,
              effect: const ExpandingDotsEffect(
                dotHeight: 4,
                dotWidth: 4,
                spacing: 4,
                dotColor: Colors.white,
                activeDotColor: Colors.white,
              ),
              onDotClicked: (index) => _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
