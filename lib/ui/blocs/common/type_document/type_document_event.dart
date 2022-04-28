part of 'type_document_bloc.dart';

abstract class TypeDocumentEvent {}

class TypeDocumentLoadEvent extends TypeDocumentEvent {}

class TypeDocumentSelectEvent extends TypeDocumentEvent {}