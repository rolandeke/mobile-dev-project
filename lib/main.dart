import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/screens/apicall.dart';
import 'package:interview/screens/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const Order(),
    );
  }
}

