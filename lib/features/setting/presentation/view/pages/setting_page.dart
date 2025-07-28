import 'package:business_tools/core/constant/app_images.dart';
import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/functions/open_url.dart';
import 'package:business_tools/features/language/presentation/bloc/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tools/l10n/app_localizations.dart';
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
          applicationName: AppLocalizations.of(context)!.appName,
          applicationVersion: '1.2.0',
          applicationLegalese: '© 2025',
          children: [
            Text(
              AppLocalizations.of(context)!.appCreator,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _ContactIcon(
                  icon: Icons.email,
                  label: 'Gmail',
                  url: 'mailto:nagm113nagm@gmail.com',
                ),
                _ContactIcon(
                  icon: Icons.chat,
                  label: 'Telegram',
                  url: 'https://t.me/Nagm_nagm',
                ),
                _ContactIcon(
                  icon: Icons.code,
                  label: 'GitHub',
                  url: 'https://github.com/najm-flutter',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ContactIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _ContactIcon({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        openUrl(url);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
