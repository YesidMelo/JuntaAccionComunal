import 'package:jac/core/core.dart';
import 'package:jac/ui/mobile/routes/routes.dart';
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
      handlerErrorAndProgressbar(stateBloc: state);
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
        _showErrorListFilteredIsEmpty(state: state),
        Expanded(child: _getListPersons(state: state)),
      ],
    );
  }

  Widget _getListPersons({required ListPersonState state}) {
    return ListPersonWidget(
      listPersons: state.listPersonData.listPersons,
      listPersonsFiltered: state.listPersonData.listPersonsFiltered,
      listenerPersonSelected: (personSelected) {
        navigateTo(context: context, route: RoutesAvailables.editPerson, arguments: personSelected, replace: false);
      }
    );
  }

  DropdownButton<StateRegisteredPersonModel> _getFilterStatePerson({required ListPersonState state}) {
    return DropdownButton<StateRegisteredPersonModel>(
      value: state.listPersonData.stateFiltered,
      items: _getListStatePersonModel(state: state),
      onChanged: (StateRegisteredPersonModel? selected) {
        BlocProvider
          .of<ListPersonBloc>(context)
          .add(ListPersonFilterEvent(listPersonData: state.listPersonData.copyWith(stateFiltered: selected)))
        ;
      }
    );
  }

  List<DropdownMenuItem<StateRegisteredPersonModel>> _getListStatePersonModel({required ListPersonState state}){
    return state
      .listPersonData
      .listStatePersonRegistered
      .map(
        (e) => DropdownMenuItem<StateRegisteredPersonModel>(
          value: e,
          child: Text(e.name ?? LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.defaultEmptyString)),
        )
      )
      .toList();
  }

  Widget _showErrorListFilteredIsEmpty({required ListPersonState state}) {
    return state.listPersonData.showErrorEmptyListPersonFiltered
      ? Text(LanguageFactory.getCurrentLanguage().getWorld(world: Worlds.listPersonFilterIsEmpty))
      : const SizedBox()
    ;
  }
}