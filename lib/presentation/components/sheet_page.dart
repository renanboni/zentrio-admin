import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const SheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black26,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 512,
              minWidth: 0,
            ),
            child: Dialog(
              insetPadding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ShadCard(
                  padding: const EdgeInsets.all(0),
                  child: builder(context),
                ),
              ),
            ),
          ),
        ),
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
