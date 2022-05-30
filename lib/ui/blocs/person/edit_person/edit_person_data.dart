part of 'edit_person_bloc.dart';

class EditPersonBlocData {
  PersonModel? personModel;
  bool editing = false;

  EditPersonBlocData copyWith({
    PersonModel? personModel,
    bool? editing
  }) {
    EditPersonBlocData data = EditPersonBlocData();
    data.personModel = personModel ?? this.personModel;
    data.editing = editing ?? this.editing;
    return data;
  }

}