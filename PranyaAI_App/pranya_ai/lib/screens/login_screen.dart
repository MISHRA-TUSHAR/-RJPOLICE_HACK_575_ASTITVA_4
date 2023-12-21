import 'package:flutter/material.dart';
import 'package:pranya_ai/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool isUserMode;

  @override
  void initState() {
    super.initState();
    isUserMode = true; // Default to user mode
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        return true; // Return false if you want to prevent the user from leaving the screen
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900], // Background color
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoSegmentedControl(
                children: const {
                  0: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('User'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Admin'),
                  ),
                },
                onValueChanged: (int index) {
                  setState(() {
                    isUserMode = index == 0;
                  });
                },
                groupValue: isUserMode ? 0 : 1,
                borderColor: Colors.blueAccent,
                pressedColor: Colors.blueAccent.withOpacity(0.5),
                unselectedColor: Colors.blueGrey[800],
                selectedColor: Colors.blueAccent,
              ),
              const SizedBox(height: 20),
              LoginForm(userMode: isUserMode),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final bool userMode;

  const LoginForm({Key? key, required this.userMode}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.blueAccent),
                prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.blueAccent),
                prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              obscureText: obscureText,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your login logic here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(userMode: widget.userMode),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                widget.userMode ? 'User Login' : 'Admin Login',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
