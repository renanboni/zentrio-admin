import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/screen_type_layout.dart';
import 'package:zentrio_admin/presentation/features/login/login_desktop_page.dart';
import 'package:zentrio_admin/presentation/features/login/login_mobile_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: LoginMobilePage(),
      desktop: LoginDesktopPage(),
      tablet: LoginDesktopPage(),
    );
  }
}
