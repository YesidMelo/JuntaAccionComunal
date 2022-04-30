import 'package:get_it/get_it.dart';

import 'package:jac/datasource/datasource.dart';
import 'package:jac/core/core.dart';

part 'datasource_di.dart';
part 'repository_di.dart';
part 'source_di.dart';
part 'use_cases_di.dart';

GetIt getIt = GetIt.instance..allowReassignment;

void initDI() {
  _initDatasources();
  _initSources();
  _initRepositories();
  _initUseCases();
}