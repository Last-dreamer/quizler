import 'package:flutter/material.dart';
import 'mainui.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
           primaryColor: Colors.grey.shade900,
         scaffoldBackgroundColor: Colors.grey.shade900,

           ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
            body: MyApp(),
      ),
    ));
