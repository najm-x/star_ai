import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:business_tools/core/app_routes.dart' ;
import 'package:business_tools/core/errors/failure.dart';
import 'package:business_tools/core/functions/message_error_handel.dart';
import 'package:business_tools/features/video_translator/domain/entities/vd_translate_entities.dart';
import 'package:business_tools/features/video_translator/domain/usecases/download_trans_uc.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'vd_download_event.dart';
part 'vd_download_state.dart';


class VdDownloadBloc extends Bloc<VdDownloadEvent, VdDownloadState> {
  final DownloadTransUc downloadTransUc;
  BuildContext context = goRouter.routerDelegate.navigatorKey.currentContext! ;
  VdDownloadBloc({required this.downloadTransUc}) : super(const VdDownloadState()) {
    on<VdDownloadEvent>(_vdDownloadEvent);
  }

  Future<void> _vdDownloadEvent(VdDownloadEvent event, Emitter<VdDownloadState> emit) async {
    // if (permissionStatus == PermissionStatus.denied || permissionStatus == PermissionStatus.permanentlyDenied) {}
    emit(state.copyWith(status: VdDownloadStatus.init));
    if (await checkPermission()) {
      emit(state.copyWith(status: VdDownloadStatus.loading));
      var failureOrDone = await downloadTransUc.call(event.translation, event.videoUrl);
      await Future.delayed(const Duration(seconds: 2));
      emit(_vdDownloadState(failureOrDone));
    } else {
      emit(state.copyWith(status: VdDownloadStatus.errorPermission));
    }
  }

  VdDownloadState _vdDownloadState(Either<Failure, Unit> failureOrDone) {
    return failureOrDone.fold(
        (failure) => state.copyWith(status: VdDownloadStatus.error, messageError: messageErrorHandel(failure , context)),
        (done) => state.copyWith(
            status: VdDownloadStatus.success, messageSuccess: AppLocalizations.of(context)!.doneSaveFile));
  }

  Future<bool> checkPermission() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
      return await Permission.manageExternalStorage.isGranted;
    } else {
      return await Permission.storage.isGranted;
    }
  }

  Future<void> requsetPremission() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    if (Platform.isAndroid && androidDeviceInfo.version.sdkInt > 29) {
      await Permission.manageExternalStorage.request();
    } else {
      await Permission.storage.request();
    }
  }
}
