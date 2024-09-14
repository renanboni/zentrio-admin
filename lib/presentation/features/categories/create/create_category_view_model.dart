import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category_status.dart';
import 'package:zentrio_admin/domain/models/category_visibility.dart';

@Injectable()
class CreateCategoryViewModel {
  CategoryStatus? categoryStatus = CategoryStatus.active;
  CategoryVisibility? categoryVisibility = CategoryVisibility.public;

  final title = signal("");
  final handle = signal("");
  final description = signal("");

  void onCategoryStatusChanged(CategoryStatus? status) {
    categoryStatus = status;
  }

  void onCategoryVisibilityChanged(CategoryVisibility? visibility) {
    categoryVisibility = visibility;
  }
}
