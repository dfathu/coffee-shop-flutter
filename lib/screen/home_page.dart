import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:test_1/flutter_mode_config.dart';

class HomePage extends StatelessWidget {
  final String flavor;
  const HomePage({Key? key, required this.flavor}) : super(key: key);

  Widget bar1() {
    return Container(
      width: 200,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Poin',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                '31',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Voucher Saya',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                '31 Vouchers',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bar2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Cari pesanan'),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 60,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              color: Colors.greenAccent,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 15,
                height: 15,
                margin: EdgeInsets.only(top: 10, right: 5),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget plusVersion(Future<dynamic> _packageInfo) {
  //   return Center(
  //     child: Column(
  //       children: [
  //         const Divider(height: 32, thickness: 2),
  //         Text(
  //           "App Name : ${_packageInfo?.appName}",
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(fontSize: 22),
  //         ),
  //         Text(
  //           "Package Name : ${_packageInfo?.packageName}",
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(fontSize: 22),
  //         ),
  //         Text(
  //           "Version Name : ${_packageInfo?.version}",
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(fontSize: 22),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(flavor),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Mode: ${FlutterModeConfig.flutterMode}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          bar1(),
          SizedBox(
            height: 10,
          ),
          bar2(),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
              if (!snapshot.hasData) return Container();
              PackageInfo? _packageInfo = snapshot.data;
              return Center(
                child: Column(
                  children: [
                    const Divider(height: 32, thickness: 2),
                    Text(
                      "App Name : ${_packageInfo?.appName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Package Name : ${_packageInfo?.packageName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Version Name : ${_packageInfo?.version}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
