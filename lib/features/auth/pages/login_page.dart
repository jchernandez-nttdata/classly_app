import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/auth/constants/assets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 140),
            child: Column(
              children: [
                Image.asset(AuthAssets.logo.path),
                const SizedBox(height: 56),
                ClasslyTextField(
                  hintText: context.localizations.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // Handle email input change
                  },
                ),
                const SizedBox(height: 28),
                ClasslyTextField(
                  hintText: context.localizations.password,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    // Handle password input change
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 56),
                ClasslyButton(
                  onPressed: () {},
                  text: context.localizations.logIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
