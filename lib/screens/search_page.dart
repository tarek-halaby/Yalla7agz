import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(
                child: TextField(
              decoration: new InputDecoration(
                hintText: 'Enter Password Here',
              ),
              autofocus: false,
            ))),
        body: Container(

        ));
  }
}
