part of 'collections.dart';

extension CollectionFirebaseExtention on CollectionsFirebase {

  String getName() {
    switch(this) {
      case CollectionsFirebase.person:
        return "Persona";
      case CollectionsFirebase.statesRegisterPerson:
        return "EstadosRegistroPersona";
      case CollectionsFirebase.typeInhabitants:
        return "TiposHabitantes";
      case CollectionsFirebase.typeDocumentation:
        return "TiposIdentificacion";
    }
  }
}