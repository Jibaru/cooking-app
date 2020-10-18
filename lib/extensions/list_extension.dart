extension ListInsert<T> on List<T> {
  List<T> addBeforeEach(T item) {
    List<T> listGenerated = [];
    this.forEach((element) {
      listGenerated.add(element);
      listGenerated.add(item);
    });

    return listGenerated;
  }
}
