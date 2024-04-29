import 'package:flutter/material.dart';
import 'package:flutter_freezed_ammotation/posts/view/post_page.dart';
import 'package:get/get.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      home: PostPage(),
    );
  }
}
