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
  Route<T> createRoute(BuildContext context) {
    return RawDialogRoute<T>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 512,
                minWidth: 0,
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
        );
      },
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      anchorPoint: anchorPoint,
      settings: this,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
