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
    Worlds.nameApp: "Junta Accion comunal"
  };
}