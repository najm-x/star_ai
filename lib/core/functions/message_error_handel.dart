import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/errors/failure.dart';

String messageErrorHandel(Failure failure) {
  switch (failure.runtimeType) {
    case EmptyPathFailure:
      return AppStrings.emptyFilePath;
    case CreateFileFailure:
      return AppStrings.fileCreateFailed;
    case EmptyFailure:
      return AppStrings.unknownError;
    case TransScriptVdFailure:
      return AppStrings.noVideoCaptions;
    case TranslateVdFailure:
      return AppStrings.videoTranslationFailed;
    case PermissionFailure:
      return AppStrings.insufficientPermissions;
    case SaveFailure:
      return AppStrings.fileSaveFailed;
    case AIFailure():
      return AppStrings.aIFailure;
    default:
      return AppStrings.genericError;
  }
}
