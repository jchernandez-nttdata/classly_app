import 'package:classly_app/core/routes/routes.dart';
import 'package:classly_app/core/services/service_locator.dart';
import 'package:classly_app/core/theme/light_theme.dart';
import 'package:classly_app/features/auth/domain/cubits/auth/auth_cubit.dart';
import 'package:classly_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ClasslyApp extends StatelessWidget {
  const ClasslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: LightTheme().theme(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        routerConfig: appRouter,
        builder: (context, child) => child!,
      ),
    );
  }
}
