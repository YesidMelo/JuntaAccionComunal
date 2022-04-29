part of 'type_document_bloc.dart';

abstract class TypeDocumentEvent {}

class TypeDocumentLoadEvent extends TypeDocumentEvent {}

class TypeDocumentSelectEvent extends TypeDocumentEvent {
  final List<TypeDocumentModel> listDocuments;
  final TypeDocumentModel selected;

  TypeDocumentSelectEvent({
    required this.listDocuments,
    required this.selected
  });
}