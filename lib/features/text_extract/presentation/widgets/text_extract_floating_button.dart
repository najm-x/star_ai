import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart' ;

class TextExtractFloatingButton extends StatelessWidget {
  const TextExtractFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 120),
      child: BlocBuilder<TextExtractBloc, TextExtractState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.status == TextExtractStatus.successCropImage ||
                      state.status == TextExtractStatus.successTextExtract // ........
                  ? _restWidget(context)
                  : const SizedBox(),
              const SizedBox(
                height: 15,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: AnimatedCrossFade(
                    firstChild: _iconSend(context),
                    secondChild: const Text("..."),
                    crossFadeState: state.status == TextExtractStatus.loading
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Durations.medium1),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _restWidget(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<TextExtractBloc>().add(const RestEvent()),
      child: const Icon(
        Icons.restart_alt,
        size: 28,
      ),
    );
  }

  Widget _iconSend(BuildContext context) {
    return Showcase(
      key: BlocProvider.of<TextExtractBloc>(context).tow,
      description: AppLocalizations.of(context)!.clickTOExtract,
      child: IconButton(
          onPressed: () => context
              .read<TextExtractBloc>()
              .add(ExtractTextFromImageEvent(path: context.read<TextExtractBloc>().path)),
          icon: const Icon(
            Icons.image_search,
            size: 28,
          )),
    );
  }
}
