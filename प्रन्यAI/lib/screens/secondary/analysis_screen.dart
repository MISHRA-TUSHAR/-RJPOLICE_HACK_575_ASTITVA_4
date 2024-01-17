import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class FIRAnalysisScreen extends StatefulWidget {
  @override
  _FIRAnalysisScreenState createState() => _FIRAnalysisScreenState();
}

class _FIRAnalysisScreenState extends State<FIRAnalysisScreen> {
  late String filePath = ''; // Initialize with an empty string
  String apiResponse = '';
  List<String> analysisOptions = [];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
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
      var uri = Uri.parse('https://api.example.com/upload');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', filePath))
        ..headers['Authorization'] =
            'Bearer YOUR_DUMMY_API_KEY'; // Replace with your actual API key

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle successful response
        setState(() {
          apiResponse = 'File uploaded successfully';
        });

        // Extract options from the API response and update the UI
        await _extractOptionsFromResponse(response as http.Response);
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
        analysisOptions = ['Summarize', 'Acts/services', 'Keywords'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse FIR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilePickerButton(onPressed: _pickFile),
            SizedBox(height: 16),
            if (filePath.isNotEmpty) FilePathDisplay(filePath: filePath),
            SizedBox(height: 16),
            Text('API Response: $apiResponse'),
            // Display analysis options based on API response
            if (analysisOptions.isNotEmpty)
              Column(
                children: analysisOptions
                    .map((option) => ElevatedButton(
                          onPressed: () {
                            // Handle option selection
                            _handleOptionSelection(option);
                          },
                          child: Text(option),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  void _handleOptionSelection(String option) {
    // Add logic to handle the selected option
    print('Selected option: $option');
    // Further processing based on the selected option
  }
}

class FilePickerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FilePickerButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Pick FIR File'),
    );
  }
}

class FilePathDisplay extends StatelessWidget {
  final String filePath;

  const FilePathDisplay({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Text(
      'File Path: $filePath',
      style: TextStyle(fontSize: 16),
    );
  }
}
