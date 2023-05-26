import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'api_response.dart';
import 'country_result.dart';

class CountryStates extends StatefulWidget {
  const CountryStates({Key? key}) : super(key: key);

  @override
  State<CountryStates> createState() => _CountryStatesState();
}

class _CountryStatesState extends State<CountryStates>
    with TickerProviderStateMixin {
  final _searchController = TextEditingController();
  ApIServices apIServices = ApIServices();
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 3), vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                hintText: "Search with Country name",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                // fillColor: Colors.grey.withOpacity(0.2),
                // filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: apIServices.fetchCountryWiseData(),
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      print(snapshot.data);
                      return SpinKitCircle(
                        color: Colors.black,
                        size: 100,
                        controller: _animationController,
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]["country"];
                            if (_searchController.text.toString().isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CountryResult(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['cases'],
                                                    todayRecovered: snapshot
                                                        .data![index]['active'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag']),
                                        ),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString())),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                _searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CountryResult(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['cases'],
                                                    todayRecovered: snapshot
                                                        .data![index]['active'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag']),
                                        ),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString())),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
