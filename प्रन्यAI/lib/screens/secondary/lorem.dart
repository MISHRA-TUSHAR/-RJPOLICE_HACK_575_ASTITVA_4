import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoremPage extends StatelessWidget {
  Future<List<int>> _generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Investigation Summary'),
        );
      },
    ));

    return pdf.save();
  }

  Future<void> _savePdf(BuildContext context) async {
    final pdfBytes = await _generatePdf();

    try {
      // Get the document directory
      final directory = await getApplicationDocumentsDirectory();

      // Create a File instance using the document directory and the file name
      final pdfFile = File('${directory.path}/investigation_summary.pdf');

      // Write PDF data to file
      await pdfFile.writeAsBytes(pdfBytes);

      print('PDF saved successfully at: ${pdfFile.path}');

      // Show a snackbar upon successful saving
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF saved successfully at: ${pdfFile.path}'),
          duration: Duration(seconds: 3),
        ),
      );

      // Save PDF file path in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('pdfFilePath', pdfFile.path);
    } catch (e) {
      print('Error saving PDF: $e');
      // Show a snackbar on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving PDF: $e'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _shareSavedPdf(BuildContext context) async {
    // Retrieve PDF file path from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final pdfFilePath = prefs.getString('pdfFilePath');

    if (pdfFilePath != null) {
      // Share the PDF file using share_plus
      await Share.shareFiles([pdfFilePath], text: 'Investigation Summary PDF');
    } else {
      // Show a snackbar if the PDF file path is not found
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF file not found. Save the PDF first.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _shareText(BuildContext context) async {
    final text = 'Investigation Summary\n\n'
        'An investigation was conducted into allegations of excess payments made during the tenure of Gram Panchayat Beranadi for various works, including pipeline laying and shed construction. The investigation found that signatures of a competent engineer were missing on some approvals and no measurement book was filled for one of the works. A preliminary inquiry was registered and verified, with necessary documents obtained. Some documents lacked required signatures or were incomplete.';

    // Share the text using share_plus
    await Share.share(text, subject: 'Investigation Summary');
  }

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
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _savePdf(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Save as PDF',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _shareSavedPdf(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Share Saved PDF',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _shareText(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Share Text',
                      style: TextStyle(fontSize: 18),
                    ),
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

void main() {
  runApp(MaterialApp(
    home: LoremPage(),
  ));
}
