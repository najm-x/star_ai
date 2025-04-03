import 'package:business_tools/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('How to Use'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            InstructionText(
              text:
                  'Welcome to the How to Use page! This guide will show you how to get started with video summarization.',
            ),
            SizedBox(height: 4.0),
            MethodTitle(title: '1: Copy Link'),
            InstructionText(text: '1. Tap "Share" button below the video on the app or webpage.'),
            InstructionImage(imagePath: AppImages.share),
            InstructionText(text: '2. Select "Copy Link".'),
            InstructionImage(imagePath: AppImages.copy),
            InstructionText(text: '3. Tap on the "Add" icon to add a new summarization.'),
            InstructionImage(imagePath: AppImages.add),
            InstructionText(
                text: '4. Paste the video link, select the type of summary, its size, and the language you prefer.'),
            InstructionImage(imagePath: AppImages.summary),
          ],
        ),
      ),
    );
  }
}

class InstructionText extends StatelessWidget {
  final String text;

  const InstructionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.0),
    );
  }
}

class MethodTitle extends StatelessWidget {
  final String title;

  const MethodTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}

class InstructionImage extends StatelessWidget {
  final String imagePath;

  const InstructionImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade600,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
