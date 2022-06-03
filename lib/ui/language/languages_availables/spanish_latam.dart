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
    Worlds.back: "Atras",
    Worlds.cellPhone : "Telefono",
    Worlds.cancel : "Cancelar",
    Worlds.commonContinue: "Continuar",
    Worlds.defaultEmptyString: "",
    Worlds.direction : "Dirección",
    Worlds.documentType: "Tipo de documento",
    Worlds.error: "Error",
    Worlds.failedLoadForm: "No se pudo cargar correctamente el formulario de registro",
    Worlds.nameApp: "Junta Accion comunal",
    Worlds.namesAndLastNames : "Nombres y Apellidos",
    Worlds.numberDocument : "Numero documento",
    Worlds.send: "Enviar",
    Worlds.theCellphoneNotIsValid : "El numero de telefono no es valido",
    Worlds.theMinimumSizeDirectionIs : "El tamaño minimo de la direccion es ${Constants.keyReplacementString}",
    Worlds.theMinimumSizeDocumentIs : "El tamaño minimo del documento es ${Constants.keyReplacementString}",
    Worlds.theMinimumSizeNameIs : "El tamaño minimo del nombre es ${Constants.keyReplacementString}",
    Worlds.theSizeCellphoneBetween : "El tamaño telefono entre ${Constants.keyReplacementString} y ${Constants.keyReplacementString}",
    Worlds.thisFieldIsEmpty: "No has ingresado un valor a este campo",
    Worlds.unExpectedProblem: "Problema inesperado",
    Worlds.unExpectedProblemTryAgain: "Surgio un problema inesperado, intentalo mas tarde",
    Worlds.withoutInternet: "No tienes internet en estos momentos.\nIntentalo mas tarde.",

    //Preregister
    Worlds.preregister: "Preregistro",
    Worlds.preregisterBasicInformation : "Informacion basica",
    Worlds.preregisterContact : "Contacto",
    Worlds.preregisterFailedRegisterPerson : "Fallo el preregistro verifica tu conexion a internet",

    //ListPerson
    Worlds.listPerson : "Listado de personas",
    Worlds.listPersonFilterIsEmpty : "No tienes coincidencias con el estado seleccionado",

    //EditPerson
    Worlds.editPerson: "Editar persona",
    Worlds.editPersonNotState: "La persona no tiene un estado de registro",

  };
}