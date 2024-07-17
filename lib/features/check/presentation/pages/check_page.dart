import 'package:business_tools/core/constant/app_routes_name.dart';
import 'package:business_tools/core/public/widgets/loading.dart';
import 'package:business_tools/features/check/presentation/bloc/check/check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CheckCubit, CheckState>(
        listener: (context, state) {
          if (state.status == CheckStatus.internetError) {
            context.pushReplacement(AppRouteName.noInternetPageg);
          }
          if (state.status == CheckStatus.addedApiKey) {
            context.pushReplacement(AppRouteName.onBoarding);
          }
          if (state.status == CheckStatus.apiKeyWorking) {
            context.pushReplacement(AppRouteName.onBoarding);
          }
          if (state.status == CheckStatus.apiKeyDontWorking) {
            context.pushReplacement(AppRouteName.addApiKeyPage);
          }
        },
        child: const Center(child:  Loading()),
      ),
    );
  }
}
