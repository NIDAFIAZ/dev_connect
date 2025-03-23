import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/global_data.dart';

class BidsScreen extends StatelessWidget {
  final int projectIndex; // Get project index dynamically

  BidsScreen({required this.projectIndex});

  @override
  Widget build(BuildContext context) {
    final project = projectList[projectIndex];
    final bids = project['bids'] as List;

    return Scaffold(
      appBar: AppBar(title: Text("Bids for ${project['title']}")),
      backgroundColor: AppTheme.backgroundColor,
      body: bids.isEmpty
          ? Center(child: Text("No Bids Yet for this Project"))
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bids.length,
        itemBuilder: (context, index) {
          final bid = bids[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.person, color: AppTheme.primaryColor),
              title: Text("Developer: ${bid['developer']}"),
              subtitle: Text("Bid Amount: \$${bid['amount']}"),
              trailing: ElevatedButton(
                onPressed: () {
                  _acceptBid(context, projectIndex, index);
                },
                child: Text(bid['status'] == 'Accepted' ? 'Hired' : 'Hire'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  bid['status'] == 'Accepted' ? Colors.green : AppTheme.secondaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Accept Bid (Hire Developer)
  void _acceptBid(BuildContext context, int projIndex, int bidIndex) {
    // Mark all as pending first
    for (var b in projectList[projIndex]['bids']) {
      b['status'] = 'Pending';
    }
    // Set selected bid as accepted
    projectList[projIndex]['bids'][bidIndex]['status'] = 'Accepted';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Developer Hired Successfully!")),
    );
  }
}
