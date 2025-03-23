import 'package:flutter/material.dart';
import '../utils/theme.dart';

class AnalyticsScreen extends StatelessWidget {
  final List<Map<String, String>> earnings = [
    {"project": "E-Commerce App", "amount": "1500", "date": "April 2025"},
    {"project": "Portfolio Website", "amount": "800", "date": "March 2025"},
  ];

  @override
  Widget build(BuildContext context) {
    double total = earnings.fold(0, (sum, e) => sum + double.parse(e['amount']!));

    return Scaffold(
      appBar: AppBar(title: Text("Earnings & Analytics")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Total Earnings: \$${total.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ...earnings.map((e) => Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.green),
              title: Text("${e['project']}"),
              subtitle: Text("${e['date']}"),
              trailing: Text("\$${e['amount']}"),
            ),
          )),
          SizedBox(height: 30),
          // Optional: You can add Graph here later
        ],
      ),
    );
  }
}
