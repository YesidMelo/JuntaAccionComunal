part of 'type_document_bloc.dart';

abstract class TypeDocumentState {
  final List<TypeDocumentModel> listDocuments;
  final TypeDocumentModel? selected;

  TypeDocumentState({
    required this.listDocuments,
    required this.selected
  });

}

class TypeDocumentInitState extends TypeDocumentState {
  TypeDocumentInitState() : super(listDocuments: <TypeDocumentModel>[], selected: null);
}

class TypeDocumentLoadingState extends TypeDocumentState {
  TypeDocumentLoadingState() : super(listDocuments: <TypeDocumentModel>[], selected: null);
}

class TypeDocumentLoadedState extends TypeDocumentState {
  TypeDocumentLoadedState(
    List<TypeDocumentModel> listDocuments,
    TypeDocumentModel selected
  ) : super(listDocuments:  listDocuments, selected: selected);
}

class TypeDocumentSelectDocumentState extends TypeDocumentState {
  TypeDocumentSelectDocumentState(
    List<TypeDocumentModel> listDocuments,
    TypeDocumentModel selected
  ) : super(listDocuments:  listDocuments, selected: selected);
}