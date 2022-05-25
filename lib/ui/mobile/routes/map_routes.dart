part of 'routes_availables.dart';

Map<String, Widget Function(BuildContext)> getRoutes() => {
  RoutesAvailables.preRegisterPerson.getName() : (_) => const PreRegisterPersonPage(),
  RoutesAvailables.listPersons.getName() : (_) => const ListPersonPage(),
  RoutesAvailables.editPerson.getName() : (_) => const EditPersonPage(),
};