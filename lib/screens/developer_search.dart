import 'package:flutter/material.dart';
import '../utils/theme.dart';
import 'chat_screen.dart';

class DeveloperSearchSection extends StatelessWidget {
  final List<Map<String, String>> developers = [
    {"name": "Ali Dev", "skills": "Flutter, Firebase"},
    {"name": "Sara UX", "skills": "UI/UX Designer"},
    {"name": "Bilal Khan", "skills": "React, NodeJS"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: developers.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.person, color: AppTheme.primaryColor),
            title: Text(developers[index]['name']!),
            subtitle: Text(developers[index]['skills']!),
            trailing: Icon(Icons.chat, color: Colors.green),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => ChatScreen(otherUser: developers[index]['name']!),
              ));
            },
          ),
        );
      },
    );
  }
}
