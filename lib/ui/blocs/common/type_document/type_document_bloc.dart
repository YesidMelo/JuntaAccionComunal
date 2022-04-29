import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';

part 'type_document_event.dart';
part 'type_document_state.dart';

class TypeDocumentBloc extends Bloc<TypeDocumentEvent, TypeDocumentState> {
  TypeDocumentBloc()
    : super(TypeDocumentInitState()) {
    on(_loadTypeDocuments);
    on(_changeTypeDocument);
  }

  Future<void> _loadTypeDocuments(TypeDocumentLoadEvent event, Emitter emit) async {
    emit(TypeDocumentLoadingState());

    await Future.delayed(const Duration(seconds: 5));

    List<TypeDocumentModel> listModels = <TypeDocumentModel>[];
    listModels.add(TypeDocumentModel(id: "", name: "cedula"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 1"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 2"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 3"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 4"));
    listModels.add(TypeDocumentModel(id: "", name: "cedula 5"));
    emit(TypeDocumentLoadedState(listModels, listModels.first));
  }

  Future<void> _changeTypeDocument(TypeDocumentSelectEvent event, Emitter emit) async {
    emit(TypeDocumentSelectDocumentState(event.listDocuments, event.selected));
  }

}