part of 'routes_availables.dart';

extension DetailRoutesAvailables on RoutesAvailables {
  String getName() {
    switch(this) {
      case RoutesAvailables.preRegisterPerson :
        return "/preRegistroPersona";
      case RoutesAvailables.listPersons:
        return "/listPerson";
      case RoutesAvailables.editPerson:
        return "/editPerson";
      default:
        return "/";
    }
  }
}