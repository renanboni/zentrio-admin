import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/features/login/components/login_form.dart';

class LoginDesktopPage extends StatelessWidget {
  const LoginDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350,
        ),
        child: const LoginForm(),
      ),
    );
  }
}
