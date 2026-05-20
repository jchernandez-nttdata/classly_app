import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/widgets/widgets.dart';
import 'package:classly_app/features/auth/constants/assets.dart';
import 'package:classly_app/features/auth/domain/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.requestStatus != current.requestStatus,
      listener: (context, state) {
        if (state.isLoading) {
          context.showLoader();
        } else {
          context.hideLoader();
        }

        if (state.isError) {
          ClasslySnackbar.show(
            context,
            message: context.localizations.operationFailed('login'),
            type: ClasslySnackbarType.error,
          );
        }

        if (state.isSuccess) {
          //TODO(jc): navigate to home page, once it's implemented
          // context.go('/home');
        }
      },
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  onChanged: (value) =>
                      context.read<AuthCubit>().emailChanged(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.localizations.emailRequired;
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return context.localizations.invalidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                ClasslyTextField(
                  hintText: context.localizations.password,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) =>
                      context.read<AuthCubit>().passwordChanged(value),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.localizations.passwordRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 56),
                ClasslyButton(
                  onPressed: () => context.read<AuthCubit>().login(),
                  text: context.localizations.logIn,
                  isEnabled: context.select(
                    (AuthCubit cubit) => cubit.state.isFormValid,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
