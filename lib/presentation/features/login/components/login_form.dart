import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SignalsAutoDisposeMixin {
  late final obscure = createSignal(context, true);

  final _formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: _formKey,
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
            placeholder: const Text('Email'),
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 4),
          ShadInputFormField(
            placeholder: const Text('Password'),
            obscureText: obscure.value,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.password(),
            ]),
            suffix: ShadButton(
              width: 24,
              height: 24,
              padding: EdgeInsets.zero,
              decoration: const ShadDecoration(
                secondaryBorder: ShadBorder.none,
                secondaryFocusedBorder: ShadBorder.none,
              ),
              icon: ShadImage.square(
                size: 16,
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
              if (_formKey.currentState?.saveAndValidate() == true) {
                print(_formKey.currentState!.value);
              }
            },
          ),
        ],
      ),
    );
  }
}
