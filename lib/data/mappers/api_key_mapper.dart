import 'package:zentrio_admin/data/models/api_publishable_key.dart';
import 'package:zentrio_admin/domain/models/api_key.dart';

extension ApiKeyMapper on ApiPublishableKey {
  ApiKey toApiKey() {
    return ApiKey(
      id: id ?? '',
      title: title ?? '',
      token: token ?? '',
      redacted: redacted ?? '',
      type: type ?? '',
      createdBy: createdBy ?? '',
    );
  }
}
