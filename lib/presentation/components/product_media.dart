import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../domain/models/medusa_file.dart';

class ProductMedia extends StatefulWidget {
  final MedusaFile file;
  final Function(MedusaFile file, bool isChecked) onChecked;

  const ProductMedia({
    super.key,
    required this.file,
    required this.onChecked,
  });

  @override
  State<ProductMedia> createState() => _ProductMediaState();
}

class _ProductMediaState extends State<ProductMedia> {
  final isHovering = signal(false);
  final isChecked = signal(false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isChecked.set(!isChecked.value);
        widget.onChecked(widget.file, isChecked.value);
      },
      onHover: (isHover) => isHovering.value = isHover,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.file.url,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Watch(
            (context) {
              if (!isHovering.value && !isChecked.value) return const SizedBox.shrink();
              return Positioned(
                top: 12,
                right: 12,
                child: ShadCheckbox(
                  value: isChecked.value,
                  onChanged: (checked) {
                    isChecked.value = (checked);
                    widget.onChecked(widget.file, isChecked.value);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
