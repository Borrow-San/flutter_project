import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  String? imagePath;
  String? imageName;
  XFile? tokenPthoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              print(image);
            },
            child: Text("Load Image"),
          ),
          ElevatedButton(
            onPressed: () async {
              final image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 100,
                maxWidth: 100,
                imageQuality: 30,
              );
              print("이미지 경로 : ${image!.path}");
              print("이미지 이름 : ${image.name}");
              print("이미지 경로 타입 : ${image.path.runtimeType}");
              setState(() {
                imagePath = image.path;
                imageName = image.name;
                tokenPthoto = image;
              });
            },
            child: Text("Take a Photo"),
          ),
          ElevatedButton(
            onPressed: () {
              var response = postImage(tokenPthoto);
              print("response : ${response.toString()}");
            },
            child: Text("Send Image"),
          ),
          previewPhoto(),
          ElevatedButton(
            onPressed: () {
              putImage(tokenPthoto);
            },
            child: Text("putImage"),
          ),
        ],
      ),
    );
  }

  Widget previewPhoto() {
    if (imagePath == null) {
      return Container(
        child: Text("이미지 없음"),
      );
    } else {
      return Column(
        children: [
          Text("이미지 이름 : $imageName\n이미지 경로 : $imagePath"),
          Image.file(
            File(imagePath!),
            width: 200,
            height: 200,
          ),
        ],
      );
    }
  }

  postImage(dynamic input) async {
    print("사진을 서버에 업로드 합니다.");
    try {
      print("##### input : $input");
      print("##### input type : ${input.runtimeType}");
      print("##### formdata type : ${FormData.fromMap({
            "file": MultipartFile.fromFileSync(input.path)
          }).runtimeType}");
      var response = await Dio().post(
        'http://10.0.2.2:8000/articles/uploadfile/',
        //'http://192.168.0.22:8000/yolotest2',
        data: FormData.fromMap(
          {"file": MultipartFile.fromFileSync(input.path)},
        ),
      );
      print('성공적으로 업로드했습니다');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  void putImage(input) async {
    print("사진을 아마존 S3에 업로드 합니다.");
    try {
      var response = await Dio().put(
        'http://borrowsan-test-bucket.s3-website.ap-northeast-2.amazonaws.com/${input.name}',
        data: FormData.fromMap(
          {"file": MultipartFile.fromFileSync(input.path)},
        ),
      );
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
