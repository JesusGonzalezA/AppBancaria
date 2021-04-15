import 'package:flutter/material.dart';
import 'package:p2/src/pages/home.dart';
import 'src/app.dart';

void main() {
  runApp( 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: HomePage(),
      ),
    )
  );
}

