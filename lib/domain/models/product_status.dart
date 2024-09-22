enum ProductStatus {
  published,
  draft,
  proposed,
  rejected;

  static ProductStatus fromString(String status) {
    switch (status) {
      case 'published':
        return ProductStatus.published;
      case 'draft':
        return ProductStatus.draft;
      case 'proposed':
        return ProductStatus.proposed;
      case 'rejected':
        return ProductStatus.rejected;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }
}
