import 'package:business_tools/features/language/data/datasources/static_data_language.dart';
import 'package:business_tools/features/language/data/models/languages_model.dart';
import 'package:business_tools/features/language/presentation/bloc/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_tools/l10n/app_localizations.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.lang),
      ),
      body: ListView.builder(
        itemCount: StaticDataLanguage.languages.length,
        itemBuilder: (context, index) {
          LanguagesModel languagesModel = StaticDataLanguage.languages[index];
          return ListTile(
            title: Text(languagesModel.lang),
            onTap: () => BlocProvider.of<LanguageCubit>(context).changeLange(languagesModel.code),
          );
        },
      ),
    );
  }
}
