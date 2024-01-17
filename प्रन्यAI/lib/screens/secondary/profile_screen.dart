// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Implement logout functionality
//               // Navigate to the login screen
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.account_circle,
//               size: 100,
//               color: Colors.blue,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Hello, Username!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Edit Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Info'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User's Profile Picture in a Circle
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/police.jpeg'),
              ),
              SizedBox(height: 16.0),

              // User's Name
              Text(
                'User Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),

              // User's Mobile Number
              Text(
                'Mobile Number: +1234567890', // Replace with the actual mobile number
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),

              // User's Address
              Text(
                'Address: 123 Main Street, City, Country', // Replace with the actual address
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),

              // User's Email ID
              Text(
                'Email ID: user@example.com', // Replace with the actual email ID
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
