extension ListFunctionalProgramming on List {

  List<T> filter<T>({required bool Function(T) condition}) {
    List<T> newList = <T>[];
    forEach((element) {
      if(condition(element)) {
        newList.add(element);
      }
    });
    return newList;
  }

  T? findFirst<T>({required bool Function(T) condition}) {
    List<T> filtered = filter(condition: condition);
    if(filtered.isEmpty) return null;
    return filtered.first;
  }

}