import 'package:flutter/material.dart';
import '../utils/theme.dart';
import 'project_post.dart';
import 'bids_screen.dart';
import 'saved_developers.dart';
import 'review_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'notifications_screen.dart';
import 'faq_screen.dart';
import 'developer_search.dart';
import '../utils/global_data.dart';
import 'ai_matching.dart';
import 'project_completion.dart';
import 'payments_screen.dart';
import 'role_selection.dart';

class ClientDashboard extends StatefulWidget {
  @override
  _ClientDashboardState createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProjectSection(),
    DeveloperSearchSection(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsScreen())),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.secondaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search Dev"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        backgroundColor: AppTheme.secondaryColor,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => ProjectPostScreen()));
          setState(() {}); // Refresh after posting
        },
      )
          : null,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.primaryColor),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payments'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentsSection())),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Reviews'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReviewSection())),
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Project Completion'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProjectCompletionSection())),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Saved Developers'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SavedDevelopersScreen())),
          ),
          ListTile(
            leading: Icon(Icons.smart_toy),
            title: Text('AI Matching'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AIMatchingScreen())),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => RoleSelectionScreen()),
                    (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('FAQ / Help'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FAQScreen())),
          ),
        ],
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return projectList.isEmpty
        ? Center(child: Text("No Projects Posted Yet"))
        : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        final project = projectList[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Icons.code, color: AppTheme.primaryColor),
            title: Text(project['title']),
            subtitle: Text("Budget: \$${project['budget']} | Status: ${project['status']}"),
            trailing: ElevatedButton(
              child: Text("View Bids"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BidsScreen(projectIndex: index)));
              },
            ),
          ),
        );
      },
    );
  }
}

class DeveloperSearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: Icon(Icons.chat),
        label: Text("Chat with Developer"),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(otherUser: "Developer A"))),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(24),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.secondaryColor,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text("Client Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("client@gmail.com", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
                child: Text("Edit Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
