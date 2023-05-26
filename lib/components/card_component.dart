import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String myImage;
  final String myText;
  const CardComponent({Key? key, required this.myImage, required this.myText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        width: 280,
        decoration: BoxDecoration(
          color: Color(0xff595B5D),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              height: 220,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      myImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 6,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '\$${myText}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Fast Food",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem ipsum",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.heart_broken, color: Colors.red,),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orangeAccent,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share,
                            color: Colors.black,
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
  }
}
