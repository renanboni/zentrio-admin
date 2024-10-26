import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';
import 'package:zentrio_admin/presentation/features/banners/create/create_banner_view_model.dart';

@Injectable()
class ProductMediaViewModel {
  final ListSignal<MedusaFile> medias = ListSignal<MedusaFile>([]);

  final ProductUseCase _productUseCase;

  ProductMediaViewModel(this._productUseCase);

  void getMedias(String productId, String selectedMediaId) async {
    try {
      final product = await _productUseCase.getProductById(
        productId,
        expand: ["images"],
      );

      medias.value = selectedMediaId.isEmpty
          ? product.images
              .mapIndexed((index, e) => e.copyWith(selected: index == 0))
              .toList()
          : product.images
              .map((e) => e.copyWith(selected: e.id == selectedMediaId))
              .toList();
    } catch (e) {
      print(e);
    }
  }

  void onMediaSelected(MedusaFile file) {
    medias.value = medias.value
        .map((e) => e.copyWith(selected: e.id == file.id))
        .toList();
  }

  void onNextSelected() {
    final currentIndex = medias.value.indexWhere((element) => element.selected);
    final nextIndex = (currentIndex + 1) % medias.value.length;
    medias.value = medias.value
        .mapIndexed((index, e) => e.copyWith(selected: index == nextIndex))
        .toList();
  }

  void onPreviousSelected() {
    final currentIndex = medias.value.indexWhere((element) => element.selected);
    final previousIndex = (currentIndex - 1) % medias.value.length;
    medias.value = medias.value
        .mapIndexed((index, e) => e.copyWith(selected: index == previousIndex))
        .toList();
  }
}
