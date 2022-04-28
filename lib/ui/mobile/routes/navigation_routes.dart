part of 'routes_availables.dart';

void navigateTo({
  required BuildContext context,
  required RoutesAvailables route,
  bool replace = false,
  Object? arguments
}) {
  if(replace) {
    Navigator.of(context).pushReplacementNamed(route.getName(), arguments: arguments);
    return;
  }
  Navigator.of(context).pushNamed(route.getName(), arguments: arguments);
}