import 'package:flutter/material.dart';

class EmptyVideoSummary extends StatelessWidget {
  const EmptyVideoSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.ondemand_video_outlined,
              size: 100.0,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24.0),
            Text(
              'قائمتك فارغة حالياً',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              'لم تقم بتلخيص أي فيديو بعد.\nابدأ الآن بالضغط على زر الإضافة (+) في الأسفل.',
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              'لمعرفة المزيد حول كيفية استخدام التطبيق، اضغط على أيقونة المعلومات (ⓘ) في أعلى الشاشة.',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
