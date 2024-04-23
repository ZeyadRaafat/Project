import 'package:flutter/material.dart';
import 'lib/popular destination/home_view.dart';

void main() {
  runApp(PopDest());
}

class PopDest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
