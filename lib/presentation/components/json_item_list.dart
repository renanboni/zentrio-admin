import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/action_item_list.dart';
import 'package:zentrio_admin/presentation/components/json_sheet.dart';

class JsonItemList extends StatelessWidget {
  final Map<String, dynamic> json;

  const JsonItemList({
    super.key,
    required this.json,
  });

  @override
  Widget build(BuildContext context) {
    return ActionItemList(
      title: "JSON",
      label: "${json.entries.length} keys",
      onTap: () {
        showShadSheet(
          side: ShadSheetSide.right,
          context: context,
          builder: (context) => JsonSheet(
            json: json,
          ),
        );
      },
    );
  }
}
