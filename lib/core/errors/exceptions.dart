class EmptyException implements Exception {}

class SaveException implements Exception {}

class EmptyPathException implements Exception {}

class TranslateVdException implements Exception {}

class TransScriptVdException implements Exception {}

class PermissionException implements Exception {}

class CreateFileException implements Exception {}

class CopyException implements Exception {}

class AIException implements Exception {
  final String? messageError;

  AIException({this.messageError});
}

class AdLoadException implements Exception {}

class CropImageException implements Exception {}

class EmptyCropImageException implements Exception {}

class GetTransFroFileException implements Exception {}
class EmptyFileException implements Exception {}
class ClosedCaptionException implements Exception {}

