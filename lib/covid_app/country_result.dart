import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/covid_app/world_test_screen.dart';

class CountryResult extends StatefulWidget {
  final String image, name;
  final int totalCases,
      totalRecovered,
      totalDeaths,
      active,
      todayRecovered,
      critical;
  const CountryResult(
      {Key? key,
      required this.image,
      required this.name,
      required this.totalCases,
      required this.totalRecovered,
      required this.totalDeaths,
      required this.active,
      required this.todayRecovered,
      required this.critical})
      : super(key: key);

  @override
  State<CountryResult> createState() => _CountryResultState();
}

class _CountryResultState extends State<CountryResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Result",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 70,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Canterbury'),
            ),
            SizedBox(height: 40,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.black),
              ),
              elevation: 2.2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image(
                        height: 100,
                        width: 100,
                        image: NetworkImage(
                          widget.image,
                        )),
                    RowComponent(text1: "Country", text2: widget.name),
                    SizedBox(
                      height: 15,
                    ),
                    RowComponent(
                        text1: "Total Cases",
                        text2: widget.totalCases.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    RowComponent(
                        text1: "Total Recovered",
                        text2: widget.todayRecovered.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    RowComponent(
                        text1: "Total Deaths",
                        text2: widget.totalDeaths.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    RowComponent(
                        text1: "Active", text2: widget.active.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    RowComponent(
                        text1: "Critical", text2: widget.critical.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
