// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getapi_with_mvvm_riverpod/Views/user_list_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM with Riverpod and Dio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserListScreen(),
      //UserListScreen(),
    );
  }
}
