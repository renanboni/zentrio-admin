
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

@injectable
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<void> getAll() {
    return _productRepository.getAll();
  }
}
