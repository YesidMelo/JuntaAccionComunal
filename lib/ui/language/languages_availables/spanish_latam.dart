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
    Worlds.nameApp: "Junta Accion comunal",
    Worlds.defaultEmptyString: "",

    Worlds.preregister: "Preregistro",
    Worlds.preregisterFailedLoadForm: "No se pudo cargar correctamente el formulario de registro",
    Worlds.preregisterBasicInformation : "Informacion basica",
    Worlds.preregisterNamesAndLastNames : "Nombres y Apellidos",
    Worlds.preregisterNumberDocument : "Numero documento",

  };
}