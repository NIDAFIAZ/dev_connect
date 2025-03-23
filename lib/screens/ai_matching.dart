import 'package:flutter/material.dart';

class AIMatchingScreen extends StatelessWidget {
  final List<String> recommended = ["John Dev", "Emma Dev", "Alex Dev"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Matching")),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: recommended.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(recommended[index]),
            subtitle: Text("Matched Developer"),
          ),
        ),
      ),
    );
  }
}
