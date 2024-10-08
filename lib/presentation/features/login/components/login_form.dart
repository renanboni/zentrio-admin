import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';

import '../login_view_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>  {
  late final obscure = signal(true);

  final formKey = GlobalKey<ShadFormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Log in",
            style: ShadTheme.of(context).textTheme.h4,
          ),
          Text(
            "to continue to Zentrio",
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            id: 'username',
            controller: email,
            placeholder: const Text('Email'),
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 4),
          ShadInputFormField(
            controller: password,
            placeholder: const Text('Password'),
            obscureText: obscure.watch(context),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.password(),
            ]),
            suffix: ShadButton(
              width: 16,
              height: 16,
              padding: EdgeInsets.zero,
              decoration: const ShadDecoration(
                secondaryBorder: ShadBorder.none,
                secondaryFocusedBorder: ShadBorder.none,
              ),
              icon: ShadImage.square(
                size: 12,
                obscure.value ? LucideIcons.eyeOff : LucideIcons.eye,
              ),
              onPressed: () {
                obscure.value = !obscure.value;
              },
            ),
          ),
          const SizedBox(height: 16),
          ShadButton(
            width: double.infinity,
            child: const Text('Continue'),
            onPressed: () {
              final isAdmin = GoRouter.of(context)
                  .routerDelegate
                  .currentConfiguration
                  .last
                  .route
                  .path
                  .contains("admin");

              viewModel.login(
                isAdmin,
                email.text,
                password.text,
                () {
                  final destination = isAdmin ? '/vendors' : '/products';
                  GoRouter.of(context).go(destination);
                },
                () => ShadToaster.of(context).show(
                  const ShadToast.destructive(
                    alignment: Alignment.bottomCenter,
                    title: Text('Uh oh! Something went wrong'),
                    description: Text('There was a problem with your request'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
