import 'package:flutter/material.dart';
import 'client_dashboard.dart';
import 'developer_dashboard.dart';
import 'signup_screen.dart';
import '../utils/theme.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  LoginScreen({required this.role});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Hardcoded login check
  final String userEmail = "user@gmail.com";
  final String devEmail = "developer@gmail.com";
  final String defaultPassword = "0000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login as ${widget.role.toUpperCase()}")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) => value!.isEmpty ? "Enter Email" : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) => value!.isEmpty ? "Enter Password" : null,
              ),

              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen())),
                  child: Text("Forgot Password?"),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if ((widget.role == "client" && emailController.text == userEmail && passwordController.text == defaultPassword) ||
                        (widget.role == "developer" && emailController.text == devEmail && passwordController.text == defaultPassword)) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => widget.role == "client"
                                  ? ClientDashboard()
                                  : DeveloperDashboard()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Credentials")));
                    }
                  }
                },
                child: Text("Login"),
              ),

              SizedBox(height: 20),
              Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),
              _socialButton(context, Icons.g_mobiledata, "Continue with Google"),
              SizedBox(height: 15),
              _socialButton(context, Icons.account_circle, "Continue with GitHub"),

              SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen())),
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context, IconData icon, String text) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$text - Feature Coming Soon")));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textColor,
        side: BorderSide(color: AppTheme.secondaryColor),
        minimumSize: Size(double.infinity, 50),
      ),
      icon: Icon(icon, color: AppTheme.primaryColor, size: 28),
      label: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
