abstract class ApiPaginatedResponse<T> {
  final int? count;
  final int? offset;
  final int? limit;
  final List<T>? data;

  ApiPaginatedResponse({
    required this.count,
    required this.offset,
    required this.limit,
    required this.data,
  });
}
