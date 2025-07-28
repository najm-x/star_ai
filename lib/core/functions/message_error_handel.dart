import 'package:business_tools/core/errors/failure.dart';
import 'package:flutter/material.dart';
import 'package:business_tools/l10n/app_localizations.dart';

String messageErrorHandel(Failure failure, BuildContext context) {
  switch (failure.runtimeType) {
    case EmptyPathFailure():
      return AppLocalizations.of(context)!.emptyFilePath;
    case CreateFileFailure():
      return AppLocalizations.of(context)!.fileCreateFailed;
    case EmptyFailure():
      return AppLocalizations.of(context)!.unknownError;
    case TransScriptVdFailure():
      return AppLocalizations.of(context)!.noVideoCaptions;
    case TranslateVdFailure():
      return AppLocalizations.of(context)!.videoTranslationFailed;
    case PermissionFailure():
      return AppLocalizations.of(context)!.insufficientPermissions;
    case SaveFailure():
      return AppLocalizations.of(context)!.fileSaveFailed;
    case AIFailure():
      return AppLocalizations.of(context)!.aIFailure;
    default:
      return AppLocalizations.of(context)!.genericError;
  }
}
