import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/global_data.dart';
import 'chat_screen.dart';
import 'notifications_screen.dart';
import 'faq_screen.dart';
import 'analytics_screen.dart';
import 'saved_developers.dart';
import 'role_selection.dart';

class DeveloperDashboard extends StatefulWidget {
  @override
  _DeveloperDashboardState createState() => _DeveloperDashboardState();
}

class _DeveloperDashboardState extends State<DeveloperDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AvailableProjectsSection(),
    MyBidsScreen(),
    ChatSection(),
    PaymentsSection(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsScreen())),
          ),
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FAQScreen())),
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
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: "My Bids"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Payments"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
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
            leading: Icon(Icons.analytics),
            title: Text('Analytics'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnalyticsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Saved Developers'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SavedDevelopersScreen())),
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
        ],
      ),
    );
  }
}

// ✅ Available Projects
class AvailableProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return projectList.isEmpty
        ? Center(child: Text("No Projects Available"))
        : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        final project = projectList[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.assignment),
            title: Text(project['title']),
            subtitle: Text("Budget: \$${project['budget']}"),
            trailing: ElevatedButton(
              onPressed: () => _showBidDialog(context, index),
              child: Text("Bid Now"),
            ),
          ),
        );
      },
    );
  }

  void _showBidDialog(BuildContext context, int projectIndex) {
    final bidAmount = TextEditingController();
    final message = TextEditingController();
    final sampleLink = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Place Your Bid"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: bidAmount, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Bid Amount")),
              TextField(controller: message, decoration: InputDecoration(labelText: "Message to Client")),
              TextField(controller: sampleLink, decoration: InputDecoration(labelText: "Sample Link")),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (bidAmount.text.isNotEmpty) {
                projectList[projectIndex]['bids'].add({
                  'developer': 'developer@gmail.com',
                  'amount': bidAmount.text,
                  'status': 'Pending',
                  'message': message.text,
                  'sample': sampleLink.text
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bid Placed Successfully")));
              }
            },
            child: Text("Submit Bid"),
          ),
        ],
      ),
    );
  }
}

// ✅ My Bids
class MyBidsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> myBids = [];
    for (var project in projectList) {
      for (var bid in project['bids']) {
        if (bid['developer'] == 'developer@gmail.com') {
          myBids.add({
            'project': project['title'],
            'amount': bid['amount'],
            'status': bid['status'],
            'message': bid['message'],
            'sample': bid['sample'],
          });
        }
      }
    }

    return myBids.isEmpty
        ? Center(child: Text("No Bids Placed Yet"))
        : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: myBids.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text(myBids[index]['project']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bid: \$${myBids[index]['amount']} | ${myBids[index]['status']}"),
                Text("Message: ${myBids[index]['message']}"),
                Text("Sample: ${myBids[index]['sample']}"),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ✅ Chat Section
class ChatSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("Chats", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        _chatTile(context, "Client A", "Hey! Can you deliver?"),
        _chatTile(context, "Client B", "Please share progress."),
      ],
    );
  }

  Widget _chatTile(BuildContext context, String name, String lastMessage) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(name),
        subtitle: Text(lastMessage),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(otherUser: name)));
        },
      ),
    );
  }
}

// ✅ Payments Section
class PaymentsSection extends StatelessWidget {
  final List<Map<String, String>> payments = [
    {"project": "E-Commerce App", "amount": "1200", "method": "JazzCash", "date": "Apr 10, 2025"},
    {"project": "Portfolio Website", "amount": "700", "method": "EasyPaisa", "date": "Apr 5, 2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("Payments", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ...payments.map((payment) => Card(
          child: ListTile(
            leading: Icon(Icons.attach_money, color: Colors.green),
            title: Text("Received \$${payment['amount']} via ${payment['method']}"),
            subtitle: Text("${payment['project']} - ${payment['date']}"),
          ),
        ))
      ],
    );
  }
}

// ✅ Profile Section with Tech Stack and Orders
class ProfileSection extends StatelessWidget {
  final List<String> techStack = ["Flutter", "Firebase", "NodeJS"];
  final List<String> pastOrders = ["E-Commerce App", "Portfolio Website"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 20),
          Text("Developer Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("developer@gmail.com"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showEditDialog(context),
            child: Text("Edit Profile"),
          ),
          Divider(),
          Text("Tech Stack", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...techStack.map((tech) => ListTile(title: Text(tech))),
          Divider(),
          Text("Past Orders", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...pastOrders.map((order) => ListTile(title: Text(order))),
          Divider(),
          ElevatedButton(
            onPressed: () {}, // Upload completed logic placeholder
            child: Text("Upload Completed Project"),
          ),
          SizedBox(height: 20),
          Text("Rating: ⭐ 4.8", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated")));
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
