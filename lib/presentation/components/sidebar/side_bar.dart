import 'package:flutter/material.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/presentation/components/sidebar/header.dart';
import 'package:zentrio_admin/presentation/components/sidebar/models/side_bar_item.dart';
import 'package:zentrio_admin/presentation/components/sidebar/side_bar_item_list.dart';

class SideBar extends StatefulWidget {
  final List<SideBarItem> items;
  final SideBarItem? footer;
  final Function(SideBarItem item)? onTap;
  final Vendor vendor;

  const SideBar({
    super.key,
    required this.items,
    required this.vendor,
    this.onTap,
    this.footer,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(storeName: widget.vendor.name),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: widget.items.map((item) {
                  return SideBarItemList(
                    item: item,
                    onTap: () {
                      if (widget.onTap != null) {
                        widget.onTap!(item);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          if (widget.footer != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SideBarItemList(
                item: widget.footer!,
              ),
            ),
        ],
      ),
    );
  }
}
