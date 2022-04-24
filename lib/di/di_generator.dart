import 'package:get_it/get_it.dart';

import 'package:jac/datasource/datasource.dart';

part 'datasource_di.dart';

GetIt getIt = GetIt.instance..allowReassignment;

void initDI() {
  _initDatasources();
}