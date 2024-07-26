import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/video_translator/data/datasources/static_data_vd_trans.dart';
import 'package:business_tools/features/video_translator/data/models/vd_type_model.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_trans_type_cubit/vd_trans_type_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_trans_type/button_show_add_widget.dart';
import 'package:business_tools/features/video_translator/presentation/widgets/vd_trans_type/radio_choose_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseTypeTransPage extends StatefulWidget {
  const ChooseTypeTransPage({Key? key}) : super(key: key);

  @override
  State<ChooseTypeTransPage> createState() => _ChooseTypeTransPageState();
}

class _ChooseTypeTransPageState extends State<ChooseTypeTransPage> {
  @override
  void initState() {
    BlocProvider.of<AdsBloc>(context).add(RewardedAdEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: _bottomSheetBuilder(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    StaticDataVdTrans staticDataVdTrans = StaticDataVdTrans() ;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<VdTransTypeCubit, VdTransTypeState>(
        builder: (context, state) {
          print("object");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              staticDataVdTrans.vdTypeData.length,
              (index) {
                VdTypeModel vdTypeModel = staticDataVdTrans.vdTypeData[index];
                return RadioChooseWidget(
                  index: index,
                  currentVdType: context.read<VdTransTypeCubit>().currentVdType,
                  vdTypeModel: vdTypeModel,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _bottomSheetBuilder() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ButtonShowAddWidget(),
    );
  }
}
