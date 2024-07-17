part of 'add_api_key_cubit.dart';

enum AddApiKeyStatus { init, loading, success, error , stepChange }

final class AddApiKeyState extends Equatable {
  const AddApiKeyState({this.messageError = "", this.status = AddApiKeyStatus.init});
  final String messageError;
  final AddApiKeyStatus status;

   AddApiKeyState copyWith ({
     String? messageError ,
   AddApiKeyStatus? status
   }) {
    return AddApiKeyState(messageError: messageError??this.messageError , status: status??this.status);
   }

  @override
  List<Object> get props => [messageError , status];
}

