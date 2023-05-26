import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/components/card_component.dart';
import 'package:sample_project/components/text_field_component.dart';
import 'package:sample_project/screens/login_screen.dart';

import '../components/card_component_example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final items = [
      CardComponent(myImage: 'asset/burger1.jpg', myText: "25"),
      CardComponent(myImage: "asset/burger2.jpg", myText: "30"),
      CardComponent(myImage: "asset/burger3.jpg", myText: "19"),
      CardComponent(myImage: "asset/chicken.jpg", myText: "23"),
    ];
    FirebaseAuth auth = FirebaseAuth.instance;
    final _field = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
              icon: Icon(Icons.login)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              cursorColor: Colors.white,
              cursorRadius: Radius.circular(10),
              controller: _field,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 25,
                      )),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Best Sellers",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                height: 350,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text(
              "Trending",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: 15,),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardComponentExample(myImage: 'asset/veg1.jpg', text: "Vegetables",),
                  SizedBox(width: 25,),
                  CardComponentExample(myImage: 'asset/burger4.jpg', text: "Burgers",),
                  SizedBox(width: 25,),
                  CardComponentExample(myImage: 'asset/pizza.jpg', text: "Pizza",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
