import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/global_data.dart';

class ProjectPostScreen extends StatefulWidget {
  @override
  _ProjectPostScreenState createState() => _ProjectPostScreenState();
}

class _ProjectPostScreenState extends State<ProjectPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  String selectedTechStack = 'Flutter';
  List<String> techStackOptions = ['Flutter', 'React', 'Firebase', 'NodeJS', 'UI/UX Design'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post New Project")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Project Title"),
                  validator: (value) => value!.isEmpty ? "Enter Project Title" : null,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(labelText: "Project Description"),
                  validator: (value) => value!.isEmpty ? "Enter Project Description" : null,
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: selectedTechStack,
                  decoration: InputDecoration(labelText: "Tech Stack Required"),
                  items: techStackOptions.map((tech) => DropdownMenuItem(
                      value: tech, child: Text(tech))).toList(),
                  onChanged: (value) => setState(() => selectedTechStack = value!),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Budget (USD)"),
                  validator: (value) => value!.isEmpty ? "Enter Budget" : null,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ✅ Add project to global projectList
                      projectList.add({
                        "title": titleController.text,
                        "description": descriptionController.text,
                        "tech": selectedTechStack,
                        "budget": budgetController.text,
                        "status": "Open",
                        "bids": [],
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Project Posted Successfully")));
                      Navigator.pop(context); // Go back to dashboard
                    }
                  },
                  child: Text("Post Project"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
