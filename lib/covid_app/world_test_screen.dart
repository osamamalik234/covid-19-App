import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'WorldStateModel.dart';
import 'api_response.dart';
import 'country_states.dart';

class WorldTestScreen extends StatefulWidget {
  const WorldTestScreen({Key? key}) : super(key: key);

  @override
  State<WorldTestScreen> createState() => _WorldTestScreenState();
}

class _WorldTestScreenState extends State<WorldTestScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 3), vsync: this);
  ApIServices _apIServices = ApIServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "All Records",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: _apIServices.fetchData(),
                    builder:
                        (context, AsyncSnapshot<WorldStateModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // print("IS data available");
                        if (snapshot.hasData) {
                          print("Is data available");
                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              PieChart(
                                dataMap: {
                                  "Total Cases":
                                     double.parse( snapshot.data!.cases!.toString(),)
                                  "Deaths":
                                      snapshot.data!.deaths!,
                                  "Recovered":  snapshot.data!.deaths!,
                                },
                                animationDuration: Duration(milliseconds: 1000),
                                chartLegendSpacing: 50,
                                // chartRadius: MediaQuery.of(context).size.width / 3.2,
                                // initialAngleInDegree: 0,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 32,
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.right,
                                  // showLegends: true,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.grey)),
                                elevation: 2,
                                child: Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30, top: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RowComponent(
                                          text1: "Total cases",
                                          text2:
                                              snapshot.data!.cases.toString(),
                                        ),
                                        Divider(),
                                        RowComponent(
                                          text1: "Deaths",
                                          text2:
                                              snapshot.data!.deaths.toString(),
                                        ),
                                        Divider(),
                                        RowComponent(
                                          text1: "Recovered",
                                          text2: snapshot.data!.recovered
                                              .toString(),
                                        ),
                                        Divider(),
                                        RowComponent(
                                          text1: "Active",
                                          text2:
                                              snapshot.data!.active.toString(),
                                        ),
                                        Divider(),
                                        RowComponent(
                                          text1: "Critical",
                                          text2: snapshot.data!.critical
                                              .toString(),
                                        ),
                                        Divider(),
                                        RowComponent(
                                          text1: "Today Deaths",
                                          text2: snapshot.data!.todayDeaths
                                              .toString(),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CountryStates()));
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Track Countries",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error.toString());
                          return Center(
                            child: Text('${snapshot.error.toString()}'),
                          );
                        }
                      }
                      return SpinKitCircle(
                        color: Colors.black,
                        size: 100,
                        controller: _animationController,
                      );

                      // if (!snapshot.hasData) {
                      //   return Expanded(
                      //     child: SpinKitCircle(
                      //       color: Colors.black,
                      //       size: 100,
                      //       controller: _animationController,
                      //     ),
                      //   );
                      // } else {
                      //   return Column(
                      //     children: [
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       PieChart(
                      //         dataMap: {
                      //           "Total Cases": double.parse(
                      //               snapshot.data!.cases.toString()),
                      //           "Deaths": double.parse(
                      //               snapshot.data!.deaths.toString()),
                      //           "Recovered": double.parse(
                      //             snapshot.data!.recovered.toString(),
                      //           ),
                      //         },
                      //         animationDuration: Duration(milliseconds: 1000),
                      //         chartLegendSpacing: 50,
                      //         // chartRadius: MediaQuery.of(context).size.width / 3.2,
                      //         // initialAngleInDegree: 0,
                      //         chartType: ChartType.ring,
                      //         ringStrokeWidth: 32,
                      //         legendOptions: LegendOptions(
                      //           showLegendsInRow: false,
                      //           legendPosition: LegendPosition.right,
                      //           // showLegends: true,
                      //           legendTextStyle: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //         chartValuesOptions: ChartValuesOptions(
                      //           showChartValueBackground: true,
                      //           showChartValues: true,
                      //           showChartValuesInPercentage: true,
                      //           showChartValuesOutside: false,
                      //           decimalPlaces: 1,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Card(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(30),
                      //             side: BorderSide(color: Colors.grey)),
                      //         elevation: 2,
                      //         child: Container(
                      //           height: 250,
                      //           width: double.infinity,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(
                      //                 left: 30, right: 30, top: 30),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 RowComponent(
                      //                   text1: "Total cases",
                      //                   text2: snapshot.data!.cases.toString(),
                      //                 ),
                      //                 Divider(),
                      //                 RowComponent(
                      //                   text1: "Deaths",
                      //                   text2: snapshot.data!.deaths.toString(),
                      //                 ),
                      //                 Divider(),
                      //                 RowComponent(
                      //                   text1: "Recovered",
                      //                   text2:
                      //                       snapshot.data!.recovered.toString(),
                      //                 ),
                      //                 Divider(),
                      //                 RowComponent(
                      //                   text1: "Active",
                      //                   text2: snapshot.data!.active.toString(),
                      //                 ),
                      //                 Divider(),
                      //                 RowComponent(
                      //                   text1: "Critical",
                      //                   text2:
                      //                       snapshot.data!.critical.toString(),
                      //                 ),
                      //                 Divider(),
                      //                 RowComponent(
                      //                   text1: "Today Deaths",
                      //                   text2: snapshot.data!.todayDeaths
                      //                       .toString(),
                      //                 ),
                      //                 Divider(),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 40,
                      //       ),
                      //       InkWell(
                      //         onTap: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => CountryStates()));
                      //         },
                      //         child: Container(
                      //           height: 50,
                      //           width: double.infinity,
                      //           decoration: BoxDecoration(
                      //             color: Colors.orangeAccent,
                      //             borderRadius: BorderRadius.circular(50),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Track Countries",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 23,
                      //                   letterSpacing: 2,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   );
                      // }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowComponent extends StatelessWidget {
  final String text1, text2;
  const RowComponent({Key? key, required this.text1, required this.text2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          text2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
  }
}
