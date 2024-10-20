class PaginatedResponse<T> {
  final List<T> data;
  final int count;
  final int offset;
  final int limit;

  PaginatedResponse({
    required this.data,
    required this.count,
    required this.offset,
    required this.limit,
  });

  factory PaginatedResponse.empty() {
    return PaginatedResponse(
      data: [],
      count: 0,
      offset: 0,
      limit: 0,
    );
  }
}
