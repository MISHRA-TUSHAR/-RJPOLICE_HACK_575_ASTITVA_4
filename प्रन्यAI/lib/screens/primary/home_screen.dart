import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prnyai/screens/secondary/about_us.dart';
import 'package:prnyai/screens/secondary/analysis_screen.dart';
import 'package:prnyai/screens/secondary/cctns.dart';
import 'package:prnyai/screens/secondary/profile_screen.dart';
import 'package:prnyai/screens/secondary/ps.dart';
import 'package:prnyai/screens/secondary/settings.dart';
import 'package:prnyai/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> horizontalImages = [
    'assets/azadi.png',
    'assets/Emblem_Rajasthan.png',
    'assets/raccam.jpeg',
  ];

  final List<String> carouselImages = [
    'assets/carousel.png',
    'assets/1.jpeg',
    'assets/2.jpeg',
    'assets/3.jpeg',
    'assets/4.jpeg',
  ];

  final List<String> cardTitles = [
    'Analyse FIR',
    'Locate PS',
    'CCTNS Database', // New card title
    'About Us',
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildSquareCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white, // Set card background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: 100, // Adjust the width as needed
        height: 100, // Adjust the height as needed
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 68, 6), // Set background color
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      'Empowering Justice, Transforming Processes - Your Future Our Innovation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width:
                  MediaQuery.of(context).size.width, // Adjust width as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHorizontalImage(widget.horizontalImages[0]),
                  _buildHorizontalImage(widget.horizontalImages[1]),
                  _buildHorizontalImage(widget.horizontalImages[2]),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.9,
                ),
                items: widget.carouselImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePath,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: widget.cardTitles.length,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return _buildSquareCard(
                        widget.cardTitles[index],
                        Icons.description,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FIRAnalysisScreen(),
                            ),
                          );
                        },
                      );
                    case 1:
                      return _buildSquareCard(
                        widget.cardTitles[index],
                        Icons.location_on,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocatePSScreen(),
                            ),
                          );
                        },
                      );
                    case 2:
                      return _buildSquareCard(
                        widget.cardTitles[index],
                        Icons.book,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CCTNSDatabaseScreen(),
                            ),
                          );
                        },
                      );
                    case 3:
                      return _buildSquareCard(
                        widget.cardTitles[index],
                        Icons.info,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AboutUsPage(), // Navigate to AboutUsScreen
                            ),
                          );
                        },
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 226, 68, 6),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              print('Home icon clicked!');
              break;
            case 1:
              print('Chatbot icon clicked!');
              break;
            case 2:
              print('Settings icon clicked!');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
