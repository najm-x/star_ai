import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإعدادات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ملف شخصي بسيط
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile.jpg'), // تأكد من وجود الصورة في assets
            ),
            SizedBox(height: 10),
            Text('اسم المستخدم',
                style: Theme.of(context).textTheme.bodyLarge),
            Divider(),

            // تغيير اللغة
            ListTile(
              leading: Icon(Icons.language),
              title: Text('تغيير اللغة'),
              onTap: () {
                // منطق تغيير اللغة هنا
              },
            ),

            // تغيير API Key
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('تغيير API Key'),
              onTap: () {
                // منطق تغيير API Key هنا
              },
            ),

            // حول التطبيق والمطور
            ListTile(
              leading: Icon(Icons.info),
              title: Text('حول التطبيق'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'اسم التطبيق',
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'حقوق النشر © 2025',
                  children: [
                    Text('هذا التطبيق تم تطويره بواسطة المطور فلان.')
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
