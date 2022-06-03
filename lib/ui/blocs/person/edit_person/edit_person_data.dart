part of 'edit_person_bloc.dart';

class EditPersonBlocData {
  PersonModel? personModel;
  bool editing = false;
  String? nameError;
  String? stateRegisterError;
  String? numberDocumentError;
  String? directionError;
  String? cellphoneError;

  EditPersonBlocData copyWith({
    PersonModel? personModel,
    bool? editing,
    String? nameError,
    String? stateRegisterError,
    String? numberDocumentError,
    String? directionError,
    String? cellphoneError
  }) {
    EditPersonBlocData data = EditPersonBlocData();
    data.personModel = personModel ?? this.personModel;
    data.editing = editing ?? this.editing;
    data.nameError = nameError;
    data.stateRegisterError = stateRegisterError;
    data.numberDocumentError = numberDocumentError;
    data.directionError = directionError;
    data.cellphoneError = cellphoneError;
    return data;
  }

}