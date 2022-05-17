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

}