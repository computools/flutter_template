class ProductFilter {
  int limit = 20;
  int offset = 0;

  ProductFilter();

  ProductFilter copyWith({
    int? limit,
    int? offset,
  }) {
    final newFilter = ProductFilter();

    newFilter.limit = limit ?? this.limit;
    newFilter.offset = offset ?? this.offset;

    return newFilter;
  }

  @override
  String toString() {
    return 'ProductFilter{limit: $limit, offset: $offset}';
  }
}
