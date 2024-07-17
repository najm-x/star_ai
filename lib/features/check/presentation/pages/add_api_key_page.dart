import 'package:business_tools/core/public/widgets/info_widget.dart';
import 'package:business_tools/features/check/presentation/widgets/step_widget.dart';
import 'package:flutter/material.dart';

class AddApiKeyPage extends StatelessWidget {
  const AddApiKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InfoWidget(text: "يتعذر حاليا الإتصال بمزود الخدمة الخاص بنا "),
            SizedBox(
              height: 10,
            ),
            Text(
              "في هذه الحالة  يرجى إدخال ال api key الخاص بك للاستمرار في استخدام التطبيق لن تستغرق معك هذه الخطوات أكثر من دقيقة  ",
              textAlign: TextAlign.center,
            ),
            Expanded(child: StepWidget())
          ],
        ),
      ),
    );
  }
}
