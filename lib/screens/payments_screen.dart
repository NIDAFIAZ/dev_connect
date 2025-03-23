import 'package:flutter/material.dart';
import '../utils/theme.dart';

class PaymentsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payments History")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.attach_money, color: AppTheme.primaryColor),
            title: Text("Food Delivery App"),
            subtitle: Text("Paid via JazzCash"),
            trailing: Text("Rs. 10,000"),
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: AppTheme.primaryColor),
            title: Text("Chat App"),
            subtitle: Text("Paid via EasyPaisa"),
            trailing: Text("Rs. 8,000"),
          ),
        ],
      ),
    );
  }
}
