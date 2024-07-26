import 'package:business_tools/core/public/widgets/loading.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/video_translator/data/datasources/static_data_vd_trans.dart';
import 'package:business_tools/features/video_translator/data/models/vd_type_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_trans_type_cubit/vd_trans_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonShowAddWidget extends StatelessWidget {
  const ButtonShowAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return state is RewardedAdLoading
            ? const Loading()
            : FilledButton.icon(
                onPressed: () => context.read<AdsBloc>().rewardedAd?.show(
                  onUserEarnedReward: (ad, reward) {
                    VdTypeModel vdTypeModel =
                        StaticDataVdTrans().vdTypeData[BlocProvider.of<VdTransTypeCubit>(context).currentVdType];
                    context.pushReplacement(vdTypeModel.pageRoute, extra: vdTypeModel.type);
                  },
                ),
                label: Text(
                  AppLocalizations.of(context)!.showToStart,
                ),
                icon: const Icon(Icons.videocam),
              );
      },
    );
  }
}
