import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/blocs/person/preregister_person/preregister_person.dart';
import 'package:jac/ui/common_ui.dart';

List<BlocProvider> generateListPersonBloc() {
  return <BlocProvider>[
    BlocProvider<PreregisterPersonBloc>(create: (_)=> PreregisterPersonBloc()),
    BlocProvider<ListPersonBloc>(create: (_)=> ListPersonBloc()),
  ];
}