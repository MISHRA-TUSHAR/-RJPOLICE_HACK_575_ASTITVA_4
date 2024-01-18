import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photo_view/photo_view.dart';
import 'package:prnyai/screens/secondary/acts.dart';
import 'package:prnyai/screens/secondary/lorem.dart';

class FIRAnalysisScreen extends StatefulWidget {
  @override
  _FIRAnalysisScreenState createState() => _FIRAnalysisScreenState();
}

class _FIRAnalysisScreenState extends State<FIRAnalysisScreen> {
  late String filePath = '';
  String apiResponse = '';
  List<String> analysisOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse FIR'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Pick FIR File',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              if (filePath.isNotEmpty) Text('File Path: $filePath'),
              SizedBox(height: 16),
              Text('API Response: $apiResponse'),
              SizedBox(height: 32),
              Text(
                'Additional Content Goes Here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Display analysis options based on API response
              if (analysisOptions.isNotEmpty) _buildAnalysisOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisOptions() {
    // Check if 'Summarize' is present
    bool hasSummarize = analysisOptions.contains('Summarize');

    // Check if 'Acts/Sections' is present
    bool hasActsSections = analysisOptions.contains('Acts/Sections');

    // Create 'Summarize' button if present
    Widget summarizeButton = hasSummarize
        ? ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoremPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Summarize',
              style: TextStyle(fontSize: 18),
            ),
          )
        : Container(); // Empty container if 'Summarize' is not present

    // Create 'Acts/Sections' button if present
    Widget actsSectionsButton = hasActsSections
        ? ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActSections()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Acts/Sections',
              style: TextStyle(fontSize: 18),
            ),
          )
        : Container(); // Empty container if 'Acts/Sections' is not present

    // Wrap the buttons in a Column with spacing
    Widget optionsColumn = Column(
      children: [
        SizedBox(height: 16),
        summarizeButton,
        SizedBox(height: 16),
        actsSectionsButton,
      ],
    );

    // Add some padding around the buttons
    optionsColumn = Padding(
      padding: EdgeInsets.all(16),
      child: optionsColumn,
    );

    return optionsColumn;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        filePath = result.files.single.path!;
      });

      // Upload the file immediately after selection
      await _uploadFile(filePath);
    }
  }

  Future<void> _uploadFile(String filePath) async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.post(
        url,
        body: {'title': 'Uploaded File', 'body': 'File content'},
      );

      if (response.statusCode == 201) {
        // Handle successful response
        setState(() {
          apiResponse = 'File uploaded successfully';
        });

        // Extract options from the API response and update the UI
        await _extractOptionsFromResponse(response);

        // Display the content of the uploaded file
        _displayFileContent(filePath);
      } else {
        // Handle error response
        setState(() {
          apiResponse = 'Error uploading file: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      // Handle other exceptions if needed
      setState(() {
        apiResponse = 'Error: $e';
      });
    }
  }

  Future<void> _extractOptionsFromResponse(http.Response response) async {
    // Simulate extracting options from the API response
    // Replace this with your actual logic based on the API response
    await Future.delayed(Duration(seconds: 2));

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Dummy analysis options
      setState(() {
        analysisOptions = ['Summarize', 'Acts/Sections'];
      });
    }
  }

  void _handleOptionSelection(String option) {
    // Add logic to handle the selected option
    print('Selected option: $option');
    // Further processing based on the selected option
  }

  void _displayFileContent(String filePath) {
    if (filePath.endsWith('.pdf') || filePath.endsWith('.doc')) {
      // Display PDF files using flutter_pdfview
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFView(
            filePath: filePath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageSnap: true,
            pageFling: true,
            defaultPage: 0,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (pages) {
              // Called when PDF is rendered successfully
            },
            onError: (error) {
              // Called when an error occurs during rendering
            },
            onPageError: (page, error) {
              // Called when an error occurs on a specific page
            },
            onViewCreated: (PDFViewController pdfViewController) {
              // You can use pdfViewController to control the PDF view
            },
          ),
        ),
      );
    } else if (filePath.endsWith('.jpg') ||
        filePath.endsWith('.jpeg') ||
        filePath.endsWith('.png')) {
      // Display image files
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoView(
            imageProvider: FileImage(File(filePath)),
          ),
        ),
      );
    }
  }
}
