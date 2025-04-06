import 'package:business_tools/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.howToUseTitle),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            InstructionText(
              text: AppLocalizations.of(context)!.welcomeText,
            ),
            SizedBox(height: 4.0),
            MethodTitle(
              title: AppLocalizations.of(context)!.step1Title,
            ),
            InstructionText(
              text: AppLocalizations.of(context)!.step1Instruction1,
            ),
            InstructionImage(imagePath: AppImages.share),
            InstructionText(
              text: AppLocalizations.of(context)!.step1Instruction2,
            ),
            InstructionImage(imagePath: AppImages.copy),
            InstructionText(
              text: AppLocalizations.of(context)!.step1Instruction3,
            ),
            InstructionImage(imagePath: AppImages.add),
            InstructionText(
              text: AppLocalizations.of(context)!.step1Instruction4,
            ),
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
