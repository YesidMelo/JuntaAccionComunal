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

    //common
    Worlds.accept: "Aceptar",
    Worlds.back: "atras",
    Worlds.cellPhone : "Telefono",
    Worlds.commonContinue: "Continuar",
    Worlds.defaultEmptyString: "",
    Worlds.direction : "Dirección",
    Worlds.nameApp: "Junta Accion comunal",
    Worlds.namesAndLastNames : "Nombres y Apellidos",
    Worlds.send: "Enviar",
    Worlds.thisFieldIsEmpty: "No has ingresado un valor a este campo",
    Worlds.unExpectedProblem: "Problema inesperado",
    Worlds.unExpectedProblemTryAgain: "Surgio un problema inesperado, intentalo mas tarde",
    Worlds.withoutInternet: "No tienes internet en estos momentos.\nIntentalo mas tarde.",
    Worlds.documentType: "Tipo de documento",
    Worlds.numberDocument : "Numero documento",

    //Preregister
    Worlds.preregister: "Preregistro",
    Worlds.preregisterBasicInformation : "Informacion basica",
    Worlds.preregisterContact : "Contacto",
    Worlds.preregisterFailedLoadForm: "No se pudo cargar correctamente el formulario de registro",
    Worlds.preregisterFailedRegisterPerson : "Fallo el preregistro verifica tu conexion a internet",
    Worlds.preregisterTheCellphoneNotIsValid : "El numero de telefono no es valido",
    Worlds.preregisterTheMinimumSizeDirectionIs : "El tamaño minimo de la direccion es ${Constants.keyReplacementString}",
    Worlds.preregisterTheMinimumSizeDocumentIs : "El tamaño minimo del documento es ${Constants.keyReplacementString}",
    Worlds.preregisterTheMinimumSizeNameIs : "El tamaño minimo del nombre es ${Constants.keyReplacementString}",
    Worlds.preregisterTheSizeCellphoneBetween : "El tamaño telefono entre ${Constants.keyReplacementString} y ${Constants.keyReplacementString}",

    //ListPerson
    Worlds.listPerson : "Listado de personas",
    Worlds.listPersonFilterIsEmpty : "No tienes coincidencias con el estado seleccionado",

    //EditPerson
    Worlds.editPerson: "Editar persona",

  };
}