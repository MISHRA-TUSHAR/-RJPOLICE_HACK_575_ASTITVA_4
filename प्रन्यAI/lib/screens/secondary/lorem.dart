import 'package:flutter/material.dart';

class LoremPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summarize FIR'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Investigation Summary',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'An investigation was conducted into allegations of excess payments made during the tenure of Gram Panchayat Beranadi for various works, including pipeline laying and shed construction. The investigation found that signatures of a competent engineer were missing on some approvals and no measurement book was filled for one of the works. A preliminary inquiry was registered and verified, with necessary documents obtained. Some documents lacked required signatures or were incomplete.',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
