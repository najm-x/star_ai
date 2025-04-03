import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

void showApiKeyDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text("تنبيه"),
        content: Text("التطبيق غير قادر على تلخيص المزيد من الفيديوهات. يرجى إدخال مفتاح API الخاص بك من صفحة الإعدادات."),
        actions: [
          CupertinoDialogAction(
            child: Text("إلغاء"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text("الإعدادات"),
            onPressed: () {
              context.go(AppRouteName.addApiKeyPage); // تعديل حسب مسار صفحة الإعدادات لديك
            },
          ),
        ],
      );
    },
  );
}
