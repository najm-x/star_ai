import 'package:business_tools/core/constant/app_colors.dart';
import 'package:business_tools/features/extract/domain/entities/emails_numbera_entite.dart';
import 'package:flutter/material.dart';

class ViewDataDialog extends StatelessWidget {
  const ViewDataDialog({super.key, required this.data});

 final List<EmailsNumberaEntite> data ;
  @override
  Widget build(BuildContext context){
    return Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.secondary.withOpacity(0.5))),
              child: ListWheelScrollView(
                  useMagnifier: true,
                  magnification: 1.2,
                  itemExtent: 30,
                  children: List.generate(
                      data.length,
                      (index) => Text(
                          data[index].value,
                            style: Theme.of(context).textTheme.titleLarge,
                          ))),
            );
  }
}