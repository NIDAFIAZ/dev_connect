import 'package:flutter/material.dart';
import '../utils/theme.dart';

class SavedDevelopersScreen extends StatefulWidget {
  @override
  _SavedDevelopersScreenState createState() => _SavedDevelopersScreenState();
}

class _SavedDevelopersScreenState extends State<SavedDevelopersScreen> {
  List<String> savedDevelopers = [];
  TextEditingController devNameController = TextEditingController();

  void _addDeveloper() {
    if (devNameController.text.trim().isNotEmpty) {
      setState(() {
        savedDevelopers.add(devNameController.text.trim());
        devNameController.clear();
      });
    }
  }

  void _removeDeveloper(int index) {
    setState(() {
      savedDevelopers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Developers")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: devNameController,
              decoration: InputDecoration(
                labelText: "Developer Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addDeveloper,
              icon: Icon(Icons.save),
              label: Text("Save Developer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: savedDevelopers.isEmpty
                  ? Center(child: Text("No Developers Saved Yet"))
                  : ListView.builder(
                itemCount: savedDevelopers.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Icon(Icons.person, color: AppTheme.primaryColor),
                    title: Text(savedDevelopers[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeDeveloper(index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
