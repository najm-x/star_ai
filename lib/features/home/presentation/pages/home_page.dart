import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/features/home/presentation/widgets/dec_widget.dart';
import 'package:business_tools/features/home/presentation/widgets/drawer_widget.dart';
import 'package:business_tools/features/home/presentation/widgets/lange_widget.dart';
import 'package:business_tools/features/home/presentation/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContainer,
      appBar: _appBar(context),
      drawer: _drawer(),
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          Add(
            height: 70,
          ),
          Spacer(),
          WelcomeWidget(),
          DecWidget(),
          SizedBox(
            height: 20,
          ),
          LangeWidget(),
          Spacer()
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(AppLocalizations.of(context)!.businessTools),
    );
  }

  Widget _drawer() {
    return const DrawerWidget();
  }
}
