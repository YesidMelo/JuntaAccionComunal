import 'package:jac/ui/blocs/common/type_document/type_document.dart';
import 'package:jac/ui/common_ui.dart';

List<BlocProvider> generateCommonProviders() {
  return <BlocProvider>[
    BlocProvider<TypeDocumentBloc>(create: (_)=> TypeDocumentBloc())
  ];
}