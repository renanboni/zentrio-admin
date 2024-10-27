import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

class DateInput extends StatelessWidget {
  final ValueChanged<DateTime>? onChanged;
  final DateTime? value;

  const DateInput({
    super.key,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final today = DateTime.now();

    return ShadInput(
      placeholder: const Text("DD/MM/YYYY"),
      controller: TextEditingController(
        text: value?.toString().ddMMyyyy(),
      ),
      readOnly: true,
      prefix: const Padding(
        padding: EdgeInsets.all(4.0),
        child: ShadImage.square(size: 16, LucideIcons.alarmClock),
      ),
      onPressed: () {
        showShadDialog(
          context: context,
          builder: (context) => Center(
            child: ShadCalendar(
              decoration: ShadDecoration(
                color: theme.colorScheme.background,
              ),
              selected: value,
              fromMonth: DateTime(today.year - 1),
              toMonth: DateTime(today.year, 12),
              onChanged: (date) {
                onChanged?.call(date);
                GoRouter.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
