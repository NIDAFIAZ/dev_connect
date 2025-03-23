import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ProjectCompletionSection extends StatelessWidget {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mark Project as Completed")),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Completion Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                _buildTextField("Project Name", projectNameController),
                SizedBox(height: 20),
                _buildTextField("Remarks / Delivery Notes", remarksController, maxLines: 4),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Project Marked as Completed")),
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Submit Completion", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(labelText: label),
    );
  }
}
