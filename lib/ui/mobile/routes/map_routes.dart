part of 'routes_availables.dart';

Map<String, Widget Function(BuildContext)> getRoutes() => {
  RoutesAvailables.preRegisterPerson.getName() : (_) => PreRegisterPersonPage()
};