abstract class Failure {
 final String? message ;

  Failure({ this.message}); 

}

class EmptyFailure extends Failure {
  EmptyFailure({ super.message});
}

class SaveFailure extends Failure {}

class EmptyPathFailure extends Failure {}

class TransScriptVdFailure extends Failure {}

class TranslateVdFailure extends Failure {}

class PermissionFailure extends Failure {}

class CreateFileFailure extends Failure {}

class CopyFailure extends Failure {}

class AIFailure extends Failure {
   AIFailure({ super.message});
}

class AdLoadFailure extends Failure {}

class GetTransFroFileFailure extends Failure {}
class EmptyFileFailure extends Failure {}

//? Vd == Video
