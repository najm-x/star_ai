import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/features/extract/data/datasources/static_data.dart';
import 'package:business_tools/features/extract/data/models/type_file_save_model.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileTypes extends StatelessWidget {
  const FileTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExtractBloc, ExtractState>(
      listener: (context, state) {
       context.read<SaveDataBloc>().type = context.read<ExtractBloc>().typeFileSelexted ;
      },
      builder: (context, state) {
        return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  BlocProvider.of<ExtractBloc>(context).typeExtractName == "number"
                      ? StaticDataEx.typeNumberSaveData.length
                      : StaticDataEx.typeEmailSaveData.length, (index) {
                TypeFileSaveModle typeFileSaveModle = BlocProvider.of<ExtractBloc>(context).typeExtractName == "number"
                    ? StaticDataEx.typeNumberSaveData[index]
                    : StaticDataEx.typeEmailSaveData[index];
                return _partFile(
                  name: typeFileSaveModle.name,
                  isSelected: context.read<ExtractBloc>().typeFileSelexted == typeFileSaveModle.name,
                  onTap: () {
                    context.read<ExtractBloc>().add(ChangeTypeFile(value: typeFileSaveModle.name));
                  },
                );
              }),
            ) ;
          },
        );
      }
    
  }

  Widget _partFile({required String name, required bool isSelected, required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          name,
          style: TextStyle(color: AppColors.secondary),
        )),
      ),
    );
  }

