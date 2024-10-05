import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';

@Injectable()
class ProductMetadataViewModel {
  final ListSignal<Metadata> metadata = ListSignal([]);

  ProductMetadataViewModel() {
    metadata.add(
      const Metadata(
        key: "",
        value: "",
      ),
    );
  }

  void onKeyChanged(int index, String value) {
    metadata[index] = metadata[index].copyWith(key: value);
  }

  void onValueChanged(int index, String value) {
    metadata[index] = metadata[index].copyWith(value: value);
  }

  void onAddRowAbove(int index) {
    metadata.insert(
      index,
      Metadata.empty(),
    );
  }

  void onAddRowBelow(int index) {
    metadata.insert(
      index + 1,
      Metadata.empty(),
    );
  }

  void onDeleteRow(int index) {
    metadata.removeAt(index);
  }
}
