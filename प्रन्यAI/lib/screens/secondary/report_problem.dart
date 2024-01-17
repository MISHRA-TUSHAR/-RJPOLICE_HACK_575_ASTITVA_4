import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement the logic to submit feedback
                        Navigator.pop(context); // Close the feedback form
                      },
                      child: Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the feedback form
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red, // Choose the color for the button
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
