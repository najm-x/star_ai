import 'package:business_tools/core/constant/app_strings.dart';
import 'package:business_tools/core/errors/failure.dart';

String messageErrorHandel(Failure failure) {
  switch (failure.runtimeType) {
    case EmptyPathFailure:
      return AppStrings.emptyFilePath;
    case CreateFileFailure:
      return AppStrings.fileCreateFailed;
    case EmptyFailure:
      // Use a more specific message if available, otherwise fallback to generic
      return AppStrings.unknownError;
    case TransScriptVdFailure:
      return AppStrings.noVideoCaptions;
    case TranslateVdFailure:
      return AppStrings.videoTranslationFailed;
    case PermissionFailure:
      return AppStrings.insufficientPermissions;
    case SaveFailure:
      return AppStrings.fileSaveFailed;
    default:
      return AppStrings.genericError;
  }
}
