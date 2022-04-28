part of 'type_document_bloc.dart';

abstract class TypeDocumentState {}

class TypeDocumentInitState extends TypeDocumentState {
}

class TypeDocumentLoadingState extends TypeDocumentState {}
class TypeDocumentLoadedState extends TypeDocumentState {}
class TypeDocumentSelectDocumentEvent extends TypeDocumentState {}