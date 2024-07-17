import 'package:business_tools/core/public/widgets/add.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/add_image_widget.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/text_extract_floating_button.dart';
import 'package:business_tools/features/text_extract/presentation/widgets/view_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextExtractPage extends StatelessWidget {
  const TextExtractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (didPop) {
          BlocProvider.of<TextExtractBloc>(context).add(const RestEvent());
        },
        child: Scaffold(
          floatingActionButton: _floatingActionButton(),
          appBar: AppBar(),
          body: _buildBody(),
        ));
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          const SingleChildScrollView(
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
          ),
          Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              child: const Add(height: 70))
        ],
      ),
    );
  }

  Widget _floatingActionButton() {
    return const TextExtractFloatingButton();
  }
}
