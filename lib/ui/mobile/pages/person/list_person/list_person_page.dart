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
              child: ListPersonWidget(
                listPersons: state.listPersons,
                listPersonsFiltered: state.listPersonsFiltered,
              ),
            )
        ),
      );
    });
  }

}