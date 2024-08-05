// import 'package:business_tools/features/ads/presentation/widgets/ads_banner_widget.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/add_image_widget.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/text_extract_floating_button.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/view_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:showcaseview/showcaseview.dart';

class TextExtractPage extends StatefulWidget {
  const TextExtractPage({super.key});

  @override
  State<TextExtractPage> createState() => _TextExtractPageState();
}

class _TextExtractPageState extends State<TextExtractPage> {
  BuildContext? myContext;
  @override
  void initState() {
    Future.delayed(Durations.short1, () {
      BlocProvider.of<TextExtractBloc>(context).showCase(myContext!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
        myContext = context;
        return PopScope(
            onPopInvoked: (didPop) {
              BlocProvider.of<TextExtractBloc>(context).add(const RestEvent());
            },
            child: Scaffold(
              floatingActionButton: _floatingActionButton(),
              appBar: AppBar(),
              body: _buildBody(),
              // bottomSheet: const AdsBannerWidget(
              //   adSize: AdSize.largeBanner,
              // ),
            ));
      },
    );
  }

  Widget _buildBody() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddImageWidget(),
          SizedBox(
            height: 20,
          ),
          ViewTextWidget(),
        ],
      ),
    );
  }

  Widget _floatingActionButton() {
    return const TextExtractFloatingButton();
  }
}
