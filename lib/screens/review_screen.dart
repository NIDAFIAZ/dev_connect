import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Reviews")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.star, color: Colors.amber),
            title: Text("Developer: Ali Khan"),
            subtitle: Text("Great work, completed before deadline!"),
            trailing: Text("⭐ 5.0"),
          ),
        ],
      ),
    );
  }
}
