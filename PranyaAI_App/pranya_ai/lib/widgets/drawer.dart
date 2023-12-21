import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/ogo.png', height: 80),
                // ignore: prefer_const_constructors
                SizedBox(height: 10),
                Text('praynayAI', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          DrawerItem(
              icon: Icons.home,
              title: 'Home',
              onTap: () => _navigateToScreen(context, '/home')),
          // Add other drawer items as needed
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String route) {
    Navigator.pop(context); // Close the drawer
    Navigator.pushNamed(context, route);
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  DrawerItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
