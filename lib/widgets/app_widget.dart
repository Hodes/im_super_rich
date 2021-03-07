import 'package:do_nothing/widgets/gems_widget.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The App',
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent[100],
        appBar: AppBar(
          title: Text('I\'am super rich!'),
          backgroundColor: Colors.lightGreen[700],
        ),
        body: GemsWidget()
      ),
    );
  }
}
