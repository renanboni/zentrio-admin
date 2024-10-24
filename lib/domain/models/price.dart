
import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final String? id;
  final String currencyCode;
  final num amount;

  const Price({
    this.id,
    required this.currencyCode,
    required this.amount,
  });

  Price copyWith({
    String? id,
    String? currencyCode,
    num? amount,
  }) {
    return Price(
      id: id ?? this.id,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [id, currencyCode, amount];
}