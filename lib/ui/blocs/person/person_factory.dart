import 'package:jac/ui/blocs/blocs.dart';
import 'package:jac/ui/common_ui.dart';

List<BlocProvider> generateListPersonBloc() {
  return <BlocProvider>[
    BlocProvider<PreregisterPersonBloc>(create: (_)=> PreregisterPersonBloc()),
    BlocProvider<ListPersonBloc>(create: (_)=> ListPersonBloc()),
    BlocProvider<EditPersonBloc>(create: (_)=> EditPersonBloc()),
  ];
}