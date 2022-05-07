import 'package:jac/core/core.dart';
import 'package:jac/ui/language/base_language.dart';
import 'package:jac/ui/language/worlds_languages.dart';

class SpanishLatam extends BaseLanguage {

  @override
  String getWorld({required Worlds world}) {
    if(!mapWorlds.containsKey(world)) {
      return "";
    }
    return mapWorlds[world]!;
  }

  /// private methods
  Map<Worlds, String> mapWorlds = {
    Worlds.accept: "Aceptar",
    Worlds.back: "atras",
    Worlds.commonContinue: "Continuar",
    Worlds.defaultEmptyString: "",
    Worlds.nameApp: "Junta Accion comunal",
    Worlds.send: "Enviar",
    Worlds.thisFieldIsEmpty: "No has ingresado un valor a este campo",

    //Preregister
    Worlds.preregister: "Preregistro",
    Worlds.preregisterBasicInformation : "Informacion basica",
    Worlds.preregisterCellPhone : "Telefono",
    Worlds.preregisterContact : "Contacto",
    Worlds.preregisterDirection : "Dirección",
    Worlds.preregisterFailedLoadForm: "No se pudo cargar correctamente el formulario de registro",
    Worlds.preregisterNamesAndLastNames : "Nombres y Apellidos",
    Worlds.preregisterNumberDocument : "Numero documento",
    Worlds.preregisterTheMinimumSizeNameIs : "El tamaño minimo del nombre es ${Constants.keyReplacementString}",
    Worlds.preregisterTheMinimumSizeDocumentIs : "El tamaño minimo del documento es ${Constants.keyReplacementString}",

  };
}