import 'package:jac/core/core.dart';
import 'package:jac/ui/common_ui.dart';
import 'package:jac/ui/mobile/widgets/widgets.dart';

class PreRegisterPersonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TypeDocumentsWidget(listener: (TypeDocumentModel model) {
            print("selecciono ${model.name}");
          }
        ),
      )
    );
  }

}