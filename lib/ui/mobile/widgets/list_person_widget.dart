import 'package:jac/core/core.dart';
import 'package:jac/ui/base/base.dart';
import 'package:jac/ui/common_ui.dart';

class ListPersonWidget extends BaseStateful {

  final List<PersonModel> listPersons;
  final List<PersonModel> listPersonsFiltered;
  final Function(PersonModel) listenerPersonSelected;

  const ListPersonWidget({
    required this.listPersons,
    required this.listPersonsFiltered,
    required this.listenerPersonSelected,
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
        itemBuilder: (context, index) => _getListTile(personModel: list[index])
    );
  }

  List<PersonModel> _listPersons() {
    return widget.listPersonsFiltered.isEmpty
      ? widget.listPersons
      : widget.listPersonsFiltered
    ;
  }

  ListTile _getListTile({required PersonModel personModel}) {
    return ListTile(
      title: Text(personModel.nameLastname),
      subtitle: Text(personModel.direction?.name ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
      trailing: Text(personModel.stateRegisterId ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
      onTap: () => widget.listenerPersonSelected(personModel),
    );
  }



}