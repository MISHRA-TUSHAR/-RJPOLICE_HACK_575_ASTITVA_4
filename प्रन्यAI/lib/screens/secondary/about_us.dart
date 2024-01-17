// about_us.dart
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Image.asset('assets/astitva.jpeg', width: 400, height: 150),
              ),
              // Introduction
              Text(
                'Welcome to Team ASTITVA, where technology and legal expertise converge to revolutionize the accessibility of law. We are a dynamic blend of tech-savvy minds and legal professionals committed to addressing real-world challenges.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Our Mission
              Text(
                'Our Mission',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Decoding FIRs with Precision\n\n'
                'FIRs are integral to investigations, but their complexities often pose challenges. At ASTITVA, we harness the power of Artificial Intelligence (AI) to enhance speed and accuracy in analyzing First Information Reports. Our goal is to automate the identification of legal acts and sections, offering invaluable support to the Indian Police Service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Meet the Team
              Text(
                'Meet the Team',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Tushar - Flutter App Developer\n'
                'Bringing creativity to code, Tushar designs intuitive interfaces for seamless user experiences in our Flutter applications.\n\n'
                'Alankar - AI and Machine Learning Specialist\n'
                'Proficient in PyTorch, Alankar delves into the world of Large Language Models (LLMs) to decode FIR intricacies effectively.\n\n'
                'Vedant - Legal Expert and App developer\n'
                'With a solid understanding of the Indian Penal Code, Vedant ensures accuracy and relevance in deciphering legal complexities.\n\n'
                'Sidharth - Full-stack Web Developer\n'
                'Linking the pieces together, Sidharth transforms intricate analyses into accessible and interactive web solutions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Our Chosen Challenge
              Text(
                'Our Chosen Challenge',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Analysis of FIRs Using AI/ML\n\n'
                'Why FIR Analysis?\n'
                'Deciphering FIRs is critical but challenging. Our expertise in LLMs enables us to create a tool that automates the identification of legal acts and sections, making the legal process more efficient.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Our Approach
              Text(
                'Our Approach',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                '- Large Language Model (LLM): Using Hugging Face\'s Transformers library, we build a robust FIR analysis model.\n\n'
                '- Machine Learning Expertise: Crafted with PyTorch, our model processes a diverse dataset of FIRs, employing natural language processing techniques.\n\n'
                '- User-friendly Interface: Tushar ensures an intuitive user interface for the Indian Police Service, accessible through our Flutter application.\n\n'
                '- Seamless Integration: Sidharth utilizes open-source tools like nodeJS for the backend and ReactJS for the website, ensuring scalability and accessibility.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Our Vision
              Text(
                'Our Vision',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'We envision a future where our AI-driven FIR analysis system facilitates quicker, more accurate investigations for the Indian Police Service, transcending language barriers. ASTITVA strives to make law more accessible, just, and efficient.\n\n'
                'Join us on this transformative journey toward a technologically empowered legal landscape!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
