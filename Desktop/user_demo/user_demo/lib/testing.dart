import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testing"),
      ),
      body: ListView.builder(itemCount: 3, itemBuilder: (c, i) => Text("test")),
    );
  }
}
