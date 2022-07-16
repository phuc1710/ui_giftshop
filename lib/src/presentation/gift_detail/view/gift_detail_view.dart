import 'package:flutter/material.dart';

class GiftDetailView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: FittedBox(
                child: Hero(
                  tag: '${imagePath}ImagePath',
                  child: Image.asset('assets/images/$imagePath.jpg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Hero(
                        tag: '${imagePath}Name',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(name),
                        ),
                      ),
                      Hero(
                        tag: '${imagePath}Price',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(price),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Color(0xFFF27280),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
