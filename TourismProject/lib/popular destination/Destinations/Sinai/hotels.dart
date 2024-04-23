import 'package:flutter/material.dart';
import './Specification.dart';
import 'info.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sinai'),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SixthRoute()),); // Implement the back button functionality
          },
        ),
      ),
       body: Column(
        children: [
            Specify(),
            Center(child: Text("Welcome to Hotels!"),),
        ],
      )
    );
  }
}