import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {"question": "How to post a project?", "answer": "Go to Projects tab and click on '+' to post a project."},
    {"question": "How is payment secured?", "answer": "Payments are held in escrow until project completion."},
    {"question": "How to contact developer?", "answer": "Go to Saved Developers and chat directly."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqs[index]['question']!, style: TextStyle(fontWeight: FontWeight.bold)),
            children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(faqs[index]['answer']!),
            )],
          );
        },
      ),
    );
  }
}
