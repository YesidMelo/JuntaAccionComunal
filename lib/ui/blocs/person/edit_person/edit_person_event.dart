part of 'edit_person_bloc.dart';

abstract class EditPersonEvent {
  EditPersonBlocData data;
  EditPersonEvent({
    required this.data
  });
}

class EditPersonLoadingPersonEvent extends EditPersonEvent {

  final GetTypeDocumentUseCase _getTypeDocumentUseCase = getIt<GetTypeDocumentUseCase>();

  EditPersonLoadingPersonEvent({
    required EditPersonBlocData data
  }) : super(data: data);

  Future<EditPersonBlocData> loadPerson() async {
    List<TypeDocumentModel> list = await _getTypeDocumentUseCase.invoke();
    data.personModel?.typeDocument  = list.findFirst(condition: (current) {
      return current.id == data.personModel?.typeDocument?.id;
    });
    return data;
  }

}

class EditPersonChangeInfoEvent extends EditPersonEvent {

  EditPersonChangeInfoEvent({
    required EditPersonBlocData data
  }) : super(data: data);

  Future<EditPersonBlocData> changeInfo() async {
    return data.copyWith(editing: !data.editing);
  }

}

class EditPersonSendInfoEvent extends EditPersonEvent {

  EditPersonSendInfoEvent({
    required EditPersonBlocData data
  }) : super(data: data);

  Future<bool> sendData() async {
    if(data.personModel == null) throw PersonModelNullException();
    if(data.personModel?.nameLastname.isEmpty ?? true) throw NameAndLastNameLengthException();
    if(!(data.personModel?.nameLastname.validNameAndLastName() ?? false)) throw NameAndLastNameLengthException();
    if(data.personModel?.stateRegisterId?.isEmpty ?? true) throw StateRegisterPersonException();
    if(data.personModel?.documentNumber.isEmpty ?? true) throw NumberDocumentationLengthException();
    if(!(data.personModel?.documentNumber.validDocumentationNumber() ?? false)) throw NumberDocumentationLengthException();
    if(data.personModel?.direction == null || (data.personModel?.direction?.name.isEmpty ?? true)) throw DirectionEmptyException();
    if(!(data.personModel?.direction?.name.validDirection() ?? false)) throw DirectionLengthException();
    if(data.personModel?.cellPhone.isEmpty ?? true) throw CellphoneEmptyException();
    if(!(data.personModel?.cellPhone.validCellphone() ?? false)) throw CellphoneLengthException();
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

}