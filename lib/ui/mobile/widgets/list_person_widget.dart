import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/blocs/blocs.dart';

class ListPersonWidget extends BaseStateful {

  final List<PersonModel> listPersons;
  final List<PersonModel> listPersonsFiltered;

  const ListPersonWidget({
    required this.listPersons,
    required this.listPersonsFiltered,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPersonWidgetState();

}

class _ListPersonWidgetState extends BaseStateUI<ListPersonWidget> {


  @override
  Widget build(BuildContext context) {
    List<PersonModel> list = _listPersons();
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].nameLastname),
          );
        }
    );
  }

  List<PersonModel> _listPersons() {
    return widget.listPersonsFiltered.isEmpty
      ? widget.listPersons
      : widget.listPersonsFiltered
    ;
  }



}