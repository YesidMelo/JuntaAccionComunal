import 'package:jac/ui/blocs/common/type_document/type_document.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/core/core.dart' show TypeDocumentModel;

class TypeDocumentsWidget extends StatefulWidget {
  final Function(TypeDocumentModel) listener;

  TypeDocumentsWidget({
    required this.listener
  });

  @override
  State<TypeDocumentsWidget> createState() => _TypeDocumentsWidgetState(listener: listener);
}

class _TypeDocumentsWidgetState extends State<TypeDocumentsWidget> {

  final Function(TypeDocumentModel) listener;

  _TypeDocumentsWidgetState({
    required this.listener
  });

  @override
  void initState() {
    super.initState();
    TypeDocumentLoadEvent event = TypeDocumentLoadEvent();

    BlocProvider
      .of<TypeDocumentBloc>(context)
      .add(event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeDocumentBloc, TypeDocumentState>(builder: (_, state) {
      return DropdownButton(
        value: state.selected,
        items: _getItems(state: state),
        onChanged: (TypeDocumentModel? model) {
          if(model == null) return;

          TypeDocumentSelectEvent event = TypeDocumentSelectEvent(listDocuments: state.listDocuments, selected: model);
          BlocProvider
              .of<TypeDocumentBloc>(context)
              .add(event);
          listener(model);
        }
      );
    });
  }

  List<DropdownMenuItem<TypeDocumentModel>> _getItems({required TypeDocumentState state}) {
    return state
      .listDocuments
      .map((current) {
        return _generateItemDropdownItem(typeDocumentModel: current);
      })
      .toList();
  }

  DropdownMenuItem<TypeDocumentModel> _generateItemDropdownItem({ required TypeDocumentModel typeDocumentModel}) {
    return DropdownMenuItem<TypeDocumentModel>(
      child: Text(typeDocumentModel.name),
      value: typeDocumentModel,
    );
  }
}