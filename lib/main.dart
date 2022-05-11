import 'package:clean_arcitectur_simple/injection.dart';
import 'package:clean_arcitectur_simple/presentation/page/comments_page.dart';
import 'package:flutter/material.dart';

void main() {
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Arcitectur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CommentsPage(),
    );
  }
}
