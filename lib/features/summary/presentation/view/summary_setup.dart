import 'package:business_tools/core/public/widgets/text_form_filed_cu.dart';
import 'package:business_tools/features/extract/presentation/widgets/drop_down_widget.dart';
import 'package:business_tools/features/summary/data/source/static/summary_static_data.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_setup/slider_setup.dart';
import 'package:business_tools/features/summary/presentation/view/widgets/summary_setup/title_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uicons/uicons.dart';

class SummarySetup extends StatelessWidget {
  const SummarySetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, appBar: _appBar(), body: _body(context));
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('تجهيز'),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Card.outlined(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormFieldCu(
                    hint: "Video Url",
                    isCenter: true,
                    textEditingController: context.read<SummarySetupCubit>().textco,
                  ),
                  Divider(),
                  TitleSetup(title: "summary type"),
                  _typesBuilder(),
                  Divider(),
                  TitleSetup(title: "summary size"),
                  SliderSetup(),
                  Divider(),
                  TitleSetup(title: "language"),
                  _changeLange(),
                  Divider(),
                  BlocListener<SummarySetupCubit, SummarySetupState>(
                    listener: (context, state) {
                      if (state.state == StateSetUp.error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data")));
                      }
                    },
                    child: Center(
                      child: FilledButton.icon(
                        onPressed: () => context.read<SummarySetupCubit>().validateButton(),
                        label: Text("Summary"),
                        icon: Icon(UIcons.regularStraight.magic_wand),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _typesBuilder() {
    return BlocBuilder<SummarySetupCubit, SummarySetupState>(
      buildWhen: (previous, current) => current.state == StateSetUp.changeType,
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 8,
          children: List.generate(SummaryStaticData.summaryTypes.length, (index) {
            String type = SummaryStaticData.summaryTypes[index];
            return FilterChip(
              label: Text(type),
              onSelected: (value) {
                context.read<SummarySetupCubit>().selectType(type);
              },
              selected: state.summaryType == type,
            );
          }),
        );
      },
    );
  }

  Widget _changeLange() {
    return BlocBuilder<SummarySetupCubit, SummarySetupState>(
      buildWhen: (previous, current) => current.state == StateSetUp.changeLang,
      builder: (context, state) {
        return DropDownlangWidget(
          title: "lang",
          width: double.maxFinite,
          onSelected: (lang) => context.read<SummarySetupCubit>().changeLang(lang),
          initVlaue: state.lang,
        );
      },
    );
  }
}
