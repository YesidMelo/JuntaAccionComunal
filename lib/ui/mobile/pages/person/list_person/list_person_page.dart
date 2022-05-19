import 'package:jac/core/core.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';
import 'package:jac/ui/ui.dart';

class ListPersonPage extends BaseStateful {

  const ListPersonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPersonPageState();

}

class _ListPersonPageState extends BaseStateUI<ListPersonPage> {


  @override
  void initState() {
    super.initState();
    BlocProvider
        .of<ListPersonBloc>(context)
        .add(ListPersonLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPersonBloc, ListPersonState>(builder: (_, state){
      return Scaffold(
        body: SafeArea(
            child: Container(
                child : _body(state: state)
            )
        ),
      );
    });
  }

  Column _body({required ListPersonState state}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _getFilterStatePerson(state: state),
        Expanded(child: _getListPersons(state: state)),
      ],
    );
  }

  Widget _getListPersons({required ListPersonState state}) {
    return ListPersonWidget(
      listPersons: state.listPersons,
      listPersonsFiltered: state.listPersonsFiltered,
      listenerPersonSelected: (personSelected) {
        print(personSelected.id);
      }
    );
  }

  DropdownButton<StateRegisteredPersonModel> _getFilterStatePerson({required ListPersonState state}) {
    return DropdownButton<StateRegisteredPersonModel>(
      value: state.filterStateRegisteredSelected,
      items: _getListStatePersonModel(state: state),
      onChanged: (selected) {

      }
    );
  }

  List<DropdownMenuItem<StateRegisteredPersonModel>> _getListStatePersonModel({required ListPersonState state}){
    return state
      .listStatePersonList
      .map(
        (e) => DropdownMenuItem<StateRegisteredPersonModel>(
          value: e,
          child: Text(e.name ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
        )
      )
      .toList();
  }
}