import 'package:flutter/material.dart';
import '../utils/theme.dart';
import 'login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Select Your Role', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose to Continue As",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            _roleButton(context, "Client", Icons.person),
            SizedBox(height: 30),
            _roleButton(context, "Developer", Icons.code),
          ],
        ),
      ),
    );
  }

  Widget _roleButton(BuildContext context, String role, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen(role: role.toLowerCase())));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.secondaryColor,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      icon: Icon(icon, size: 28, color: Colors.white),
      label: Text(role, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)),
    );
  }
}
