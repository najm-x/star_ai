import 'package:flutter/material.dart';


import 'package:business_tools/features/home/data/datasource/static/static_data.dart';
import 'package:business_tools/features/home/data/models/drawer_model.dart';
import 'package:business_tools/features/home/presentation/widgets/card_home_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final applang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome...!',
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            applang.desWelcomOnBoarding,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.8),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          _cardBuilder(context)
        ],
      ),
    );
  }

  Widget _cardBuilder(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: StaticData().drawerData.length,
        itemBuilder: (context, index) {
          DrawerModel data = StaticData().drawerData[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: CardHomeWidget(
                icon: data.iconData, title: data.title, description: data.description, routeName: data.route ?? ""),
          );
        },
      ),
    );
  }

  
}
