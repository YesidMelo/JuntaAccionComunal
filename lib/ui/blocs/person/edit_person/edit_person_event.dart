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