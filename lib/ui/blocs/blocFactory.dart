import 'package:jac/ui/blocs/common/common.dart';
import 'package:jac/ui/blocs/person/person.dart';
import 'package:jac/ui/common_ui.dart';

List<BlocProvider> generateListBloc() {
  return <BlocProvider>[
    ...generateCommonProviders(),
    ...generateListPersonBloc()
  ];
}