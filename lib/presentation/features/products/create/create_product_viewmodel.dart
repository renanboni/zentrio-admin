
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../../domain/models/media_file.dart';

@injectable
class CreateProductViewModel {

  final showProductOptions = signal(false);
  final productTitle = signal('');
  final files = signal<List<MediaFile>>([]);


}