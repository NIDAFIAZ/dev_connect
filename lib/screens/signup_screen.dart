import 'package:flutter/material.dart';
import '../utils/theme.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final techStackController = TextEditingController();
  final dobController = TextEditingController();
  final educationController = TextEditingController();
  final cnicController = TextEditingController();
  final locationController = TextEditingController();
  final githubController = TextEditingController();
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _customField(nameController, "Full Name"),
                _customField(usernameController, "Username"),
                _customField(emailController, "Email"),
                _customField(passwordController, "Password", obscure: true),
                _customField(techStackController, "Tech Stack (Flutter, Firebase, etc.)"),
                _customField(dobController, "Date of Birth"),
                _customField(educationController, "Education"),
                _customField(cnicController, "CNIC Number"),
                _customField(locationController, "Location"),
                _customField(githubController, "GitHub / LinkedIn"),

                SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: agreeTerms,
                      onChanged: (val) => setState(() => agreeTerms = val!),
                    ),
                    Expanded(child: Text("I agree to the Terms and Conditions")),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (agreeTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created Successfully!")));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please agree to the terms")));
                      }
                    }
                  },
                  child: Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customField(TextEditingController controller, String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(labelText: label),
        validator: (value) => value!.isEmpty ? "Enter $label" : null,
      ),
    );
  }
}
