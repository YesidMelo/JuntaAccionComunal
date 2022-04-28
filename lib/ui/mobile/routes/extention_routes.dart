part of 'routes_availables.dart';

extension DetailRoutesAvailables on RoutesAvailables {
  String getName() {
    switch(this) {
      case RoutesAvailables.preRegisterPerson :
        return "/preRegistroPersona";
      default:
        return "/";
    }
  }
}