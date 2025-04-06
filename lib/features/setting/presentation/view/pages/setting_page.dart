import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/features/language/presentation/bloc/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:uicons/uicons.dart';

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
    return AppBar(title: Text(AppLocalizations.of(context)!.setting));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildProfileSection(context),
          const Divider(),
          _buildLanguageTile(context),
          _buildThemeTile(context),
          _buildAboutTile(context),
          Spacer(),
          _buildTrubleShotting(context),
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
      title: Text(AppLocalizations.of(context)!.changeLang),
      onTap: () => context.push(AppRouteName.languagePage),
    );
  }

  Widget _buildThemeTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.style),
      title: Text(AppLocalizations.of(context)!.changTheme),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: const Icon(Icons.sunny),
                      title: Text(AppLocalizations.of(context)!.light),
                      onTap: () {
                        context.read<LanguageCubit>().changeTheme("light");
                      }),
                  ListTile(
                      leading: Icon(UIcons.regularStraight.moon),
                      title: Text(AppLocalizations.of(context)!.dark),
                      onTap: () {
                        context.read<LanguageCubit>().changeTheme("dark");
                      })
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTrubleShotting(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FilledButton(
            onPressed: () => context.push(AppRouteName.checkPage),
            child: Text(AppLocalizations.of(context)!.trubleShotting)),
      ),
    );
  }

  Widget _buildAboutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info),
      title: Text(AppLocalizations.of(context)!.aboutApp),
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
