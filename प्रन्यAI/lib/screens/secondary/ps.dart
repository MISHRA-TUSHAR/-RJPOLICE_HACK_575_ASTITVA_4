import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prnyai/screens/secondary/station.dart';

class LocatePSScreen extends StatefulWidget {
  @override
  _LocatePSScreenState createState() => _LocatePSScreenState();
}

class _LocatePSScreenState extends State<LocatePSScreen> {
  String locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locate Nearest Police Station'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await getCurrentLocation();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Get Current Location',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Location: $locationMessage',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        LocationData? locationData = await Location().getLocation();
        setState(() {
          locationMessage =
              "Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}";
        });

        final policeStations = await findNearestPoliceStations(
          locationData.latitude ?? 0.0,
          locationData.longitude ?? 0.0,
        );

        if (policeStations.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PoliceStationsScreen(policeStations: policeStations),
            ),
          );
        } else {
          print('No police stations found nearby.');
        }
      } else {
        handlePermissionDenied();
      }
    } catch (e) {
      print('Error obtaining location: $e');
    }
  }

  void handlePermissionDenied() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Denied'),
        content: Text('Location access is required for this feature.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> findNearestPoliceStations(
      double latitude, double longitude) async {
    final apiKey =
        'AtiL8bsZ5JdU5D1A5ahwONzkJs86YZKA86Le4W3ySW-nRk_SmssECt0dLv6oXND4';
    final bingMapsApiUrl =
        'http://dev.virtualearth.net/REST/v1/LocalSearch/?query=police&userLocation=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(bingMapsApiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['resourceSets'] != null && data['resourceSets'].isNotEmpty) {
          final List<dynamic> resources = data['resourceSets'][0]['resources'];
          if (resources.isNotEmpty) {
            return resources
                .map((resource) => {
                      'name': resource['name'],
                      'address': resource['Address']['formattedAddress'],
                    })
                .toList();
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return [];
  }
}
