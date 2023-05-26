import 'package:flutter/material.dart';

class UIDesign1 extends StatelessWidget {
  const UIDesign1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size: 30,
              )),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Find your",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Inspiration",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            hintText: "Search you are looking for",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Color(0xffEAECEE))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Promo Today",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                          myImage: "asset/pic1.jpg",
                        ),
                        MyContainer(myImage: "asset/pic2.jpg"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('asset/pic3.png' , ),
                          fit: BoxFit.fill
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20 , bottom: 20),
                            child: Text("50% off", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// image container
class MyContainer extends StatelessWidget {
  final String myImage;
  const MyContainer({Key? key, required this.myImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
            child: Image.asset(
          myImage,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
