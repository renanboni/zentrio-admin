import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String storeName;

  const Header({
    super.key,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 64,
      child: Text(storeName),
    );
  }
}
