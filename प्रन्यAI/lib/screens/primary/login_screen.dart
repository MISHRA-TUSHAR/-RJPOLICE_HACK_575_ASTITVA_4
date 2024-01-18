import 'package:flutter/material.dart';
import 'package:prnyai/screens/primary/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _signupUsernameController =
      TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(); // Add email controller
  bool _obscureText = true;
  bool _isLoginMode = true; // To toggle between login and signup modes

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 81, 7),
        appBar: AppBar(
          title: Center(
            child: Text(
              'प्रन्यAI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/rp_logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (_isLoginMode) ...[
                        TextField(
                          controller: _usernameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 81, 7),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          style: TextStyle(color: Colors.black),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 81, 7),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            if (username.isNotEmpty && password.isNotEmpty) {
                              // Clear the password field
                              _passwordController.clear();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid username or password'),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 241, 81, 7),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Add some spacing
                        // Toggle to switch to signup mode
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoginMode = !_isLoginMode;
                            });
                          },
                          child: Text(
                            'Don\'t have an account? Sign up!',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ] else ...[
                        // Signup Mode
                        TextField(
                          controller: _signupUsernameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 81, 7),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _emailController, // Add email controller
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 81, 7),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _signupPasswordController,
                          style: TextStyle(color: Colors.black),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 81, 7),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            String username = _signupUsernameController.text;
                            String email =
                                _emailController.text; // Retrieve email
                            String password = _signupPasswordController.text;

                            if (username.isNotEmpty &&
                                email
                                    .isNotEmpty && // Check if email is not empty
                                password.isNotEmpty) {
                              // Clear the password field and email field
                              _signupPasswordController.clear();
                              _emailController.clear();

                              // Perform signup logic (you can add your own logic here)

                              // For now, navigate to HomeScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invalid data entered'),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 241, 81, 7),
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Add some spacing
                        // Toggle to switch to login mode
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoginMode = !_isLoginMode;
                            });
                          },
                          child: Text(
                            'Already have an account? Login!',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
