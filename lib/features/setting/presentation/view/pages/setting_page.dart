import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(title: const Text("Setting"));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildProfileSection(context),
          const Divider(),
          _buildLanguageTile(context),
          _buildApiKeyTile(context),
          _buildAboutTile(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final theme = Theme.of(context);
    final applicationLegalese = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.logo),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(applicationLegalese.appName, style: theme.textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('تغيير اللغة'),
      onTap: () => context.push(AppRouteName.languagePage),
    );
  }

  Widget _buildApiKeyTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.vpn_key),
      title: const Text('تغيير API Key'),
      onTap: () => context.push(AppRouteName.addApiKeyPage),
    );
  }

  Widget _buildAboutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info),
      title: const Text('حول التطبيق'),
      onTap: () {
        showAboutDialog(
          context: context,
          applicationName: 'اسم التطبيق',
          applicationVersion: '1.0.0',
          applicationLegalese: 'حقوق النشر © 2025',
          children: [const Text('هذا التطبيق تم تطويره بواسطة المطور فلان.')],
        );
      },
    );
  }
}
