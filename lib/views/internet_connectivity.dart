import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InternetConnectivityExample extends StatelessWidget {
  const InternetConnectivityExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return Scaffold(
      appBar: AppBar(
        title: Text("Internet Connection"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (context, snapshot) {
            return InternetConnection(
              snapshot: snapshot,
              widget: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi , size: 30, color: Colors.white,),
                          SizedBox(width: 20,),
                          Text("Connected" , style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class InternetConnection extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Widget widget;
  const InternetConnection(
      {Key? key, required this.snapshot, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off_rounded , size: 30, color: Colors.white,),
                        SizedBox(width: 20,),
                        Text("Not Connected" , style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            );
          default:
            return widget;
        }

      default:
        return const Text('');
    }
  }
}
