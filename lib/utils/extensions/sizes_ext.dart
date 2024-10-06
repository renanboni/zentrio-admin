import 'package:flutter/material.dart';

extension PaddingNum on num {
  /// Creates insets where all the offsets are `value`.
  EdgeInsets paddingAll() => EdgeInsets.all(toDouble());

  /// Creates insets with symmetric horizontal offsets.
  EdgeInsets paddingHorizontal() =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates insets with symmetric vertical offsets.
  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates insets with only the top value.
  EdgeInsets paddingTop() => EdgeInsets.only(top: toDouble());

  /// Creates insets with only the left value.
  EdgeInsets paddingLeft() => EdgeInsets.only(left: toDouble());

  /// Creates insets with only the right value.
  EdgeInsets paddingRight() => EdgeInsets.only(right: toDouble());

  /// Creates insets with only the bottom value.
  EdgeInsets paddingBottom() => EdgeInsets.only(bottom: toDouble());
}

/// Converts a [num] into a [SizedBox]
extension Space on num {
  /// Creates sizedbox with width.
  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  /// Creates sizedbox with height.
  SizedBox get verticalSpace => SizedBox(height: toDouble());
}
