import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_project/const/constants.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File umbImageFile = File(
      r"C:\Users\AIA\StudioProjects\flutter_project\assets\img\vector.png");

  double? currentLatitude;
  double? currentLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: OverlayImage.fromAssetImage(
              assetName: "assets/img/vector.png",
            ),
            builder: (context, snapshot) {
              return NaverMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.5706, 126.9853),
                  zoom: 15,
                ),
                markers: [
                  Marker(
                    markerId: '1',
                    position: LatLng(37.5706, 126.9853),
                    captionText: "AIA",
                    captionTextSize: 20.0,
                    captionColor: MAIN_COLOR,
                    captionHaloColor: Colors.black,
                    icon: snapshot.data,
                    width: 50,
                    height: 50,
                  ),
                  Marker(
                    markerId: '2',
                    position: LatLng(currentLatitude!, currentLongitude!),
                    captionText: "Current Location",
                    captionTextSize: 20.0,
                    captionColor: MAIN_COLOR,
                    captionHaloColor: Colors.black,
                    icon: snapshot.data,
                    width: 50,
                    height: 50,
                  ),
                ],
              );
            },
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  getLocation();
                  print("########## ElevatedButton currentLatitude : $currentLatitude, currentLongitude : $currentLongitude  ##########  ");
                },
                child: Text("Get Location"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void getLocation() async {
    LocationPermission permission =
        await Geolocator.requestPermission(); //오류 해결 코드
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("############### getLocation() latitude : ${position.latitude}, longitude : ${position.longitude}");
    setState(() {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    });
  }
}
