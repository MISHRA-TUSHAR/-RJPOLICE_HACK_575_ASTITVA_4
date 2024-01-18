import 'package:flutter/material.dart';

class ActSections extends StatelessWidget {
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
                    'Based on the context provided in the statement, it appears that an excess payment of Rs. 13,28,219 was made for various public works projects in violation of rules. However, the message does not provide sufficient information to determine which specific Indian Penal Code (IPC) sections may apply. Here are some possible IPC sections that could be relevant based on the given context:',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 16.0),
                  buildHighlightedText(
                    '1. Criminal Breach of Trust by Public Servant (Section 403):',
                    'This section applies when a public servant, entrusted with property or money, dishonestly misappropriates or converts it to his own use, or intends to convert it to his own use, or allows any other person so to do, without lawful authority. In this context, if the Sarpanch and Gram Vikas Adhikari are found to have misappropriated funds intended for public works projects, this section may apply.',
                  ),
                  buildHighlightedText(
                    '2. Criminal Conspiracy (Section 120B):',
                    'This section applies when two or more persons agree to commit an offense or to aid, abet, or procure its commission. If it is determined that the Sarpanch and Gram Vikas Adhikari conspired to withdraw government funds without executing the intended works, this section may apply.',
                  ),
                  buildHighlightedText(
                    '3. Cheating (Section 415):',
                    'This section applies when a person by deceit, fraud, or misrepresentation, or by concealing the truth, induces another person to deliver any property or valuable security to him or fails to perform a promise or contract. If it is found that false statements were made or information was concealed in order to secure government funds for works that were never executed, this section may apply.',
                  ),
                  buildHighlightedText(
                    '4. Forgery (Section 465):',
                    'This section applies when a person makes a false document or alters a genuine document with the intention of causing damage or injury to another person or property. If it is determined that false documents were created or existing documents were altered in order to secure government funds for non-existent works, this section may apply.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHighlightedText(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          content,
          style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
