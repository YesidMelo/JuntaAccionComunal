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

  }

  Future<void> _changeTypeDocument(TypeDocumentSelectDocumentEvent event, Emitter emit) async {

  }

}