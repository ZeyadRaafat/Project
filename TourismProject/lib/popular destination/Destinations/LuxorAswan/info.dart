import 'package:flutter/material.dart';
import 'package:new_project/popular%20destination/home_view.dart';
import './Specification.dart';



class ThirdRoute extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luxor And Aswan'),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView())); // Implement the back button functionality
          },
        ),
      ),
      body: Column(
        children: [
            Specify(),
        ],
      )
    );
  }
}


