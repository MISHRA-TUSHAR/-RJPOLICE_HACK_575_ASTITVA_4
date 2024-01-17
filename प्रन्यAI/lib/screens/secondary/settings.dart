import 'package:flutter/material.dart';
import 'package:prnyai/screens/primary/login_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool areNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingSection(
              'General Settings',
              [
                buildSettingItem(
                  'Dark Mode',
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                        _toggleDarkMode();
                      });
                    },
                  ),
                ),
                buildSettingItem(
                  'Notifications',
                  Switch(
                    value: areNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        areNotificationsEnabled = value;
                        // Add logic to handle notification change
                      });
                    },
                  ),
                ),
                buildSettingItem('Language', Text('English')),
              ],
            ),
            Divider(),
            buildSettingSection(
              'Account Settings',
              [
                buildLogoutButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingSection(String title, List<Widget> settings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        ...settings,
      ],
    );
  }

  Widget buildSettingItem(String title, Widget trailing,
      {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Logout'),
          Icon(Icons.exit_to_app),
        ],
      ),
    );
  }

  void _toggleDarkMode() {
    if (isDarkMode) {
      // Apply dark mode theme
      // You can customize the dark mode theme based on your requirements
      // For example, you can use ThemeData.dark()
      // ThemeProvider.applyTheme(ThemeData.dark());
    } else {
      // Apply light mode theme
      // You can customize the light mode theme based on your requirements
      // For example, you can use ThemeData.light()
      // ThemeProvider.applyTheme(ThemeData.light());
    }
  }
}
