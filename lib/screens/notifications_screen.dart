import 'package:flutter/material.dart';
import '../utils/theme.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "New Bid Received",
      "desc": "Ali Khan placed a bid on your E-commerce App project."
    },
    {
      "title": "Payment Successful",
      "desc": "You paid \$800 to Sara UX for Website Design."
    },
    {
      "title": "Project Completed",
      "desc": "Your project 'Chat App' was marked as completed."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notifications, color: AppTheme.primaryColor),
              title: Text(notifications[index]['title']!),
              subtitle: Text(notifications[index]['desc']!),
            ),
          );
        },
      ),
    );
  }
}
