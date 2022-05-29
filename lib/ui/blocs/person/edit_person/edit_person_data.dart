part of 'edit_person_bloc.dart';

class EditPersonBlocData {
  PersonModel? personModel;

  EditPersonBlocData copyWith({PersonModel? personModel}) {
    EditPersonBlocData data = EditPersonBlocData();
    data.personModel = personModel ?? this.personModel;
    return data;
  }

}