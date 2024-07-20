import 'package:business_tools/core/errors/exceptions.dart';
import 'package:business_tools/core/errors/failure.dart';

Failure mapExceptionToFailure(Object exception) {
  switch (exception.runtimeType) {
    case EmptyException:
      return EmptyFailure();
    case SaveException:
      return SaveFailure();
    case EmptyPathException:
      return EmptyPathFailure();
    case TranslateVdException:
      return TranslateVdFailure();
    case TransScriptVdException:
      return TransScriptVdFailure();
    case PermissionException:
      return PermissionFailure();
    case CreateFileException:
      return CreateFileFailure();
    case AIException():
      return AIFailure();
    case CopyException:
      return CopyFailure();
    case AdLoadException():
      return AdLoadFailure();
    default:
      return EmptyFailure();
  }
}
